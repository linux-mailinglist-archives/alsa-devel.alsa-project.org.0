Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ED6D047D
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 01:54:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 743C61614;
	Wed,  9 Oct 2019 01:53:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 743C61614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570578846;
	bh=erKSEuUepUR0cDMD+8eRN3XhyBzq3WFSvT6Qb1unPkQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Slv8phcfo8F6+Ro1KliGJr9K6a+NP/9FnunJcQCnHmiwWuc6c9thcoV6CQktbsGTf
	 jMRFpE3V+mRKmGGG3cAPiH+waeV1bEJ7aIAi95apTK5KGbskldkZfzAlcugMbS14oT
	 xegyF22L+LvO+MhX21IC/BAm99MvwYgPHoZxor8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA55AF800BF;
	Wed,  9 Oct 2019 01:52:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA116F800BF; Wed,  9 Oct 2019 01:52:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87C0DF800BF
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 01:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87C0DF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="eXNI7uF0"
Received: by mail-pf1-x442.google.com with SMTP id q7so364880pfh.8
 for <alsa-devel@alsa-project.org>; Tue, 08 Oct 2019 16:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=93hNjDd5eCXL0gLM7IExhV/a9m9EoJoT7fu4u8l/oCM=;
 b=eXNI7uF0qS/fCt2cI6utGIXdycLWTx96ipuD1Awfs01s+oJasZqugJxfDr8XHm7lUZ
 8tjlu5fsX2JbhTMn9QkyqTBi6P7kyUsVaADWNvk/F75Y9kugrTQpZvB6/pg38RoNPDCR
 T6hxia1aurk05lY6rJaRTTdgwcuzUcea4EHyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=93hNjDd5eCXL0gLM7IExhV/a9m9EoJoT7fu4u8l/oCM=;
 b=noCsoug21jnTwXXvBYxAIVBS8nOTinIXYesn12uwF5U0h8kTfWt++fBJe+/DEm9I9t
 c6T9AkNX9jE/RenN4ktUJhIkIdreEk8LVApGN2Sx3PA4w+xBu0IPOGDyxeyL0QqNcWuj
 OQ6QYh1CX5pUjBl1N+DKpLOivK0t7f9WupVCcdM17rwfm2MS6kG48fDPvgNhJo7y19na
 LVq2W+WfwDOr00/2IvP9XKzKRqOlg87BdXXDiuoKjZ9axoaZf5nBPHsyhMg3GJOSXhv5
 8Eo09QnXHbdSZQVFcOlbLf1B8DgPT1xoi6RPH6SGC2Znlj26YchmIygB976rIhoTR+rP
 RDcA==
X-Gm-Message-State: APjAAAWSkPJfwU2QQXxc16JtWXQmG07DPFWkzFnKmbp8T9VYvRUFo2XC
 S1oEUHt8sKGSpAprPQD/nl541w==
X-Google-Smtp-Source: APXvYqyazmsIa9xT1DjyyRpW2ecIG7h2tPAxbPMK5zo+csVhL9H79eaaMl3eZK/YO3F1MgHPdxSGMg==
X-Received: by 2002:a62:1d8e:: with SMTP id d136mr617041pfd.49.1570578734052; 
 Tue, 08 Oct 2019 16:52:14 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id o11sm252083pgp.13.2019.10.08.16.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 16:52:13 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Tue,  8 Oct 2019 16:52:12 -0700
Message-Id: <20191008235212.228856-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
In-Reply-To: <20191008105815.1011a0fc@canb.auug.org.au>
References: <20191008105815.1011a0fc@canb.auug.org.au>
MIME-Version: 1.0
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [alsa-devel] [PATCH] ASoC: jz4740: Remove unused match variable
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

After commit 67ad656bdd70 ("ASoC: jz4740: Use
of_device_get_match_data()"), the match local variable is unused and the
compiler rightly warns.

sound/soc/jz4740/jz4740-i2s.c: In function 'jz4740_i2s_dev_probe':                                                                                                   
sound/soc/jz4740/jz4740-i2s.c:500:29: warning: unused variable 'match' [-Wunused-variable]                                                                           
  500 |  const struct of_device_id *match;                                                                                                                           

Drop it.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: <alsa-devel@alsa-project.org>
Fixes: 67ad656bdd70 ("ASoC: jz4740: Use of_device_get_match_data()")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Can also be squashed. Sorry I missed this warning in the compile log.

 sound/soc/jz4740/jz4740-i2s.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index d2dab4d24b87..38d48d101783 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -497,7 +497,6 @@ static int jz4740_i2s_dev_probe(struct platform_device *pdev)
 	struct jz4740_i2s *i2s;
 	struct resource *mem;
 	int ret;
-	const struct of_device_id *match;
 
 	i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
 	if (!i2s)

base-commit: 442630f691a1537b7e0cc35e3d580222077549cb
-- 
Sent by a computer through tubes

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
