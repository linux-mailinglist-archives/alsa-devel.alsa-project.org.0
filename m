Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A30886909A8
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 14:15:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 817A7E0E;
	Thu,  9 Feb 2023 14:14:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 817A7E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675948545;
	bh=6m7JCq6puJC6MDMhPLCN6YB/xjS2bTIc2JwbKjSzti4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GXqYLB/8GFh0FOkHCqVlVqBqM/VEe0vFXcir/d8fcpqw5RCj8fp7/n2Ka5iE2D4Pk
	 YzSNTAZ0dA+3eqiABOEGNQb9+UeqwfRgR34qj4DXCX8dzXuEGUlp8m6mksjD3u66gn
	 2mDiFdfcN3GzFrAyT0fE6W/otAdYACq98D1A9Xpc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53F86F8052D;
	Thu,  9 Feb 2023 14:14:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4504F80526; Thu,  9 Feb 2023 14:14:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AEFBF80027
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 14:13:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AEFBF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DX+gWntv
Received: by mail-wm1-x32d.google.com with SMTP id
 az4-20020a05600c600400b003dff767a1f1so1494937wmb.2
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 05:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZXq8dEw8EGIO/pGDRaHOOzvG+p+V2k3SWMSCz374AM=;
        b=DX+gWntv9kzkTbjK0gkqW7XZcfeX5kAYrPiXrCQo21K0scAgIXpVJAP1rndjdvAOMg
         3whWi/KWru5IkCXPKpJ4ShsNfXompA7GSrV/b0dE6EOGjxmSCoIe+bMxEf7GZWxEZ4aq
         DHfe35AEE8QEF/FxgngYLPkbVxAvxK0ayyKDFV1om9I7xdIG5+7m0ycVnGhdSr9tHRKn
         schucCCwbIDdqWoYmE1GXdDa1dGPxa4Ky4b+1bLpWDBwr0xasXjMwEPrYlpqbfT0YMa6
         lXjNl36Og+9c2kjZnZxqNpB9B47TUlgJBy424l8ja96M7rV0ikg36ZcxUnAJtrEuggmM
         KMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZXq8dEw8EGIO/pGDRaHOOzvG+p+V2k3SWMSCz374AM=;
        b=MGncZ53WG7Z4odbDegdlSGAUWM2aWe9XH/0Ty6uRVabmneAmEoZMlWuYG4mz5A/Kjb
         QocjIP1FOlu5/pf7DIyqCBQ/KZ7Kn4Pw2ZPDgQhjVgN6NpmokT0sxucsmwqd5IxnCx27
         dMgf6e9FIyrKTjdBpviBl53HO4H3R4dsjxg1tqNE9dLUJG8fFJqGS99zF9i+cAGhrEtW
         brPOkfll4b0NU9fLVvxzvnpfvPFyfhwbWqDctQHXqpKWNkRbEIHap/4nZU/9DDIi+DRi
         aeOR0ZYBSLehgwq9pz0vnIwfUFlwl9hfxMiuLvXylqPCZ0M++JFXocdjSICd8ApbADvs
         d/0A==
X-Gm-Message-State: AO0yUKUEfM9M6HCvEzKsVJWgatZ8gteCMILN1c0CNo2xn0iFH5AhWJM4
	jYE++VHy4aBaONarlGdpbxAOYQ==
X-Google-Smtp-Source: 
 AK7set9UDllZp++Y9sSAO87/EiOBjOXXsU2IfXA+F46MbiAOkm7RnkGwp/TzTkkcsgE8um4uO9+/8w==
X-Received: by 2002:a05:600c:331b:b0:3dc:4356:533c with SMTP id
 q27-20020a05600c331b00b003dc4356533cmr9840352wmp.5.1675948428277;
        Thu, 09 Feb 2023 05:13:48 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ja13-20020a05600c556d00b003dc4b4dea31sm1789394wmb.27.2023.02.09.05.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 05:13:47 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH 1/5] soundwire: qcom: update status correctly with mask
Date: Thu,  9 Feb 2023 13:13:32 +0000
Message-Id: <20230209131336.18252-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230209131336.18252-1-srinivas.kandagatla@linaro.org>
References: <20230209131336.18252-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5ZDSJPRKMX43FIKHJ2RRPYJFNRQ4MEZO
X-Message-ID-Hash: 5ZDSJPRKMX43FIKHJ2RRPYJFNRQ4MEZO
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, steev@kali.org,
 johan+linaro@kernel.org, quic_bjorande@quicinc.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ZDSJPRKMX43FIKHJ2RRPYJFNRQ4MEZO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SoundWire device status can be incorrectly updated without
proper mask, fix this by adding a mask before updating the status.

Fixes: c7d49c76d1d5 ("soundwire: qcom: add support to new interrupts")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 335424870290..9d8ae77bad0a 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -434,7 +434,7 @@ static int qcom_swrm_get_alert_slave_dev_num(struct qcom_swrm_ctrl *ctrl)
 		status = (val >> (dev_num * SWRM_MCP_SLV_STATUS_SZ));
 
 		if ((status & SWRM_MCP_SLV_STATUS_MASK) == SDW_SLAVE_ALERT) {
-			ctrl->status[dev_num] = status;
+			ctrl->status[dev_num] = status & SWRM_MCP_SLV_STATUS_MASK;
 			return dev_num;
 		}
 	}
-- 
2.21.0

