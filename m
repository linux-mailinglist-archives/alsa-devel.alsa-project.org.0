Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 016277351E3
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 12:20:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAA2E84A;
	Mon, 19 Jun 2023 12:20:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAA2E84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687170052;
	bh=2reZq8sJYnsYRfweoggB/d18SpsoSUlGnLipk1FHLKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ILaGLcceNke4Ghu9iverOyEFvcTPqor1BLI7Q7+Ne3ietuU9HDtI8Uj1m2qbkIXTm
	 SZ7huTnJPLnpMKMnylsxEtVNGfuLWfWZZ5TpYDrOXVqNAVH+FzU5wvc97KuCHLADV5
	 kmLeElpTxCpxybFSyDBfE8qC9daQfgT/9lq91n9s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 735A6F805ED; Mon, 19 Jun 2023 12:17:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3456F805E8;
	Mon, 19 Jun 2023 12:17:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA01AF8057D; Mon, 19 Jun 2023 12:17:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E81EF80448
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 12:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E81EF80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=K545tCci
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31109cd8d8cso2967172f8f.2
        for <alsa-devel@alsa-project.org>;
 Mon, 19 Jun 2023 03:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687169822; x=1689761822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhDOcyfRIoE2cQHMZGlVdvXCRT+HvU3JTOnhcjqd13I=;
        b=K545tCci1GTfmEnyjn8i0zeEnnQq4kD+wGaUowMiGIfPnKKKsG9iwdbHcYM72jk4km
         NbUsDIGv4z1zDUspYUkKMHYkPtwgVVcYGJ2JPQtUFrwuoumHhBianHSJjjbt9QIQ8Gv3
         ENkUz2UJVAnxCf9rjWxMcmtkdXfgQoUCdwZpEZRAIVLfJ4y3a8cXZi+NF8FFc9F70C8U
         K2+vhil7gSDTWz9yA+ph0NRd5lXuWj9bMc+/HYP30aKZotMvOVCbqfu0Oqh1qGHbxj92
         NczQSKq/3Ns0iil16NlNKQj3wjS4QUbcm1wbK4T8kLixtSir8nVaQAqhDtXWl9rU6gv/
         uxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687169822; x=1689761822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhDOcyfRIoE2cQHMZGlVdvXCRT+HvU3JTOnhcjqd13I=;
        b=P97ab4QLzm3vkesNd2lnlexUsC4kNZa+leucx3ZL29WJJN0GCtwhY0/XsOa7IzCj8G
         dRN7AdX7DAKOwjoSu+HtGD+/BBNdjWxPwnZ6zqI3+FYq8maX+gvM2fn2lOyZwbc6TQxM
         A49CF30BBm/EMHGZJPWQiNeC/MYlTtD6d9owiEWBAsde3KZbsPanSjy7p3UGuMcIRN7G
         kMj48AfTuLta2L6F4E35MarJ5Wh2GM/x8NFfNOE2ZFpWmyr6rI36GaaYVsKQCqx5GZlL
         ArdllmITExascIpOZYhHnJONWsoy3IZ6pV7QEv1pYqSVNRglBplFVHT2KOcpgojjmkOI
         pmTw==
X-Gm-Message-State: AC+VfDyS/sk3sTp3gfmqSdzsnQlsE+T7ZtpdEEnBjKPr18a8kNT5jtj/
	3Ir8QZXLKl5mEw+D4BhYYSZsXg==
X-Google-Smtp-Source: 
 ACHHUZ6rFD9Xi0ixsLMYlGX+5AcwRfcQFbE58cljPfYsn+BKzSAKfColuB0CUTsPpZlELzAvg2dhRw==
X-Received: by 2002:a5d:6711:0:b0:30f:c298:601d with SMTP id
 o17-20020a5d6711000000b0030fc298601dmr6654075wru.5.1687169822717;
        Mon, 19 Jun 2023 03:17:02 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 c2-20020a5d5282000000b002fae7408544sm31146922wrv.108.2023.06.19.03.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 03:17:02 -0700 (PDT)
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
Subject: [PATCH v3 06/11] ASoC: q6dsp: audioreach: Add gapless feature support
Date: Mon, 19 Jun 2023 11:16:48 +0100
Message-Id: <20230619101653.9750-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230619101653.9750-1-srinivas.kandagatla@linaro.org>
References: <20230619101653.9750-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NYP6NM53TNE2IE3VOTGZUMA3FO7HNMYQ
X-Message-ID-Hash: NYP6NM53TNE2IE3VOTGZUMA3FO7HNMYQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NYP6NM53TNE2IE3VOTGZUMA3FO7HNMYQ/>
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

Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 11 +++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index ba262408b27a..5974c7929dd3 100644
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
@@ -1270,6 +1278,9 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
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

