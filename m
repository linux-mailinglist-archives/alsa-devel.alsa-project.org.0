Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC1F3302E7
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Mar 2021 17:25:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD4F81F65;
	Sun,  7 Mar 2021 17:24:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD4F81F65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615134336;
	bh=+IS+HsEn9PScpKZSYsoN2mo3qELnqpdac9Pu1dWhtjE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eizu7wPsTrzAAJapUpJ5qACidjRsAn0F+Wrc1c6LiBFBhCARcGt5BiaFk6/TgRVEp
	 2qGAgdmY9ypSHobrljQLzdS0DXhMIMlF8BxGPhKcq1Zia4jXBoBzFZUag4KidBwDna
	 RbylzqiLO8ax4Ge2XRcwYH6ip9AaLmthN495E6Dw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAA05F8025A;
	Sun,  7 Mar 2021 17:23:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B23EBF8019B; Sun,  7 Mar 2021 17:23:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96AD0F800CC
 for <alsa-devel@alsa-project.org>; Sun,  7 Mar 2021 17:23:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96AD0F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aJUEBRpX"
Received: by mail-wr1-x42c.google.com with SMTP id v15so8840356wrx.4
 for <alsa-devel@alsa-project.org>; Sun, 07 Mar 2021 08:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oj2xRqbEeMFzhlH+V7733PkaePwuNrfh8/9dg+i8twk=;
 b=aJUEBRpXErCQ4G9hu/HmWGVaNlBlpJPKAYX6D2EpRKQ+Bncf4Dw0AsByA8ni5OeAJc
 1Ax6MEkTAQcjUXPgyEnAEEbRNFy5LujGrOkv5JLcuJozseXzb9aGg+qSYQq/BJS5Z2Zk
 G5/uQM69YHXm0z2e6GOnNWjG/3d7ZYs4c2RFbSvU7IOrBKgtCvJqdNOvpftHIGHtiftB
 KU9GM35mF4WtwGZYQY7dnyGE4tKuA0sL0+2/xQwjicJBGGQs0bP1YY7DR61FmpjW89v9
 FEVUjdUYHE4r5xCWswpilrWn2JUh2X1KfeePMTR4UeDpUyGfiPSbubEsHUU2iUdAPMNw
 MevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oj2xRqbEeMFzhlH+V7733PkaePwuNrfh8/9dg+i8twk=;
 b=SEwmdwg+l5o4BdXNQ1A8omfS1qq3rVcK0z0HkY+JCcytSjYPvbduFkI1UZjPna8+2P
 yk0naMaE0gVVqJ7bRvFhCpvOm1bfaAjBGEaplkEt8YuDe0VmBOuDbddBHHmlKupOCXZ7
 jA/Dqcc7ue43vdyfDwtlxk8klVkJxMi/J3ig6fUqEqfiWaDmH3vf7UH1v8RSlW3dQKp6
 cqk/IeGWKURRvS1GCZ6mw7iG6NFoWdaIRtvNXC5Kt9NO9YzwdmxD+8OdCVA2jnC2AnEx
 +EmlbeBdvDya1VTL7dZXAaJAD1mmVcFnIMfVkWiXNMKEnDkWwu5XR2OG8aayMvw8wPMP
 RKkA==
X-Gm-Message-State: AOAM531BvnGie9dLLUHKndlGiTR3PxNv3bn0td9+u/15PpUMB9OPh9EX
 K80nOZR7impjMCjOLqXBm5g=
X-Google-Smtp-Source: ABdhPJyoMDAbk3o5tKlKQRAAvmPn/eztheXA87xRydC7wBaubagKri49JAB+o1QVp30Nmfb34/YYUw==
X-Received: by 2002:adf:8445:: with SMTP id 63mr19301582wrf.222.1615134223304; 
 Sun, 07 Mar 2021 08:23:43 -0800 (PST)
Received: from morpheus.home.roving-it.com
 (f.c.9.1.f.e.c.d.1.e.0.0.2.b.5.5.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:fb11:2681:55b2:e1:dcef:19cf])
 by smtp.googlemail.com with ESMTPSA id a75sm14515541wme.10.2021.03.07.08.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 08:23:42 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Barry Song <baohua@kernel.org>,
 alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: remove zte zx dangling kconfig
Date: Sun,  7 Mar 2021 16:23:38 +0000
Message-Id: <20210307162338.1160604-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210307162338.1160604-1-pbrobinson@gmail.com>
References: <20210307162338.1160604-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, Peter Robinson <pbrobinson@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>
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

In commit dc98f1d we removed the zte zx sound drivers but there
was a dangling Kconfig left around for the codec so fix this.

Fixes: dc98f1d655ca (ASoC: ASoC: remove zte zx drivers)
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 1c87b42606c9..e04fa8b5f178 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1739,11 +1739,6 @@ config SND_SOC_ZL38060
 	  which consists of a Digital Signal Processor (DSP), several Digital
 	  Audio Interfaces (DAIs), analog outputs, and a block of 14 GPIOs.
 
-config SND_SOC_ZX_AUD96P22
-	tristate "ZTE ZX AUD96P22 CODEC"
-	depends on I2C
-	select REGMAP_I2C
-
 # Amp
 config SND_SOC_LM4857
 	tristate
-- 
2.29.2

