Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B7A5A6303
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 14:15:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BCE616AD;
	Tue, 30 Aug 2022 14:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BCE616AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661861714;
	bh=+aVYKlFVAjTvx6soGUuGIwJ7iZo35OZREUEqMpZNUws=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hSnqrC9T9oUyXB3CrIlYUrq0AqVEvBzjFzeCyLRsu3FMUn1glSKEmKhsjWHBU0rGH
	 VmyY/15UvvOCHyRegBviExfikDsL+H1Ijg0omIfeJvYO4XN9wzHLOH/6giiZyv2nz3
	 GjcsdJk3nToNGaPKTuFI1cWBjdNstLVDEfaxJCY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15F74F800F2;
	Tue, 30 Aug 2022 14:14:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B535F8012A; Tue, 30 Aug 2022 14:14:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E6E7F8012A
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 14:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E6E7F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lDRTcSWk"
Received: by mail-lj1-x232.google.com with SMTP id w19so8170889ljj.7
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 05:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=733lkI4nV8tAJya1OCGSDu4na04yzaOxs1WGC8a5e54=;
 b=lDRTcSWk7n5WQYwupr0VW1gI/QLldoWoLCFM2J685qNCJnlhBYp84BlmdPypYDBNo3
 ouJRHsTrlaKAimiUYCJd+qaQ/TwoZ+f5yu50PoNDQJdBhrtNM6mXgmYnUXS7nLhbj44T
 MpvWAod1I18ESN43WrM1B/te/wjdPUxWXEFyxdUcMFaIXtH132GxxAago7aHQvXJe8gh
 JhfxoYsRPaG4ZZW1fJ6R9D8uCCs3sEkRncEFPzwv+K6fIpijn552jnYeSw8LnldYcbhF
 AK6IglZnjBtsb7493A9ttt2jRV3uqL81yUj/p+xTPFucIcU8c2MzP3O0FLZq1JaZtqd4
 xImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=733lkI4nV8tAJya1OCGSDu4na04yzaOxs1WGC8a5e54=;
 b=UCPvhzoLsa1odg5bhUXybm13v23lfXmITgHfmX2Hl9yRhd1eji2S3tRJUen2zOIbWo
 bZ56Cd5TK6/BxnniQBlAIgxUPLYAb2Rncw1G/9xwwrqCC8DbQ6fIIuxnK3qroNbEz2gm
 UWOZAG2iV98sBRtHgPEpE1m60ORdjRS8WP1ak6VCL7pOqfwUigS/bGNE48ZzAOMkdnVY
 gXjCqCI7uvQEcEO7h2h1Dn4akYntWJM4Ph2esNVnvjqFdx7Aexh3NMcktWrJA8xNz4Ys
 RpRNeM4qCYGk70l1BxZL8sgaywiZqRPXjHGKTxuAJqfu3mLG0jY4fB9a67fBUiqNHPMh
 v2Rw==
X-Gm-Message-State: ACgBeo31TzaXYZJct2j9tUar+tHHrC3/L7OUmJyxsEnaBCuiqXPtayHZ
 6gwwau3F+EqDQMa+77Qiln+W1ESmrh6a92/z+iw=
X-Google-Smtp-Source: AA6agR6g5o6RyV4a/0s0Sj9o147r3+2K3usBGme+KNe+ujHurRQoMOnSOwQSwykKycjIsPgtrmQ2eQ==
X-Received: by 2002:a2e:5005:0:b0:265:54e9:2b81 with SMTP id
 e5-20020a2e5005000000b0026554e92b81mr2514328ljb.309.1661861643670; 
 Tue, 30 Aug 2022 05:14:03 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a2e984e000000b0025e57b40009sm1742436ljj.89.2022.08.30.05.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 05:14:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] slimbus: qcom-ngd: use correct error in message of
 pdr_add_lookup() failure
Date: Tue, 30 Aug 2022 15:13:57 +0300
Message-Id: <20220830121359.634344-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 stable@vger.kernel.org
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

Use cprrect error code, instead of previous 'ret' value, when printing
error from pdr_add_lookup() failure.

Cc: <stable@vger.kernel.org>
Fixes: e1ae85e1830e ("slimbus: qcom-ngd-ctrl: add Protection Domain Restart Support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 0aa8408464ad..6fe6abb86061 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1581,6 +1581,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 
 	pds = pdr_add_lookup(ctrl->pdr, "avs/audio", "msm/adsp/audio_pd");
 	if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
+		ret = PTR_ERR(pds);
 		dev_err(dev, "pdr add lookup failed: %d\n", ret);
 		return PTR_ERR(pds);
 	}
-- 
2.34.1

