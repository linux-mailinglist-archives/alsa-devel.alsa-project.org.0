Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C6F29E8D2
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 11:17:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 603981695;
	Thu, 29 Oct 2020 11:17:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 603981695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603966672;
	bh=Vr9WtR8yIzdvabnPCJ188Mfj0oE5BRLaCenMJh0lmco=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NZu5R6NlFu1LeKVzDPXvuuBAJZ3l4AeXaDB4aLl2D6VnsITGHFj+gPTV8SjoSFiR/
	 ZhoKO/9AZ9CbRqkUGnajX4++OhdFU4Gq7Lw/BKvZCW2VTq7yemOapABHWJCp4lItdJ
	 dNEFgtGdAIKU7W3Lg/5Ub7YpUANO0hCs5DW/hQXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C85FEF8021D;
	Thu, 29 Oct 2020 11:16:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBD8EF8020D; Thu, 29 Oct 2020 11:16:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF9E8F80095
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 11:15:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF9E8F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QOQ7mU5W"
Received: by mail-wr1-x441.google.com with SMTP id t9so2070408wrq.11
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 03:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i74O5NY+sTiDci0iVom9weNEC9VKdMsGWfdVhOUj4Xk=;
 b=QOQ7mU5WYK5nyIpw5goqHMmsDSJMRHJi7oEVLYhjcY05Ep9bxWWdfS1vEpBCsYdiGV
 ON9iuONq3yODrxlinvhw/tHBi45DHvBHl6ZUqUk/IHG7RA06GD21Ej2t00A0OP9mD+0A
 z3E+FgeqB8kmrVeALkdA0zemjJFO75HIAPns/O7YlpqUbd7S9+wn7su9FPS+CrB6uSBk
 qvZfUDapwV7z0KOmE5iPq/qf4OXjcZJrHOAe6/kl98pd7rkEHxblIvDJkYPLETT2FMzr
 /aJV7nTRfMaT+WBkbauH17hXn+QhTSgR1TtATAbuZE6K/EAQ4Vq9KuEQD8mPL8udiV3q
 vrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i74O5NY+sTiDci0iVom9weNEC9VKdMsGWfdVhOUj4Xk=;
 b=lpcKP3duuGkamPnnlmOWJ5eje/beQ8m9K1s2vaAEYeYmTVvI3MbClI8ukfo04cxdMB
 MyNLIYmmShq8KGVhyPmA6/ESYMZMJsFdiQWg5AgjivfUrJstITF3xxWYo5mH5apI1m6+
 Te2Y7jt6rEL3phjn0NFTw0AVV2oUuSpxSlgHO1yZ8q0vQ4cMEJLcZ6DTk5p6A/DXN+2F
 nOWY9Gc794Pow8kvb+300/2wl/rhFaGLFBC/iwqqj5UrUo+jUJF6Cnahbx8emdl4kw2m
 paqj3QUIiW7FR2R4j1pl0AseW4Cdr3eFmO2kBp05XcXca13aFLgXddwfI5Xu1h0yNDgJ
 tngw==
X-Gm-Message-State: AOAM5302AR2KpbwLejBS+ew9WawBhxU55m20NpSBeWaG2UQvRdlFpHT8
 gyWQTzjJSOyyFL35MovBl+9EOg==
X-Google-Smtp-Source: ABdhPJxFoVwhtInQxp4YNuWp2oFll6oAB0fdAsEjCqEVIm6c5GIOXbS3RSbETDmBOXb4v/2rIw8nxg==
X-Received: by 2002:adf:fd49:: with SMTP id h9mr4784034wrs.115.1603966558585; 
 Thu, 29 Oct 2020 03:15:58 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id 32sm4222495wro.31.2020.10.29.03.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 03:15:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/2] ASoC: qcom: sm8250: update compatible with new bindings
Date: Thu, 29 Oct 2020 10:15:50 +0000
Message-Id: <20201029101550.31695-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201029101550.31695-1-srinivas.kandagatla@linaro.org>
References: <20201029101550.31695-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh@kernel.org>, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Update compatible string as board compatible and device compatible
should not be same!. Make the driver inline with the new bindings.

Fixes: aa2e2785545a ("ASoC: qcom: sm8250: add sound card qrb5165-rb5 support")
Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sm8250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 52c40512102f..315ed6ccb7c4 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -207,8 +207,8 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
-	{.compatible = "qcom,sdm8250"},
-	{.compatible = "qcom,qrb5165-rb5"},
+	{.compatible = "qcom,sm8250-sndcard"},
+	{.compatible = "qcom,qrb5165-rb5-sndcard"},
 	{}
 };
 
-- 
2.21.0

