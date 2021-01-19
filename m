Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC552FAF90
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 05:44:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27AD8185E;
	Tue, 19 Jan 2021 05:43:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27AD8185E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611031464;
	bh=vtl47ou48k7trYzbPp8vEBkmaGWR+nm7PtZI+sV/u1o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ie64oEnSKSf3XW/9Km/dclJuvAEgJ2Ka/6qYB70BTXzEpShot8QS6uOfgI2cJeEf4
	 ovppjn5HkFISrOl86M1P52M9ECfSrZ4dwFdBcBDutdGTho8Rd0O9Pmd+916Pu/Pkkz
	 oa/No/AKfFoUhXY+2SPl5ys3ZskyVTDGUcCm+5VM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B48DF8026A;
	Tue, 19 Jan 2021 05:42:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D73BF80257; Tue, 19 Jan 2021 05:42:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBE0AF80117
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 05:42:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBE0AF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xPxjbryp"
Received: by mail-ot1-x333.google.com with SMTP id i30so5686096ota.6
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 20:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lEGHa/fw+pXIBREv347tt5onnQ/KqN9oFmmcQKWLUbk=;
 b=xPxjbryp22HRmb8+ZYS9I7l0hi8pYHA5ePzpgkS6UYYEpN/jiV88/B+3gx3BuxiYoy
 GrwapJ3pmku3FfPj1n74s9jhefYdICmKIEZ3zsdWzcLgXSqk2ZHAtlkrBFcBFJSOS9Ti
 6IJuuIkPPFYJzVfwdtrCSO47BCyraDTdYEr2EY94v5mSQ2awnssGxkUapkJYTCodHODA
 1BrEDMh3sSGoINMl7w8HlZEZxy6FU068TI5p+2ngPpjYdyejQx4vKkP/jMLv8l8nq6Yd
 lUwb6YilPWhhc+wK3Q4UpRrkmorMcmC47Cs4YO5ILjVLsTckR+6kwmliEMFmaglxpnPt
 AX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lEGHa/fw+pXIBREv347tt5onnQ/KqN9oFmmcQKWLUbk=;
 b=Z5/qjGvmNDQfCbSzZ0/safwzhGhvDtfvpxTaAtDwayCoC7BGyFzFPPfLgqBvrlGhAe
 HLEsb1FktYmH46zSpsk55OkZo5a8s/nqusFRvAagimnj+xXOeMZ/IxyCE+iulWOphRRK
 CdspTaRNbse+GWqKsAo+GXodDxz25KypW9yv5x9xd8Md/BpJegpv6tVr11Ov72ExY3XO
 QFzw3eQ7TZdHzxO7qeAaQovJ6DRlKFr1MOYmRyKT0/qWDnu10NRl/QX+2vxBSv1lMD2E
 SGXAh80XkYm3kP+1B7K3027gtek1ch5KSb9lvYK8blkswKxnPzwuCnMLsKxB0T5U9Wpq
 Qr0A==
X-Gm-Message-State: AOAM5315bJU8DVbEzidyzNZL+j1qZ0YjvvqXG0F2bYTnH5Me32qO4fxH
 JxsI/GyN4RDI1xesgxAe8x546w==
X-Google-Smtp-Source: ABdhPJytkVwYJyjW3NPbkDVvL8+Dw0n40mrQBKACtAcutScv90A86ExydUH6m4vm8AS+/cwkWGubyw==
X-Received: by 2002:a9d:22a6:: with SMTP id y35mr2134126ota.20.1611031356353; 
 Mon, 18 Jan 2021 20:42:36 -0800 (PST)
Received: from localhost.localdomain (li519-153.members.linode.com.
 [66.175.222.153])
 by smtp.gmail.com with ESMTPSA id r26sm2236901oij.3.2021.01.18.20.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 20:42:05 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
To: a.hajda@samsung.com,
	john.stultz@linaro.org
Subject: [PATCH] drm: bridge: adv7511: Add set_jack handler
Date: Tue, 19 Jan 2021 12:41:57 +0800
Message-Id: <20210119044157.3801598-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: architt@codeaurora.org, lars@metafoo.de, kuninori.morimoto.gx@renesas.com,
 airlied@linux.ie, broonie@kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 bogdan.togorean@analog.com
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

With commit 55c5cc63ab, the hdmi_codec_set_jack() will report unsupport
failure if set_jack handler is missing. Add set_jack handler to resolve
this failure.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../gpu/drm/bridge/adv7511/adv7511_audio.c    | 27 ++++++++++++++-----
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index f101dd2819b5..16de1a8ca7a0 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -217,22 +217,35 @@ static int adv7511_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
 	return -EINVAL;
 }
 
+static int adv7511_hdmi_i2s_hook_plugged_cb(struct device *dev, void *data,
+					    hdmi_codec_plugged_cb fn,
+					    struct device *codec_dev)
+{
+	struct adv7511 *adv7511 = data;
+	bool plugged = adv7511->connector.status == connector_status_connected;
+
+	fn(codec_dev, plugged);
+	return 0;
+}
+
 static const struct hdmi_codec_ops adv7511_codec_ops = {
 	.hw_params	= adv7511_hdmi_hw_params,
 	.audio_shutdown = audio_shutdown,
 	.audio_startup	= audio_startup,
 	.get_dai_id	= adv7511_hdmi_i2s_get_dai_id,
-};
-
-static const struct hdmi_codec_pdata codec_data = {
-	.ops = &adv7511_codec_ops,
-	.max_i2s_channels = 2,
-	.i2s = 1,
-	.spdif = 1,
+	.hook_plugged_cb = adv7511_hdmi_i2s_hook_plugged_cb,
 };
 
 int adv7511_audio_init(struct device *dev, struct adv7511 *adv7511)
 {
+	struct hdmi_codec_pdata codec_data = {
+		.ops = &adv7511_codec_ops,
+		.max_i2s_channels = 2,
+		.i2s = 1,
+		.spdif = 1,
+		.data = adv7511,
+	};
+
 	adv7511->audio_pdev = platform_device_register_data(dev,
 					HDMI_CODEC_DRV_NAME,
 					PLATFORM_DEVID_AUTO,
-- 
2.25.1

