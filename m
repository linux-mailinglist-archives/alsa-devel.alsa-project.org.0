Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDB03F3984
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Aug 2021 10:30:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BE7A1661;
	Sat, 21 Aug 2021 10:29:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BE7A1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629534633;
	bh=jZBn775/JDtPZkTlSM+vfKQAx5C9ObiQDo4tQJtoTPA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lcFuKs/YhdibNiI9YvkWUTZI1XzE3JID9EMkiMTNFCMezmhNeDJIkT2zo8CrYduEk
	 HV8NAGQQazEcXSzqiyX2QNXbK9wl/Y0ZjYWHVhrBSfHS923YCVkeDNrjJV1tQW3jJR
	 /xF/l8v/e5lZWKEKpP8aq8gTCU9bm+CwCGp/abj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AEEAF80272;
	Sat, 21 Aug 2021 10:29:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC481F8026D; Sat, 21 Aug 2021 10:29:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1CB2F801D5
 for <alsa-devel@alsa-project.org>; Sat, 21 Aug 2021 10:28:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1CB2F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com
 header.i=@timesys-com.20150623.gappssmtp.com header.b="1VJZZyoE"
Received: by mail-ed1-x52e.google.com with SMTP id s3so5253215edd.11
 for <alsa-devel@alsa-project.org>; Sat, 21 Aug 2021 01:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=timesys-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tm7ebvKIHJ7AeKUA9v8CHuxGhcPcPAtO1oMTAzgC4Ns=;
 b=1VJZZyoEzX0swA14PsTuYILkGaQf/rDMvzaQIOh8JEzUpW4ustLKwf94E3vnQ6cFsA
 6sSPga5QDpivp4boiVHjHYTIi0CrIj9E4j2XV+3y6m92VyZ7PYB/OV6XHrDn4yL2CF0Y
 Hr69ZDGGhb+Bst1HMAXd10F1didC9wdTU9W4LVL7JlY4dZN0Ewwo/uGOaOfE7uXIBzir
 Q0YrJpoG3YLSUzboOkhdhI7vWYjnaWzby1g5KCiqTeza6+/c/FnQRMQmwCw6W/bOevvD
 Ogbgb081w0dXMlDNYBWdIQzQh60ulsS52VyZ0r5YZGiytnC+PxCLZecuHU6QR2RrBiHA
 7Xmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tm7ebvKIHJ7AeKUA9v8CHuxGhcPcPAtO1oMTAzgC4Ns=;
 b=CPx0JOGgmU8+oAs+FD0RNiYxsPriHyTgvmWzVCFSFDpOenaGAbjMQ/0sB+Ugkv85TO
 PZdbTUXLkJUrZ/MbJAHTwgeT0WsCupbujMpht/LInOgdFMV3l96mbgAPtySkoB1rgkoY
 P/WSVkfyF6APJ4tL5gmj89ks5ZTQ94+gGGkjeM9M7H173BaMAjXZpFGrvRJ4xpFMs+fb
 bT0jo6c+nwrXIrzaaeQ1Ko4gPOp5FBCbOe19v3ldRQGao5U2zS2oMICmcrgwh8BJBMRL
 jsA+b+UXfTRrkfc2JPdJrppi87u/0s1j94O/IAjEzCuKuOCjmi2qNDpXKL0yAfm5aLfs
 t5Sw==
X-Gm-Message-State: AOAM532xuEVVVYiqGYf246vRiyt2sJhV4Y3U1SOEWzQ7OVENMEJj9ZQ1
 n4r8+ZMZMyiAO6kUKTVoI2JbUeSnOYUIMd83
X-Google-Smtp-Source: ABdhPJx4ryiLv7FAxamj2yIcAWZq3gxzulXly6h4eWJwTVfxCk4prw1tGnMoT/N8wrG18xefjn3KGA==
X-Received: by 2002:a05:6402:1642:: with SMTP id
 s2mr2047584edx.135.1629534535782; 
 Sat, 21 Aug 2021 01:28:55 -0700 (PDT)
Received: from dfj.1.1.1.1 (host-95-246-39-126.retail.telecomitalia.it.
 [95.246.39.126])
 by smtp.gmail.com with ESMTPSA id a22sm3960296ejb.90.2021.08.21.01.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 01:28:55 -0700 (PDT)
From: Angelo Dureghello <angelo.dureghello@timesys.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Subject: [RESEND 2/3] dt-bindings: add compatible vendor prefix for CUI Devices
Date: Sat, 21 Aug 2021 10:26:57 +0200
Message-Id: <20210821082658.4147595-2-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210821082658.4147595-1-angelo.dureghello@timesys.com>
References: <20210821082658.4147595-1-angelo.dureghello@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ricard.wanderlof@axis.com,
 Angelo Dureghello <angelo.dureghello@timesys.com>
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

Add vendor prefix for CUI Devices.

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 07fb0d25fc15..ed4f66ec9a65 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -271,6 +271,8 @@ patternProperties:
     description: Shenzen Chuangsiqi Technology Co.,Ltd.
   "^cubietech,.*":
     description: Cubietech, Ltd.
+  "^cui,.*":
+    description: CUI Devices
   "^cypress,.*":
     description: Cypress Semiconductor Corporation
   "^cznic,.*":
-- 
2.32.0

