Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6051A3322D1
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 11:18:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B2AB17E2;
	Tue,  9 Mar 2021 11:17:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B2AB17E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615285123;
	bh=VrnXP4MtdeQ1nxl+lr/neWZ6mFgIywwceu0F6yMpX9U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CtjQbJ2MSpW/MY2ifY0l0bIpuwJuRbSuOR1bsub1EtDH1MeBunCug2GbrpAR/GKup
	 9zXXOeKz2bYJSrR+UHwqjcGQgxIYtSNahNIDOdtS6Ryl6voaa3lu1FjWYHY/DXyziN
	 4SyWLPqzIH8plQDnSywS5oLB/lPKci6TvYy132ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF977F8014E;
	Tue,  9 Mar 2021 11:16:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AA21F8028B; Tue,  9 Mar 2021 11:16:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0B6EF8019B
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 11:16:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0B6EF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vN04cyxD"
Received: by mail-wm1-x332.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so5578700wml.2
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 02:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WX5B3jn3ABsmJDUgiZ1eHo/S/aL6tIYdkt/tUOvK0TM=;
 b=vN04cyxDqUiaMClGFuacj9KHo6lA5Hfq2nxSH040ePyBd3FennWQC/tAWuSBtqUKE7
 fVONhlsKroMNejjvUHSlU4t2OZRF8TZ02QMC0yzd03YUT8oIMkDz3piacSSLrAMJwvWI
 IdBM7MwXQNyuah+bClcd8A/K2Lshp7nmrFGc+pxsRocT8xic6mukCT/hWmYPkw9zqQ1d
 E8HIZopo3kjSFP02eBPu32hZ+L4KyLpEZw6iZENOBAmt0Cbj5rvQX9YlfpCKmqjHHthU
 lBdgmF2yf6/Af7s2TO9NBrx1URmr5QYNmmnzL1bs5abtJ07HAVF2N0wi/6jgtMqpx+16
 PKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WX5B3jn3ABsmJDUgiZ1eHo/S/aL6tIYdkt/tUOvK0TM=;
 b=PiTwarO0QfYntoVGpbsFJBHx+JSp5JyGAojV4lAedEGATUcfhBb3a/mEXF8WGM95DG
 /Vov8dUJ8wp7maVJPZT2FjKxyAXaXvkxqwdXePduTZWiFTtpCviUktZR6m0hJHmuZ0Pe
 nJ9gxwD+iBxg/TyHUVpL0VwB472AFhE20v52TAR4vJ7f+qScnxHtDSoRseYyG3EG4D0r
 VepzSG09OQ6qrYdppq3Vf+m275Vq5kAaEjCyI40+OLpzV5mEdLxuN/qVHsKCMCHytu0Z
 GNijC7SvnVGDUSejb4HUYH68JbcKIH3pAK0bIOwNI3PdyQ612v9h5PCq9oY7NsddAdHv
 iOcA==
X-Gm-Message-State: AOAM531vtKjYHVOa+jmjaRG3yTPdRV0kI4D8sRwLR39PKGHshRwoSoGN
 McKYzyZ8fd3ribP7NfoBBjm//w==
X-Google-Smtp-Source: ABdhPJy0TulbZb3A9b1N+k2CzwpgJACMjLIPJ6Slj0duc3bnYWnBDMNEy8FnmYKVFP+bv3j/XS90/A==
X-Received: by 2002:a05:600c:2cb9:: with SMTP id
 h25mr3217369wmc.110.1615284977493; 
 Tue, 09 Mar 2021 02:16:17 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id r2sm22552248wrt.8.2021.03.09.02.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 02:16:17 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/3] ASoC: qcom: sdm845: Fix array out of range on rx slim
 channels
Date: Tue,  9 Mar 2021 10:16:12 +0000
Message-Id: <20210309101613.25995-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210309101613.25995-1-srinivas.kandagatla@linaro.org>
References: <20210309101613.25995-1-srinivas.kandagatla@linaro.org>
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

