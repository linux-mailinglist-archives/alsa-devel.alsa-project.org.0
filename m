Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8A71188E7
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 13:53:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A710115F9;
	Tue, 10 Dec 2019 13:52:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A710115F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575982422;
	bh=q46hE5zIsxhwWQuSJhM3/Rg+YU5oTP2fgE41aSfG1is=;
	h=Date:To:From:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LI0pPOmVcm8p7xKExUytU2PUDSa5GeAU+PgPQa1nBg39OyFD8gKq6Tm+nYzin/bWE
	 YfxiAGQAjge1HeloN2E7XSPq66ZMktIINsoQs12umB8CIGlxWFiXogWHC8k69LtGYd
	 xt7EWkJGgV0uTgvrrQMI1BJhHBLwX6jvSlfefNys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DCCCF800F3;
	Tue, 10 Dec 2019 13:51:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E53BF8020C; Tue, 10 Dec 2019 13:51:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BE7FF800F3
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 13:51:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BE7FF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com
 header.i=@kernelci-org.20150623.gappssmtp.com header.b="uh3mhyY9"
Received: by mail-wr1-x441.google.com with SMTP id j42so19905910wrj.12
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 04:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernelci-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:content-transfer-encoding:subject:to
 :from:cc; bh=OLrkMP1SU9o9YBr7j7LFNOgjptF6dJnR5stNA5yE+Q8=;
 b=uh3mhyY9uLO+mp2uiWazSJDcsnD5XfkpEOOcw1HNtcmytJFF5tu1V1nPwA6UbdH+2h
 /yxK3KCWNiZGyuFUODO1SVEoY4YmwIbJJJDLzCTFvsoc4Y3lx6RG55Wv0RhOI+Ld68F1
 MmTZZ84eonn/IAbK3vNCAYisSE4+wUk1qgGm4WGHokRJ5AV0cywIJGLKWA1egaIQv5Nf
 KdXxvktEn0ICLFcYXa263fjycY3/1jjakB53NOo+xMp66+udx5bOKyfOFp6cMX/sXGQ7
 GN+E2np2vMaWS1W5L9vO0alDheKQrwusY8FOV/qYloYWj78QTllHyxx5E02P8FWc8+bb
 uxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version
 :content-transfer-encoding:subject:to:from:cc;
 bh=OLrkMP1SU9o9YBr7j7LFNOgjptF6dJnR5stNA5yE+Q8=;
 b=kkDd6JA+3CNWrSuOkJTZE6PtOWF73CmmIak0i9XiX93vhBWJ/KE5omTFw5TQcUk/bH
 mpJvThOw9UmQisnNkGr1tFXRXtAK1pGm/2MVlyYpwUq1GBrzYDnM+aWRgOfBrAm8uS5D
 /MBfUzx8l5JJHUoqkIBR9WiWsqEe/mjQ/K3tlpOqQpJ2ZQBsmt6M5waaWifwweXK1zkH
 pDI/Jw9Y23rZoBXTAc7Vf0jDS4m+YKdj7SU5wWDrbtC7ccIZT5whJislzjpym83ZzABv
 ObdA1lGZbM+UcMaoM3LXFrNtMj+UPISvPcig3wbRWjTRltYMldA0MFG1OT9sqhssglYw
 RlTQ==
X-Gm-Message-State: APjAAAXnlW4Qo6njfwPN9m718NfjFzgXjhOzfL6/Reh4yqlVnaDqgOpF
 4BM0CAD4jILe6ztL+tJJ3WhWsA==
X-Google-Smtp-Source: APXvYqxUkysahHkOiervGkOZJnvReIh3BHdOH5U6VcuWUyHem/WdlgN/yXqsOWyR+BN1yZhWfyRLnQ==
X-Received: by 2002:a05:6000:cb:: with SMTP id
 q11mr3039832wrx.14.1575982312182; 
 Tue, 10 Dec 2019 04:51:52 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
 by smtp.gmail.com with ESMTPSA id d186sm3013991wmf.7.2019.12.10.04.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 04:51:51 -0800 (PST)
Message-ID: <5def94e7.1c69fb81.2751f.190a@mx.google.com>
Date: Tue, 10 Dec 2019 04:51:51 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Report-Type: bisect
X-Kernelci-Kernel: v5.5-rc1-46-g3778790e1d13
X-Kernelci-Tree: broonie-sound
X-Kernelci-Branch: for-next
X-Kernelci-Lab-Name: lab-collabora
To: Olivier Moysan <olivier.moysan@st.com>, mgalka@collabora.com,
 Mark Brown <broonie@kernel.org>, enric.balletbo@collabora.com,
 khilman@baylibre.com, tomeu.vizoso@collabora.com, broonie@kernel.org,
 guillaume.tucker@collabora.com
From: "kernelci.org bot" <bot@kernelci.org>
Cc: Brian Austin <brian.austin@cirrus.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Paul Handrigan <Paul.Handrigan@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] broonie-sound/for-next bisection: boot on
	rk3399-gru-kevin
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

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* This automated bisection report was sent to you on the basis  *
* that you may be involved with the breaking commit it has      *
* found.  No manual investigation has been done to verify it,   *
* and the root cause of the problem may be somewhere else.      *
*                                                               *
* If you do send a fix, please include this trailer:            *
*   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
*                                                               *
* Hope this helps!                                              *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

