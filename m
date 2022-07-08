Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2026A56BD27
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 18:04:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AE941621;
	Fri,  8 Jul 2022 18:03:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AE941621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657296239;
	bh=hogIewQW+dYlr/en8yGW/5/+qQlU8V8IP/kxU774cgA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sW2GF0G42zGT3Cn7r+4IiY4b7+XN0dVJPzDfdP4Ja/Lh3kh7Fbz8b3WvdKD1fkFmS
	 R2Ij+UArF7XrZax/FOwTxK84pJ9TQpHPKqzsF6RLrbL/VFJjfArZW4EPinwZmvalq5
	 dDwuZTKGJz9bKYBvAuNUROVNDD4nK6MscVI60N5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 263E8F8053C;
	Fri,  8 Jul 2022 18:02:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADB07F80538; Fri,  8 Jul 2022 18:02:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DC06F80537
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 18:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DC06F80537
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XKU1NRB3"
Received: by mail-wr1-x432.google.com with SMTP id h17so17999816wrx.0
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 09:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+3sBXRp/zeIpi+smlmCJit5ubHlk/qV0SMuYjGyKHw=;
 b=XKU1NRB3a0LaCzrPjePainKaedFiQqRolh+uGgZgbfV+W/87GfwTTFKw9slVJwb6qe
 f2FIy6e+GCTKj3ckoRu9bFugR1cC/J7XenV2JzQgfX2x4wkLsd3F5C1u6LPKOpActlAX
 xu9eFgNa5nYZd9RIOMqUoV4LH2LKD9CTIYgq/Um2o1ToVCTTrEpWWKLJJx9Ut+TT/bbO
 1ioUj8IY0KOQt5zPvNOiktONrmaMJwzyckhSV1bkFdemoI9aZHgglyXuhlCLGtegAwKZ
 nK0zvp4oQzNNDvy4Avm1c7eCncZq112FonbJCAWK2R2+lHpv9K8rfGa0eyNvBM5M6xTF
 mhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X+3sBXRp/zeIpi+smlmCJit5ubHlk/qV0SMuYjGyKHw=;
 b=4MCIJop7W5AZi9ftRJ1KQYw1ps5a9325G9/Qeoe2CJ+/Skqi3TK4r97yml6PAMt5tf
 oXSCduGm+IprcJwzTYF50X6BV3QP+oQAPNYy8qGHO7SXeL47zz/3WxJ8iH6dqQeB3TWQ
 jNQQghTzOj7WJ/YZeJIpwvtzmCWYtLz8P9Mb4w2navL3wA30hhUnkiBDsjBgPMg9+A3R
 cP2YT7uyUSvgIDydtLia8deOs1WpVpOTUhQ0lxoqz8yAz5mCgI59E7Ui/TDBMi2OB1nz
 jl17uZxvKl83y39lYC6u98bQzBbGs/hvDR0OBS+YfEsIG2Il/+DkErVF128iMvXo2eH0
 uz0g==
X-Gm-Message-State: AJIora8YjuxOFbFPON4hAUZZfjKTHMSCsoMJXU9ezOzBLgGR5CKBAfWx
 s9nLiROxpdDAJeesOKXbOHQ=
X-Google-Smtp-Source: AGRyM1uAbe3JEknDQ+quc/MmYhHL3bxnlIbNXaROFVRb2ZclK3fmAO4vCIa2G/zxkkF+3OwBlQlJ+w==
X-Received: by 2002:a5d:4346:0:b0:21d:5dfe:b29b with SMTP id
 u6-20020a5d4346000000b0021d5dfeb29bmr4057696wrr.672.1657296128931; 
 Fri, 08 Jul 2022 09:02:08 -0700 (PDT)
Received: from localhost (92.40.203.144.threembb.co.uk. [92.40.203.144])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a1c7903000000b003a04962ad3esm2593863wme.31.2022.07.08.09.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 09:02:08 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v4 02/11] ASoC: jz4740-i2s: Remove unused 'mem' resource
Date: Fri,  8 Jul 2022 17:02:35 +0100
Message-Id: <20220708160244.21933-3-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
References: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

This isn't used and doesn't need to be in the private data struct.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 576f31f9d734..adf896333584 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -98,7 +98,6 @@ struct i2s_soc_info {
 };
 
 struct jz4740_i2s {
-	struct resource *mem;
 	void __iomem *base;
 
 	struct clk *clk_aic;
-- 
2.35.1

