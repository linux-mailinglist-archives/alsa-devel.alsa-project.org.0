Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF967FFBB2
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Nov 2023 20:45:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C601DEB;
	Thu, 30 Nov 2023 20:45:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C601DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701373525;
	bh=OxkZgshpaYqRTtBVcu9JT/bxIPyq50WuUjYVUyUZtJM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O8Kfi3ihL/8KK3xc/HFXBBVa0UU21IkBvF1V7r/yXX2qogfXZ/Tx5nP2q0FN43TAW
	 7YajdfJADz339FzDBQM5Xm5LApRa8mG281Y49984/NsH9YsarNJvX+sKjev4iPrlvM
	 JI8bp0beNeZUhlm7IoZSeoQztUc8XlwjruxkCJSs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DB66F80246; Thu, 30 Nov 2023 20:45:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58A9EF80571;
	Thu, 30 Nov 2023 20:45:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CBB7F8016E; Thu, 30 Nov 2023 20:44:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CC0CF800F5
	for <alsa-devel@alsa-project.org>; Thu, 30 Nov 2023 20:44:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CC0CF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kTdGcOIw
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40b4c2ef584so11703425e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 30 Nov 2023 11:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701373491; x=1701978291;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07QYxEgyoqmQ3Q1vq77DMefnw2mMccatpZsNXnEAueU=;
        b=kTdGcOIwL8vdkBt5mIx6yPhwQrpE9pNvIScHO0v9wbz6lP/J23Uy1nCTjm7eQ8Azr7
         GJZ7yPqwdHi/SVOmiKxl7qUrQOpdPzX/PD/uvLdTdmuI94D9jtT08Q61zOB92XGCdDgn
         dZIoeBMmuv61C9gIejPNo1++0XNUodXdWgLYBTRVLr0j0ovCwFm1+uQeWwDkl2RXoUGJ
         01qDQS0kHsfv4HGHtBMk7nFPWPOESCdcJUy3ecSfgmO8zj5xT4ABZrWXr3c8cXPay1EX
         uRldL1WiFb5vfOJis2rOVJ2oUWM/KJQfXYqWd57fCoZy31YtBKC1qe51Rg8NlHdUnlOQ
         ks/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701373491; x=1701978291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07QYxEgyoqmQ3Q1vq77DMefnw2mMccatpZsNXnEAueU=;
        b=DwsbO7FfLxWHuSWEZ0aCxsLW5q3jB8SwMBfg/Sb5A4G9B65j3kHNYp5vbHVLiDDDMj
         oXb4rDsQGP/c3+/IlKvwg1ZmUUTeBZc2nKZ0L71Ks3cpGFARYhANx5FQBrEAxtUOSgyA
         c4i0GPK0gsN2xJtvPlJFgXptgByTA4WBkW941iuwVkE8t2jtM/r6locuXhnWUxw6f0du
         ahQ2GJ8NMBtao+YnhRbCX5RUab60tDFpwi+/KnVxwevgMuC8ggiwtCIqydvM3hf2zV2s
         4ul4zEbusBKeSyBF9EVO/m4Q5ZYGXcEA4giBpziOak95STp2FjGzbs2X2otLu1jlVrbG
         VBVw==
X-Gm-Message-State: AOJu0YwgLSuWkeyN+NNl2T0wkaQhh1RqDJ5aXsX910/NfArTorNHk/le
	RPujRnaVxtgM+U2wUDlHHYUHGaR3eecPfbknRsEquQ==
X-Google-Smtp-Source: 
 AGHT+IH5RLOmJKYkkr8iZOW9SC+fCUJYFeQDas3VL1+GiBFExPCe+HsuOw/Ti2CQ542OzjVBSw5i4g==
X-Received: by 2002:a17:906:ca2:b0:9fe:3bb6:99fe with SMTP id
 k2-20020a1709060ca200b009fe3bb699femr80697ejh.2.1701367698155;
        Thu, 30 Nov 2023 10:08:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id
 y16-20020a170906559000b009a1dbf55665sm926713ejp.161.2023.11.30.10.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 10:08:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/3] ASoC: qcom: audioreach: Add 4 channel support
Date: Thu, 30 Nov 2023 19:07:58 +0100
Message-Id: <20231130180758.212172-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130180758.212172-1-krzysztof.kozlowski@linaro.org>
References: <20231130180758.212172-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O5LMZKCX4X5MZGHPDLQSGRZVZ5S7VPNN
X-Message-ID-Hash: O5LMZKCX4X5MZGHPDLQSGRZVZ5S7VPNN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O5LMZKCX4X5MZGHPDLQSGRZVZ5S7VPNN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support four channel streams.  Map channel 3 and 4 to left/right
surround ("quad(side)" from ffmpeg standard channel list) to match what
is in qdsp6/q6dsp-common.c driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Rebase to avoid duplicate code.

v1:
https://lore.kernel.org/alsa-devel/20231020084919.18628-1-krzysztof.kozlowski@linaro.org/

quad(side):
https://trac.ffmpeg.org/wiki/AudioChannelManipulation#Listchannelnamesandstandardchannellayouts
---
 sound/soc/qcom/qdsp6/audioreach.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 5c7113d46b6f..5291deac0a0b 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -274,6 +274,11 @@ static void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
 	} else if (num_channels == 2) {
 		ch_map[0] =  PCM_CHANNEL_FL;
 		ch_map[1] =  PCM_CHANNEL_FR;
+	} else if (num_channels == 4) {
+		ch_map[0] =  PCM_CHANNEL_FL;
+		ch_map[1] =  PCM_CHANNEL_FR;
+		ch_map[2] =  PCM_CHANNEL_LS;
+		ch_map[3] =  PCM_CHANNEL_RS;
 	}
 }
 
@@ -843,6 +848,11 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	} else if (num_channels == 2) {
 		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
 		media_format->channel_mapping[1] = PCM_CHANNEL_FR;
+	} else if (num_channels == 4) {
+		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
+		media_format->channel_mapping[1] = PCM_CHANNEL_FR;
+		media_format->channel_mapping[2] = PCM_CHANNEL_LS;
+		media_format->channel_mapping[3] = PCM_CHANNEL_RS;
 	}
 
 	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
@@ -1063,7 +1073,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	int rc, payload_size;
 	struct gpr_pkt *pkt;
 
-	if (num_channels > 2) {
+	if (num_channels > 4) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
 		return -EINVAL;
 	}
@@ -1117,7 +1127,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 	struct gpr_pkt *pkt;
 	void *p;
 
-	if (num_channels > 2) {
+	if (num_channels > 4) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
 		return -EINVAL;
 	}
-- 
2.34.1

