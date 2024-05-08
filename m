Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 252A88BF84B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 10:17:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D8CF845;
	Wed,  8 May 2024 10:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D8CF845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715156266;
	bh=HZ5c05lASDGke6zV6oGSp7GtVTkm9nQ4CbvayqlVq5o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J59aMxGk1LFI0jDHvocOkzzVcp8UCbaNLR5Jew51IQ6lErXMQm+r0zNOmAczjOqqj
	 l/nOoBzdtBXtAo1e4oGaYLNnZpGj7LaNy4DTPJ3/l+/0jpM7jVV5DQY2h/S3Vdg/5H
	 17rx/kKtm01Bt7LaUHEHZnCeAgMk8rCZ57eSTHdI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5588F805CB; Wed,  8 May 2024 10:16:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13A01F805D2;
	Wed,  8 May 2024 10:16:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 830C4F805B1; Wed,  8 May 2024 10:16:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E66F5F8003A
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 10:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E66F5F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wDVCgWiM
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a59cdf7cd78so807390766b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 08 May 2024 01:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715156200; x=1715761000;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LwDR/uj963neDfuvigHcDzvEI8lpRkCIvqpr3ctsbs=;
        b=wDVCgWiMzzf59hh+c4y9kn2cYW6QcZmwXVoIDC1cpcZrzNCIS7fPGfHLT3uPPniCmf
         nvN926J3REWFAn+oBBNlVfVR6GiktDXpSzF5DmkWYA7YdX7TDg88J03UuL5DkTSuDEyN
         daDZ6b0laN+Kvn2RBdF8uFu/A8XT+IN5y1DyCoHjDfNvOIB5PrQaNyCgp/tNHNrswYQ0
         CNHQSxO1SlXjcLn/ExjuFRB5534zrkKK45KBO616yTtR0dQzHfJrVvq4dEPIuxYcbfSa
         9lkFrrJ31pHaW9wBhJHG5+GmR/ruU3W7okokAZJdWByvxO2w2UA8srGi2nr1EVqCvhQb
         fwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715156200; x=1715761000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0LwDR/uj963neDfuvigHcDzvEI8lpRkCIvqpr3ctsbs=;
        b=joidk+FzZT1LOVr9Rl+CAo7+bnjMJT0W20KGXOpyoS2vZ/sZSBJcAqwcF83e5lKZZF
         whELPcRDZpfgWygYdd71jMJraHeNB9K0zesuGeK42vVbmUAgDGHOM6KoVEpOcDv0pdnU
         wsdEOG+iTpxoW9+VAU5AU6Mr+QIpggBUdmln2xLhtKZr2kXHcMwDg/BnM9SpEGk8LsAd
         HqU1PJgSXlDvAcYxVnKXxVyFR2DW3oftwlJb21waldYEvHHuSG4p5xmYuKnLmAP+OgOH
         5cyvRJuEmVngDbioz0lFySSo036IlWfK3kAD5AaQ3Vy5WJ3KwrllmAjFE8mIStWdFZU5
         pUhQ==
X-Gm-Message-State: AOJu0YyRKrNnr6q7VtUIt7UJsdwRiD3K43ee5bW5dvoLuL7nHlnkM0xN
	Kxu3PE7PENrIWvggwo+IAeJlQOkIWuoE+2+BIb2ZtNqqIbM5zRt20MXDDYpzJV0=
X-Google-Smtp-Source: 
 AGHT+IFObuqnHNAZx3tIfH6k17QV8p4TQzZlUFXl/C0j8YnL6NYLHT142nQn12hW7zd9PdMUhzCNRg==
X-Received: by 2002:a17:906:16d8:b0:a59:a0c1:2624 with SMTP id
 a640c23a62f3a-a59fb968db2mr107669366b.39.1715156199807;
        Wed, 08 May 2024 01:16:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 va28-20020a17090711dc00b00a59b87dd0d7sm4564734ejb.147.2024.05.08.01.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 01:16:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 08 May 2024 10:16:27 +0200
Subject: [PATCH v2 1/4] ASoC: Constify channel mapping array arguments in
 set_channel_map()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240508-asoc-x1e80100-4-channel-mapping-v2-1-ccef9a66a572@linaro.org>
