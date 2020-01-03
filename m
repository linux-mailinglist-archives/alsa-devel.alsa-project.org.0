Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BFD12F229
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 01:23:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01DEC1660;
	Fri,  3 Jan 2020 01:22:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01DEC1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578011022;
	bh=gznGlY/EQzRpK7GptVHxpKIamT9pm+uusF6bETZyu3s=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h4LDbd5R8vETYNId6UC6WF8iDBtQJ3Jt+NdbTkLX6tjR0sk7ZbA1Is1uIZPq+3ewB
	 EPdgeYMfaKS+Yiz31BaTHhwmTldfjGO7wt7Dj1Jr20Sb/wuRwEANwKDBOgjBpMxaOx
	 fka8PLFRyNG9j60OASgX/VoCaK/TkPQApYdpzR6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16498F8011F;
	Fri,  3 Jan 2020 01:22:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03B7DF8020B; Fri,  3 Jan 2020 01:22:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C595F8011F
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 01:22:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C595F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="NqzpcO36"
Received: by mail-pf1-x443.google.com with SMTP id q8so22781175pfh.7
 for <alsa-devel@alsa-project.org>; Thu, 02 Jan 2020 16:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tUxq8i1QoyN076FNd9no9rm0JfBtqoMlndPucVdwL+Q=;
 b=NqzpcO36JT0r16vm2kcKH+pdauNyQQsUIyYJUhYlvwWBIhP3Z7RwiQn+rEob1LSmIJ
 EHgZH319tZBynp9cwUiYu7c25RRgTa3chhWSfbqGv2Emm5LQXtQg3KK7pPCXCYZAeyk3
 YRqWfrp07i9FKtXMYxREunS7kK4YIr1T2p9JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tUxq8i1QoyN076FNd9no9rm0JfBtqoMlndPucVdwL+Q=;
 b=SVlvpcBpRr3d/mrxGUB8O40xuHrbIbh/1ecFVcny/ssERmzudeziR9v1+aiZ7/CbD8
 zOoIbvpx3Za7yiV2U7/3LC4ohBAMWDcmujK+JDu9ZyZYcR8gxMcvbVE9aGq4fdARr2zh
 WwsGC1j7kNCXu+R3SQlbASAHOiwaKf7V9yOdk184XlFFLENFZgAR+thrpT2OV8cKsHIJ
 86iJzJpzXSOnJSThezri2gZMd0ZHcroxfWzNr/uK92YPuUokFGLDuRy/PL0DdFAyL06o
 ge045rOgeSltNtFZDRXOEjp5bnnSvZLXDWepcAYY49a76ws1n00K/ArGomsCk33fiHJj
 Yakg==
X-Gm-Message-State: APjAAAUmf+L373Bvo/yOJOHQUnlntwCl3tIQ/jm17C4/W8jWc10l5JcI
 4rFB4aM3mVpyv+MRyR6aqpLR2g==
X-Google-Smtp-Source: APXvYqzwQpEwtXV4Yw2vqM2WQoqggfsEW7PCxIzkquBQ9xCQStVJl8j6EU9668hHmqiPC2+AojsYdg==
X-Received: by 2002:a63:1b49:: with SMTP id b9mr92068426pgm.258.1578010938307; 
 Thu, 02 Jan 2020 16:22:18 -0800 (PST)
Received: from localhost ([2401:fa00:9:15:c479:b58e:61d1:15d5])
 by smtp.gmail.com with ESMTPSA id z64sm64784446pfz.23.2020.01.02.16.22.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2020 16:22:17 -0800 (PST)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Date: Fri,  3 Jan 2020 11:22:06 +1100
Message-Id: <20200103112158.v2.1.Ib87c4a7fbb3fc818ea12198e291b87dc2d5bc8c2@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Cc: Xun Zhang <xun2.zhang@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Jairaj Arava <jairaj.arava@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Sathya Prakash M R <sathya.prakash.m.r@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [alsa-devel] [PATCH v2] ASoC: Intel: sof_rt5682: Ignore the speaker
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
speaker amp. When a speaker amp is also present, the first 10EC5682
entry in snd_soc_acpi_intel_cml_machines[] matches, finding the
MX98357A as well, resulting in the quirk_data field in the
snd_soc_acpi_mach being non-null. When only the rt5682 is present, the
second 10EC5682 entry is matched instead and quirk_data is left null.

The sof_rt5682 driver's DMI data matching identifies that a speaker amp
is present for all Google_Hatch family devices. Detect cases where there
is no speaker amp by checking for a null quirk_data in the
snd_soc_acpi_mach and remove the speaker amp bit in that case.

Signed-off-by: Sam McNally <sammc@chromium.org>
---

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
