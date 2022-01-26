Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD9749C8C9
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 12:37:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ABB81F38;
	Wed, 26 Jan 2022 12:36:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ABB81F38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643197068;
	bh=v9tz+ZRJbraMzyWhYntph1X9RJ7WPuVJluq8cMG1ZMo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZTbtTf6M7qYyWFzWa7WS7tZt9fyQB2PsyGMENm+20Lbfcpi5+WUzEdbM6xxU+9Kwa
	 op/0788nS8rzaJ/ZoV++wO8T4SG/ciJAPxWhdf1Dk7XtWHB+VZhUFNpH+mN+0pNQ8K
	 R0Bw2yP54ANuGXBSVOKzFm96qikYD8VxPhB8egIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 840B0F8050F;
	Wed, 26 Jan 2022 12:36:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FCD0F804C3; Wed, 26 Jan 2022 12:36:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E0F8F80118
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 12:36:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E0F8F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="tjF30mrN"
Received: by mail-wr1-x42b.google.com with SMTP id f17so25237922wrx.1
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 03:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7uYgTZ5BWUKo6IE+sW0nmQRKJ/VMJrPvYdN9IXE2AoE=;
 b=tjF30mrNbfIzk9FPTeX9J+dohxsUXSuKLTpvowq4NkQs7XXPyy0M+fLUJ6zaj1aXI2
 YwZuiaDdIgkZfqcLqE4+8nDkxG5NtFFrLI9pmcnH7i5UREo86cBacs+Zlnurdhdb0Yak
 zuslFv6w1StuZdOS+QPFhjNlfs0LVJFwRYAm6k3ywUa6nwUP1Vs7qHTu6F32ZWKuO57u
 3zECYns5cwwfv6XfWpvfDK55sprfdwbdNJeubp42tWGUrAr/QjzfwwKN+mA/uJWeMTqI
 5TpedkJzs/NJjndJNKluqYxXc0n2PDWpYCydQXVC+4ebSi8P4xgunld09FeMN7c9M2t6
 //5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7uYgTZ5BWUKo6IE+sW0nmQRKJ/VMJrPvYdN9IXE2AoE=;
 b=PQpNtKqZRzoq1bw5FdTrEm5/xdF2Ji0iAN/w9ToPTOPiz2wNbEqDmhIx1t319rZGmK
 ihcpF+TAG6k60dbzHRVm7zdZHW6BV8VhoQXfaxoPxR4wz9JP0htDv2L3nr6JznnL1sOR
 pQxhsr8DY65xDXoX7ZM/2ONjvH6l8/RcCibQGFpDq66dhrsOitr7wca2ZdJRz+VT3oal
 6t8MvaqPDEJLdStHPThvIoHSrMTEexWHVy3YhTxp/yMzJJWGLX2rHDZGrVKgypJBwHkh
 xsJZxcEZuqNWsG9THmtHHeZXDenOe8+roHc+zxDELnH9e8c+ciuLCBL6HXhiIkXQVlJs
 S7gg==
X-Gm-Message-State: AOAM533ffKFUY2U80vJPkFKrx4y0LDBDu6Yp2dz5xjhw8whbyiCjkcYN
 NOS/QaVqDy+M8RK/4gVBXS7Pkw==
X-Google-Smtp-Source: ABdhPJz6AtCx7kIVacdAi8UodwIfH2dJGXhPMfuTNLL92yJFCgM1jmsiUIBBy9uhJx15WnbhGriiBg==
X-Received: by 2002:a05:6000:1a89:: with SMTP id
 f9mr13793463wry.481.1643196961852; 
 Wed, 26 Jan 2022 03:36:01 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id n14sm11999188wri.75.2022.01.26.03.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 03:36:01 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 3/4] ASoC: codecs: wcd938x: fix return value of mixer put
 function
Date: Wed, 26 Jan 2022 11:35:48 +0000
Message-Id: <20220126113549.8853-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220126113549.8853-1-srinivas.kandagatla@linaro.org>
References: <20220126113549.8853-1-srinivas.kandagatla@linaro.org>
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

wcd938x_ear_pa_put_gain, wcd938x_set_swr_port and  wcd938x_set_compander
currently returns zero eventhough it changes the value.
Fix this, so that change notifications are sent correctly.

Fixes: e8ba1e05bdc01 ("ASoC: codecs: wcd938x: add basic controls")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 5994644c8702..36cbc66914f9 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -2559,7 +2559,7 @@ static int wcd938x_ear_pa_put_gain(struct snd_kcontrol *kcontrol,
 				      WCD938X_EAR_GAIN_MASK,
 				      ucontrol->value.integer.value[0]);
 
-	return 0;
+	return 1;
 }
 
 static int wcd938x_get_compander(struct snd_kcontrol *kcontrol,
@@ -2610,7 +2610,7 @@ static int wcd938x_set_compander(struct snd_kcontrol *kcontrol,
 	else
 		wcd938x_connect_port(wcd, portidx, mc->reg, false);
 
-	return 0;
+	return 1;
 }
 
 static int wcd938x_ldoh_get(struct snd_kcontrol *kcontrol,
@@ -2917,7 +2917,7 @@ static int wcd938x_set_swr_port(struct snd_kcontrol *kcontrol,
 
 	wcd938x_connect_port(wcd, portidx, ch_idx, enable);
 
-	return 0;
+	return 1;
 
 }
 
-- 
2.21.0

