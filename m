Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE0912F2C9
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 02:52:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A38916F7;
	Fri,  3 Jan 2020 02:51:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A38916F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578016341;
	bh=JEXamE9HR60JPXUworygPbPcUf1X9Jm4ih6rpN7/5Y8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E1saq0AabWwh5qQKzN+Xypn4kXAiQc/7Gib7BFcE87NHlI1XGzCL1mb7dz9Wffe+a
	 lWDfb0eV8M6tZMpmiwqelq/ND7thXMFtHIIGzeiCmwuSGElGtswRAn0yUYwZ4ORm9A
	 3+JjP7hr1g7BDz3qIGIorXD30JKb6dx3wnQua/nY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46904F80157;
	Fri,  3 Jan 2020 02:50:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A522F80157; Fri,  3 Jan 2020 02:50:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8029EF8013E
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 02:50:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8029EF8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="YSfQMQ/7"
Received: by mail-pf1-x444.google.com with SMTP id x185so22863294pfc.5
 for <alsa-devel@alsa-project.org>; Thu, 02 Jan 2020 17:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oFTLxb+41MiC6n43bMNpqAO7uKgmJzv0ZXWHejH9m18=;
 b=YSfQMQ/7HsvcZuI9w3YxL0DB09qW6t/OjZDQNJZIen6innJmL4MxOUs4PgU+ocq129
 n4fW7DsI5CDnlPI2L0nmRVwm08tq/uxZM91HkVK6qySZ5HpUljW07ZAoQsrDgveAhT0I
 Gt29Z9I9segAMg3662EoldgBLZxMqmtKXCk0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oFTLxb+41MiC6n43bMNpqAO7uKgmJzv0ZXWHejH9m18=;
 b=sL6CaQLRglXN/wYyWIrODrTgM1+ikjaUMt+uY0TBH83xgJFfLNSvzxP33wFwXRw/6h
 pwO5sCIlsW0BguUM0V085uWAPBuQWxWvqlmI6H/oAoK+sRXuk5dyVQMmOAQ1ycmZyB+s
 Fom8bj5/jssTKqGm0t/4aMlz6KxtoJCSkQe5OpeHkkrwh8AYDKBdTJK6b3SBSmHENzLW
 tSdcI9IzHsxoVe1WMs69BMRvPA4cAqkxO5v62x2YZ8yxe6aEDU2Z3z0JTCQDtNbSU1JE
 3Y4SlFpmmwYnjp8Of/xWSROiJ2P0RP8S3uhYQAZ8bdwt3LJWa8eXrrQWtLae3anVObi6
 ntcQ==
X-Gm-Message-State: APjAAAWGQVFNVLMKmLQrXW+n+MmXSZxJSHSmh04Rsg+bI/cP55Ilqmcz
 JBDc5mVoN1RwcN0rT2W01e+LsA==
X-Google-Smtp-Source: APXvYqzqhwYcattRFHjc9PGKGA3bAJNMmQMLDOfPym+ZWDgsx0Z+n70qiCu1VTKmC/+wwGjAlvGSgw==
X-Received: by 2002:aa7:940e:: with SMTP id x14mr73933464pfo.42.1578016232045; 
 Thu, 02 Jan 2020 17:50:32 -0800 (PST)
Received: from localhost ([2401:fa00:9:15:c479:b58e:61d1:15d5])
 by smtp.gmail.com with ESMTPSA id z4sm12377658pjn.29.2020.01.02.17.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2020 17:50:31 -0800 (PST)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Date: Fri,  3 Jan 2020 12:50:19 +1100
Message-Id: <20200103124921.v3.1.Ib87c4a7fbb3fc818ea12198e291b87dc2d5bc8c2@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Cc: Xun Zhang <xun2.zhang@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Sathya Prakash M R <sathya.prakash.m.r@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [alsa-devel] [PATCH v3] ASoC: Intel: sof_rt5682: Ignore the speaker
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

Some members of the Google_Hatch family include a rt5682 jack codec, but
no speaker amplifier. This uses the same driver (sof_rt5682) as a
combination of rt5682 jack codec and max98357a speaker amplifier. Within
the sof_rt5682 driver, these cases are not currently distinguishable,
relying on a DMI quirk to decide the configuration. This causes an
incorrect configuration when only the rt5682 is present on a
Google_Hatch device.

For CML, the jack codec is used as the primary key when matching,
with a possible speaker amplifier described in quirk_data. The two cases
of interest are the second and third 10EC5682 entries in
snd_soc_acpi_intel_cml_machines[]. The second entry matches the
combination of rt5682 and max98357a, resulting in the quirk_data field
in the snd_soc_acpi_mach being non-null, pointing at
max98357a_spk_codecs, the snd_soc_acpi_codecs for the matched speaker
amplifier. The third entry matches just the rt5682, resulting in a null
quirk_data.

The sof_rt5682 driver's DMI data matching identifies that a speaker
amplifier is present for all Google_Hatch family devices. Detect cases
where there is no speaker amplifier by checking for a null quirk_data in
the snd_soc_acpi_mach and remove the speaker amplifier bit in that case.

Signed-off-by: Sam McNally <sammc@chromium.org>
---

Changes in v3:
- Rewrote commit message to refer to correct
  snd_soc_acpi_intel_cml_machines[] entries and better describe the
  change

Changes in v2:
- Added details about the relevant ACPI matches to the description

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
