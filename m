Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF3E2419BC
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 12:28:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D60610E;
	Tue, 11 Aug 2020 12:27:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D60610E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597141717;
	bh=BUzmREVehIQXAPp1s8dcl/qEUXhxb8gkKPmpDykaTFM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bEuYyoWFL44S02NDbCYKX981cfoGNCWyZACg3w0ZJ8/h33j2Uwh7uZ/mdMOlgl8sl
	 NzQLv09An9rq6lhqc5R9G6hMRiE2vGfNYkWuo0I9gWqihUpzkcipmnYO3RJbYX+Kqm
	 wAz2X+3CPAfaWBXhchfcEvzr1PYFe83+oR+A5UoY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DEAAF80118;
	Tue, 11 Aug 2020 12:26:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5261BF801A3; Tue, 11 Aug 2020 12:26:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 334EAF800D3
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 12:25:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 334EAF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Pe3SJSUZ"
Received: by mail-ed1-x544.google.com with SMTP id i6so8662084edy.5
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 03:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CE2Owqviue/VQIXGk6mVLnEvDF33jGGXHgxlHjLuh/g=;
 b=Pe3SJSUZ+vkfgPFgS5Ata/faB6BErqPNLSX71PgTg6EpmCYHXqzuuYILr082+uF+Vh
 3MxncsZE+KaWFYMdBfFtn4E6YLavtrALT+MztOdCtwWgkqciIUFChZK1tbDGkWnCL42z
 52fCBFF4F/gRMALt5efXhPqirlwsYS4Bdmlczd5tqtxFOH2Rg2K/Ccw4siRbYjbuJtqN
 ulh7S+8c2thaMXICdmY/xBGL4vzOUoJUZ+T9/G+LOSdan0uSEZtYD0Vt6EPweZJhEOKz
 I9yH/e/qfPE5/mWDFC//nO3s1gO6lshMezP5wp0yU5QWRQiOUM+D9VjFvGwn3dkAMNkp
 W2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CE2Owqviue/VQIXGk6mVLnEvDF33jGGXHgxlHjLuh/g=;
 b=iXynbpKHqufhQq1S4weapunXIWqygCaDaVYyryroiHuX8lRo+Asql5ENzzr7+WxzFA
 jXLPv0tGm/3hrEHhRKAlrygGzIxd0hY0GOdbqJp4DUqNjfJeI5oSPbUaPa3pg4oCDmzd
 1+NlBb6uBMYggANrDztwJYN2X3tGf5WqTzjKK68ggBu2r+OA2ladenrLzW20r6ckog3V
 Qv4j92Idf43OFdQm1JwtNJAQcWyvxuVnWuW2yN+Jlp6sDVymtcgiVc0UDC5mjZmKA79j
 osF1zhALgHxjAQlJEUeuGfmJFOsZelc9SchSgUkRZxvNIRLB368HbDD/WPtir+Gvh8Ya
 L98g==
X-Gm-Message-State: AOAM533hSJPUzekQKpSqNra1PCuMlnnBNfVMqEPrImpVkK9Lik6aRHsE
 rX0WHuQQGFhHZJjtv96P4g6xtA==
X-Google-Smtp-Source: ABdhPJwyjbinnjY6qvExiC6LJv5rawE65Y9qVNsEqu/7UT4pEtUrxKdedoviaZuV8xcdXXlgUM1IvA==
X-Received: by 2002:aa7:dc44:: with SMTP id g4mr25707392edu.273.1597141557638; 
 Tue, 11 Aug 2020 03:25:57 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id v14sm14864196ejb.63.2020.08.11.03.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 03:25:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/2] ASoC: q6afe-dai: add dummy register read function
Date: Tue, 11 Aug 2020 11:25:51 +0100
Message-Id: <20200811102552.26975-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, john.stultz@linaro.org
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

Most of the DAPM widgets for DSP ASoC components reuse reg field
of the widgets for its internal calculations, however these are not
real registers. So read/writes to these numbers are not really
valid. However ASoC core will read these registers to get default
state during startup.

With recent changes to ASoC core, every register read/write
failures are reported very verbosely. Prior to this fails to reads
are totally ignored, so we never saw any error messages.

To fix this add dummy read function to return default value.

Reported-by: John Stultz <john.stultz@linaro.org>
Fixes: 24c4cbcfac09 ("ASoC: qdsp6: q6afe: Add q6afe dai driver")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index 2a5302f1db98..492bdbaf13c4 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -1352,6 +1352,13 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("DISPLAY_PORT_RX", "NULL", 0, 0, 0, 0),
 };
 
+static unsigned int q6afe_reg_read(struct snd_soc_component *component,
+				   unsigned int reg)
+{
+	/* default value */
+	return 0;
+}
+
 static const struct snd_soc_component_driver q6afe_dai_component = {
 	.name		= "q6afe-dai-component",
 	.dapm_widgets = q6afe_dai_widgets,
@@ -1359,7 +1366,7 @@ static const struct snd_soc_component_driver q6afe_dai_component = {
 	.dapm_routes = q6afe_dapm_routes,
 	.num_dapm_routes = ARRAY_SIZE(q6afe_dapm_routes),
 	.of_xlate_dai_name = q6afe_of_xlate_dai_name,
-
+	.read = q6afe_reg_read,
 };
 
 static void of_q6afe_parse_dai_data(struct device *dev,
-- 
2.21.0

