Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A8557C8E7
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 12:26:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 130A716F6;
	Thu, 21 Jul 2022 12:25:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 130A716F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658399205;
	bh=bz4CoGFADMH5B+74PxV09Hchvj2e4wkShPJ21OWaDhM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fbMS36WGDhcCbWa1stA8fx/RdW3X2bkeylauK+fsOCje/VEhsC2FPTsR+wC5NOX4k
	 5Ll/yqpT2r1h9kru+4gVPwK7JKgcCNLclE20hubjj7d/yLlpecyf0p/L2sR6kvoNJc
	 J58LohDsiIRVnER6wo97UaxIY+EuBAGODRMu+ARM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8576CF80538;
	Thu, 21 Jul 2022 12:25:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64FBCF80528; Thu, 21 Jul 2022 12:25:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 508D8F80166
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 12:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 508D8F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BXbAH2Qp"
Received: by mail-ej1-x62d.google.com with SMTP id b11so2306645eju.10
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 03:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DDlxv6f17NMMsNj65PpLbDHfFZ9n6R5iig5GSNIQc60=;
 b=BXbAH2QpOuEtDBsyknn63KMdYDqwYJ04QkYENBBBubvPKw5ufJQQ2RYWkh8TUehmAp
 eRg1pqewIA/nWrCKjZm9eUb5/F7/+M3SfQb3fG2M/j37/NW+H4x5xwUZB8pLViC0hPap
 mpJRkHmRolRjatLFK46JVrwFPwWbLIjnK/IPCnz962aIg/Ya09URDokHXSDpIDp++KMU
 IvdBpBpqCcplCkrF6gXYiY5M/0zk2Ofj6aGIuMQ3j/QygHzKx4yIlYJ5mdI9YATue7Lz
 mzIUg11Y/4YGn1/EkK5qinmyWQ1dBof6ytJgv5ZSspVQS1IpsGnFb75wrOwzRzVcwf/U
 M+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DDlxv6f17NMMsNj65PpLbDHfFZ9n6R5iig5GSNIQc60=;
 b=BAQByTaov9aXMbdjidGjFYuEyVB5m5EOg3d9xYS+VuGl6GPUTswQS5CcjSLrnh9V15
 gN0llGKhpr8knZAB7ZhQIEtaO6+beLc74NLZU4kprF/rfP4FH0C7I4hu58jXOHWZpPPa
 +Yy053XQEDk1THioJmvsNZ1lCsq9v83Nc/qTiMeHRGidEe1i/yJUJRkeNlQZObOiJt6R
 xCIBy2pI3qXfgeCUBw4OfPIgyMwuKL2bz+v48tomg//nGSZRc6JxT+CPiuajGtAZwLJW
 kUrpYk9US4XdfHrtgdWj15Lt8F2P+gWq+Ukcq1zHAfbQY/dA3XKY42AAsJPwJIm2sm3s
 cOow==
X-Gm-Message-State: AJIora8T/OPPzPmXOvNqAA5VQ+lo7wKPJ7LjqQHLUyOVRahnyLuNPg0K
 eww2Syjymselwafnltivw40=
X-Google-Smtp-Source: AGRyM1uT4hp2Itp4P40blzsKlm6eCx6+8avKdG3J/Wu5vQx5h0kQMV6Q9zWDGrdUxUc9Zz0qPjlN4g==
X-Received: by 2002:a17:906:9c84:b0:6e0:7c75:6f01 with SMTP id
 fj4-20020a1709069c8400b006e07c756f01mr40510180ejc.103.1658399093753; 
 Thu, 21 Jul 2022 03:24:53 -0700 (PDT)
Received: from localhost (92.40.202.7.threembb.co.uk. [92.40.202.7])
 by smtp.gmail.com with ESMTPSA id
 bv4-20020a170906b1c400b0072f0dbaf2f7sm653335ejb.214.2022.07.21.03.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 03:24:53 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com
Subject: [PATCH -next 2/2] sound: soc: codecs: wcd938x: Remove spurious
 type_base from irq chip
Date: Thu, 21 Jul 2022 11:25:58 +0100
Message-Id: <20220721102558.25457-3-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220721102558.25457-1-aidanmacdonald.0x0@gmail.com>
References: <20220721102558.25457-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

There is no reason to set type_base here: the chip doesn't set
num_type_regs and none of the IRQs have type information so it's
not possible for regmap-irq to configure IRQ types.

Type registers are also deprecated in regmap-irq, so any IRQ type
support in the future should be implemented using config registers
instead.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/codecs/wcd938x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 781ae569be29..aca06a4026f3 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1298,7 +1298,6 @@ static struct regmap_irq_chip wcd938x_regmap_irq_chip = {
 	.num_regs = 3,
 	.status_base = WCD938X_DIGITAL_INTR_STATUS_0,
 	.mask_base = WCD938X_DIGITAL_INTR_MASK_0,
-	.type_base = WCD938X_DIGITAL_INTR_LEVEL_0,
 	.ack_base = WCD938X_DIGITAL_INTR_CLEAR_0,
 	.use_ack = 1,
 	.runtime_pm = true,
-- 
2.35.1

