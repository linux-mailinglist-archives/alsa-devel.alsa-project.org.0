Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B66934BF7A3
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 13:02:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BD8317B7;
	Tue, 22 Feb 2022 13:01:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BD8317B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645531346;
	bh=3pyhuthwanfxS5nWWbTlgdbILpj0kyAne8vH/5EO01I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QgDLtB7JwrzgAdsAvToa/Yxl9irqy0iLPDyE4ucXYBay8kTxCH8lfgoCEHUOx6x6q
	 m0l7DlEkhSK4WhKOk7dlsUZhIuoCY08skWwvWrUn94SXZBYtWVCchwsWOFU6GKyMtg
	 89Gy8cWHY07B3EWZcSH9YS6sY8zAgxahIDvLKLgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A73DF80524;
	Tue, 22 Feb 2022 13:00:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB9EBF80519; Tue, 22 Feb 2022 13:00:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82027F80311
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 12:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82027F80311
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="YSKSCQX8"
Received: by mail-wr1-x433.google.com with SMTP id j17so6035933wrc.0
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 03:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ht2zsDCw6mTpQAlwd9QIJhSI+uSP7rAlJbSv+42FdW4=;
 b=YSKSCQX8VLsIIuyC0rpsqZIVu8heWghUgpq9tyco/RlMfoMRfvL0TXTGRgj62ydrAC
 C3WqlPBHcTZVpsg2EZlDVsJbq1d3AwyyqN2HLIoyroTXtH8hT09QEZVJJCA9dfOYWVvg
 n0XHBDHlVGZGLjnue046qqwlgxFfVPHHjaRNX8lTueg2stxjhgOv0/5Q601rwSOfvtut
 IZ2zecmhTYgxYuzifrlK06I/9FYAfiP8zhDIZR0M8MYpwKeyKTv0PqTr9+iAJwalaU4x
 z+HWpXfi4FedctzjsaznTVd2Yv1nPrNU430A4MU3MvSeqkbG8O7zAHBYqUMaCXwOiIoW
 CBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ht2zsDCw6mTpQAlwd9QIJhSI+uSP7rAlJbSv+42FdW4=;
 b=fl/05Tw/mZHF+6risq3vfW11tRNmnCeanRIRsT+sxtWpO3Ebhkz1HUbkWCLZinHKqj
 iRRqtbOJdAX9Yocr5b7oYGysFuHZuPQiIaXerHVggqB6oizLoeT8gXPJy6axKB5chict
 NMMyX8UpkRIabXwulfzlBemkEW7cCyE4kFUVLChFzvUEOcOuzeRx3uAw2l+8DbjbLnoD
 UP5Ct6WdkBSTzBcPnGzJvKBL2tWzuJmrw/68GV131gKr3vXXW/GDcCP38gk549/rkna/
 MLsjKJJoUcsDUOPUNHZylBaNjkzBXKoIUO8MLnCfW4tT5PXf5K8k1zEw20UDB3iBYvgx
 oPhQ==
X-Gm-Message-State: AOAM531DSqE2286/A+4r3xGX7bviw2AnFuu2thl6DahOEeXrHOzLzyEI
 H5qXE1NPBqrl8632sjFCCO3Rvw==
X-Google-Smtp-Source: ABdhPJznEZqGfqmVrP+p0Vldxzh+Nd5LHUSodJxau7eBZeNvoTKPAn+XDsrnpIFSB15jtzso9lZVBQ==
X-Received: by 2002:a05:6000:1ace:b0:1e8:cbe4:9920 with SMTP id
 i14-20020a0560001ace00b001e8cbe49920mr19167947wry.121.1645531193943; 
 Tue, 22 Feb 2022 03:59:53 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id a18sm50014661wrg.13.2022.02.22.03.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 03:59:53 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 06/16] ASoC: codecs: wc938x: fix accessing array out of bounds
 for enum type
Date: Tue, 22 Feb 2022 11:59:23 +0000
Message-Id: <20220222115933.9114-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
References: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

Accessing enums using integer would result in array out of bounds access
on platforms like aarch64 where sizeof(long) is 8 compared to enum size
which is 4 bytes.

Fix this by using enumerated items instead of integers.

Fixes: e8ba1e05bdc0 ("ASoC: codecs: wcd938x: add basic controls")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index cf61d23bfb1c..deecc83eb592 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -2506,7 +2506,7 @@ static int wcd938x_tx_mode_get(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
 
-	ucontrol->value.integer.value[0] = wcd938x->tx_mode[path];
+	ucontrol->value.enumerated.item[0] = wcd938x->tx_mode[path];
 
 	return 0;
 }
@@ -2530,7 +2530,7 @@ static int wcd938x_rx_hph_mode_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 
-	ucontrol->value.integer.value[0] = wcd938x->hph_mode;
+	ucontrol->value.enumerated.item[0] = wcd938x->hph_mode;
 
 	return 0;
 }
-- 
2.21.0

