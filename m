Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AB34E609D
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Mar 2022 09:48:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AECA317AA;
	Thu, 24 Mar 2022 09:47:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AECA317AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648111712;
	bh=EDWEubvPA4xrNZHtB21m5Ouzs678qNaig2lcdUHRtR8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vh8N5sFSvQE4gcOsosqQ9F2P57FWPv1hpQl5Vsy9D26FUpxKvrunH1tT48rK25HmP
	 9MtZuJz3704L7+J++5sg0FX6q8p3uhzHjXQsDSAYeQEyonyEyFryT+OIKh59rlJ3wc
	 1MF1Uw23vWMibGL0DWR27PBXJxp13Eq6kDn/xP0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57BABF801EC;
	Thu, 24 Mar 2022 09:47:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B6EAF80165; Thu, 24 Mar 2022 09:47:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B68AF800AA;
 Thu, 24 Mar 2022 09:47:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B68AF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="B/PWwhBs"
Received: by mail-pg1-x536.google.com with SMTP id k14so3321509pga.0;
 Thu, 24 Mar 2022 01:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=33aPXc/mS/jNewOzlkvWpaIPpntrWzVJqKx+1PHJOcc=;
 b=B/PWwhBsfcXhm4SXAAv8CYraVSF4L9JLe6uaFJFtRL6EwhMk6+iWDReghpMVf+9cJ2
 vuGNAT2F0X4gmkBG0IyE0+ko7c+XUe7eJOoEIJV2tmI+vr15rKJvIRjyjuCf7vkXXpMB
 ks9AFnR0g0RQRb2WAXmCRy36N8hqrGbsO0EKDeF2nUrpEHjaslFIs065ii896VwBajJp
 kEr6g1XnoHKe946CNFfhbbrcdADcfRbWO9l7JGNOEANQVBhmFWG5gJqTFNaRa1djH16R
 S3ScU5eRYbZkAlnht3RPhUmTvy81dhiw1gzsaX50rGi2beSh8u6dpVxJVuf4IGI2W6ks
 gbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=33aPXc/mS/jNewOzlkvWpaIPpntrWzVJqKx+1PHJOcc=;
 b=T7sAXJCQHe2JZxWhRyhWrC1QaoEIOQoSsXSIGH62vyv8kjfw0dVVWMgRcl7CMV/Jn4
 N8rTPaClhS7pp3CczYw/QK1SHtfnItFSoRPooQ5g/J222D7KSHI9Nl0KwqruiuYa6zq2
 zj7IbjJYkm4N/F8jpkhgdBdbOy7hhaFGZN5xUMoNTGkLam1ZKMDEI5O5yNQpvFYvU6QM
 cWVPhZrixLPXRsPcwVnizCqTres0x2D0nNVSZU12ZqlZtDnr1EFg6hdZ8ShnTb172NXB
 HzpsobMwphhqbljJYeWP4LdzBZhnq4q0GAbl2VRoD1tyVzgMRucTXGFjhuVtYci0bijd
 +PGw==
X-Gm-Message-State: AOAM532+RjtKz45N2jHltO0y01mcb8YhRzbe4DKMth+cW2RkGC8u/7zl
 vRBmfb8eERe+BoFALKTpSdE=
X-Google-Smtp-Source: ABdhPJwgl+qMNlis/u8O3JqVzA/WRpz85V+ZGKqf84PGubMlFZfP3ETLxy8awqUZh8bQNz0cGJem/Q==
X-Received: by 2002:a63:1a56:0:b0:381:ede3:979d with SMTP id
 a22-20020a631a56000000b00381ede3979dmr3224293pgm.372.1648111639392; 
 Thu, 24 Mar 2022 01:47:19 -0700 (PDT)
Received: from localhost.localdomain (118-167-208-50.dynamic-ip.hinet.net.
 [118.167.208.50]) by smtp.gmail.com with ESMTPSA id
 z16-20020a637e10000000b00382b21c6b0bsm1924605pgc.51.2022.03.24.01.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 01:47:18 -0700 (PDT)
From: Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1] ASoC: Intel: sof_rt5682: Add support for max98360a speaker
 amp on SSP2
Date: Thu, 24 Mar 2022 16:47:08 +0800
Message-Id: <20220324084708.2009375-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 sound-open-firmware@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Brent Lu <brent.lu@intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

Follow Intel's design to replace max98360a amp SSP2 reather than SSP1
by judging DMI_OEM_STRING in sof_rt5682_quirk_table struct.
And reusing max98357's topology since DAI setting could be leveraged.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 13 +++++++++++++
 sound/soc/sof/sof-pci-dev.c         |  9 ++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index ebec4d15edaa..7126fcb63d90 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -212,6 +212,19 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 
 	},
+	{
+		.callback = sof_rt5682_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Brya"),
+			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98360_ALC5682I_I2S_AMP_SSP2"),
+		},
+		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(2) |
+					SOF_RT5682_NUM_HDMIDEV(4)),
+	},
 	{}
 };
 
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 4c9596742844..12f5cff22448 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -83,7 +83,14 @@ static const struct dmi_system_id sof_tplg_table[] = {
 		},
 		.driver_data = "sof-adl-max98357a-rt5682-2way.tplg",
 	},
-
+	{
+		.callback = sof_tplg_cb,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Brya"),
+			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98360_ALC5682I_I2S_AMP_SSP2"),
+		},
+		.driver_data = "sof-adl-max98357a-rt5682.tplg",
+	},
 	{}
 };
 
-- 
2.25.1

