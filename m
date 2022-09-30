Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B39D5F0774
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 11:21:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37B5F168E;
	Fri, 30 Sep 2022 11:20:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37B5F168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664529701;
	bh=BmfAjmFoGPgjjbmPaKUTAITyWLuwEC50Z5dJV54F5Ys=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pOG/h/Wm3j6Odw/lU3oT37wZaWhcmumTAvVrpsfure1QlruWpqhSGGJCGX/IAB9LO
	 SkKqP859PusxmsXx0AeOr07vtcQRUcS3bTUch6SHurECXA8jWxSnfkr9yj3Bn6JA8d
	 /8g5cHMP5OPlXnMKkYPHeZXNE8Uf5Nx4uG0KbwFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 973C1F80537;
	Fri, 30 Sep 2022 11:20:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17F0AF801D5; Fri, 30 Sep 2022 11:20:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AD58F80095
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 11:20:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AD58F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lDdeIh0c"
Received: by mail-lf1-x133.google.com with SMTP id 10so5976467lfy.5
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 02:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=7Sv5seCRTWybOOOOludWC1A9KTXxVnMAlKH82j49yng=;
 b=lDdeIh0cWxEkskELtP03Xa8NbQmjyC39cByRE9LguZ7etBFGJO1mMkfoIxIHzsDJQc
 1TW2F3Z9ubFF1rlXTndLb2Xrvz1Fvm0ZVHnCjj+la8YDXH0eDnXmLQiAtZZCXIswyVW0
 +VD3R6ol67HKiwfx1kWAt4HUdjV7Q6lLiAJQznSupBUHmrOsfSc/WxEn7Qb1PvtHlvBn
 PRHnSp3IXcDmflioPwMXVQIX+2Ni801Op1Pe7HI6l1xzhQyz3uzDZGzQW5DIylXPRuXA
 qHUhEXxMEPgdxdmChRdP7LpPXTQ5aNWdk9U9VOEdFQ4INt4ueS5XgRCydwWYxPpvIhga
 5dLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=7Sv5seCRTWybOOOOludWC1A9KTXxVnMAlKH82j49yng=;
 b=2yg6PAPMrtl86bKbigzwNynAvxCtb3eALz2zeCtUvrZLWQlJHF9yLPR34yFJgmlA5k
 iSZJE+MrarF7DogODexP2qHZNRJBmUvooPyZEBwoEz6L9IvPN7RdHkq3I6jSJWbzR3nz
 DpRjCBTlfga2O80LnWzStGLm/Y2syBK4oRfPbrec3UndSH+wFl4oYQR5PH1viUxYpT8t
 9G73Hy9s7p2HFaO+SHJK5TeCUom3SjCR0xqcfaMFRE8dizm6xxWkzsKqTGJPXzvflJNk
 GMUe5Com6Zi89LuC6LF1r2+93pSE3fdglZ4Wanzny37BKKdFAFbxrcofZyKkp3k36+0G
 rD1Q==
X-Gm-Message-State: ACrzQf0eirME9LOd/8fw61TJKjLqLTFOBbQDhOll6GBsj8OlLgcGlBrL
 liPtXFIdSeKTc/1pRLChzwzHaw==
X-Google-Smtp-Source: AMsMyM4auLp3LAPf6h4uJworyb16xNE8RvMv9WwpYX6v09WUHaBQx0ZOYHzJXC16Alv7j/0sl81oqw==
X-Received: by 2002:a05:6512:12c5:b0:49e:5431:45d0 with SMTP id
 p5-20020a05651212c500b0049e543145d0mr3223201lfg.111.1664529609923; 
 Fri, 30 Sep 2022 02:20:09 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a2ea226000000b0026aba858fbfsm103461ljm.137.2022.09.30.02.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 02:20:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] slimbus: qcom-ngd-ctrl: add support for 44.1 Khz frequency
Date: Fri, 30 Sep 2022 11:20:06 +0200
Message-Id: <20220930092006.85982-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930092006.85982-1-krzysztof.kozlowski@linaro.org>
References: <20220930092006.85982-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Prudhvi Yarlagadda <pyarlaga@codeaurora.org>
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

Add support for 44.1Khz frequency by dynamically calculating the slimbus
parameters instead of statically defining them.

Co-developed-by: Prudhvi Yarlagadda <pyarlaga@codeaurora.org>
Signed-off-by: Prudhvi Yarlagadda <pyarlaga@codeaurora.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 64 ++++++++++++++++++++++++++++++---
 1 file changed, 59 insertions(+), 5 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index ac84fdc2822f..051ac5cba207 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -944,6 +944,54 @@ static int qcom_slim_ngd_xfer_msg_sync(struct slim_controller *ctrl,
 	return ret;
 }
 
+static int qcom_slim_calc_coef(struct slim_stream_runtime *rt, int *exp)
+{
+	struct slim_controller *ctrl = rt->dev->ctrl;
+	int coef;
+
+	if (rt->ratem * ctrl->a_framer->superfreq < rt->rate)
+		rt->ratem++;
+
+	coef = rt->ratem;
+	*exp = 0;
+
+	/*
+	 * CRM = Cx(2^E) is the formula we are using.
+	 * Here C is the coffecient and E is the exponent.
+	 * CRM is the Channel Rate Multiplier.
+	 * Coefficeint should be either 1 or 3 and exponenet
+	 * should be an integer between 0 to 9, inclusive.
+	 */
+	while (1) {
+		while ((coef & 0x1) != 0x1) {
+			coef >>= 1;
+			*exp = *exp + 1;
+		}
+
+		if (coef <= 3)
+			break;
+
+		coef++;
+	}
+
+	/*
+	 * we rely on the coef value (1 or 3) to set a bit
+	 * in the slimbus message packet. This bit is
+	 * BIT(5) which is the segment rate coefficient.
+	 */
+	if (coef == 1) {
+		if (*exp > 9)
+			return -EIO;
+		coef = 0;
+	} else {
+		if (*exp > 8)
+			return -EIO;
+		coef = 1;
+	}
+
+	return coef;
+}
+
 static int qcom_slim_ngd_enable_stream(struct slim_stream_runtime *rt)
 {
 	struct slim_device *sdev = rt->dev;
@@ -967,16 +1015,22 @@ static int qcom_slim_ngd_enable_stream(struct slim_stream_runtime *rt)
 		struct slim_port *port = &rt->ports[i];
 
 		if (txn.msg->num_bytes == 0) {
-			int seg_interval = SLIM_SLOTS_PER_SUPERFRAME/rt->ratem;
-			int exp;
+			int exp = 0, coef = 0;
 
 			wbuf[txn.msg->num_bytes++] = sdev->laddr;
 			wbuf[txn.msg->num_bytes] = rt->bps >> 2 |
 						   (port->ch.aux_fmt << 6);
 
-			/* Data channel segment interval not multiple of 3 */
-			exp = seg_interval % 3;
-			if (exp)
+			/* calculate coef dynamically */
+			coef = qcom_slim_calc_coef(rt, &exp);
+			if (coef < 0) {
+				dev_err(&sdev->dev,
+				"%s: error calculating coef %d\n", __func__,
+									coef);
+				return -EIO;
+			}
+
+			if (coef)
 				wbuf[txn.msg->num_bytes] |= BIT(5);
 
 			txn.msg->num_bytes++;
-- 
2.34.1

