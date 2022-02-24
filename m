Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 314714C2AC5
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 12:22:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C028418AA;
	Thu, 24 Feb 2022 12:21:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C028418AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645701727;
	bh=e56jG/lyd6oGBZ52c9erwIAX8hNA9r6AzEtczhHWtZo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HZMyFucIvGyr72LA+hhC7D9rE7lmTxD71jrJNeaTkAWSvzlMIlUcb0jxk48dqSSIK
	 DHK5fRa4DepaUwwlL9drmtgnho9LOtP8vJYssOux5+v1dxTJJDDDhPedl8hKWLG7pK
	 qgZq7gDI+4Wx/wBCq+rl8x9jF1O5KK31L6nTIWB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C7B7F80564;
	Thu, 24 Feb 2022 12:17:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCDA8F80539; Thu, 24 Feb 2022 12:17:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4CBCF80430
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 12:17:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4CBCF80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="r7/l65/1"
Received: by mail-wm1-x331.google.com with SMTP id i20so897282wmc.3
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 03:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LfKStxRvgTEmdqhNQGyq07ydIW9Hyz4sxw/jfz5hVYw=;
 b=r7/l65/1oIcrXfeQMVC71/5ogGArMOi/oLoSasc+FcBBcXlOrqSYFlPWedgjDjMnhb
 gJmBZPCFhf71QLIyP9+ilt7CBR2VUVRTLRCr26CThISQ0VBSERN11vsNDHWjlHRgxrkD
 iInDeLhpIy1O4W/EuP2sxdzBVIyuOM5FQ0JgZakch9wTfzx7N88xoJcfl3B1iPtNRmW0
 3wuTRxjxYWr7DjdNt6Bde8ukt47mSQWK8R2m+BwzXpzoyejcUo2XAo02FPoOyMU9kpTM
 yaNA4iW3xIKaNLZ7S2vvWNQh9PLo7AFZ8cFCp2eZVC6mgT8D0uej0iayS4bTrbmCiIqA
 uclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LfKStxRvgTEmdqhNQGyq07ydIW9Hyz4sxw/jfz5hVYw=;
 b=AanJMj0Qp+66HOQZcj1kZSMyl6rrE8iAxwwJF0nWCahSRlLvir61Bsou5M5Lg0u7bt
 KxqqyTKGmqf0e9kAmAhTp8ysdREds+mCAxun7SjAbYkRJKL+ux8bnfH5Ndzb1/JqbTnt
 0uhECOGBktjymAFCKqoLqGb1mCPp9eQIyw07bSWG2s6wpioMwIYB5Hf6sULtiwp1pbMY
 KHept3aGQ+2kWLPDhtB5QbPMw9WNLntnREVuYIUUOTgpgZG4GXnXEGYbTYY5ieOxSCG5
 m66p2gMz4/Tx+klGd+c2DPysYtjHT+OEP3bkioWc0poKeTtGPtCwUf1B+hpWf8oJM387
 BKbg==
X-Gm-Message-State: AOAM532xhhknUY+xaUcfRJhp1YI/mLk914qaPnHPso2ImvTv5hnCVRmh
 R8lsEJd7s19Wyr4gin2F2pTEYA==
X-Google-Smtp-Source: ABdhPJzYjVTN9x+GL1LFM9oLjla4Nv5U4uIq7XL0Lqv3bedGcqZkNI5nSpYhXrImHNanSLu+5Isiog==
X-Received: by 2002:a1c:a7ca:0:b0:380:e40f:c31a with SMTP id
 q193-20020a1ca7ca000000b00380e40fc31amr1874845wme.85.1645701459163; 
 Thu, 24 Feb 2022 03:17:39 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id t4sm2245737wmj.10.2022.02.24.03.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:17:38 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 15/16] ASoC: codecs: wcd938x: add simple clk stop support
Date: Thu, 24 Feb 2022 11:17:17 +0000
Message-Id: <20220224111718.6264-16-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220224111718.6264-1-srinivas.kandagatla@linaro.org>
References: <20220224111718.6264-1-srinivas.kandagatla@linaro.org>
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

mark WCD938x as clock stop capable.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x-sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index 1fa05ec7459a..1bf3c06a2b62 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -249,6 +249,7 @@ static int wcd9380_probe(struct sdw_slave *pdev,
 					SDW_SCP_INT1_BUS_CLASH |
 					SDW_SCP_INT1_PARITY;
 	pdev->prop.lane_control_support = true;
+	pdev->prop.simple_clk_stop_capable = true;
 	if (wcd->is_tx) {
 		pdev->prop.source_ports = GENMASK(WCD938X_MAX_SWR_PORTS, 0);
 		pdev->prop.src_dpn_prop = wcd938x_dpn_prop;
-- 
2.21.0

