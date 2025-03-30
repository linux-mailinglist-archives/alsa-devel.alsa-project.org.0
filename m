Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11900A84107
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Apr 2025 12:43:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 736B46A863;
	Thu, 10 Apr 2025 12:43:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 736B46A863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744281813;
	bh=D3olxYLlBQ+nUTuxA65h4ayn7fzQD05m+AcZNVbUetg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UzOoeoHGrkT0de/1ChRy247ICpFEp6cxE4FHA0V70glxSX/pNF5M7dofuBk98zzMv
	 piqoywc2YUD8SsOOu7+mlTOHrsGGc2zbx/AkL8cpwnuaYS8LUOyjlVG9amKpYoOij5
	 NSi2B4x6CTmxP75FSc0mmSsOLsHedIaZuDPDofuA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75A7DF805C0; Thu, 10 Apr 2025 12:43:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B8DBF805B5;
	Thu, 10 Apr 2025 12:43:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95B30F802DB; Sun, 30 Mar 2025 15:09:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8AED5F8001D
	for <alsa-devel@alsa-project.org>; Sun, 30 Mar 2025 15:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AED5F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZfUS8kTW
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-6ecfc7ed0c1so32874796d6.3
        for <alsa-devel@alsa-project.org>;
 Sun, 30 Mar 2025 06:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743340159; x=1743944959;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+f8/d1LUJCYjyq/aaDtzvsA9nVkE0shHwGbrMegDUrU=;
        b=ZfUS8kTWu7lpJu8KCmGeaO+bujOM9Wl1qBAoLYZ6Skze4Vx31Z74ORPmcAInKz28ar
         PQC2LeljKIt+rkiMKf2B5L4ewKBqfBCNJfiAjqFpVYA/SvJfrvalM062gUJHQughVVJf
         KywiFPr4RaTiuF6Z+D+70dq8+kqMgK6jTE4M8oYKF2Ic1bk5O6N7TJR92cgy/jE5FJrj
         +pk3zpmQXw3B3Kc4B+8z1hXeVw5pss88RuCSU2gTs5/tuASdhvMtWBfFDqFvhGW0/lOV
         L3FiOA9R9HHTeNjcVY2aKmmAWYW5rLXAm06SwHx55q0V4WU5U5KrrTe+M2MB5iTPHkXH
         MTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743340159; x=1743944959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+f8/d1LUJCYjyq/aaDtzvsA9nVkE0shHwGbrMegDUrU=;
        b=iu3r5FLxl1G+98et5/u4KSnfXwYfpIlbfl+3PDsc1MIIMqLXtS+CVJ48g2q9Z/igz1
         oUkTcjkT79nKq01ism9AtSNHjrLFv2kn03CRv/bWgoaLfh0CWqrE3As+aVoSbA6cteVZ
         OkwiV1ta4mKwb4+7r/79xaUmFirWVm14GV32Ux3pZ4OnPXefm4EJrkDI6tE/ptWMOgVT
         K2TMnhDF6yu/AXbt4V24AAvxysI6r0MmNyVS93Lts6+Zb5VLrrxTnggbGkOvx5PSsa6s
         Y4U8cA50cb3obqbK3azfGEkNZDx0n6hvB/3+9S1xLFWp9suo4fo5kdKI/tmPmsPVVZPG
         iI9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/6B8/80/Gnn8mrMivhaZg3nRVVyahIjWM4W1NQadX+dgLeFFjJD9XjKY7uy1OkziTqvPo+1Xmd/7D@alsa-project.org
X-Gm-Message-State: AOJu0YysAwq/XcuAvBo9Nj4GOJStLiibJZNSQdEUMwf7gC4kN4gIvfJe
	2VUE6XkO2/oU5Nd6cL6EurfBPNGWbIttkGPSk3D6UWv9XYyBlUpk
X-Gm-Gg: ASbGncupeBIJaba92j5Sw71khczgfT/GBHokGyAFh4sBcdJN2O4Oqn8WJgpxt2u6nAB
	198MF2JOa2qS8luNpS0yBPBtmxzmj7BpTadgpTu8EiMwoTkkrfh9jwIxUvXE1VmV6BwzeE+QMpp
	ICPWi++p6rFdgJ+XumLX67uqSpkOZDyzX6Qk5wC3UEiE6GmyoBqYiAJbYgqIeNQH3EC01WA3x3M
	s136lLqMgJSwjHR8rDDnhcCPNwr1KA9f/X0VsJqWJnyVRfjxNeu9gbIqW0Gt4xYBrONtuMk17N0
	yHIlU4nNq1BkeU2J6YS0EwFribd+/Zmcyin98yte4uWGl7dGdxlU/cazqdzm8ouYc9zChCqAlA7
	A74jykW9zvu6HxqyyEuU=
X-Google-Smtp-Source: 
 AGHT+IGeW8/4t87eo3BmiJ5DqyKAxUo+ucEX1aeMXgaM2kqMDezafr8XhvZLkCdxwkgarITLCh9R1g==
