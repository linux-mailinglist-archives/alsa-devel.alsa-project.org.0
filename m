Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 749ED521EF0
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 17:35:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CBDE18A9;
	Tue, 10 May 2022 17:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CBDE18A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652196902;
	bh=IEFQ4uu4doLwCszEybaGPuLWzh4l9a1rfb+746ODxRU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U2ZIgGNmLaTaYQH1rAvLY3PG/bCDZrvIAhytMPoulN3x9dtQW1Sju6YHGPsf2196n
	 6PKrxhuu3oKh+Pi1AszcFX0k2Sn+zq++A7tZ3p+HpdsyI5U4KfIW2iEGFpHICvp5v7
	 NA0k5pF6s96TdMYvXEFQ/fcwQAG1BoJlhqSBjon0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B02C5F80510;
	Tue, 10 May 2022 17:33:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F3B5F804FF; Tue, 10 May 2022 17:33:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFE25F804FF
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 17:33:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFE25F804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hlIhyjXW"
Received: by mail-pl1-x62c.google.com with SMTP id q18so4123684pln.12
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 08:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eag9/N12Mu3KYJJ0B0WDBdKQD2EGzDc2Cj2dmt69sIg=;
 b=hlIhyjXWWaS429dekFzsxpoSrs74VJmufWGmWV5tWMWylXvaSzSNiV8KwCOJCJl/ms
 5lbySympGAvbFfBejHNe6TUiO8nLo944xo9TetryJDHFoNW1CJ6DqnyFORYry4nd86QB
 OtqaS3H4VNJoR7k1pLVLtc46D3wHeTIp50VOuCZdQYksAwdjKdu1uddenfl+8+/oe0nK
 YfCSxtVHXQDP1BZMTP4/zxV3ObVeZkmYfe9kmg43VpNd9v2sdxTyCDMWMCSqhP8jUk1F
 +FvfwoIdU0wwxnS9G8SWQNXjAjVvpDfTRT/2ZApNxpAAdnWZIkEsAyiM5DMReiwzC8we
 8lbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eag9/N12Mu3KYJJ0B0WDBdKQD2EGzDc2Cj2dmt69sIg=;
 b=IOjZ19HjXJt5PeSiz0fdHfwrkxiPNoqaPEKI/2LFIo05HSQ2g0yZMlECbYRsjGHBbR
 J13zG9ej92h5zxj3kOLfOmQHl+95so8LL4/DLCUUSyi3rpdxsA/3RqXjCPnv7cqH1buG
 Xf0CISYK2O7rarRVM3Aaf3+CsHWaIuPemupyf3YmAHGxgtRtjr5h644qNg+bkygsexWg
 j615+cSlyxmZYNYlnH/itamzCX4SfC65geeoi4xbZggWOocz5M2WJDONzYfNigD+S4Ls
 7fJp9FD7qgJkc7+bmYwujeOoT0pnPy2HOLhJR1DmWsD853ieWX8EZiJm1CpeS3hIqr6x
 Mr0Q==
X-Gm-Message-State: AOAM533LvZUPvs+e1Ndl9pLtGSzhN9By+1QeGMfq0pYr5wVoYe4K9c1m
 slj48J0PxjVgXunkkNtzwgyXP8C+2952yXc=
X-Google-Smtp-Source: ABdhPJxFNiE/WgSKaJPA7RFpU5aiK16uBpllXCpM3cyKm0NYEOM3FXJtOGT7rNWzr+Vz36Pu6iKMpQ==
X-Received: by 2002:a17:902:edc7:b0:15b:4196:1957 with SMTP id
 q7-20020a170902edc700b0015b41961957mr20688090plk.161.1652196806644; 
 Tue, 10 May 2022 08:33:26 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 cd10-20020a056a00420a00b0050dc76281d0sm11104248pfb.170.2022.05.10.08.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 08:33:26 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 oder_chiou@realtek.com
Subject: [PATCH 2/6] ASoC: cs35l36: Fix the error handling of
 cs35l36_i2c_probe()
Date: Tue, 10 May 2022 23:32:47 +0800
Message-Id: <20220510153251.1741210-3-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510153251.1741210-1-zheyuma97@gmail.com>
References: <20220510153251.1741210-1-zheyuma97@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Zheyu Ma <zheyuma97@gmail.com>, linux-kernel@vger.kernel.org
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

The driver should goto label 'err' when failing at regmap_read().

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 sound/soc/codecs/cs35l36.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index cc5e80222916..920190daa4d1 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -1803,7 +1803,7 @@ static int cs35l36_i2c_probe(struct i2c_client *i2c_client)
 	if (ret < 0) {
 		dev_err(&i2c_client->dev, "Failed to read otp_id Register %d\n",
 			ret);
-		return ret;
+		goto err;
 	}
 
 	if ((l37_id_reg & CS35L36_OTP_REV_MASK) == CS35L36_OTP_REV_L37)
-- 
2.25.1

