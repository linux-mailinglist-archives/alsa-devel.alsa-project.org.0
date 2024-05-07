Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3418B8BDF4D
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 12:03:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E28620E;
	Tue,  7 May 2024 12:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E28620E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715076184;
	bh=jxrbP51ApwB+nB6k7droxBtoZKEplqH7fzVFkVtvoqM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UDMrQ0ISdcZxfwOuSVfILNZ169zXQCyZhmXcZ6t7o063zA4U1w5W4sKdKUBN6JL7W
	 hF+lD9DLwAdPaZGCmqiofFSleFv/BHW385SlYek6N+D4mhdyYp1aJUPY71m6Yiqn5e
	 keZpulD90EfF73Q36AIGaTJl5t0/GjI8+iDgGnUg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF5EDF8057E; Tue,  7 May 2024 12:02:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 884F6F80571;
	Tue,  7 May 2024 12:02:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 146FDF8049C; Tue,  7 May 2024 12:02:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F1ACF8003A
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 12:02:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F1ACF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NrPXC/A9
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a59a9d66a51so647704666b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 07 May 2024 03:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715076133; x=1715680933;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xh7EFY8Q7bV9bAL/jh9gBCI67O6P18pHtiY/L20Df14=;
        b=NrPXC/A9nUdo7KKQGnyaBLlOp8JZ7/Ddjb3zs9wjmEDCO6Wp8DmiDTy6FnXZseJoQR
         9eb87tOyQ/0TCBjH5NNqeqr9sLnp/PVj9DTFDDdAet9IkPSH/cvCdpWisj5GleYRgT88
         /0bV34SOcx7T0mZEuetmp4BKl/UXP17MOcXSfEJENLH3OQcsWy95rEuookxx84kfaxhQ
         r52VQl8WIdy2BHTlW8e9XVuoQw9AMd2yLLJGT4iC7TBexd4+zlyGgK0rG3Hsif7hJHw0
         c4GR/spwBjkQVm+Cq9OTt9mN/FV16um50smDoMPNxutpa3QuuSrEoiVDyZtGh8z4s1A8
         K9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715076133; x=1715680933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xh7EFY8Q7bV9bAL/jh9gBCI67O6P18pHtiY/L20Df14=;
        b=IXwgfCO7AVZcgm5T3MkMN2VVi3q0s27J8Z3PUC9wFPos4PaadQvfXgaAyliiyBWfVJ
         n7n6AqBhgcohHLph4bkR7Bmatr/g2ANvfYI2JwqZSyxMTpJulQFWf/nHnwzSLXMwojo9
         3qsU+f6xnGUver5qMkM9yE4IuEyUnXNF/3RlwiIev6eGqLOx3sJfaCrMq+2sU1iPIJMA
         3HTluUn9cfCTPdgmlR6a1pAao4fwfCfNvfZFjJJUWdUzVrBDh5v+eGMXntaJWqwchG40
         x0YvGowS7GLdB0WxQ2lzrJJddRVZNhmzOqlVM6Z3K+WHMw6LEdYn4TED4pUMTrhHHFl5
         XlUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCEopfjXjuOlhDqI7UGf/lsrTBfNFbJM54cSBq9LekYGK50cJGkYtNPtU1nYqizYPOTArl5GmQ4lBS1Bu1RGJ9Gl/dPa0kP8bkZUM=
X-Gm-Message-State: AOJu0YzyReqbYe6JkqLcCA2z7894G8H9LHbZjjITEcfbXItdYox8ph7y
	VizdkuIpvk1eg945ne51F8uOX6UgOtf+ynE1JoVpBSDLkd0mFsxhlC+VKXUhJLw=
X-Google-Smtp-Source: 
 AGHT+IGdTeYrrvQuiHJ267AFGQGOr/InjQ1hSYK78u1GMZuzU7Nd8dK+zAN8gjqU0ku58bn2t42Wow==
X-Received: by 2002:a17:907:1b06:b0:a59:9a68:7283 with SMTP id
 mp6-20020a1709071b0600b00a599a687283mr9092604ejc.12.1715076133185;
        Tue, 07 May 2024 03:02:13 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 qy29-20020a170907689d00b00a59adb12790sm3792651ejc.27.2024.05.07.03.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 03:02:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] ASoC: qcom: audioreach: Correct mapping of back speakers
Date: Tue,  7 May 2024 12:02:09 +0200
Message-ID: <20240507100209.610436-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JFUELDDJBGHPHTC7NIFFVIVT3L7JIAU3
X-Message-ID-Hash: JFUELDDJBGHPHTC7NIFFVIVT3L7JIAU3
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JFUELDDJBGHPHTC7NIFFVIVT3L7JIAU3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Qualcomm DSP, according to downstream sources, expects back speakers to
be mapped as "back", not "surround".  The surround is used only for 8+
speakers configuration.

Reported-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Fixes: 3c5fcb20e07e ("ASoC: qcom: audioreach: Add 4 channel support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 5291deac0a0b..c655f0213723 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -277,8 +277,8 @@ static void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
 	} else if (num_channels == 4) {
 		ch_map[0] =  PCM_CHANNEL_FL;
 		ch_map[1] =  PCM_CHANNEL_FR;
-		ch_map[2] =  PCM_CHANNEL_LS;
-		ch_map[3] =  PCM_CHANNEL_RS;
+		ch_map[2] =  PCM_CHANNEL_LB;
+		ch_map[3] =  PCM_CHANNEL_RB;
 	}
 }
 
@@ -851,8 +851,8 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	} else if (num_channels == 4) {
 		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
 		media_format->channel_mapping[1] = PCM_CHANNEL_FR;
-		media_format->channel_mapping[2] = PCM_CHANNEL_LS;
-		media_format->channel_mapping[3] = PCM_CHANNEL_RS;
+		media_format->channel_mapping[2] = PCM_CHANNEL_LB;
+		media_format->channel_mapping[3] = PCM_CHANNEL_RB;
 	}
 
 	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
-- 
2.43.0

