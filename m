Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A93F5386AA
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 11:00:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3785111C;
	Fri,  7 Jun 2019 10:59:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3785111C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559898023;
	bh=afpiMG1SzSx97BCZGECfPQYjapLN3ZxCm2xQ8KtmY0U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ktHNz86Lwt4+4FI2PLtP6e85A5rv5jdi/ZN0gmts/gHvLC8eMacfB5sH8Suo/WEsx
	 fcig5STSB1e85ejZa7+04kQUiXpcNCFoQWhwnJPOV35qG6/8nf6gcGXQZTYqdZNpJH
	 OElQZL1lL4bsbH1SgNFCKeJDSmZ6pd84AmmaQaqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E95EF89733;
	Fri,  7 Jun 2019 10:57:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D6CFF8972E; Fri,  7 Jun 2019 10:57:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18EA9F896EE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 10:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18EA9F896EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cjb6qcY3"
Received: by mail-wr1-x441.google.com with SMTP id n9so1347877wru.0
 for <alsa-devel@alsa-project.org>; Fri, 07 Jun 2019 01:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aNrOP9bVL8WzVy3bzvsSNv+Sb0/Lb3pHrKp7Bekeixc=;
 b=cjb6qcY3L1FVfrYmUwzIy0VkpN6BDjsbZZMFOM7FoHLonsrmUhjkR5K67jGdT/lkWQ
 m1EsLAPt0M+2H+zVDZs/xmAU8F+ou6qSKR8SqbxW4h23LzXi4lEyYVM07mXgOTJtlu/D
 mtnJ/5Zrb/7IafTDfAz5E0MsS4lZEia1z/C44kbsJUJS/I6a3EcWI/UE/zvBlAwyvOHH
 /4DeqmVy215xmQj5xX8S+T8mGEnIWgSOVsW2umlRlxMnzNk7tsl74HO4/yR7eNnHVtHa
 IH+l6o/tsfoZ+cR30bMAHIZ6uKQ7O5uF7pDeUVJhIXM+TZUs6oVPoLds/5jRUorn91Ts
 RuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aNrOP9bVL8WzVy3bzvsSNv+Sb0/Lb3pHrKp7Bekeixc=;
 b=H9AbWZyXXlMtpl9hmhfnoawmSfrL1xdH0/LPVLx/nnG/4fI33nz8zTRejZZ5hs8VPU
 8+YVXoP25MJ3JeD1Zbwm3vfBHflwe9CGY8JmBfazRT+mOl2Ppa4gXo7c496Gt02Sw8og
 jBuH+4rFkblklf+OafeYua3j0lfsn3u6So0Pid60VJYxWphTC3m352oLqH70YuvF0fPt
 gkXigAwxsSgqN+ifUFF0hYXVoCnGJlS6+K6DD0TvXsWgv66HNHCYLYsXMwPeqVKKiLr1
 fYq8keE+H2ulvKXtx1g5mzs+06DBovqLBoNdjCohaj7/lLSO2JQrfE1CnOTQZK3jBpp8
 SLuA==
X-Gm-Message-State: APjAAAVE8lUFQ9NBKOd/ObeWlfFJOnOUQD0P7dPw1tc2S19b8bA8sxd6
 70j2OG1ChfSZ9AEXDeeNNyl8Cw==
X-Google-Smtp-Source: APXvYqxbkSa2FvpzRrFhR3bjFZae70/IKTrI88s7YHzN1zi7y0jrxItssV8DEdhia6tZLf+gx9z9OA==
X-Received: by 2002:adf:dcc2:: with SMTP id x2mr18944862wrm.55.1559897830398; 
 Fri, 07 Jun 2019 01:57:10 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id d10sm2035308wrh.91.2019.06.07.01.57.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 01:57:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Date: Fri,  7 Jun 2019 09:56:40 +0100
Message-Id: <20190607085643.932-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [RFC PATCH 3/6] soundwire: core: define SDW_MAX_PORT
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds SDW_MAX_PORT so that other driver can use it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/linux/soundwire/sdw.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index aac68e879fae..80ca997e4e5d 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -36,6 +36,7 @@ struct sdw_slave;
 #define SDW_FRAME_CTRL_BITS		48
 #define SDW_MAX_DEVICES			11
 
+#define SDW_MAX_PORTS	14
 #define SDW_VALID_PORT_RANGE(n)		((n) <= 14 && (n) >= 1)
 
 #define SDW_DAI_ID_RANGE_START		100
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
