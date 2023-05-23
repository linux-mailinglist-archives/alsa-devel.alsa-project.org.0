Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 511BA70E27B
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 18:55:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75A543E8;
	Tue, 23 May 2023 18:54:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75A543E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684860916;
	bh=f5AG5ofoopp/L9Qw+x+v5BOFAIptfZVPO+r8qbxa7CQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Msz+24sIJ9N/15LeKGl60MOO3/i5+bSU2il2OV1uTY5Y2EJY4F6OOQH39kkcZ5QWq
	 M3JAUCYiQHPwOrAmNEu2n8VlGMo1mv11xD4NcywDizd/4kWElEw+y8oX9UVpGl7DVh
	 mdD/DxggW1zxvmDTK6V7fv85Fb5SGtGn75V15nlI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B863F80548; Tue, 23 May 2023 18:54:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBDD2F8024E;
	Tue, 23 May 2023 18:54:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41A5DF8026A; Tue, 23 May 2023 18:54:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7290EF80249
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 18:54:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7290EF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qPLj+t7f
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f60e730c4bso716435e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 23 May 2023 09:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684860857; x=1687452857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+IpOI6DjQvsWYmDscf/WJ+Iv5OpwjIhaEoLM2tDvqjs=;
        b=qPLj+t7fMYCcTYpOl945/05++fCK7Dg2DPxLSXl6hSItdQAiS+Uv1q/fKy9041A2gv
         JBs0ANkA63E9eL6WtBxVv5EuquwIZhHJlJtm4BAho71Nba09bXMohGVszalUU+EeQYBN
         udBJg8qHZvYFu8a5sfyfkrKpTr3x8w2O5IIzxQ4Zf7c5CXkftBTYiI3UhGx4D2EfC9yu
         e9ZAln37baQpHZtlsUQDlLNxka+bMNHYimnrK3gFq/GTMDlTGDQiQ6OhZ5ohv/W1R426
         SvyEa9s4Mz5E0C/iu1QXmGs1rWPumPEE/m0B7Cpct+EI3ghZRy+CL62mB70diLhpQOIl
         ApFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684860857; x=1687452857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IpOI6DjQvsWYmDscf/WJ+Iv5OpwjIhaEoLM2tDvqjs=;
        b=HyWstGOmvakJmvR7LhG1wcBu9QprxX+AV7dwbbS//RCtul09Y01EwqX3gvDYLmyrGn
         I/my+1nJm54ZT36sXd6iVPUCTE3+KfikEqvTXKySOY229UUPqCHf+NqScA2rc0lw1zlN
         xLM6+kJyZ1Aatxk7P8ziiwNLM72ChKJ11XB4Bk++Due1Na2Z8ObVC3xXyEKQk1lB24G0
         6WdG8tT2Gn8sdLw9iEHCYi3hKZsRMQyLk3qaxCDJSSIXIkRuvRE0VVu1jC5gGNRIwOE1
         vouIhxfjxOyFIWJ58Cu2rCjBhv10ajwcVnHWTDgjXM9Dt6rP6pY/Vw139lXz2MFcTR7S
         HMDg==
X-Gm-Message-State: AC+VfDw3jlnuqXvy78p8ondVqCi+2bDKg8CzXJJ3cQfRTWrQ1wUJH4Cb
	DvInpK/UCY0ulM4nR/a4nu1rew==
X-Google-Smtp-Source: 
 ACHHUZ4kBw+gSodRazsb2pOCQnnKcrUn1lDCjvQhAR7zwA7XQGBiwx6vfTyxl5SfnMwdvoZCjQG4JA==
X-Received: by 2002:a7b:c447:0:b0:3f4:e4a2:9f7f with SMTP id
 l7-20020a7bc447000000b003f4e4a29f7fmr9903955wmi.36.1684860857247;
        Tue, 23 May 2023 09:54:17 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 c11-20020adfe74b000000b00306281cfa59sm11783321wrn.47.2023.05.23.09.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 09:54:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] ASoC: codecs: wcd938x-sdw: do not set can_multi_write flag
Date: Tue, 23 May 2023 17:54:14 +0100
Message-Id: <20230523165414.14560-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OZ3TOWB2XBRVQRPK2S4JWBBGTULAFA3F
X-Message-ID-Hash: OZ3TOWB2XBRVQRPK2S4JWBBGTULAFA3F
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OZ3TOWB2XBRVQRPK2S4JWBBGTULAFA3F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

regmap-sdw does not support multi register writes, so there is
no point in setting this flag. This also leads to incorrect
programming of WSA codecs with regmap_multi_reg_write() call.

This invalid configuration should have been rejected by regmap-sdw.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x-sdw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index 402286dfaea4..9c10200ff34b 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -1190,7 +1190,6 @@ static const struct regmap_config wcd938x_regmap_config = {
 	.readable_reg = wcd938x_readable_register,
 	.writeable_reg = wcd938x_writeable_register,
 	.volatile_reg = wcd938x_volatile_register,
-	.can_multi_write = true,
 };
 
 static const struct sdw_slave_ops wcd9380_slave_ops = {
-- 
2.21.0

