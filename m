Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0779729D7F
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:56:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3EF8E89;
	Fri,  9 Jun 2023 16:55:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3EF8E89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322600;
	bh=zwla3lViOteuIC3ju1PhOS7PaDD4OAdf1RLozBdw7x4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UGmTBxtf2yZHLxpd5B+bfFro4iODS9WSvNiPC+1Xy6HxJheOyZ6uCAuwcckDphKze
	 29j3MIWABazKatAgpLnQrFEZyM6AKPXzhRWCc4hCmv+w65VQlykhlm6Vx8MLbGN+2j
	 y0vAZNcBehfaKjOaiasmsTWF6/2mac/VqtG/1XpE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92DA2F80290; Fri,  9 Jun 2023 16:55:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76739F80199;
	Fri,  9 Jun 2023 16:55:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF2B7F80254; Fri,  9 Jun 2023 16:55:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FFFAF800ED
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 16:55:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FFFAF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hECgauk1
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f732d37d7cso18366365e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Jun 2023 07:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686322541; x=1688914541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHdZfsXP57Mm/02dFH23BtlU4BZ6K+unFALB3eZT2XI=;
        b=hECgauk1lv9bUI/qzxcc7onysVmt8iROVx6nXi/YCoc83NhbFoD/4qrdkus6CWQeow
         17XOJnERd4wS2pC9Jtj5Z0LvbO36dq8e7vFaP8wMVLS3ZksVs2+8vlHqAfHCdsM8IeYb
         kWxbAUioeWrEo98dX43/VwdaqSD/KMsyqBIJ1SVJ9PQSOP0qflDSJtl3ytD+0abDkaM8
         dDW/IHhRlRiYvQ0fhPJA/JfbyB5nqsKeBHDju8yUK/ttUrUZ4XiCAAIad3mORYijf6Bw
         4NUfuoHOHGUS5tN3dkeIk3q/SjCML4ET/V5bL3+tddwKzcaJaMDWjfdNwDA78wiPIFPT
         Z9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686322541; x=1688914541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHdZfsXP57Mm/02dFH23BtlU4BZ6K+unFALB3eZT2XI=;
        b=FSX5Rv5HRaLY5hVxzw3RKe2LMxxjuF7oUg3gf7fMwowPhBgQ0InbPHM61n3wPppQMi
         +1hBU8yXm0Bn2k1WN9OnmOguMh68WHiiJ9hYvTF2MqCYzZHDPOYfP7NMUFo0jaVLg7nI
         wP/2QQ0voySR2ujwzx5Ill8HEQm562CsE9chDA84dPtmCmRQc91Kth91Fb8MQhUTU36c
         k6jqrKl+yN7tPqhMiVJpEi7xa4P9vm59pN6+ZAgz2iQ+ZCUNMy8BmpvnsUte+g0aDrSt
         pvJnZteiX3ApNSclRQqzzVnfOXF9+cIDwxhmLnH/OXyPx8y2EheFb8q5VFUy4QxMTvtS
         Xslw==
X-Gm-Message-State: AC+VfDzxybFNi5Rd/OJoyh2UDYxTCVHiGxY+0YeW68MExOw2tqsEtTLw
	noZNn/tIKpiaDPeVRsksvd+Q8A==
X-Google-Smtp-Source: 
 ACHHUZ5DrewvI0+n2J+g2WI68Cm64oCnaD/7RuLUe7THX5lmRHb6ogXTyKEQqJRdaPOPKIZ/0Vk9Dg==
X-Received: by 2002:a05:600c:2901:b0:3f7:39ed:c9a4 with SMTP id
 i1-20020a05600c290100b003f739edc9a4mr1475841wmd.30.1686322541228;
        Fri, 09 Jun 2023 07:55:41 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0ad500b003f7310a3ffasm2946632wmr.2.2023.06.09.07.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:54:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 06/11] ASoC: q6dsp: audioreach: Add gapless feature support
Date: Fri,  9 Jun 2023 15:54:02 +0100
Message-Id: <20230609145407.18774-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230609145407.18774-1-srinivas.kandagatla@linaro.org>
References: <20230609145407.18774-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4KNMKI4BCHNKEK222ZD47KELKXWR7EUG
X-Message-ID-Hash: 4KNMKI4BCHNKEK222ZD47KELKXWR7EUG
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4KNMKI4BCHNKEK222ZD47KELKXWR7EUG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add support for setting EOS delay command and receive the
EOS response from ADSP, for seamless compress offload
playback feature.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 11 +++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 6d0f4c8505f1..fefab20aaf1c 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -787,6 +787,14 @@ static int audioreach_module_enable(struct q6apm_graph *graph,
 	return audioreach_send_u32_param(graph, module, PARAM_ID_MODULE_ENABLE, enable);
 }
 
+static int audioreach_gapless_set_media_format(struct q6apm_graph *graph,
+					       struct audioreach_module *module,
+					       struct audioreach_module_config *cfg)
+{
+	return audioreach_send_u32_param(graph, module, PARAM_ID_EARLY_EOS_DELAY,
+					 EARLY_EOS_DELAY_MS);
+}
+
 static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 					   struct audioreach_module *module,
 					   struct audioreach_module_config *cfg)
@@ -1268,6 +1276,9 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 	case MODULE_ID_MFC:
 		rc = audioreach_mfc_set_media_format(graph, module, cfg);
 		break;
+	case MODULE_ID_GAPLESS:
+		rc = audioreach_gapless_set_media_format(graph, module, cfg);
+		break;
 	default:
 		rc = 0;
 	}
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index dc089879b501..e38111ffd7b9 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -27,6 +27,7 @@ struct q6apm_graph;
 #define MODULE_ID_AAC_DEC		0x0700101F
 #define MODULE_ID_FLAC_DEC		0x0700102F
 #define MODULE_ID_MP3_DECODE		0x0700103B
+#define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
 
 #define APM_CMD_GET_SPF_STATE		0x01001021
@@ -552,6 +553,8 @@ struct param_id_sal_limiter_enable {
 } __packed;
 
 #define PARAM_ID_MFC_OUTPUT_MEDIA_FORMAT	0x08001024
+#define PARAM_ID_EARLY_EOS_DELAY		0x0800114C
+#define EARLY_EOS_DELAY_MS			150
 
 struct param_id_mfc_media_format {
 	uint32_t sample_rate;
@@ -560,6 +563,10 @@ struct param_id_mfc_media_format {
 	uint16_t channel_mapping[];
 } __packed;
 
+struct param_id_gapless_early_eos_delay_t {
+	uint32_t early_eos_delay_ms;
+} __packed;
+
 struct media_format {
 	uint32_t data_format;
 	uint32_t fmt_id;
-- 
2.21.0