References: 
 <20240508-asoc-x1e80100-4-channel-mapping-v2-0-ccef9a66a572@linaro.org>
In-Reply-To: 
 <20240508-asoc-x1e80100-4-channel-mapping-v2-0-ccef9a66a572@linaro.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10038;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HZ5c05lASDGke6zV6oGSp7GtVTkm9nQ4CbvayqlVq5o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmOzThPDEa3Y144bYqYosGCjC/SAw0gTeweR2Id
 aEVzLem9f2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjs04QAKCRDBN2bmhouD
 1+yNEACRYti+q8Z0fVyDZbDn8FGaexH1ORpc4CR2JCGcC+4xcoB+ytKpUrD2PVU3CwbgRmKCvl7
 dbVYXOkFBoUGSkRZuu1JWmv1Ed7kGlKbplaXhZzcQVD7PqlYe5tfOKBV3mVC8CYf8HGC1ngeuen
 iuB/dy2CHbjK3eIMQ9LxPilN9hDitxnPgpOAGXlrVYD3eyZ4m1z3gkn6DJZAemKBmLA1Vkbe7Je
 0ExKdRHDz9PJrI2LbUfVsMOL+wykRJNPQALyv0ZS9/qRXQvWob1d1XlwlQ0CtNCeHCNDcyX8UJz
 cUY8glVhVn9mozHqP9lDZKKaUy92IkG5VR0iJ0Wky5IqmBn8zmgkhEe8tWxtZ59Zu2RyXvWLAqk
 a3yPbFNTVOgN4BKSIVXk1+J9YVa6M1iQ+g97BpAoT9B4iz5UjMXauH3D4QWtFp3JBwogKsG04/c
 SlPZPM9AI4EqfCEJnw8d+J38cwB3WFC7ILVBsIPD0KMDAy/OEekGA3JLrvzUdZBwbGOvimnsQla
 JNQ/PPRRvs+0uCt3EVQCRv1Om1uFPGYaDHUNkXZsWFn3LAFB9EYtAuik/LPvDNGsT2kx43IW3YO
 fl/5i5Zz2bOidPnMHwbo7BAAF+HhEH5HXc3TLBdH2mw18MII16TsLaT8b47UGlQqncMiAcgwsn/
 62YkmriK3XYlCxQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 4F52QZ2X6UTAG7J674GVYWP4PONOOR2K
X-Message-ID-Hash: 4F52QZ2X6UTAG7J674GVYWP4PONOOR2K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4F52QZ2X6UTAG7J674GVYWP4PONOOR2K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is no need for implementations of DAI set_channel_map() to modify
contents of passed arrays with actual channel mapping.  Additionally,
the caller keeps full ownership of the array.

Constify these pointer arguments so the code will be safer and easier to
read (documenting the caller's ownership).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. None
---
 include/sound/cs35l41.h                 |  4 ++--
 include/sound/soc-dai.h                 |  8 ++++----
 sound/soc/codecs/adau7118.c             |  6 ++++--
 sound/soc/codecs/cs35l41-lib.c          |  4 ++--
 sound/soc/codecs/cs35l41.c              |  3 ++-
 sound/soc/codecs/max98504.c             |  6 ++++--
 sound/soc/codecs/wcd9335.c              |  6 ++++--
 sound/soc/codecs/wcd934x.c              |  6 ++++--
 sound/soc/qcom/qdsp6/q6afe-dai.c        | 16 ++++++++++------
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  6 ++++--
 sound/soc/soc-dai.c                     |  4 ++--
 11 files changed, 42 insertions(+), 27 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index bb70782d15d0..43c6a9ef8d9f 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -896,8 +896,8 @@ int cs35l41_test_key_lock(struct device *dev, struct regmap *regmap);
 int cs35l41_otp_unpack(struct device *dev, struct regmap *regmap);
 int cs35l41_register_errata_patch(struct device *dev, struct regmap *reg, unsigned int reg_revid);
 int cs35l41_set_channels(struct device *dev, struct regmap *reg,
-			 unsigned int tx_num, unsigned int *tx_slot,
-			 unsigned int rx_num, unsigned int *rx_slot);
+			 unsigned int tx_num, const unsigned int *tx_slot,
+			 unsigned int rx_num, const unsigned int *rx_slot);
 int cs35l41_gpio_config(struct regmap *regmap, struct cs35l41_hw_cfg *hw_cfg);
 void cs35l41_configure_cs_dsp(struct device *dev, struct regmap *reg, struct cs_dsp *dsp);
 int cs35l41_set_cspl_mbox_cmd(struct device *dev, struct regmap *regmap,
diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index adcd8719d343..15ef268c9845 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -188,8 +188,8 @@ int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width);
 
 int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
