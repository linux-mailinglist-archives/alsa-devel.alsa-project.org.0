Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DF9AED5AE
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jun 2025 09:32:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 088ED601F5;
	Mon, 30 Jun 2025 09:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 088ED601F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751268727;
	bh=IFIH+MZeZGncc5oPqvS+TkU1/Rq4qHZHJMPO62is7RU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MzvKpsgfEiG3KO8iSiV1Pmq+7utpd74ZyZ8g4iOB+iqV7RB4g92t1g3KFM+UxuH7z
	 +MM5bxIHWGSFKQIO3S+crSY0pQTmCCLOXvnBEzb1mI+wTzsiNXIYVLMhnsSlxgXKYK
	 7GmyzGPlfKlO7y21uaGF9oKA8CWySXiDM3V/3a3w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CC5FF805C6; Mon, 30 Jun 2025 09:31:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07E7AF805C1;
	Mon, 30 Jun 2025 09:31:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F7E2F804B2; Mon, 30 Jun 2025 09:31:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73FC7F800B0
	for <alsa-devel@alsa-project.org>; Mon, 30 Jun 2025 09:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73FC7F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=pN9o4lS9
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-748e63d4b05so1095480b3a.2
        for <alsa-devel@alsa-project.org>;
 Mon, 30 Jun 2025 00:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1751268685; x=1751873485; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=POxYgTmDu2e9RWNzg1dbBCkTKGEMfv0ASNz6IDybwM0=;
        b=pN9o4lS90DNCLMwRdNjBDY7PiZYeZVyPWh69oDAfZSfn3jdnLBwz8ogtJjV2tUqt8e
         IBQC5HkRxkT/JJCsI9q5G1vA4iPcxU/bsihTDo4U3158xt9h/mf+TlcVFW3yLtR25wZW
         1wpoRuxyPakGuRuOQTMkOaPLTo5h4Wu/t3Mdfvy7sAcXso/dXo1UabhMusUWGM5wYavO
         nxaP1s4mRJ/BQpG8yp+gt4IKtudOG0ZHx0g+dNtn9SuKHNwKxoxqQ3sxB9DTypbKnYD4
         uB85DilI5k6LZynofXfsVD06oE1dVQqh1/gsRVizrfVETsxTiJPYCG09oCAJSLOd7Bo4
         Oebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751268685; x=1751873485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POxYgTmDu2e9RWNzg1dbBCkTKGEMfv0ASNz6IDybwM0=;
        b=EOsuSflfawhgCQSFDtvikOAUpDI5gv1OatvRniEFgG4bPrQ4Q6Ka87kd+x8bFt2c87
         88a834pq08vNTFVaXBwkrOMPFQG/UH4BzWE6MfiGYkeothlsOkH34JWuZDN7HXCchih8
         H7w9x2uYysez4nIYRDoovO/aF9+p6yEz9J7GvuC8CYhQYk5OgVuWHNY5i96y6mDWet5j
         tpciBC7yNCljrv23b4xbI2RgaM266wpJW5ZG8HufiM4ZXICn9d5M/LPCdSGL0Dwy2sL8
         9Kcnte3xEfnO3mqT3fqe5rntavtDWMgZwFsWtSsYGCZzOzE6FGBZO8aM1gkyRiYWVLqI
         24+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3a7cW3t+ZScakPKL7rRQZldHnJD+ISlPeGTZBr+vKN0Wc4dhC7LRqPsi6gCpsMptrW2e6XP6V0Zxp@alsa-project.org
X-Gm-Message-State: AOJu0YydcILQHCmJOMfavk3Q4ddl4bAFA2/sjgSS8Ts7/V05hI1RSzIG
	E6veoY15SD5rZS6uSG/EV7AWPdP4C9WHAEv/jWBqsnImrTPFVO7oM/SYnbMO/zz6Wo0=
