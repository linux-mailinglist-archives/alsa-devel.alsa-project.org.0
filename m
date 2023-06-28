Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E668740EB8
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 12:28:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E21DB83A;
	Wed, 28 Jun 2023 12:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E21DB83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687948112;
	bh=Z6gCjtJw1AHN2sv1Sx+u/yEIB8sLzUUJEixlKZcN+L8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h4c91NSo/VmIxUJrt3q9EKzpWprtaJVdKA0o21ACcGuMAHTDbjcfeEi1si+Ew1RRP
	 X5JGDMbjgcBrvbhLCxFtI4z8VBMwsBunpLyK3LoSVRILG42kemxbP5mhoxgU14L6W8
	 u1E6h4xzj2WROc3vFLPVEdPkqG4LV3Ap1rxUeXlw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42998F8053B; Wed, 28 Jun 2023 12:26:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D134F8053B;
	Wed, 28 Jun 2023 12:26:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8D71F80431; Wed, 28 Jun 2023 12:26:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BE26F80212
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 12:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BE26F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xXvqIFxI
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-313f3cd6bb4so2941054f8f.3
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Jun 2023 03:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687947999; x=1690539999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QndBu+Ea73+5HZm45UHtALLqjv/Bpq0i3QEOMrOjFEA=;
        b=xXvqIFxIGebSeM10VHUvp6JelIbH0a8Ghpt64wKknXwMSWL95vKtz40Urf/l2eRZyA
         cjijU5zSPWNmwFnS43WQxxT2utoqGcRzSyayFdaRLw0YHKXIWNe5nbZlSY5r5IUciEtW
         Sur/5jylNwWcOGVtBJ3bEGewf7JLwbJrpY2LUxwj92DLECfudE3uVlpVGlrPXyKYapA9
         H1yc3NgwjRve8v2SGiIZGEu2TQDAlBD3bjDUzFPwr1kBUwjVLXE4764tZgl9hFDs1Yak
         lZrusYucIwYjDAT76FMkcFZmsRM6Gyn/Z02PodY4GX3iq+EfHcdaJnfC15T9MvKCvs4P
         ocEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687947999; x=1690539999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QndBu+Ea73+5HZm45UHtALLqjv/Bpq0i3QEOMrOjFEA=;
        b=jVoJD4TEX+cQryyEdH6F2yH4IKR/NTJ9NhQkgstmNixuLJwPdnWsHoiE+1lQjS0Dqo
         6iq+0xQMoHF0DsDKlKpt3JumSqWi5TCKvAwe8cXk3GmfMphzWJbXLn+82Tp7tQCWEWGP
         bIRMwZvuXOVipVIrXbtkORiRNWLT/RpfZP6+IsskNe0uH4LBDQJyZf98cAFVrrD7hNAA
         ZinWMwOq5Dp+fqYSysMEEfuXC4B9DO6Ws2h6pLv43idRccKrScyhy40FD6wvGvkP/VNi
         RS9Gy67uQ6p1ec5zJLxNetSboiCQbz7uIGpOP7MROlpPxvLHNjM2D77h88he/UqBsSo2
         gCZg==
X-Gm-Message-State: AC+VfDyA0UMORHQ/nm2v7l0BZJh+t1ufcAXrXon/07pM0es0kyX6fMMY
	0PQdjyLDJbILHkaNahpFxQB1Zw==
X-Google-Smtp-Source: 
 ACHHUZ5jM7AFbBVobXv7tCMo8URNzib2Q8aoTQ3nBXjD6sz9p2fAnpPFJReVgG2Pjw6ld9T5Q04RIw==
X-Received: by 2002:adf:e741:0:b0:313:ee2e:dae1 with SMTP id
 c1-20020adfe741000000b00313ee2edae1mr7605993wrn.18.1687947999424;
        Wed, 28 Jun 2023 03:26:39 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 a10-20020a5d53ca000000b003140555c0ddsm2467780wrw.56.2023.06.28.03.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 03:26:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: krzysztof.kozlowski+dt@linaro.org,
	andersson@kernel.org,
	broonie@kernel.org
Cc: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/3] ASoC: qcom: q6apm: add support for reading firmware name
 from DT
Date: Wed, 28 Jun 2023 11:26:20 +0100
Message-Id: <20230628102621.15016-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
References: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: K5A6I57DFPSGQRNV2TEP7JBN7SZQMMIE
X-Message-ID-Hash: K5A6I57DFPSGQRNV2TEP7JBN7SZQMMIE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K5A6I57DFPSGQRNV2TEP7JBN7SZQMMIE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently firmware file name is autogenerated based on card name and model number,
however this imposed a restriction of finding firmware in a single firmware path.
Platform specific firmwares are normally located in sub folders of the SoC.

Provide more flexibity by reading firmware-name from DT.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/topology.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index cccc59b570b9..ccb4efc15648 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1258,16 +1258,16 @@ static struct snd_soc_tplg_ops audioreach_tplg_ops  = {
 
 int audioreach_tplg_init(struct snd_soc_component *component)
 {
-	struct snd_soc_card *card = component->card;
 	struct device *dev = component->dev;
 	const struct firmware *fw;
-	char *tplg_fw_name;
+	const char *tplg_fw_name;
 	int ret;
 
-	/* Inline with Qualcomm UCM configs and linux-firmware path */
-	tplg_fw_name = kasprintf(GFP_KERNEL, "qcom/%s/%s-tplg.bin", card->driver_name, card->name);
-	if (!tplg_fw_name)
-		return -ENOMEM;
+	ret = of_property_read_string(dev->of_node, "firmware-name",  &tplg_fw_name);
+	if (ret < 0) {
+		dev_err(dev, "firmware-name property missing in Device tree\n");
+		return ret;
+	}
 
 	ret = request_firmware(&fw, tplg_fw_name, dev);
 	if (ret < 0) {
@@ -1283,8 +1283,6 @@ int audioreach_tplg_init(struct snd_soc_component *component)
 
 	release_firmware(fw);
 err:
-	kfree(tplg_fw_name);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(audioreach_tplg_init);
-- 
2.21.0

