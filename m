Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B29412E150
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jan 2020 01:31:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB8BB16B5;
	Thu,  2 Jan 2020 01:30:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB8BB16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577925063;
	bh=m5rrAEbsIpKLGrRTkxoe3wGka0TkvsvwFEaE5ZMB6Zw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AHYSmmnlcSC0CnwDrqJ/FC9ycGWKtfNK0qb40CdoUKoq7Gto+tx6FRfS0W0O2KhS9
	 0vezVlrlQESKr1zWfpogYq4A7nbaFzjXbY6NOXqBbjTRgtnsb9B/4QMK7c9rxS+gW7
	 6J21xlrkF7Pc9n1MaUbKdMbuM4c8sEO+DEy8tKMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F5A8F8015E;
	Thu,  2 Jan 2020 01:29:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BCA1F8015D; Thu,  2 Jan 2020 01:29:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9465F8011E
 for <alsa-devel@alsa-project.org>; Thu,  2 Jan 2020 01:29:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9465F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="mf6oJFqD"
Received: by mail-pl1-x641.google.com with SMTP id f20so17193967plj.5
 for <alsa-devel@alsa-project.org>; Wed, 01 Jan 2020 16:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9GJYS2xwYL6+Da0JsxP8DsSxNZ3j5TIjH/wHBFm0PRA=;
 b=mf6oJFqDXwxAXyg4aXPM84cAGHIdCVNqcZT5aleGPlTquh+FLh1f+dyPgxcXX5RXfM
 Qce0ahB7vz5jMsconZUcEGtyAUQ+lv75rMVTUlh+62VKKOT94OENioubYP82GLE24SkO
 y5wTcSP8uunA6ljabFPF+vsqwVSuabg6vh9ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9GJYS2xwYL6+Da0JsxP8DsSxNZ3j5TIjH/wHBFm0PRA=;
 b=gO43Z6XF9RbShzA1g6Ok0WlbtaRL954x+I9z/zg56FB1zUFk8hsDBeHBV+xtwcTwmq
 GYpWfwGQ+UOGnqQjeQtHuZ/JGCKHdcgpxq3j487s6NAIhkampwqULhbJXe7kMhJMGcqG
 XvlvSGo+EDDT7pyZP3RX/rAfuPQB+LDUcRvF730JzIRnj3oykPpQ9YWwf7Te111NEOaH
 zPCG/OWqmkpryX+Nx/ZDik0d3mb4y1nO7/PCiMetwrLqOZ+PANGqlGIX1hQsWK0GT80p
 6BVNdXJI5r5GSze/FufG0VrTJbE6BhpVBcrcfIOk8r3XIuOxrLZ5+fq4XU3rmk0gvGcq
 SBrA==
X-Gm-Message-State: APjAAAVMIMoFZzI/gzOxNYcbfo4/P+b3pbQ4X7gYDKf6nXReJuoBX/CD
 n3IoZ2AUjE8BrzGfPaSC74DEOQ==
X-Google-Smtp-Source: APXvYqxneFpTHIfgl2F/2i+m025oRgDpA8vNciUpijln22SYxjPjYXhMkW/DNF5QacCVeiX0ZzX2DA==
X-Received: by 2002:a17:90b:3c9:: with SMTP id
 go9mr16175122pjb.7.1577924944088; 
 Wed, 01 Jan 2020 16:29:04 -0800 (PST)
Received: from localhost ([2401:fa00:9:15:c479:b58e:61d1:15d5])
 by smtp.gmail.com with ESMTPSA id b65sm58498229pgc.18.2020.01.01.16.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jan 2020 16:29:03 -0800 (PST)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Date: Thu,  2 Jan 2020 11:28:12 +1100
Message-Id: <20200102112558.1.Ib87c4a7fbb3fc818ea12198e291b87dc2d5bc8c2@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Cc: Xun Zhang <xun2.zhang@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Jairaj Arava <jairaj.arava@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Sathya Prakash M R <sathya.prakash.m.r@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: Intel: sof_rt5682: Ignore the speaker
	amp when there isn't one.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Some members of the Google_Hatch family include a rt5682, but not a
speaker amp. When a speaker amp is also present, it matches MX98357A
as well, resulting in the quirk_data field in the snd_soc_acpi_mach
being non-null. When only the rt5682 is present, quirk_data is left
null.

The sof_rt5682 driver's DMI data matching identifies that a speaker amp
is present for all Google_Hatch family devices. Detect cases where there
is no speaker amp by checking for a null quirk_data in the
snd_soc_acpi_mach and remove the speaker amp bit in that case.

Signed-off-by: Sam McNally <sammc@chromium.org>
---

 sound/soc/intel/boards/sof_rt5682.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index ad8a2b4bc709..8a13231dee15 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -603,6 +603,14 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dmi_check_system(sof_rt5682_quirk_table);
 
+	mach = (&pdev->dev)->platform_data;
+
+	/* A speaker amp might not be present when the quirk claims one is.
+	 * Detect this via whether the machine driver match includes quirk_data.
+	 */
+	if ((sof_rt5682_quirk & SOF_SPEAKER_AMP_PRESENT) && !mach->quirk_data)
+		sof_rt5682_quirk &= ~SOF_SPEAKER_AMP_PRESENT;
+
 	if (soc_intel_is_byt() || soc_intel_is_cht()) {
 		is_legacy_cpu = 1;
 		dmic_be_num = 0;
@@ -663,7 +671,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
 
 	sof_audio_card_rt5682.dev = &pdev->dev;
-	mach = (&pdev->dev)->platform_data;
 
 	/* set platform name for each dailink */
 	ret = snd_soc_fixup_dai_links_platform_name(&sof_audio_card_rt5682,
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
