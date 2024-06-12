Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE958905879
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:19:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6DD1E67;
	Wed, 12 Jun 2024 18:19:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6DD1E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209198;
	bh=k3aHGQ35T7ijjTVwTgAA+AUOyeA0WrPr6zQfs8D75H4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FAJNeZaxepG6RWjMBJM7V1DFEmz8cf4GLbjobAjdWQeds3wDYCiO4d5JXmoCViZKa
	 GZexZUMFXftId3wD9A0z1s/QOLdtq2JPCX1CYTHqkDnOiIoNs3jBGS1zhtfhc3IA2w
	 dNY1WxXyORb+FAjbJthcOG3CrhSWoLMgqIwWphYU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7108CF80580; Wed, 12 Jun 2024 18:16:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3B58F808CC;
	Wed, 12 Jun 2024 18:16:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63A7EF806CA; Wed, 12 Jun 2024 18:16:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06D6CF80617
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:16:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06D6CF80617
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=BiFBpSB4
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6f0dc80ab9so9284966b.2
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208959; x=1718813759;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UcbW+JTPzOIFFpOVum5uDUaAmhIV61iigZY7iqshvBY=;
        b=BiFBpSB4ZITG2/9wZY1atS4QKFw1dvQYZ3ndwiUtzDZUq+qKOyUWVtU9sSQC8cbMnA
         T/fTDB45u9iZwy7Tzjxp+ImEx+f69bjB+MChjmO44hWafVT7UpBWeO/CEPhbFQsF8Y3j
         3WzoXi9lv2YRiU6gGInq/TPCjK0SsDZ0QxLx9rwjnoOdXg3AeVYwivhBXT5NCtcMstQd
         VaTavJJSk1P78Mfyj8I3SOkYt9McK641lYweBEBmFkDpyPsQCxhms/pN3pDoncx+dp17
         piL6lwM7gV1SyVXw4qvKLIa9y6oonVaNLsbSRsD4G9EgO5IH+/y97GN1P9bGkeG7dUE+
         QlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208959; x=1718813759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcbW+JTPzOIFFpOVum5uDUaAmhIV61iigZY7iqshvBY=;
        b=w4AufHg5u6Yzn/qlLqP1z1UkEnVyeiV+MYtgC6J5A3mz/MZ6pT4tANJ+2tJoO/hwsG
         XndpxayE5epBUqkKqqqQITwvQEiplM+ActKpw/GLZP40EKMZJ/apqZ/r5oUMI3CKePY9
         6ElnrR1hddVfwnbbDzsTAaw94/O4/DF2Kg9GgRrrj252eAtv2ALswqyoNMLY3EdTt8Go
         GhWEPyFEUGhlqIQ/hZygihxaIYJRQ9yct2F4WMLt2cuwQaFIfTlVuLwbRO1+pubg3ATi
         c6fByJMe7YOsUTkYGqlNgEAJS6AwA94BZAlSYeIXWAZoPNHoD+qdDhZ3SpGVjjBezXKV
         qh+A==
X-Gm-Message-State: AOJu0YxZiCI0TxpWcWcGpha3EHO6BXLnW/RlVAeB9CrYOsvyaYLih+2H
	g+DyVSHRZhr0diLz3/rWUsuYLF8RixLSvruUfz9ZMLiGwsnyT9+y1D6/Vo6LeMY=
X-Google-Smtp-Source: 
 AGHT+IEN9rj2+7IxBP1nbcBt9m7CJsmICBXS9QNlv8TKrqAIqhUGB4qf3LQZ9NZjbSz+56EqZjtyAQ==
X-Received: by 2002:a17:906:8411:b0:a6e:f701:384d with SMTP id
 a640c23a62f3a-a6f47c9ef68mr138716266b.29.1718208959469;
        Wed, 12 Jun 2024 09:15:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:26 +0200
