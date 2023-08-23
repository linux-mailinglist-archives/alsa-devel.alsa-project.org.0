Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5529A784F86
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 06:09:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A047B91;
	Wed, 23 Aug 2023 06:08:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A047B91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692763776;
	bh=E77xry1tiLz5202bLBdOFmCxxoQ4He0lmM0GiZevcao=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JuaG+tSF4zNl/WGxMljYDOCJoMrbLhcvfKF66beuuN1+M/NxWyZqf7h4K+A+N/RcB
	 XyejbQDuu9KBSzt9rS76s5rw/UV73/F6UC4b5JEA9L2fwRE7wcHiBZn0fX/ifar2o4
	 z713QDLclfJ3jf661HmfYPwkJPeHa3xtHT6LyrL8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74646F804DA; Wed, 23 Aug 2023 06:08:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 477E6F800F5;
	Wed, 23 Aug 2023 06:08:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45C4EF80158; Wed, 23 Aug 2023 06:08:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C1FBF800BF
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 06:08:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C1FBF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=compal-corp-partner-google-com.20221208.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20221208.gappssmtp.com
 header.a=rsa-sha256 header.s=20221208 header.b=3orXEGVh
Received: by mail-pl1-x641.google.com with SMTP id
 d9443c01a7336-1bf0b24d925so34048955ad.3
        for <alsa-devel@alsa-project.org>;
 Tue, 22 Aug 2023 21:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20221208.gappssmtp.com; s=20221208;
 t=1692763688; x=1693368488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SBhEGG+ClTjVSBF2+FWZ6qlB0RipiK12gm3vVvhGHF4=;
        b=3orXEGVhh6pN+1ABGWxYrkdjANIO1F55DmVrh/ZxM+sTpnC236j4AyAoJOYGofo7T0
         RkugKm5JbpiMpACvETyM3hPUuVeX8ByVKpR3/RUvX21ctpQjjiu5HlonJrkRfsqbBGQi
         2wwemKq9S4OgCLGatg+TiKEwTN4mWv/M+dwqTLM0ACe5mBBHn1sOmgt0PBHy4lEvFPZ7
         XqC189Tu0X0GvAo2vR4NARIUJtdTnJFV9gtwO961yXFt9wtrR2hV7a9VnvujTbFd6jh5
         UL74mN7TNg81K/0iFE2bfwpglxzNsgd4p0l0BbEcnNX9stfuB/nefxXOe3k22Zz6AZSP
         WNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692763688; x=1693368488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBhEGG+ClTjVSBF2+FWZ6qlB0RipiK12gm3vVvhGHF4=;
        b=Nwq9jKs1q9WK3xoRNblrshzsqVo+RNOLG5qXH0K+3T07NbvVGgzA0fijAa968sbg+a
         rzP+kCAXrBf4yEgnecpoDGqRJK+aXSNVZOBKPDk899Js7cezauloK6vQuqlQTL7IKvyC
         vz6Ay/eHmjKVYECTw/1KxaBCyefhK4O0Ejh71q880/gGYGqEpgI0hyIa3JqxxtvHm9Ir
         vsGtSYPlhKNLG5+dzJ1wrmJ6h3+MUxm2EWEEojarAMTi2N/zOpSV9V7qkiDDnC3ydvAj
         CRFFGvv2Qg9ipI9qAk5Qqu0khNtPIEq9FQjtreNyqwPaMog8HRSEkHEchHnB6RFMPlWw
         zw8w==
X-Gm-Message-State: AOJu0Yw9NNV4c/7tbY56tdpE8S/XlwEzdgDw2oS81KwMqyAeDOmnw0I7
	eym+wYjZNJAWRu7FZd+bhU2Ajw==
X-Google-Smtp-Source: 
 AGHT+IGmPW1I50BeWuD4Y3xMRlxyksUP9t/Tz9yZNhZoYw/MNuClm66cutpxb36rRLJP5d1PTRWerQ==
X-Received: by 2002:a17:903:2644:b0:1bd:b79:3068 with SMTP id
 je4-20020a170903264400b001bd0b793068mr7963342plb.48.1692763688001;
        Tue, 22 Aug 2023 21:08:08 -0700 (PDT)
Received: from localhost.localdomain (1-171-147-46.dynamic-ip.hinet.net.
 [1.171.147.46])
        by smtp.gmail.com with ESMTPSA id
 bi8-20020a170902bf0800b001bdcde49bc3sm9784332plb.119.2023.08.22.21.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 21:08:07 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Yong Zhi <yong.zhi@intel.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	"balamurugan . c" <balamurugan.c@intel.com>,
	Libin Yang <libin.yang@intel.com>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	David Lin <CTLIN0@nuvoton.com>,
	Brent Lu <brent.lu@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Terry Cheong <htcheong@chromium.org>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Gongjun Song <gongjun.song@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	apoorv <apoorv@intel.com>,
	alsa-devel@alsa-project.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v1] Revert "ASoC: Intel: Add rpl_nau8318_8825 driver"
Date: Wed, 23 Aug 2023 12:07:55 +0800
Message-Id: 
 <20230823040755.2217942-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BE6SWQE2O7USNPDPF56T7HBOQGSEYJRF
X-Message-ID-Hash: BE6SWQE2O7USNPDPF56T7HBOQGSEYJRF
X-MailFrom: ajye_huang@compal.corp-partner.google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BE6SWQE2O7USNPDPF56T7HBOQGSEYJRF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This reverts commit 6b8b6892e43419f5339c47d307b1baac0eea036d.

Report from kernel test robot <lkp@intel.com>, that
in broonie/ci.git file0yZ50U, it's redundant
commit 6b8b6892e434 ("ASoC: Intel: Add rpl_nau8318_8825 driver")
because commit 273bc8bf2227 ("ASoC: Intel: Add rpl_nau8318_8825 driver")
was committed at 2023-08-14.

 All errors (new ones prefixed by >>):
>> sound/soc/intel/common/soc-acpi-intel-rpl-match.c:369:41: error: redefinition of 'rpl_nau8318_amp'
   static const struct snd_soc_acpi_codecs rpl_nau8318_amp = {
                                           ^
   sound/soc/intel/common/soc-acpi-intel-rpl-match.c:359:41: note: previous definition is here
   static const struct snd_soc_acpi_codecs rpl_nau8318_amp = {

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308221955.FkglAuTF-lkp@intel.com/
Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 103490ac7c838..122673c1dae27 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -366,11 +366,6 @@ static const struct snd_soc_acpi_codecs rpl_rt1019p_amp = {
 	.codecs = {"RTL1019"}
 };
 
-static const struct snd_soc_acpi_codecs rpl_nau8318_amp = {
-	.num_codecs = 1,
-	.codecs = {"NVTN2012"}
-};
-
 struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 	{
 		.comp_ids = &rpl_rt5682_hp,
-- 
2.25.1

