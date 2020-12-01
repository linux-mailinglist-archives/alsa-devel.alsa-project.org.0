Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAF02CA3D5
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 14:29:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A906B17CF;
	Tue,  1 Dec 2020 14:28:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A906B17CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606829350;
	bh=qoqYo6GF9T2jOKtn4cIJjlat/DQdgNLsXAPIDDPnY90=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ATJtgiGosNgl1YDMSByyRz515ncKZS+b9S1Xek2s4TR2FYBmFk1naGpsN/nIQ1zkm
	 OzrO5guXGuX7MQrdaRI75unxKKopBnbbpwW0gNfZI7Dh/j3+YhfXq6kOTyW4O+7Cdb
	 PC2Sar0iBU/CUuaQMQRwhejZ8lVfGGS8WUvQP3FU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB040F804D6;
	Tue,  1 Dec 2020 14:26:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33041F804D8; Tue,  1 Dec 2020 14:26:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78F41F80168
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 14:26:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78F41F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="b8SIL1ah"
Received: by mail-pl1-x649.google.com with SMTP id 9so1185293plj.10
 for <alsa-devel@alsa-project.org>; Tue, 01 Dec 2020 05:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=Y0+xH3UGiixm7l2bnHVG2So+xIAjdFpqflSxFA1Eik0=;
 b=b8SIL1ahSDDGUQ+5ZihBBJeGgWjEpbPbg2yISAfdYMgJPH3MlaXrLwwL/dLSRncgu1
 r6F+B+ECCIzwnUvwa2WBdzeTMNgyoNQKyDiII5/O8qh89JCrE8nM1dAn7WvznQjAdLvH
 QheAb4gUwhEJyWpkbPU8zdUzfm9BhLijxDDB2EbJL9gDs21ip1tM5BsGM8EAPJlUNnuN
 pz36CUbHf6EoZ+Nyhfk/7Ye8RQgCQ11D88Qo1RPCEAsNy0B42IAFCTXlothueNaMAWmG
 ykprODVCJ/rKfKmKdr7qA0jxtv2Ef64kWxlLHi+lIFdjNOs5/3J16p8InkZwgrAkxq6I
 CH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Y0+xH3UGiixm7l2bnHVG2So+xIAjdFpqflSxFA1Eik0=;
 b=bpwazk3DWfMx+sBDFeS9iApKqVHYfACyVlzkEx+FWUXBKa88Kl8vEQftpTR/pdyoil
 GFhoUqxZWXaj0VnKwerc11UwxeWCLwv4SSLbJ2s4niNded5tKJQeQZNhpfVvFFfUGBhZ
 2nRzimAH/XAs+q5fVeV9/9xou5lLPwFK7Zb+0wQkLay1ysUEoTA5HeSkHon7JM0yl16I
 ielfiaGBtccxUrOQlZSzXtX2EhUArcRJN6WAJtZqarB0FRa190Kno0zKbYiAJV9PHPhE
 bQ2ec6zQPLRXJAfRDKyTKS0cBbjjkf+xBmg0Uvh+pSBcV1KnoIj9G7Tp07GWSBG49sRN
 jmrw==
X-Gm-Message-State: AOAM530eKIOtCoguUC3CE7lYvMLZZgtdCV7TNu/sA2GGc9VCPqCf4G9B
 zUbAlqDRcdUPztFhArRIc3J4meg0epmL
X-Google-Smtp-Source: ABdhPJxtqbPJs83UWd/SREUWwdihnnM1qCVhKWtIhJAJTyQJf5ajt+m6NRpMyEfnIXMm4P2hXs2Nv0n/cyxm
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:aa7:8a90:0:b029:19b:1166:2a22 with SMTP id
 a16-20020aa78a900000b029019b11662a22mr2400107pfc.31.1606829199180; Tue, 01
 Dec 2020 05:26:39 -0800 (PST)
Date: Tue,  1 Dec 2020 21:26:11 +0800
In-Reply-To: <20201201132614.1691352-1-tzungbi@google.com>
Message-Id: <20201201132614.1691352-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20201201132614.1691352-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [RESEND PATCH 3/6] ASoC: mediatek: mt8192: move rt1015_rt5682
 specific data
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tzungbi@google.com
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

Moves rt1015_rt5682 specific data right before the snd_soc_card
definition for neat purpose.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 50 +++++++++----------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index e841fd32e8cc..0d2cc6800f08 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -33,31 +33,6 @@
 
 static struct snd_soc_jack headset_jack;
 
-static const struct snd_soc_dapm_widget
-mt8192_mt6359_rt1015_rt5682_widgets[] = {
-	SND_SOC_DAPM_SPK("Left Spk", NULL),
-	SND_SOC_DAPM_SPK("Right Spk", NULL),
-	SND_SOC_DAPM_HP("Headphone Jack", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-};
-
-static const struct snd_soc_dapm_route mt8192_mt6359_rt1015_rt5682_routes[] = {
-	/* speaker */
-	{ "Left Spk", NULL, "Left SPO" },
-	{ "Right Spk", NULL, "Right SPO" },
-	/* headset */
-	{ "Headphone Jack", NULL, "HPOL" },
-	{ "Headphone Jack", NULL, "HPOR" },
-	{ "IN1P", NULL, "Headset Mic" },
-};
-
-static const struct snd_kcontrol_new mt8192_mt6359_rt1015_rt5682_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Left Spk"),
-	SOC_DAPM_PIN_SWITCH("Right Spk"),
-	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
-	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-};
-
 static int mt8192_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
@@ -971,6 +946,31 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	},
 };
 
+static const struct snd_soc_dapm_widget
+mt8192_mt6359_rt1015_rt5682_widgets[] = {
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
+static const struct snd_soc_dapm_route mt8192_mt6359_rt1015_rt5682_routes[] = {
+	/* speaker */
+	{ "Left Spk", NULL, "Left SPO" },
+	{ "Right Spk", NULL, "Right SPO" },
+	/* headset */
+	{ "Headphone Jack", NULL, "HPOL" },
+	{ "Headphone Jack", NULL, "HPOR" },
+	{ "IN1P", NULL, "Headset Mic" },
+};
+
+static const struct snd_kcontrol_new mt8192_mt6359_rt1015_rt5682_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
 static struct snd_soc_codec_conf rt1015_amp_conf[] = {
 	{
 		.dlc = COMP_CODEC_CONF(RT1015_DEV0_NAME),
-- 
2.29.2.454.gaff20da3a2-goog

