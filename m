Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A597D6ED8
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 16:37:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47DA7857;
	Wed, 25 Oct 2023 16:36:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47DA7857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698244656;
	bh=modIYTKkxTHO9QwFsE+KswBmW56RDEUNp0vfFpFsgIE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dFM+oHDh6Q83JfZFoXK26bss/dbxb9jUOA0r0vyp3NHl3kjkSNspzfyTItgx1bv19
	 F20aYm0B4qhQ6kpqgecEy9wPBpTZSesTOi96PeRSHJaY53cLbBgs738OeRDPELI+ou
	 oN3CqhPtD3j4Ch22eHqrQIz6m3MZKSO+n7ARO2ug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 777B1F80571; Wed, 25 Oct 2023 16:35:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBABEF80579;
	Wed, 25 Oct 2023 16:35:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 761A8F8055C; Wed, 25 Oct 2023 16:35:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7706F80165
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 16:35:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7706F80165
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=h/heSpZJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698244532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ads+WsKivD5hnqe/DtMV3DZwfx8DnuzoUsjr9laRFKI=;
	b=h/heSpZJ3xjOphOlkr2dp6xtp4yeEWeqJbjq8/zjEQMOez1Xjkk/XQNs6PG9gTNLnI7wsh
	de63M7bNfN7zVE6mxBUZWffIfWJRINYxVFrddQGtROVOS9c0lhFH7UkGz0S3XIwH+Es3R9
	98uDCTOz876cUcm2V4JqeeHh4cblk7s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-wZcYe5J2PS6MMfrs9d-uQA-1; Wed, 25 Oct 2023 10:35:23 -0400
X-MC-Unique: wZcYe5J2PS6MMfrs9d-uQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89151101AA6D;
	Wed, 25 Oct 2023 14:35:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.127])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78C1A2026D4C;
	Wed, 25 Oct 2023 14:35:21 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 0/4] ASoC: Intel: bytcr_wm5102: add various quirks
Date: Wed, 25 Oct 2023 16:35:09 +0200
Message-ID: <20231025143513.291753-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: DMK5EVC6L737DGR2IUVOZHGOUMELLDLC
X-Message-ID-Hash: DMK5EVC6L737DGR2IUVOZHGOUMELLDLC
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DMK5EVC6L737DGR2IUVOZHGOUMELLDLC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

As requested here is a v2 of my series to add various quirks
to the bytcr_wm5102 Intel board driver to make it more flexible.

Changes in v2:
- Dropped 2 already merged patches
- Rebased on top of broonie/sound/for-6.7

Regards,

Hans


Hans de Goede (4):
  ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_SSP2 quirk
  ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_MCLK_19_2MHZ quirk
  ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_OUT_MAP quirk
  ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_IN_MAP quirk

 sound/soc/intel/boards/bytcr_wm5102.c | 229 +++++++++++++++++++++++---
 1 file changed, 202 insertions(+), 27 deletions(-)

-- 
2.41.0

