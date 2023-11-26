Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7DF7F958C
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Nov 2023 22:41:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6297D847;
	Sun, 26 Nov 2023 22:41:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6297D847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701034898;
	bh=pAf1YHoHkmAokVImBxwE7Fix4ujWe1Fo9Ap2dJjoFGk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DfXfAlW/nOLnz52Z6+MJWz7VxlqEHVcMaoOOnszS083vkoIQa7DaW79taRASRXRJW
	 DAW9ZkXJEbr0bVveJUxh5GQ6KbpmnpdUbjTR+Z6dSHglHNfBgjz0W4gTw5wd1Ppfuj
	 dcoBLA/iC8qzldysiu+kBJc+bWNeq+8MDUstVqLo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16709F80579; Sun, 26 Nov 2023 22:41:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D33B7F8057D;
	Sun, 26 Nov 2023 22:41:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99EC2F80236; Sun, 26 Nov 2023 22:40:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D153EF80166
	for <alsa-devel@alsa-project.org>; Sun, 26 Nov 2023 22:40:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D153EF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=B/3O6iOD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701034838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ogxNVwq5X1gu8qifNpx9e5asKxUaWe+1P2/q+8YeGYQ=;
	b=B/3O6iODtlmroI19sv4JZLDxBFz6qaCzs9RgjNMHh4xYgPm5Msn8VBYqTwPwUqtxWaOBm6
	32jaFv05ZNj49B3Ye35WOOClqjXOqMaaT3cYpQ3rlB3p0FtD21OgNuwceEbhQEMsVZIqLT
	fp4CeapFxXIBIpuNdeUz0UbhUcDin7Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-f_W5Tm_tNhiuqQZLGbLgKg-1; Sun, 26 Nov 2023 16:40:35 -0500
X-MC-Unique: f_W5Tm_tNhiuqQZLGbLgKg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C5CF101A54C;
	Sun, 26 Nov 2023 21:40:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 526BE1C060B0;
	Sun, 26 Nov 2023 21:40:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 0/7] ASoC: rt5645: Add Acer Switch V 10 quirk + report quirks
 in components string
Date: Sun, 26 Nov 2023 22:40:17 +0100
Message-ID: <20231126214024.300505-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 5NRW6CIKYFMSCUT3ZGH2KTDD4RHEKWIX
X-Message-ID-Hash: 5NRW6CIKYFMSCUT3ZGH2KTDD4RHEKWIX
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5NRW6CIKYFMSCUT3ZGH2KTDD4RHEKWIX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi all,

This patch-series adds a quirk for the Acer Switch V 10, which uses
a DMIC on the DMIC2 input, rather then the default analog mic on IN2.

Most of the patches are actually for adding a component string with
mic and speaker routing information so that the UCM profile can use this
instead of duplicating all the DMI quirks in the UCM profile.

I've also submitted a alsa-ucm-config patch to add support for
the components string.

Regards,

Hans


Hans de Goede (7):
  ASoC: rt5645: Drop double EF20 entry from dmi_platform_data[]
  ASoC: rt5645: Add platform-data for Acer Switch V 10
  ASoC: rt5645: Refactor rt5645_parse_dt()
  ASoC: rt5645: Add rt5645_get_pdata() helper
  ASoC: rt5645: Add a rt5645_components() helper
  ASoC: rt5645: Add mono speaker information to the components string
  ASoC: Intel: cht_bsw_rt5645: Set card.components string

 sound/soc/codecs/rt5645.c               | 113 +++++++++++++++---------
 sound/soc/codecs/rt5645.h               |   3 +
 sound/soc/intel/boards/cht_bsw_rt5645.c |   8 ++
 3 files changed, 83 insertions(+), 41 deletions(-)

-- 
2.41.0