Subject: [PATCH 13/23] ASoC: codecs: wcd937x: Drop unused enums, defines
 and types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-13-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1405;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=k3aHGQ35T7ijjTVwTgAA+AUOyeA0WrPr6zQfs8D75H4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmiUZs1tlbK6jnBBYnES4RTFwj4cUtfFCOno
 R4s7gGO52qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJogAKCRDBN2bmhouD
 1+tcD/42Q1kKDqlMFYK6egSvrDjb4I3laIlWnthXZ8q/mP9P/VxLLWKe7SKkna8H5vuR2rE5l6T
 cmSj9/GPYecCXoPSdWTKTbhBkREhIEk4Y+t+7cN6oK5ZoaHTJuUfy6TDKixktFYHx9hu/VfW/4O
 J6CGsTtWiVKWgiIY+VmQbPbCBNjJAtmrQELlqovmVej1yKPAFzSNjgcoE7hIHxUnoteR5KFpg/Z
 YzHXBjwy5EuFYyxU3MRKFhGajmJUWjnXMw2CAWuNodCx5eWwq77/7GIHaIeiE9DwZobMpd/ciOb
 gaqSzQ2AaiNpChSnnZYRVnlEWROQ5UtDTW9tkYBFnxjo5bYGuVMZnFBUJ3L9IELS6fcKZ/sYyN9
 nXqJm5bRSeunVFnT6eoCAyaTpAaqz9xltxWp2Sqb97A0c+a48MsPHT81MuI76SrA/mmy/o0myaw
 q+ZM13T6b2t3w2mIthMaepqU3iXyy2+dHNSUhfQ/bJEudXyAAqBnrwKgX9LE4GwqDi0JTEOsfek
 iBVgz26+46X+CVPOhFp1fPyVpg4BNGuZV7JJOjjQtN9C9P93fXhJYJTLNtHTlCMRVt1U++FrqUk
 fdW8z5HQ8ziDaldRy22lPOuGzDe9d7Fja5OiYl04I5DDRWv1LYxZ2HC+ScDNxzdVfF07oazsdKx
 Yi3lbgwGryYWV3A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: HVF4YRZIUOEPRZ3WCJ36EOHY5MBUCYZX
X-Message-ID-Hash: HVF4YRZIUOEPRZ3WCJ36EOHY5MBUCYZX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVF4YRZIUOEPRZ3WCJ36EOHY5MBUCYZX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Few declarations (defines, struct codec_port_info, enums) are not used
and can be safely dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd937x.h | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
index 6f857ce7d8b7..834a3e7713a3 100644
--- a/sound/soc/codecs/wcd937x.h
+++ b/sound/soc/codecs/wcd937x.h
@@ -488,23 +488,6 @@
 #define WCD937X_MAX_SWR_PORTS			5
 #define WCD937X_MAX_SWR_CH_IDS			15
 
-/* Convert from vout ctl to micbias voltage in mV */
-#define WCD_VOUT_CTL_TO_MICB(v)	(1000 + (v) * 50)
-#define MAX_PORT 8
-#define MAX_CH_PER_PORT 8
-#define MAX_TX_PWR_CH 2
-#define SWR_NUM_PORTS 4
-
-#define WCD937X_MAX_SLAVE_PORT_TYPES 10
-
-struct codec_port_info {
-	u32 slave_port_type;
-	u32 master_port_type;
-	u32 ch_mask;
-	u32 num_ch;
-	u32 ch_rate;
-};
-
 struct wcd937x_sdw_ch_info {
 	int port_num;
 	unsigned int ch_mask;
@@ -570,12 +553,6 @@ int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 }
 #endif
 
-enum {
-	WCD_RX1,
-	WCD_RX2,
-	WCD_RX3
-};
-
 enum {
 	/* INTR_CTRL_INT_MASK_0 */
 	WCD937X_IRQ_MBHC_BUTTON_PRESS_DET = 0,
@@ -645,9 +622,4 @@ enum wcd937x_rx_sdw_channels {
 	WCD937X_DSD_L,
 };
 
-enum {
-	WCD937X_SDW_DIR_RX,
-	WCD937X_SDW_DIR_TX,
-};
-
 #endif

-- 
2.43.0

