Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FB94744D0
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 15:24:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EB991FD6;
	Tue, 14 Dec 2021 15:24:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EB991FD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639491895;
	bh=2FCn00y6vnSBkmkCuXPd1RSH5kNAuR8DagdRBwqO3eM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TBdbktvpaEV/SK0VGtN/iNQh9uU6Ioc+8swk1FtcqI8Mmf1+6lEI4MTNDMxMT1BAa
	 4Rq+xETA0rOzfsUKHoRaAsf1VFOFoecKkOiY4JRiDa534d/0h9n59thJtYxJgcnROw
	 B8pRlE3Gq/GLSlstmWU23GJs2DdPcXLfa3sc50HI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33D7CF80516;
	Tue, 14 Dec 2021 15:22:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBEF4F80475; Tue, 14 Dec 2021 15:22:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [85.215.255.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A352F800FE
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 15:22:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A352F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="m/GhDGZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1639491757;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=rqTxYtVdT2CQO9CQ1pRwiHxb/3QwziCt4kGrC57s9rI=;
 b=m/GhDGZF8OjyKObcEpPiOrD7Plmcd3e7SzWPRO+vjYs2T5vzaMMntXf0oTYCLPl0gY
 K+9rt2uDVTRZ7oPa4m0gASCrzKpKXJtEWF+jpzHGyUueVRBF10nSpvXwbDJJCiD87Ho8
 YUYLMBK5nimqTSaJFh325GP+7GVGuFS1CK5ilb7oUgJ0Ve0oELADnXaElBqQA3IvlaDi
 cIsM7IK6Z83wFT9YB+STwLjXOrh+3xTNNawIgVkW7fzLANEcTHhzovJV1ePZ5c0+39TL
 WuJqaySB/XsWSIYNh0MyVcBG/1KKZg8W1PxIRCosMtCa5Yol52wOb/l+AMk5SmUSbUCl
 NT2A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL1O/hR"
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 47.35.3 AUTH)
 with ESMTPSA id x08baexBEEMa8rZ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 14 Dec 2021 15:22:36 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/4] ASoC: msm8916-wcd-analog: Use separate outputs for
 HPH_L/HPH_R
Date: Tue, 14 Dec 2021 15:20:49 +0100
Message-Id: <20211214142049.20422-5-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211214142049.20422-1-stephan@gerhold.net>
References: <20211214142049.20422-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Vincent Knecht <vincent.knecht@mailoo.org>
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

The analog codec has separate output paths for the left headphone channel
(HPH_L) and the right headphone channel (HPH_R). While they are usually
used together for actual headphones output, some devices also have an
analog speaker amplifier connected to one of the headphone channels.

To allow modelling that properly (and to avoid powering on the unneeded
output path), HPH_L and HPH_R should be represented by separate outputs
rather than a shared HEADPHONE output that always activates both paths.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 3ddd822240e3..485cda46dbb9 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -822,8 +822,8 @@ static const struct snd_soc_dapm_route pm8916_wcd_analog_audio_map[] = {
 	{"EAR PA", NULL, "EAR CP"},
 
 	/* Headset (RX MIX1 and RX MIX2) */
-	{"HEADPHONE", NULL, "HPHL PA"},
-	{"HEADPHONE", NULL, "HPHR PA"},
+	{"HPH_L", NULL, "HPHL PA"},
+	{"HPH_R", NULL, "HPHR PA"},
 
 	{"HPHL DAC", NULL, "EAR_HPHL_CLK"},
 	{"HPHR DAC", NULL, "EAR_HPHR_CLK"},
@@ -870,7 +870,8 @@ static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("AMIC3"),
 	SND_SOC_DAPM_INPUT("AMIC2"),
 	SND_SOC_DAPM_OUTPUT("EAR"),
-	SND_SOC_DAPM_OUTPUT("HEADPHONE"),
+	SND_SOC_DAPM_OUTPUT("HPH_L"),
+	SND_SOC_DAPM_OUTPUT("HPH_R"),
 
 	/* RX stuff */
 	SND_SOC_DAPM_SUPPLY("INT_LDO_H", SND_SOC_NOPM, 1, 0, NULL, 0),
-- 
2.34.1

