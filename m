Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EE385048B
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Feb 2024 14:45:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99AD8827;
	Sat, 10 Feb 2024 14:45:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99AD8827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707572715;
	bh=AnyArfcGHQR+dIPTMSx0s6EW6nE1/Ek80RCYPdVDZaA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RRRBOF8f5dmpZTHBbqoxvxhOw5qlShphCuhAskdz6UuS88aQq7VRCoSRYFkTvOtLk
	 3QvPPDCbfUlffakEu9Ku7KCCNY0e8+Ja2OyMZDtR+/kikHI24i4aJIC3adDG8YwUhM
	 9Sl9UTesafTULQVAZlUH0nbXy/WlUAtj+yt1gYdw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DFEDF805D5; Sat, 10 Feb 2024 14:44:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE177F805C5;
	Sat, 10 Feb 2024 14:44:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13C92F804E7; Sat, 10 Feb 2024 14:44:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D42C8F800E3
	for <alsa-devel@alsa-project.org>; Sat, 10 Feb 2024 14:44:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D42C8F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=U6+adWaA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707572648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lEavU5RAH/wMb/RShXVhC9Z9sSkwIAvkP1y8Ec8FUiY=;
	b=U6+adWaAKNt4S2sXFJsBRCD5AS+OEMGsJeG85/+tRHv7SaWWyGCZNdbq2kahvJyoxEuAWD
	8C2jqNxpV/reSSpAvacMsWpyvwKjqw/ZUc10DznHzFyB+IEwXLXKCjax+RklmxkOeK13ui
	vvAQWkI/jQRm7prDVmX2MZzwpn1FOzE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-TcyPR9y5P72sIcPg2nov3Q-1; Sat, 10 Feb 2024 08:44:03 -0500
X-MC-Unique: TcyPR9y5P72sIcPg2nov3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB9941005055;
	Sat, 10 Feb 2024 13:44:02 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DA0A4015466;
	Sat, 10 Feb 2024 13:44:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 6.8 regression fix 0/2] ASoC: Intel: Boards: Fix NULL pointer
 deref in BYT/CHT boards
Date: Sat, 10 Feb 2024 14:43:58 +0100
Message-ID: <20240210134400.24913-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: LYM5QPQ5UBVDICSBJPWX73GM5NZUP47T
X-Message-ID-Hash: LYM5QPQ5UBVDICSBJPWX73GM5NZUP47T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LYM5QPQ5UBVDICSBJPWX73GM5NZUP47T/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi All,

While testing 6.8 on a Bay Trail device with a ALC5640 codec
I noticed a regression in 6.8 which causes a NULL pointer deref
in probe().

All BYT/CHT Intel machine drivers are affected. Patch 1/2 of
this series fixes all of them.

Patch 2/2 adds some small cleanups to cht_bsw_rt5645.c for
issues which I noticed while working on 1/2.

Regards,

Hans



Hans de Goede (2):
  ASoC: Intel: Boards: Fix NULL pointer deref in BYT/CHT boards
  ASoC: Intel: cht_bsw_rt5645: Cleanup codec_name handling

 sound/soc/intel/boards/bytcht_cx2072x.c | 3 ++-
 sound/soc/intel/boards/bytcht_da7213.c  | 3 ++-
 sound/soc/intel/boards/bytcht_es8316.c  | 3 ++-
 sound/soc/intel/boards/bytcr_rt5640.c   | 3 ++-
 sound/soc/intel/boards/bytcr_rt5651.c   | 3 ++-
 sound/soc/intel/boards/bytcr_wm5102.c   | 3 ++-
 sound/soc/intel/boards/cht_bsw_rt5645.c | 7 +++----
 sound/soc/intel/boards/cht_bsw_rt5672.c | 3 ++-
 8 files changed, 17 insertions(+), 11 deletions(-)

-- 
2.43.0

