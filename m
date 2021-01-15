Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C872F8150
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 17:57:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8466B182D;
	Fri, 15 Jan 2021 17:56:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8466B182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610729837;
	bh=O59yLeSbKGVSH4XkPhypOnmEXA+t8tiI0vmMhFCW8+E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lYMk7VZzuYj1hW7L6SAQ13X7/vd47LVOnG8XG/YDg5/FBhUaARTytACbUAmDWbR3U
	 n91CDA91TRfwMvRaTZMv+MlLLX0tXeMc2FtFvEkzRFgzf3dJc/aC552Kd4lyTXbjxl
	 KAdbffNn8Ytc9brQiD7KHi4YPQbuFfBcgoWIxdZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E528BF80134;
	Fri, 15 Jan 2021 17:55:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81E6CF80254; Fri, 15 Jan 2021 17:55:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B228F80113
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 17:55:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B228F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RGTAeXPw"
Received: by mail-wr1-x430.google.com with SMTP id l12so4741945wry.2
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 08:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8WFi24hS9BNe0YKy3AUzwISCsIab6xsbI/zt4Uj4n4M=;
 b=RGTAeXPwLoRI5axLLhf3PPE4LhQNT+hG/v0Fe9qCHoom3h1snDAkwXPWEZkWkFHCXA
 BGIX5l7irJT1sTHqfDuwF31F1M23Ox8hDOV04PlIopCgt5eryrj7HAlTTXJNTQhSyJJT
 BH00gVnEhBx1kBY/YMxD4HpPF4IyyqFzgFvSv3BlGSjZirDH25vdIe4uuwPhmUEGOwfp
 PzZhnrBdDTAjTt9AT7/5CUKnwmu7A232xqTxXIuwJB0Oo4Jgya7sZZgr5L7FSeZSfaTQ
 HaJtSKi6aNERpI3FPoPlwCTobkfKfWo9BWFPhZ7NRGzsoHt8Svtg0Hez+OHZIQnuvpiY
 6UOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8WFi24hS9BNe0YKy3AUzwISCsIab6xsbI/zt4Uj4n4M=;
 b=TI0W4BrZmjYGLbkmQIGVwKMaQPKg0SJwTPea6CzKfuRFe0yvLuOETTID/ZxPwlhJ9r
 /30KDUwgxUYlSTqsIHcmLvB6gBixUBovYhqfLQp72YktNKk0SCeBYKlE1sHZ2pgEkyzq
 Zs0M+6rbXg5Z4hNqREc0me8MiorOpulxYvUKcCcwLQF8vKClkOvr9qIbIVtMs5CbKCnU
 d34r0sOlOYh4pmMXVcVRrpheoDodsJlQWtg0twNqr5f2LGwoZK+VUU+rNi091Us6jAzR
 4RlWreh3Ef+3+pPwWfpGJDJ2B+bt1l+bMcaWn0N0q5t/ZSA6UX3DRQFgJaoNHDYR/Zw9
 rb5w==
X-Gm-Message-State: AOAM5329rj5LfaU7DzFfgSjzs0O46fUUol6EaLCsgpRhL2xlNEqM8p84
 /aVDvX6bCB0EDRAUPCRDLcHfCYWzbkkAcQ==
X-Google-Smtp-Source: ABdhPJxMp8ldC7Meu2zkgPjbbc72MuqlTbTnF7gLAuy832IUr9pwzFN3mZPm939YAdfGx9sPRq4MzA==
X-Received: by 2002:a5d:50c3:: with SMTP id f3mr13913611wrt.287.1610729731954; 
 Fri, 15 Jan 2021 08:55:31 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b7sm14655045wru.33.2021.01.15.08.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:55:30 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-kernel@vger.kernel.org,
	broonie@kernel.org
Subject: [PATCH 1/2] MAINTAINERS: update maintainers of qcom audio
Date: Fri, 15 Jan 2021 16:55:19 +0000
Message-Id: <20210115165520.6023-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: plai@codeaurora.org, bgoswami@codeaurora.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org
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

Add myself as maintainer of qcom audio drivers, as Patrick
has very little time to look at the patches.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Banajit Goswami <bgoswami@codeaurora.org>
Acked-by: Patrick Lai <plai@codeaurora.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6eff4f720c72..b1545817c899 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14512,7 +14512,7 @@ S:	Supported
 F:	drivers/crypto/qat/
 
 QCOM AUDIO (ASoC) DRIVERS
-M:	Patrick Lai <plai@codeaurora.org>
+M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 M:	Banajit Goswami <bgoswami@codeaurora.org>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
-- 
2.21.0