broonie-sound/for-next bisection: boot on rk3399-gru-kevin

Summary:
  Start:      3778790e1d13 Merge branch 'asoc-5.6' into asoc-next
  Details:    https://kernelci.org/boot/id/5deef68acb72c66093960f08
  Plain log:  https://storage.kernelci.org//broonie-sound/for-next/v5.5-rc1-46-g3778790e1d13/arm64/defconfig/gcc-8/lab-collabora/boot-rk3399-gru-kevin.txt
  HTML log:   https://storage.kernelci.org//broonie-sound/for-next/v5.5-rc1-46-g3778790e1d13/arm64/defconfig/gcc-8/lab-collabora/boot-rk3399-gru-kevin.html
  Result:     abe3b6727b65 ASoC: cs42l51: add dac mux widget in codec routes

Checks:
  revert:     PASS
  verify:     PASS

Parameters:
  Tree:       broonie-sound
  URL:        https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
  Branch:     for-next
  Target:     rk3399-gru-kevin
  CPU arch:   arm64
  Lab:        lab-collabora
  Compiler:   gcc-8
  Config:     defconfig
  Test suite: boot

Breaking commit found:

-------------------------------------------------------------------------------
commit abe3b6727b653307c27870a2d4ecbf9de4e914a5
Author: Olivier Moysan <olivier.moysan@st.com>
Date:   Tue Dec 3 15:16:27 2019 +0100

    ASoC: cs42l51: add dac mux widget in codec routes
    
    Add "DAC mux" DAPM widget in CS42l51 audio codec routes,
    to support DAC mux control and to remove error trace
    "DAC Mux has no paths" at widget creation.
    Note: ADC path of DAC mux is not routed in this patch.
    
    Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
    Link: https://lore.kernel.org/r/20191203141627.29471-1-olivier.moysan@st.com
    Signed-off-by: Mark Brown <broonie@kernel.org>

diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index 55408c8fcb4e..e47758e4fb36 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -214,12 +214,10 @@ static const struct snd_soc_dapm_widget cs42l51_dapm_widgets[] = {
 	SND_SOC_DAPM_ADC_E("Right ADC", "Right HiFi Capture",
 		CS42L51_POWER_CTL1, 2, 1,
 		cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
-	SND_SOC_DAPM_DAC_E("Left DAC", "Left HiFi Playback",
-		CS42L51_POWER_CTL1, 5, 1,
-		cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
-	SND_SOC_DAPM_DAC_E("Right DAC", "Right HiFi Playback",
-		CS42L51_POWER_CTL1, 6, 1,
-		cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
+	SND_SOC_DAPM_DAC_E("Left DAC", NULL, CS42L51_POWER_CTL1, 5, 1,
+			   cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
+	SND_SOC_DAPM_DAC_E("Right DAC", NULL, CS42L51_POWER_CTL1, 6, 1,
+			   cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
 
 	/* analog/mic */
 	SND_SOC_DAPM_INPUT("AIN1L"),
@@ -255,6 +253,12 @@ static const struct snd_soc_dapm_route cs42l51_routes[] = {
 	{"HPL", NULL, "Left DAC"},
 	{"HPR", NULL, "Right DAC"},
 
+	{"Right DAC", NULL, "DAC Mux"},
+	{"Left DAC", NULL, "DAC Mux"},
+
+	{"DAC Mux", "Direct PCM", "Playback"},
+	{"DAC Mux", "DSP PCM", "Playback"},
+
 	{"Left ADC", NULL, "Left PGA"},
 	{"Right ADC", NULL, "Right PGA"},
-------------------------------------------------------------------------------


Git bisection log:

-------------------------------------------------------------------------------
git bisect start
# good: [e42617b825f8073569da76dc4510bfa019b1c35a] Linux 5.5-rc1
git bisect good e42617b825f8073569da76dc4510bfa019b1c35a
# bad: [3778790e1d1329223601c63602286ad1d73c480f] Merge branch 'asoc-5.6' into asoc-next
git bisect bad 3778790e1d1329223601c63602286ad1d73c480f
# bad: [3e62579436c6a7fc35de7318e6c5f495b8d0046c] ASoC: SOF: core: modify the signature for snd_sof_create_page_table
git bisect bad 3e62579436c6a7fc35de7318e6c5f495b8d0046c
# good: [62d5ae4cafb7ffeeec6ba2dd1814cafeeea7dd8f] ASoC: max98090: save and restore SHDN when changing sensitive registers
git bisect good 62d5ae4cafb7ffeeec6ba2dd1814cafeeea7dd8f
# bad: [bc9a665581b3c6c82c9220a47f6573b49ce2df0b] ASoC: fix soc-core.c kernel-doc warning
git bisect bad bc9a665581b3c6c82c9220a47f6573b49ce2df0b
# bad: [abe3b6727b653307c27870a2d4ecbf9de4e914a5] ASoC: cs42l51: add dac mux widget in codec routes
git bisect bad abe3b6727b653307c27870a2d4ecbf9de4e914a5
# good: [49df1e3925824cf44e590daac635974270185841] ASoC: rsnd: Calculate DALIGN inversion at run-time
git bisect good 49df1e3925824cf44e590daac635974270185841
# first bad commit: [abe3b6727b653307c27870a2d4ecbf9de4e914a5] ASoC: cs42l51: add dac mux widget in codec routes
-------------------------------------------------------------------------------
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