X-Gm-Gg: ASbGncvSdkqYsQMXzHBpC2doTbfmwLLXbiU5m8Xvj3I6R/TpcSUaoeMr0faBEhmcgp+
	SSb0c81CWlp1fWZx9Qvu0cV79bd60HidlgGs4kpeY1O1O7dVv3L9ew8W2kkKxQPfbTGoJTj5/Xe
	AfUPx/i8VEvnLMIjGb9nDOcX4QvWrscEHK1WGQd5HUIj/uNdEWVuq7ch2NyHChw5EsCDj1QgkuJ
	buwV8o+xAD0I4tKZkD9fNs/sQDMM7FkTNndSrHDsMFPtuiUlvD5Ja103UjHjTO99pctlEKHoAFG
	4AKzjMRnfKQTgUWTcVyNBuL+H2awLRmn+JjOxEGoz/v1G3lOfhbnKmIg9GYAiC0482+9q5EVMNW
	wCSVDfMtcQ4qXdziGXjb1psB6fkx0uHIDZwkjuPun6wJCB1o/Ts1rCSiNu9Tg4Yl7rGcKOTtMZc
	Oc32z/4zR580CSS74DT+5PaC0o4Civ2eFj6R/6d+FiljQ74BGmkrpcMjw=
X-Google-Smtp-Source: 
 AGHT+IF2dJnHM1Gkfw8ZKgifsBXM1Dg3mh0qy29vCF7Kn90HV7QpAS1LvEjYMDtwWkrjgbtM4CyJuQ==
X-Received: by 2002:a05:6a00:1403:b0:740:afda:a742 with SMTP id
 d2e1a72fcca58-74af6d381c6mr16618695b3a.0.1751268684834;
        Mon, 30 Jun 2025 00:31:24 -0700 (PDT)
Received: from ajye-OMEN-by-HP-Laptop-S.compal.com
 (2001-b011-2017-b5df-1684-9463-00f4-4a0e.dynamic-ip6.hinet.net.
 [2001:b011:2017:b5df:1684:9463:f4:4a0e])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af56ceb74sm8512046b3a.135.2025.06.30.00.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 00:31:24 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Naveen Manohar <naveen.m@intel.com>,
	Dharageswari R <dharageswari.r@intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mac Chiang <mac.chiang@intel.com>,
	alsa-devel@alsa-project.org,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: [PATCH v1] ASoC: Intel: soc-acpi-intel-ptl-match: Add rt721_l0
 support
Date: Mon, 30 Jun 2025 15:31:12 +0800
Message-Id: 
 <20250630073112.2823898-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PYP3IGU4KQ436VAMOVKCUVDSHVID2FKT
X-Message-ID-Hash: PYP3IGU4KQ436VAMOVKCUVDSHVID2FKT
X-MailFrom: ajye_huang@compal.corp-partner.google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PYP3IGU4KQ436VAMOVKCUVDSHVID2FKT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Patch adds driver data & match table for rt721
multi-function codec on PTL at sdw link0.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index eae75f3f0fa4..0257e12e8b6e 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -330,6 +330,15 @@ static const struct snd_soc_acpi_adr_device rt1320_3_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt721_0_single_adr[] = {
+	{
+		.adr = 0x000030025d072101ull,
+		.num_endpoints = ARRAY_SIZE(rt_mf_endpoints),
+		.endpoints = rt_mf_endpoints,
+		.name_prefix = "rt721"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt721_3_single_adr[] = {
 	{
 		.adr = 0x000330025d072101ull,
@@ -339,6 +348,15 @@ static const struct snd_soc_acpi_adr_device rt721_3_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_link_adr ptl_rt721_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt721_0_single_adr),
+		.adr_d = rt721_0_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr ptl_rt721_l3[] = {
 	{
 		.mask = BIT(3),
@@ -664,6 +682,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l3.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(0),
+		.links = ptl_rt721_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-rt721.tplg",
+	},
 	{
 		.link_mask = BIT(3),
 		.links = ptl_rt721_l3,
-- 
2.25.1