-	unsigned int tx_num, unsigned int *tx_slot,
-	unsigned int rx_num, unsigned int *rx_slot);
+	unsigned int tx_num, const unsigned int *tx_slot,
+	unsigned int rx_num, const unsigned int *rx_slot);
 
 int snd_soc_dai_set_tristate(struct snd_soc_dai *dai, int tristate);
 
@@ -305,8 +305,8 @@ struct snd_soc_dai_ops {
 		unsigned int tx_mask, unsigned int rx_mask,
 		int slots, int slot_width);
 	int (*set_channel_map)(struct snd_soc_dai *dai,
-		unsigned int tx_num, unsigned int *tx_slot,
-		unsigned int rx_num, unsigned int *rx_slot);
+		unsigned int tx_num, const unsigned int *tx_slot,
+		unsigned int rx_num, const unsigned int *rx_slot);
 	int (*get_channel_map)(struct snd_soc_dai *dai,
 			unsigned int *tx_num, unsigned int *tx_slot,
 			unsigned int *rx_num, unsigned int *rx_slot);
diff --git a/sound/soc/codecs/adau7118.c b/sound/soc/codecs/adau7118.c
index a663d37e5776..abc4764697a5 100644
--- a/sound/soc/codecs/adau7118.c
+++ b/sound/soc/codecs/adau7118.c
@@ -121,8 +121,10 @@ static const struct snd_soc_dapm_widget adau7118_widgets[] = {
 };
 
 static int adau7118_set_channel_map(struct snd_soc_dai *dai,
-				    unsigned int tx_num, unsigned int *tx_slot,
-				    unsigned int rx_num, unsigned int *rx_slot)
+				    unsigned int tx_num,
+				    const unsigned int *tx_slot,
+				    unsigned int rx_num,
+				    const unsigned int *rx_slot)
 {
 	struct adau7118_data *st =
 		snd_soc_component_get_drvdata(dai->component);
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index e9993a39f7d0..1702f26049d3 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -936,8 +936,8 @@ int cs35l41_register_errata_patch(struct device *dev, struct regmap *reg, unsign
 EXPORT_SYMBOL_GPL(cs35l41_register_errata_patch);
 
 int cs35l41_set_channels(struct device *dev, struct regmap *reg,
-			 unsigned int tx_num, unsigned int *tx_slot,
-			 unsigned int rx_num, unsigned int *rx_slot)
+			 unsigned int tx_num, const unsigned int *tx_slot,
+			 unsigned int rx_num, const unsigned int *rx_slot)
 {
 	unsigned int val, mask;
 	int i;
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index cb25c33cc9b9..1688c2c688f0 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -673,7 +673,8 @@ static const struct snd_soc_dapm_route cs35l41_audio_map[] = {
 };
 
 static int cs35l41_set_channel_map(struct snd_soc_dai *dai, unsigned int tx_n,
-				   unsigned int *tx_slot, unsigned int rx_n, unsigned int *rx_slot)
+				   const unsigned int *tx_slot,
+				   unsigned int rx_n, const unsigned int *rx_slot)
 {
 	struct cs35l41_private *cs35l41 = snd_soc_component_get_drvdata(dai->component);
 
diff --git a/sound/soc/codecs/max98504.c b/sound/soc/codecs/max98504.c
index 93412b966b33..6b6a7ece4cec 100644
--- a/sound/soc/codecs/max98504.c
+++ b/sound/soc/codecs/max98504.c
@@ -220,8 +220,10 @@ static int max98504_set_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 static int max98504_set_channel_map(struct snd_soc_dai *dai,
-		unsigned int tx_num, unsigned int *tx_slot,
-		unsigned int rx_num, unsigned int *rx_slot)
+				    unsigned int tx_num,
+				    const unsigned int *tx_slot,
+				    unsigned int rx_num,
+				    const unsigned int *rx_slot)
 {
 	struct max98504_priv *max98504 = snd_soc_dai_get_drvdata(dai);
 	struct regmap *map = max98504->regmap;
diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index deb15b95992d..42a99978fe5a 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -1983,8 +1983,10 @@ static int wcd9335_trigger(struct snd_pcm_substream *substream, int cmd,
 }
 
 static int wcd9335_set_channel_map(struct snd_soc_dai *dai,
-				   unsigned int tx_num, unsigned int *tx_slot,
-				   unsigned int rx_num, unsigned int *rx_slot)
+				   unsigned int tx_num,
+				   const unsigned int *tx_slot,
+				   unsigned int rx_num,
+				   const unsigned int *rx_slot)
 {
 	struct wcd9335_codec *wcd;
 	int i;
diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index de870c7819ca..fcad2c9fba55 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1923,8 +1923,10 @@ static int wcd934x_trigger(struct snd_pcm_substream *substream, int cmd,
 }
 
 static int wcd934x_set_channel_map(struct snd_soc_dai *dai,
-				   unsigned int tx_num, unsigned int *tx_slot,
-				   unsigned int rx_num, unsigned int *rx_slot)
+				   unsigned int tx_num,
+				   const unsigned int *tx_slot,
+				   unsigned int rx_num,
+				   const unsigned int *rx_slot)
 {
 	struct wcd934x_codec *wcd;
 	int i;
diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index a9c4f896a7df..7d9628cda875 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -172,8 +172,8 @@ static int q6tdm_set_tdm_slot(struct snd_soc_dai *dai,
 }
 
 static int q6tdm_set_channel_map(struct snd_soc_dai *dai,
-				unsigned int tx_num, unsigned int *tx_slot,
-				unsigned int rx_num, unsigned int *rx_slot)
+				unsigned int tx_num, const unsigned int *tx_slot,
+				unsigned int rx_num, const unsigned int *rx_slot)
 {
 
 	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
@@ -250,8 +250,10 @@ static int q6tdm_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int q6dma_set_channel_map(struct snd_soc_dai *dai,
-				 unsigned int tx_num, unsigned int *tx_ch_mask,
-				 unsigned int rx_num, unsigned int *rx_ch_mask)
+				 unsigned int tx_num,
+				 const unsigned int *tx_ch_mask,
+				 unsigned int rx_num,
+				 const unsigned int *rx_ch_mask)
 {
 
 	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
@@ -407,8 +409,10 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
 }
 
 static int q6slim_set_channel_map(struct snd_soc_dai *dai,
-				unsigned int tx_num, unsigned int *tx_slot,
-				unsigned int rx_num, unsigned int *rx_slot)
+				  unsigned int tx_num,
+				  const unsigned int *tx_slot,
+				  unsigned int rx_num,
+				  const unsigned int *rx_slot)
 {
 	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
 	struct q6afe_port_config *pcfg = &dai_data->port_config[dai->id];
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 68a38f63a2db..6bfbb52345e1 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -25,8 +25,10 @@ struct q6apm_lpass_dai_data {
 };
 
 static int q6dma_set_channel_map(struct snd_soc_dai *dai,
-				 unsigned int tx_num, unsigned int *tx_ch_mask,
-				 unsigned int rx_num, unsigned int *rx_ch_mask)
+				 unsigned int tx_num,
+				 const unsigned int *tx_ch_mask,
+				 unsigned int rx_num,
+				 const unsigned int *rx_ch_mask)
 {
 
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index fefe394dce72..03afd5efb24c 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -304,8 +304,8 @@ EXPORT_SYMBOL_GPL(snd_soc_dai_set_tdm_slot);
  * configure the relationship between channel number and TDM slot number.
  */
 int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
-				unsigned int tx_num, unsigned int *tx_slot,
-				unsigned int rx_num, unsigned int *rx_slot)
+				unsigned int tx_num, const unsigned int *tx_slot,
+				unsigned int rx_num, const unsigned int *rx_slot)
 {
 	int ret = -ENOTSUPP;
 

-- 
2.43.0