X-Received: by 2002:a05:6214:1bc5:b0:6ed:df6:cdcd with SMTP id
 6a1803df08f44-6eed604410fmr77297666d6.21.1743340158836;
        Sun, 30 Mar 2025 06:09:18 -0700 (PDT)
Received: from localhost.localdomain (c-68-55-107-1.hsd1.mi.comcast.net.
 [68.55.107.1])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6eec9627b36sm34011146d6.6.2025.03.30.06.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 06:09:18 -0700 (PDT)
From: Brady Norander <bradynorander@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Aleksandr Mishin <amishin@t-argos.ru>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Brady Norander <bradynorander@gmail.com>
Subject: [PATCH v2] ASoC: amd: use new ACP dev names for DAI links
Date: Sun, 30 Mar 2025 09:08:45 -0400
Message-ID: <20250330130844.37870-2-bradynorander@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: bradynorander@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: R6WDBAO6ISZVTGTSD4452IUXODALYZHZ
X-Message-ID-Hash: R6WDBAO6ISZVTGTSD4452IUXODALYZHZ
X-Mailman-Approved-At: Thu, 10 Apr 2025 10:42:58 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R6WDBAO6ISZVTGTSD4452IUXODALYZHZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On AMD SoC platforms with an ACP2x gpu ip block (such as stoneyridge),
the amdgpu driver will create several platform devices for the ACP ASoC
driver to communicate with the ACP hardware block on the gpu. These
platform devices include dma for audio and one or multiple i2s
interfaces. The amdgpu driver has always created these platform devices
with automatic ids. The ASoC machine drives hardcode the platform device
name. This creates an issue where if the ACP platform devices are not
the first to be created, the ids can be different to what the machine
drivers expect, causing them to not find the ACP platform devices and
failing to load. Switch to using static ids for these ACP platform
devices so that the names never change.

Depends on patch: drm/amdgpu: use static ids for ACP platform devs [1]

[1] https://lore.kernel.org/all/20250325210517.2097188-1-bradynorander@gmail.com/

Signed-off-by: Brady Norander <bradynorander@gmail.com>
---
v2: rewrite commit message to better describe the issue
---
 sound/soc/amd/acp-da7219-max98357a.c | 8 ++++----
 sound/soc/amd/acp-es8336.c           | 4 ++--
 sound/soc/amd/acp-rt5645.c           | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 02b04f355ca6..42aa009c4e13 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -517,11 +517,11 @@ static const struct snd_soc_ops cz_rt5682_dmic1_cap_ops = {
 };
 
 SND_SOC_DAILINK_DEF(designware1,
-	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.1.auto")));
+	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.1")));
 SND_SOC_DAILINK_DEF(designware2,
-	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.2.auto")));
+	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.2")));
 SND_SOC_DAILINK_DEF(designware3,
-	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.3.auto")));
+	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.3")));
 
 SND_SOC_DAILINK_DEF(dlgs,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-DLGS7219:00", "da7219-hifi")));
@@ -533,7 +533,7 @@ SND_SOC_DAILINK_DEF(adau,
 	DAILINK_COMP_ARRAY(COMP_CODEC("ADAU7002:00", "adau7002-hifi")));
 
 SND_SOC_DAILINK_DEF(platform,
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("acp_audio_dma.0.auto")));
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("acp_audio_dma.0")));
 
 static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 	{
diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index 0193b3eae7a6..b16dde0e2987 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -137,11 +137,11 @@ static const struct snd_soc_ops st_es8336_ops = {
 };
 
 SND_SOC_DAILINK_DEF(designware1,
-		    DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.2.auto")));
+		    DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.1")));
 SND_SOC_DAILINK_DEF(codec,
 		    DAILINK_COMP_ARRAY(COMP_CODEC("i2c-ESSX8336:00", "ES8316 HiFi")));
 SND_SOC_DAILINK_DEF(platform,
-		    DAILINK_COMP_ARRAY(COMP_PLATFORM("acp_audio_dma.1.auto")));
+		    DAILINK_COMP_ARRAY(COMP_PLATFORM("acp_audio_dma.0")));
 
 static struct snd_soc_dai_link st_dai_es8336[] = {
 	{
diff --git a/sound/soc/amd/acp-rt5645.c b/sound/soc/amd/acp-rt5645.c
index 72ddad24dbda..11d373169380 100644
--- a/sound/soc/amd/acp-rt5645.c
+++ b/sound/soc/amd/acp-rt5645.c
@@ -108,15 +108,15 @@ static const struct snd_soc_ops cz_aif1_ops = {
 };
 
 SND_SOC_DAILINK_DEF(designware1,
-	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.1.auto")));
+	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.1")));
 SND_SOC_DAILINK_DEF(designware2,
-	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.2.auto")));
+	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.2")));
 
 SND_SOC_DAILINK_DEF(codec,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5650:00", "rt5645-aif1")));
 
 SND_SOC_DAILINK_DEF(platform,
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("acp_audio_dma.0.auto")));
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("acp_audio_dma.0")));
 
 static struct snd_soc_dai_link cz_dai_rt5650[] = {
 	{
-- 
2.49.0

