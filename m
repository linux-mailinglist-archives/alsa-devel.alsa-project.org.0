Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6501A3A24
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 21:03:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBD871692;
	Thu,  9 Apr 2020 21:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBD871692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586458987;
	bh=t7qxo2IMUWDYjpH/DtJSFFRkDae01aJ1DXyFj5bVu44=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XCma+ADrKaa6KhoOGeBswXZ3z7Mpjk1qXKl1OhsXIjL6T7otAyWZ2aWpUlnImNTm9
	 DBg7230GOQ1yeLSaG/0SdNjdC7oNW0QnXoqKezAw7Te1/E/SSkZuhF6eQpvMeHm0Pt
	 pGGm6z1mZzuYm8rAT9aPUlIuohwnbCSKrEEjtOPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90EC6F802A7;
	Thu,  9 Apr 2020 20:58:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BA2BF802A0; Thu,  9 Apr 2020 20:58:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 302F1F801D8
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 20:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 302F1F801D8
IronPort-SDR: m8UiqsdehsEEAFSFwm67CP1q6aE07DbohxCAZ2BKZ9OsEUniNYkNf4B0YWEFxnyOc1HkrvksBz
 rcm0R5Urifvw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 11:58:40 -0700
IronPort-SDR: XaSOxcAk4igOEXPAJekgNHkSxaQUVQwK/FVeWQTzLBKP5hnNdZOVqRTh1OcREjL9aEIk0Ff5zX
 N2N+GyTGKjFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="255248845"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by orsmga006.jf.intel.com with ESMTP; 09 Apr 2020 11:58:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/13] ASoC: Intel: sof-da7219-max98373: add DMIC widget and
 route
Date: Thu,  9 Apr 2020 13:58:21 -0500
Message-Id: <20200409185827.16255-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409185827.16255-1-pierre-louis.bossart@linux.intel.com>
References: <20200409185827.16255-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Keyon Jie <yang.jie@linux.intel.com>

Add DMIC endpoint widget and route to make DMIC DAPM routes completed,
to make DAPM Power Management works for DMIC streams.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219_max98373.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
index 8b5b74ba349f..8ca8f76470fa 100644
--- a/sound/soc/intel/boards/sof_da7219_max98373.c
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -86,6 +86,8 @@ static const struct snd_soc_dapm_widget widgets[] = {
 	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
 			    platform_clock_control, SND_SOC_DAPM_POST_PMD |
 			    SND_SOC_DAPM_PRE_PMU),
+
+	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
 };
 
 static const struct snd_soc_dapm_route audio_map[] = {
@@ -99,6 +101,9 @@ static const struct snd_soc_dapm_route audio_map[] = {
 
 	{ "Left Spk", NULL, "Left BE_OUT" },
 	{ "Right Spk", NULL, "Right BE_OUT" },
+
+	/* digital mics */
+	{"DMic", NULL, "SoC DMIC"},
 };
 
 /* For MAX98360A amp */
@@ -111,6 +116,8 @@ static const struct snd_soc_dapm_widget max98360a_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
 			    platform_clock_control, SND_SOC_DAPM_POST_PMD |
 			    SND_SOC_DAPM_PRE_PMU),
+
+	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
 };
 
 static const struct snd_soc_dapm_route max98360a_map[] = {
@@ -123,6 +130,9 @@ static const struct snd_soc_dapm_route max98360a_map[] = {
 	{ "Headset Mic", NULL, "Platform Clock" },
 
 	{"Spk", NULL, "Speaker"},
+
+	/* digital mics */
+	{"DMic", NULL, "SoC DMIC"},
 };
 
 static struct snd_soc_jack headset;
-- 
2.20.1

