Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEC43E45A8
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 14:33:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DE11167C;
	Mon,  9 Aug 2021 14:32:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DE11167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628512411;
	bh=UqIYI+/WpB8vpmajsMsNj2tzgNmRVCpRxuzElnEH3Nk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fYAxaByI8k2Kr0CMgW5hfC6HFI/S1oEvZSbV1mIbpq0vROBNZC6U35CLJZukBVity
	 nIhfEMnhmQognOPBcQ/sknYiYvijH6+HlKa8Tm3UHgQWAF30+RqkWOv6OFTAV1mxRS
	 QzkSwhpJ+CokcpQCTbyTfKOEKzaY0ThmJzWotV30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93A45F800FD;
	Mon,  9 Aug 2021 14:32:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91C73F804AE; Mon,  9 Aug 2021 14:32:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB4EFF800CB
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 14:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB4EFF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TYuC62Jh"
Received: by mail-wr1-x42b.google.com with SMTP id b11so5053041wrx.6
 for <alsa-devel@alsa-project.org>; Mon, 09 Aug 2021 05:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZKxim9glF2Pix1TZX/SYGDBRE7+YwjotanL1KNZXsdQ=;
 b=TYuC62Jh8eFdZMbUsv4rGO508rQbR1YCfDc5MbOorLYbt8FA/66mO2Tcg7Yi94zRUi
 mYzef4aoOSkoAZyHQckJS/OPuJ/7KF2JvbhlpKZ5FuL1/EbTzDWeZNM31xN8lh9SEQMS
 9Mr6IDHsmccn0qv3JKbIUSVrMCIwqqm1pYGz/hlPmk4Rcns6EgXqtHW8iXdtAZDej0do
 ViesldXEEX7N/OHOLwSoWpp0Ab9c4LUBtlRrp7U0lkpEMPdT5kSotpyVT7vvWDFMmFNK
 TTbbBEgphMsquJFuaA7qklkQClBW2gl8Lw0uWYYt78AUjuNi14OqElu3hFs9CSPxCqfF
 cTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZKxim9glF2Pix1TZX/SYGDBRE7+YwjotanL1KNZXsdQ=;
 b=SFmatJM7ZOTNNwH//fZ07/EDa+mGpHr9l01FsDZiA3irRuZbdubbREoivPu8st73fK
 UhkT08WSbyKwgjSifCzcWVPL3Rxbfefn2noLCcjzdPdLSpKbIabXC966CijJqwoxR3lx
 U5Lf/4vnIANj1n7ag6qwoL0ZqW0rYLG12JqH9068tl6hN6uT/aUmTVEZvUUs5EdmMhAf
 WWnI/kRJWhxBNoZqlf3aqOFqKx8sQqBd50qWh8N/hqSl50jmcTkxFssidVMACyqBaH1d
 vPNqRUIGAtsMEN6N7RrtxCSG+4zsl/jSyjUsh2HYK9YbOlyE+VQgebvDYLF8uil1oSi6
 i9Jw==
X-Gm-Message-State: AOAM532EN/KctzyoEMyEov6pvAsbuGCddYCsxKg8kQA8SW/udOFOgZnM
 gxfvB1dFm6nVo14/kc65eNMZAA==
X-Google-Smtp-Source: ABdhPJwJyoOBTP0fsNQzeKuLps0saSz1ly0/E7TfoFgS8hiqbxkUxbr3KiTjFFfNWykYNvbwHckfNQ==
X-Received: by 2002:a05:6000:1366:: with SMTP id
 q6mr24588422wrz.60.1628512312871; 
 Mon, 09 Aug 2021 05:31:52 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id g12sm19369193wri.49.2021.08.09.05.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 05:31:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/2] ASoC: qdsp6: q6asm: fix cppcheck warnings for unnecessary
 initialization
Date: Mon,  9 Aug 2021 13:31:36 +0100
Message-Id: <20210809123137.14456-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210809123137.14456-1-srinivas.kandagatla@linaro.org>
References: <20210809123137.14456-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, tiwai@suse.de,
 lgirdwood@gmail.com
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

cppcheck reports below warning.
q6asm.c:1631: (style) Variable 'port' is reassigned a value before the
old one has been used.

This is due to unnecessary initialization of variable port, which is
now removed as part of this patch.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 36bf8bd4edd7..9251d8548965 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -1624,7 +1624,7 @@ EXPORT_SYMBOL_GPL(q6asm_write_async);
 
 static void q6asm_reset_buf_state(struct audio_client *ac)
 {
-	struct audio_port_data *port = NULL;
+	struct audio_port_data *port;
 	unsigned long flags;
 
 	spin_lock_irqsave(&ac->lock, flags);
-- 
2.21.0

