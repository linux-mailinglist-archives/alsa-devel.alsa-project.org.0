Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CD833287F
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 15:24:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15561185A;
	Tue,  9 Mar 2021 15:23:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15561185A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615299864;
	bh=VrnXP4MtdeQ1nxl+lr/neWZ6mFgIywwceu0F6yMpX9U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qASrlGPbhcNPuOoEtfAQOQav+YGRslT4OxkMfNns89dri7NETGBVqxeCpY59sryhh
	 aj7/6jv27rIzcrvsUZ43UGfDMYDBWWxPB96kAs1ymSMv+91j52mJ1tGxueG3uEtzRA
	 ppaAV4Km/0tx1ZbN1wIReUu7HSzv1w01VtLhdR8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42E43F80431;
	Tue,  9 Mar 2021 15:22:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E479F8032B; Tue,  9 Mar 2021 15:21:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A182F80275
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 15:21:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A182F80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="aI3BpLNT"
Received: by mail-wr1-x436.google.com with SMTP id e10so15909592wro.12
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 06:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WX5B3jn3ABsmJDUgiZ1eHo/S/aL6tIYdkt/tUOvK0TM=;
 b=aI3BpLNT8H1pAZ2QrPtQOMPukaNZTV5XdPv0BIdLmV+U3RrU37YBlnpBUuNtvp1A51
 z3g2+djeS/JMErH3+T4OcThXvEmuF0cW1gdDx/IXCKB5iyyVw98ibLi/ED9MKvUgTFGS
 0pfo4CWdeyF/q8afoxMGvMCUkSGUvbxlj9pc9GRPsKtzLoKLsHzGlKjVudWqg9lLipTB
 qTk8zFMK2wtILWS81tbJPCVBLaoRtJNjFB4KbmC50px3JR+ARNFPyI6Mtue/Pii/E8su
 FXRWwNbaNdxCmuNbSDq01DBxy8DQ2DZwCPmBkPsw6q26YzNnKsIO9bQUO+vqvkctHkJm
 n9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WX5B3jn3ABsmJDUgiZ1eHo/S/aL6tIYdkt/tUOvK0TM=;
 b=ssTUjBTR1pPVf2WzLVt3aSk1i4P6DzHNqS8cQouMyCSlq3nvYadNpaVpNsOPcUDLDR
 Bdl9hHlQPsLMcq8Wf0RVw0jPInb0Qvi0fxgdxPLaIYCG3nIlWghzN0rOOjNlaMMGKCOw
 L6BRPqj89OdpDgera327b+7DPdlU5iD6TnjcrfAmOo4+75cZwQ3wSMnyrdisJ3c6ybtP
 v66azd4ul+6zD1WsqRPEGrsW8ioiRgHI7b5P+QPlNy6KcuS3QnpOXIKmh4TlL2CCwg7H
 Euvmtb8EUz9p2/GMvbLRK+sHf9TP+dPcTZMwRG0iDH7NXQFaodrpPD/54aVOLBfxOUuL
 DUJQ==
X-Gm-Message-State: AOAM532pEgS3pseeoOtah3UXF6sekjSXWQcNKYRg0sR1IUyOxYXZVOZt
 wJ6Ck99oK5g8F24JEySvJfJpmA==
X-Google-Smtp-Source: ABdhPJwYXhOQbTlcvqtTYprGnLpaUkSDnqmPYYiIhTH9Kd+QvviUvnz+zH5mxzXedEh28pEH0OTgPQ==
X-Received: by 2002:adf:9bcf:: with SMTP id e15mr27691462wrc.276.1615299706510; 
 Tue, 09 Mar 2021 06:21:46 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id j14sm22265123wrw.69.2021.03.09.06.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:21:46 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 2/3] ASoC: qcom: sdm845: Fix array out of range on rx slim
 channels
Date: Tue,  9 Mar 2021 14:21:28 +0000
Message-Id: <20210309142129.14182-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210309142129.14182-1-srinivas.kandagatla@linaro.org>
References: <20210309142129.14182-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: amit.pundir@linaro.org, alsa-devel@alsa-project.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 john.stultz@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

WCD934x has only 13 RX SLIM ports however we are setting it as 16
in set_channel_map, this will lead to array out of bounds error!

Orignally caught by enabling USBAN array out of bounds check:

Fixes: 5caf64c633a3 ("ASoC: qcom: sdm845: add support to DB845c and Lenovo Yoga")
Reported-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sdm845.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 1e2c2d0902ea..153e9b2de0b5 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -27,7 +27,7 @@
 #define SPK_TDM_RX_MASK         0x03
 #define NUM_TDM_SLOTS           8
 #define SLIM_MAX_TX_PORTS 16
-#define SLIM_MAX_RX_PORTS 16
+#define SLIM_MAX_RX_PORTS 13
 #define WCD934X_DEFAULT_MCLK_RATE	9600000
 
 struct sdm845_snd_data {
-- 
2.21.0

