Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F253216F36
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:47:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3879082C;
	Tue,  7 Jul 2020 16:47:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3879082C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594133271;
	bh=gH+7b8pc8fTbQo4a4WaVQHnRVG2QJ13h76m+aIGA31E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bApmZPe7IoQShPMR3RvQ+zZ7NdQJnFD1fv37ze6E/cbsXXCfTgPYFUNO+/CHj/d+T
	 oR4WvOQpvi1lW8U3ooc9IxyIwZDRC//8d9N5b683vo4jsCaAFFQtMzE+TUEZcIlE82
	 wZdzVpNUoCuv3UMb7zjrETn9ammkK+qS9hqq2PhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61C31F802FE;
	Tue,  7 Jul 2020 16:38:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49A11F8033D; Tue,  7 Jul 2020 16:38:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAB7EF802F9
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAB7EF802F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="y0PO5kBl"
Received: by mail-wr1-x441.google.com with SMTP id a6so45416769wrm.4
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tfKAHOC4Bqa/g3TTN2zyTgayqsyKLptRGMeCLeLAzGA=;
 b=y0PO5kBlqlUU42SbtXP1vXkvb3j/2BL0FbASY0BSoHRpU3L88y2IKVJ/9oqwLopIlz
 Mr1+MDuG4LoZEL6Ht0QCbQoOPEClwf39CLo47Q/4VJg66UWdQlIBaY1Hy4YBGaIzBbf9
 uVLgyB8ZtS/eh3QtSrUBbcObWC7kXDviDUDHKbvaGv59FZpelKcAn4Xli9lY5wh9wfkJ
 ssg8NL7DiAKLTXmuP4nBrkDuMI9mohfj/dBpAvAwQG9QFk/1vd4ennzfNc1+AxOjZqNu
 StJdHLrm0AUphNY9+g8Pzm/w6cJjVeVnhANfKw5qXTjCSxL6TR/DTW/nx2S52xpjlH5R
 MX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tfKAHOC4Bqa/g3TTN2zyTgayqsyKLptRGMeCLeLAzGA=;
 b=cyDZABIr/V3pa2Ny+MZ2TsVLRZaYO38d0e4T4KfLmvkDecY2Z0jtjinPDQF2+3lEGv
 zZ1ReGIljNKUYeImPB9kDD69A1PeERbK1HNMeeu2pwiV9HtSc0T7dS8iUSNfJZsFU1/N
 mnFuVGBd6r9ubSS9IB395WVrZPhvJ6rg90OsWOru2Ao519hnNMGPGY62xnFPJ5qe19yX
 FhBXxNiUEkRsnPg6ZAEq8SrIjRMkYZGXrvkE7p96vWyxFruEbhgcccPOfmRZ+Qq8QWE9
 mkXVb8bLFxUuynBWx288y+iEDxmnC0fEDK3zzCE4scqumyxfQmrjZ5i28aqd5Qi185j8
 inEw==
X-Gm-Message-State: AOAM532vOSXIXmdL2v0okVD2wiUsAfBH+t3owEBGwBCRrKHOBdlRU18q
 NHnDC8HBYWPeQHaPGJEFkDq6LA==
X-Google-Smtp-Source: ABdhPJy9WLIaGgmiEMVkgFNQzihpEyvUsYv4v0EIE+0+DVUHKbd38T2a6PzO/BRBW3OO4BQb4P/gMg==
X-Received: by 2002:adf:e944:: with SMTP id m4mr55414369wrn.252.1594132686208; 
 Tue, 07 Jul 2020 07:38:06 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:38:05 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 13/28] ASoC: qcom: qdsp6: q6asm: Provide documentation for
 WMA 'codec_profile'
Date: Tue,  7 Jul 2020 15:37:27 +0100
Message-Id: <20200707143742.2959960-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
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

Fixes the following W=1 kernel build warning(s):

 sound/soc/qcom/qdsp6/q6asm.c:924: warning: Function parameter or member 'codec_profile' not described in 'q6asm_open_write'

Cc: Patrick Lai <plai@codeaurora.org>
Cc: Banajit Goswami <bgoswami@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index ae4b2cabdf2d6..58720b18fc8c8 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -915,6 +915,7 @@ static int q6asm_ac_send_cmd_sync(struct audio_client *ac, struct apr_pkt *pkt)
  *
  * @ac: audio client pointer
  * @format: audio sample format
+ * @codec_profile: profile to use when WMA
  * @bits_per_sample: bits per sample
  *
  * Return: Will be an negative value on error or zero on success
-- 
2.25.1

