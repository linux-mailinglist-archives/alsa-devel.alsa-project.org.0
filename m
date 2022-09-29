Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C4B5EFB5D
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 18:53:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 253BF84C;
	Thu, 29 Sep 2022 18:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 253BF84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664470400;
	bh=tL/AXupfHsGhVpo4KUnB/2itKJJyywr2VfAzyqffbXg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dzOGp8F2DMCad3iOQSKYw3QFNowKwL5gRC8Q4S8ZZ1bCM/DizbO2csDwr590OUnA0
	 jv/7MceRn9HaCmV9TclkFLbH1ixvXC1Q5EIWHpACS6MVdQO9cnfUGB5yhH/1gTfXJu
	 BoFr2bx/HLuec3ByuEAYIkZDy5Hbm771X2/gx69I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 790FBF803DD;
	Thu, 29 Sep 2022 18:52:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87B26F8023A; Thu, 29 Sep 2022 18:52:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06DEAF800AA
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 18:52:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06DEAF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="n5YuJfo6"
Received: by mail-lf1-x12c.google.com with SMTP id i26so3099807lfp.11
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 09:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=+GbD/ptGZHf8MZCMuj0GgHu63QZYzq8/heGLYQazOEM=;
 b=n5YuJfo6RJMbh+Gr3vilh0eN1CmMTwmV7Fc0LDeUXy4WvxTghMaGezSEnyGp17t6ts
 G+0h1p4GrijCWs9i5JnNWJ45Sg56rl0BNTWA7ubopq52hHhsPdvk1vaSQtDZsa9q0ofU
 99uued9iIHjUq3C8caPdjCvgEyn8d6Bw7rtJWqPyFL9Q65IkTxYEpCbZWb+p6ZXUBkxB
 feky5J55VcMqv7qr83g04i1Dbj226Rf0f0dxryCGvGzBRC4X8XRpNct6qMzpYWevXEjS
 hHe4+HPca/7Qsn7EEP/W5SxceesGcDG2gAn0OteF5sPhSYcm8zNQZY4B7DjzMO132TCQ
 skzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=+GbD/ptGZHf8MZCMuj0GgHu63QZYzq8/heGLYQazOEM=;
 b=5Dr1jFBsUk2pk/gnykiL4iLebwMoHs951ai03QbATKGhsf/DY+jBT/vgFtFjtJfq4W
 h7Uf/S1WvHiOQVXF1Ek8QirGqjWqJuRyKGRWPPNXhLHABCZNAiWBPbzG/r4CIxqKVMpZ
 5lfYdWFL78xdJSbBVR+l+LXzZYY1fzeG/vGJmEdNfOmghT3uv5votfB9zVX2OisxQNDh
 9O8Z7y/qDNJIUzmc7vEmch4TTPVqjFIMCxaK30O1IM2i48BP2ixVBsxfMCtbiyFRKqtx
 2aDM4me6BtPMktrHn/ZBcMbrL4n/1aDft9Aap7bL7uGZsGgwxKDGcLG0VlItP+sM72qG
 x7jQ==
X-Gm-Message-State: ACrzQf0tldmjZ7nzGEKVuNUCP/ErLDPd0tD8tjUIVVPNA258uHk0dKD3
 sUHHQbCg57KYf9FdD4oFTiDkSA==
X-Google-Smtp-Source: AMsMyM6jTQgE5bnVMrph3MLPUCREMEaURGqXdZHkT9RIy4iONmZApQw5Ac/I2w0wwUlnO3gDGzTJhA==
X-Received: by 2002:a05:6512:6c3:b0:49a:d227:1b5b with SMTP id
 u3-20020a05651206c300b0049ad2271b5bmr1732964lff.386.1664470327773; 
 Thu, 29 Sep 2022 09:52:07 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 be12-20020a056512250c00b00492ea54beeasm825423lfb.306.2022.09.29.09.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:52:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] slimbus: stream: correct presence rate frequencies
Date: Thu, 29 Sep 2022 18:52:02 +0200
Message-Id: <20220929165202.410937-1-krzysztof.kozlowski@linaro.org>
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

Correct few frequencies in presence rate table - multiplied by 10
(110250 instead of 11025 Hz).

Fixes: abb9c9b8b51b ("slimbus: stream: add stream support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/slimbus/stream.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
index f7da72ab504c..a476fa6549cc 100644
--- a/drivers/slimbus/stream.c
+++ b/drivers/slimbus/stream.c
@@ -67,10 +67,10 @@ static const int slim_presence_rate_table[] = {
 	384000,
 	768000,
 	0, /* Reserved */
-	110250,
-	220500,
-	441000,
-	882000,
+	11025,
+	22050,
+	44100,
+	88200,
 	176400,
 	352800,
 	705600,
-- 
2.34.1

