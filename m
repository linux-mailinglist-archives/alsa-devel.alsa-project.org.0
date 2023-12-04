Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDC5802F82
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 11:02:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AEA9857;
	Mon,  4 Dec 2023 11:02:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AEA9857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701684166;
	bh=Ko9KA4NxwoRoFg8De5PsaOuq8CRBZDjUlKZ0pi0IT/4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=N6cyR58/RnkgHToeWgAspeznxMCQtdRlRvZln7Wi1geUNiqnjfPW3yjQgd9HJCXht
	 eAaAmpBEnkr1amwFdiRGOeSLNX16vrgcF+jF5cD8Jx48hLdv63kUgIF7LkSFT22lDO
	 96sp4N29VVTT65I+5tsGCp1CBj0wdxIRbBreIyBs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58ACAF80571; Mon,  4 Dec 2023 11:02:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FFC6F80571;
	Mon,  4 Dec 2023 11:02:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 520BCF8024E; Mon,  4 Dec 2023 11:01:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77E37F800AC
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 11:00:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77E37F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=UxSFt6Zg
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-54cd8f5bb5cso644430a12.1
        for <alsa-devel@alsa-project.org>;
 Mon, 04 Dec 2023 02:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701684054; x=1702288854;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ci3vPfK43+K4niO6uFBbC2o2Y2UUChnmCN7Lkz2+0dU=;
        b=UxSFt6Zg0bw80geBm+Ur/MEgMixMgQJhr50IN89g/2vuuZB4psvl3BZ2m/j6+8TbHV
         6s5qCyzSZ43J4sk1RaV0zBxuXIbuPhbcT053BjR/Pdj9NKws2yAOlX3LoB01sJ6oNpJN
         Yj1Y7DoR2msASMdEBOYQ+hmYyzz2TJs0GSII0TWDxyk/lIiPcfPStQWCbmSOfLEhmBpd
         3qads0X+uUJUk5Jw3Hg+H6URN+w9LE2kLsr7AjfqTYAJ+IXr/PbqqDt+KdCOQjaJgbZN
         btO9JPVbi6TvKUdbAGVmYMiiW9xV943aF8NRlP/Af5pJCiI/pUAvqJfnfT2+UqcAzW8v
         nCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701684054; x=1702288854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ci3vPfK43+K4niO6uFBbC2o2Y2UUChnmCN7Lkz2+0dU=;
        b=skIXTX6QV7njLUJz7pHtNsdsfEfY5ZMj03l9IfK5/v7ZZsAqzP8r3nNRQ8uT6u8EsS
         QqRKV/vpjnmAxCg6gWfdh1VxOt+EOO+6sXWOLt4Fkk15A434Y7pQHozSUGAf3GTUzSOo
         BxRAdbtrdsg+shCSC2T6SNxOEIhruMbVT/c93nE0ptQ4Ae30WhgMTApoq8vL52iFEAtM
         aQ5CelimOiKsLIxLWMjnQWFNmGVi+FV3ZUIvWnBFObCf7C9BM/ZrUbe2PhhTkSFrxuYO
         u2ZIBXzPvgXljbzNx1x9FY25QhYdTlrSQCMIMx3fbbefmRT7LtgN+dWMfkk4pUlvwanO
         xlgw==
X-Gm-Message-State: AOJu0Yw7oIPLCdKIXUXIVB9JYdeH2BnbGiiRMjYUJDy6mpeDdd27WdSI
	8qJ8Os+OjxuWEOn3ro2swQ7w/w==
X-Google-Smtp-Source: 
 AGHT+IEYIliWeQynvKc93LC5+E03Aal9KlNobNkzWPdTJmmKwTqYABXRJ1BhSR0RaHAZc0hqoDtJYg==
