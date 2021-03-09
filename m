Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFBE3322D2
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 11:18:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94AA717F2;
	Tue,  9 Mar 2021 11:18:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94AA717F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615285135;
	bh=92/Bf76YBPnMwhaF8nyS/2cw9CLb+nQUsb7on1K5pco=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=klII1ofIrZDoT2dM/TqqRmk4iOOX8qCpy/0UN/2+fKfh8KfQPXDAiGNqepHXvYrKb
	 NzKhqQVkUspo2dGpniChrJXpj5jYx8DrMqz9rVCHLZEkv6GLhy0Ft3KbTqSc5owDx7
	 GAqhZX1Jt+vwU6TABlVYY5ed6xWJDJXLKoxpAycg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 433A5F80482;
	Tue,  9 Mar 2021 11:16:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E457F8032C; Tue,  9 Mar 2021 11:16:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C08DF8014E
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 11:16:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C08DF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pTzLXCk2"
Received: by mail-wr1-x436.google.com with SMTP id u14so14593901wri.3
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 02:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k2f0tZenESZ9YncapAA9EaDdy6imStpc0DvcSxZrmo4=;
 b=pTzLXCk2Aedtr6NwVfE+2EGGtQA16W6Rv+sGF8jMvDqFt94ESMP/AUGZvVpAf7bZ3g
 JtkOokCwXibCkC+NEMj+29fpFsHV9Z2voqM4sT8GARnoZOYWjNlWgzRavmZvPGpm85oX
 rOMjt+ZWdmMmmSfq/LxUa/1MgkYUlaLxEx4+6RyNSzUWXDMr6B3ZvlkuWkUiHNgS9I7/
 +9A5fQi+jvfd93hADIQqfNSYG6LAY/YVqxRoWmcimPH/k/Gt96pR8wxtvsegKQKQPZCx
 CdeLpzHKpzuLweLG2kCx9LTSwgz/I0hW/4VuInPTTt4UDjbzVOxN/YgUeSIrBhcvNOMw
 Pd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k2f0tZenESZ9YncapAA9EaDdy6imStpc0DvcSxZrmo4=;
 b=CKrsU+W0b2u1Cu6yKyedgFeJr+FTmHlO1SHbqyrXGVgxFH8K4c4PZi/IICD9KN3nex
 BXPHDYW4p2QzoAxNq7cxcr5NAWwKvmy7VbjFn+HInGKpDVlopl5Tl0lqOiDQvbJ7de6g
 hcCwUsQvn4qAuHN8ieyeMJ5IYyAkp70+8X7ybt5wM9qPaEKnvM9EJOYteTBNK5ykwLyp
 RIFnjXKkW+G6FGEvEi+92w2ESBnSRupN2CSXKOpaYU+L5z0cQOiGEekaT3Ox3P2zzMiu
 VGQlQHB7CN2mWscPMJcG1dDlAIAo2ANCkYquHIC3LggMfqRJOp6NmHEfcZDfwHye06Ru
 fcbg==
X-Gm-Message-State: AOAM530FStOQeKPi2Hr7Lh7WqcsWhe9jhFRI8jyKa7BGn1qOCXrAgCuU
 Qf3MlvXTUF7ylhVSXPZM8Mgu9A==
X-Google-Smtp-Source: ABdhPJysCEn7R3n1S1UKNF5EIYYLunM/WXcDB9bEOK2WFJAcZFx+M2y9CWDMkpxp9pAyr/BdErrlKQ==
X-Received: by 2002:adf:fe09:: with SMTP id n9mr27607109wrr.104.1615284978392; 
 Tue, 09 Mar 2021 02:16:18 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id r2sm22552248wrt.8.2021.03.09.02.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 02:16:18 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 3/3] ASoC: codecs: wcd934x: add a sanity check in set channel
 map
Date: Tue,  9 Mar 2021 10:16:13 +0000
Message-Id: <20210309101613.25995-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210309101613.25995-1-srinivas.kandagatla@linaro.org>
References: <20210309101613.25995-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: amit.pundir@linaro.org, alsa-devel@alsa-project.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 john.stultz@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

set channel map can be passed with a channel maps, however if
the number of channels that are passed are more than the actual
supported channels then we would be accessing array out of bounds.

So add a sanity check to validate these numbers!

Fixes: a61f3b4f476e ("ASoC: wcd934x: add support to wcd9340/wcd9341 codec")
Reported-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 40f682f5dab8..1d27cdf5277d 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1871,6 +1871,12 @@ static int wcd934x_set_channel_map(struct snd_soc_dai *dai,
 	struct wcd934x_codec *wcd;
 	int i;
 
+	if (tx_num > WCD934X_TX_MAX || rx_num > WCD934X_RX_MAX) {
+		dev_err(wcd->dev, "Invalid tx %d or rx %d channel count\n",
+			tx_num, rx_num);
+		return -EINVAL;
+	}
+
 	wcd = snd_soc_component_get_drvdata(dai->component);
 
 	if (!tx_slot || !rx_slot) {
-- 
2.21.0