X-Received: by 2002:a17:906:3f17:b0:9be:7b67:1674 with SMTP id
 c23-20020a1709063f1700b009be7b671674mr3140130ejj.3.1701684053242;
        Mon, 04 Dec 2023 02:00:53 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id
 z21-20020a170906715500b00a1185ad53c6sm5108123ejj.199.2023.12.04.02.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 02:00:52 -0800 (PST)
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
Subject: [PATCH] ASoC: qcom: Fix trivial code style issues
Date: Mon,  4 Dec 2023 11:00:48 +0100
Message-Id: <20231204100048.211800-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RLQIH4GIARXYDSJFW5NIAYAWMCS4NCJT
X-Message-ID-Hash: RLQIH4GIARXYDSJFW5NIAYAWMCS4NCJT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RLQIH4GIARXYDSJFW5NIAYAWMCS4NCJT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix few trivial code style issues, pointed out by checkpatch, so they do
not get copied to new code (when old code is used as template):

  WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
  WARNING: function definition argument 'struct platform_device *' should also have an identifier name
  ERROR: code indent should use tabs where possible
  WARNING: please, no spaces at the start of a line
  WARNING: Missing a blank line after declarations
  WARNING: unnecessary whitespace before a quoted newline

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/apq8016_sbc.c     |  2 +-
 sound/soc/qcom/apq8096.c         |  2 +-
 sound/soc/qcom/common.c          |  2 +-
 sound/soc/qcom/lpass-apq8016.c   |  2 +-
 sound/soc/qcom/lpass-cpu.c       |  2 +-
 sound/soc/qcom/lpass-hdmi.c      |  2 +-
 sound/soc/qcom/lpass-ipq806x.c   |  2 +-
 sound/soc/qcom/lpass-platform.c  |  2 +-
 sound/soc/qcom/lpass-sc7180.c    |  2 +-
 sound/soc/qcom/lpass.h           |  2 +-
 sound/soc/qcom/qdsp6/q6afe.c     |  8 ++++----
 sound/soc/qcom/qdsp6/q6apm-dai.c |  4 ++--
 sound/soc/qcom/qdsp6/q6asm.h     | 20 ++++++++++----------
 sound/soc/qcom/qdsp6/topology.c  |  3 ++-
 sound/soc/qcom/sc7180.c          |  2 +-
 sound/soc/qcom/sc8280xp.c        |  2 +-
 sound/soc/qcom/sdm845.c          |  2 +-
 sound/soc/qcom/sdw.c             |  2 +-
 sound/soc/qcom/sm8250.c          |  2 +-
 sound/soc/qcom/storm.c           |  2 +-
 20 files changed, 34 insertions(+), 33 deletions(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index efbdbb4dd753..4834a56eaa88 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -344,4 +344,4 @@ module_platform_driver(apq8016_sbc_platform_driver);
 
 MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@linaro.org");
 MODULE_DESCRIPTION("APQ8016 ASoC Machine Driver");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/apq8096.c b/sound/soc/qcom/apq8096.c
index 7ee6df02b906..4f6594cc723c 100644
--- a/sound/soc/qcom/apq8096.c
+++ b/sound/soc/qcom/apq8096.c
@@ -142,4 +142,4 @@ static struct platform_driver msm_snd_apq8096_driver = {
 module_platform_driver(msm_snd_apq8096_driver);
 MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@linaro.org");
 MODULE_DESCRIPTION("APQ8096 ASoC Machine Driver");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 483bbf53a541..756706d5b493 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -239,4 +239,4 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_wcd_jack_setup);
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index 8e58e814a95f..9005c85f8c54 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -305,5 +305,5 @@ static struct platform_driver apq8016_lpass_cpu_platform_driver = {
 module_platform_driver(apq8016_lpass_cpu_platform_driver);
 
 MODULE_DESCRIPTION("APQ8016 LPASS CPU Driver");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
 
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 88b80ed45c66..b0f3e02cb043 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1294,4 +1294,4 @@ void asoc_qcom_lpass_cpu_platform_shutdown(struct platform_device *pdev)
 EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_platform_shutdown);
 
 MODULE_DESCRIPTION("QTi LPASS CPU Driver");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/lpass-hdmi.c b/sound/soc/qcom/lpass-hdmi.c
index 24b1a7523adb..ce753ebc0894 100644
--- a/sound/soc/qcom/lpass-hdmi.c
+++ b/sound/soc/qcom/lpass-hdmi.c
@@ -251,4 +251,4 @@ const struct snd_soc_dai_ops asoc_qcom_lpass_hdmi_dai_ops = {
 EXPORT_SYMBOL_GPL(asoc_qcom_lpass_hdmi_dai_ops);
 
 MODULE_DESCRIPTION("QTi LPASS HDMI Driver");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/lpass-ipq806x.c b/sound/soc/qcom/lpass-ipq806x.c
index e0e9ad35821c..5c874139f39d 100644
--- a/sound/soc/qcom/lpass-ipq806x.c
+++ b/sound/soc/qcom/lpass-ipq806x.c
@@ -177,4 +177,4 @@ static struct platform_driver ipq806x_lpass_cpu_platform_driver = {
 module_platform_driver(ipq806x_lpass_cpu_platform_driver);
 
 MODULE_DESCRIPTION("QTi LPASS CPU Driver");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 333c427cfdb0..addd2c4bdd3e 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -1384,4 +1384,4 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 EXPORT_SYMBOL_GPL(asoc_qcom_lpass_platform_register);
 
 MODULE_DESCRIPTION("QTi LPASS Platform Driver");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index 22063b834554..e6bcdf6ed796 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -322,4 +322,4 @@ static struct platform_driver sc7180_lpass_cpu_platform_driver = {
 module_platform_driver(sc7180_lpass_cpu_platform_driver);
 
 MODULE_DESCRIPTION("SC7180 LPASS CPU DRIVER");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 2f222bd4ffcc..27a2bf9a6613 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -398,7 +398,7 @@ struct lpass_pcm_data {
 };
 
 /* register the platform driver from the CPU DAI driver */
-int asoc_qcom_lpass_platform_register(struct platform_device *);
+int asoc_qcom_lpass_platform_register(struct platform_device *pdev);
 void asoc_qcom_lpass_cpu_platform_remove(struct platform_device *pdev);
 void asoc_qcom_lpass_cpu_platform_shutdown(struct platform_device *pdev);
 int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev);
diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 91d39f6ad0bd..ef7557be5d66 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -553,13 +553,13 @@ struct q6afe_port {
 };
 
 struct afe_cmd_remote_lpass_core_hw_vote_request {
-        uint32_t  hw_block_id;
-        char client_name[8];
+	uint32_t  hw_block_id;
+	char client_name[8];
 } __packed;
 
 struct afe_cmd_remote_lpass_core_hw_devote_request {
-        uint32_t  hw_block_id;
-        uint32_t client_handle;
+	uint32_t  hw_block_id;
+	uint32_t client_handle;
 } __packed;
 
 
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index b799ac724627..052e40cb38fe 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -134,7 +134,7 @@ static void event_handler(uint32_t opcode, uint32_t token, uint32_t *payload, vo
 		prtd->state = Q6APM_STREAM_STOPPED;
 		break;
 	case APM_CLIENT_EVENT_DATA_WRITE_DONE:
-	        spin_lock_irqsave(&prtd->lock, flags);
+		spin_lock_irqsave(&prtd->lock, flags);
 		prtd->pos += prtd->pcm_count;
 		spin_unlock_irqrestore(&prtd->lock, flags);
 		snd_pcm_period_elapsed(substream);
@@ -143,7 +143,7 @@ static void event_handler(uint32_t opcode, uint32_t token, uint32_t *payload, vo
 
 		break;
 	case APM_CLIENT_EVENT_DATA_READ_DONE:
-	        spin_lock_irqsave(&prtd->lock, flags);
+		spin_lock_irqsave(&prtd->lock, flags);
 		prtd->pos += prtd->pcm_count;
 		spin_unlock_irqrestore(&prtd->lock, flags);
 		snd_pcm_period_elapsed(substream);
diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
index 0103d8dae5da..519e1b3a3f7c 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -35,16 +35,16 @@ enum {
 #define ASM_LAST_BUFFER_FLAG           BIT(30)
 
 struct q6asm_flac_cfg {
-        u32 sample_rate;
-        u32 ext_sample_rate;
-        u32 min_frame_size;
-        u32 max_frame_size;
-        u16 stream_info_present;
-        u16 min_blk_size;
-        u16 max_blk_size;
-        u16 ch_cfg;
-        u16 sample_size;
-        u16 md5_sum;
+	u32 sample_rate;
+	u32 ext_sample_rate;
+	u32 min_frame_size;
+	u32 max_frame_size;
+	u16 stream_info_present;
+	u16 min_blk_size;
+	u16 max_blk_size;
+	u16 ch_cfg;
+	u16 sample_size;
+	u16 md5_sum;
 };
 
 struct q6asm_wma_cfg {
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 130b22a34fb3..70572c83e101 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -545,6 +545,7 @@ static struct audioreach_module *audioreach_parse_common_tokens(struct q6apm *ap
 
 	if (mod) {
 		int pn, id = 0;
+
 		mod->module_id = module_id;
 		mod->max_ip_port = max_ip_port;
 		mod->max_op_port = max_op_port;
@@ -1271,7 +1272,7 @@ int audioreach_tplg_init(struct snd_soc_component *component)
 
 	ret = request_firmware(&fw, tplg_fw_name, dev);
 	if (ret < 0) {
-		dev_err(dev, "tplg firmware loading %s failed %d \n", tplg_fw_name, ret);
+		dev_err(dev, "tplg firmware loading %s failed %d\n", tplg_fw_name, ret);
 		goto err;
 	}
 
diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index b0320a74d508..a15f385ede45 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -578,4 +578,4 @@ static struct platform_driver sc7180_snd_driver = {
 module_platform_driver(sc7180_snd_driver);
 
 MODULE_DESCRIPTION("sc7180 ASoC Machine Driver");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 7c20b25ba3de..7c5a81681a2a 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -168,4 +168,4 @@ static struct platform_driver snd_sc8280xp_driver = {
 module_platform_driver(snd_sc8280xp_driver);
 MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@linaro.org");
 MODULE_DESCRIPTION("SC8280XP ASoC Machine Driver");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 252a0f0819be..75701546b6ea 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -625,4 +625,4 @@ static struct platform_driver sdm845_snd_driver = {
 module_platform_driver(sdm845_snd_driver);
 
 MODULE_DESCRIPTION("sdm845 ASoC Machine Driver");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 77dbe0c28b29..7f5089bbe022 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -160,4 +160,4 @@ int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_hw_free);
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index f298167c2a23..d70df72c0160 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -182,4 +182,4 @@ static struct platform_driver snd_sm8250_driver = {
 module_platform_driver(snd_sm8250_driver);
 MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@linaro.org");
 MODULE_DESCRIPTION("SM8250 ASoC Machine Driver");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/storm.c b/sound/soc/qcom/storm.c
index 553165f11d30..c8d5ac43a176 100644
--- a/sound/soc/qcom/storm.c
+++ b/sound/soc/qcom/storm.c
@@ -140,4 +140,4 @@ static struct platform_driver storm_platform_driver = {
 module_platform_driver(storm_platform_driver);
 
 MODULE_DESCRIPTION("QTi IPQ806x-based Storm Machine Driver");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
-- 
2.34.1

