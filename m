Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C82F261FE99
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 20:26:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55AA73E;
	Mon,  7 Nov 2022 20:25:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55AA73E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667849204;
	bh=16zsZrDxiCPPMRJ1m6zTWTy6k7Zog3pkUXPJxkRHqlk=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jqx0H85/Y2OjO+IYXOwhIqt6Puqea4O5KvWFn/mKbwEgrK+JtzJcfmblH/TjLwB2F
	 k2ZWO38tSilN3RG0a6GxakvjxsPx/z9/a7VJPJVmFUp5BDjZ5Dy3hWjx4+X9rd3FZ/
	 m2agYOunVQYCop3u0G9BncafpcTGI/jqeQt85txQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE9E3F804BD;
	Mon,  7 Nov 2022 20:25:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A17DF8025A; Mon,  7 Nov 2022 20:25:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33F93F80116
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 20:25:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33F93F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OWgy2XCu"
Received: by mail-pf1-x429.google.com with SMTP id i3so11541472pfc.11
 for <alsa-devel@alsa-project.org>; Mon, 07 Nov 2022 11:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L09sSFj8jMYHB7Rrkwmq2jVe4IQP4EfD+P4chmHfa1c=;
 b=OWgy2XCuTwEHKHQUOym0SdS7JXGlumeU5fbSbQCQlkJlGCO/CYiWC5r23Lgbcebq/M
 OystifHIjNkmznGfP3BXu7Fi3M7y+CXstGUwdCKk/diK5IKVXP2ngraPRmeD4Xc2JEaP
 Kjtr0OFih7SU9Neuw+fed2X2OMGrVQrzK/7cqKhgrF0JD9piEuZ+Sc82mJ5fD50Rd8JP
 VTTvbE92+swpK4CmA3mFwg1UuZazjGTByOBc/sgx0gIHyyJzg94+0aRNonUrAT+gxqTs
 LFNLPfzHrkVg5NHJ1o7IxGarHxhqxj0PaJWnkLE90UzuUkmTRYAe5WG5g8Yqx1ImZGhx
 4VAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L09sSFj8jMYHB7Rrkwmq2jVe4IQP4EfD+P4chmHfa1c=;
 b=YEAnFn0YQ9TBADyoBwCA2MCe2Pgb849k+BqrmTIJyOqkd58djkbtzeVmz533tGwud4
 e6rrBf8C8RJUhYTTq/XPXjFxSwwCETDTa4Tj4tFB+/fOPq0KFUEjlTd7hh7uShb/GiG4
 naA5RRMKeYKT6eor6lh20c2MsFU+9S2vYJ/QyiJoBeTOS6oxay9BUduqZc3qFBcsnOTO
 ZwMVbZALZ9lPamaEDXne8NbDvFJF406t1XFlr3zRTmE7SZC3RC7M/4J4ebzHYB2GmLS7
 pvb/59dFQz3T4a6zFtN9nDaA8FlsawBQc7ovmnQKlAtakpyXq31OABmDBfZY+pWdIxK8
 tAog==
X-Gm-Message-State: ACrzQf1lZJSmfxyOgVVzxmbzmrZmz/xm5z4vI42oZGIXDom8CZAKq++e
 gofEOKJ3+rMfNPngIKLWWxg=
X-Google-Smtp-Source: AMsMyM4jFQowb8tpJJ02tbtrHi5AjK/wODZDnaxvLQl43T4gl2P7ncSnlJmSXopBWIRCZORFIkCCag==
X-Received: by 2002:a63:7f1a:0:b0:46f:8464:3019 with SMTP id
 a26-20020a637f1a000000b0046f84643019mr43703997pgd.450.1667849139569; 
 Mon, 07 Nov 2022 11:25:39 -0800 (PST)
Received: from thinbox ([12.231.191.170]) by smtp.gmail.com with ESMTPSA id
 n190-20020a6227c7000000b0056cea9530b6sm4837304pfn.202.2022.11.07.11.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 11:25:39 -0800 (PST)
Date: Mon, 7 Nov 2022 11:25:37 -0800
From: Maurycy Z <10maurycy10@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Trival: Fix spelling error in Kconfig help.
Message-ID: <Y2lbsfOhXicqvC2A@thinbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

In a few places in Kconfig files, 'system' is spelled as 'ststem'.
This patch changes them to the intended 'system'.

Signed-off-by: Maurycy Zalweski <10maurycy10@gmail.com>
---
 sound/soc/fsl/Kconfig     | 2 +-
 sound/soc/generic/Kconfig | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 614eceda6..c7fe12fbd 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -366,7 +366,7 @@ config SND_SOC_IMX_CARD
 	help
 	  This option enables audio sound card support for i.MX boards
 	  with OF-graph DT bindings.
-	  It also support DPCM of single CPU multi Codec ststem.
+	  It also support DPCM of single CPU multi Codec system.
 
 endif # SND_IMX_SOC
 
diff --git a/sound/soc/generic/Kconfig b/sound/soc/generic/Kconfig
index b6df4e26b..955ac8d3f 100644
--- a/sound/soc/generic/Kconfig
+++ b/sound/soc/generic/Kconfig
@@ -7,7 +7,7 @@ config SND_SIMPLE_CARD
 	select SND_SIMPLE_CARD_UTILS
 	help
 	  This option enables generic simple sound card support
-	  It also support DPCM of multi CPU single Codec ststem.
+	  It also support DPCM of multi CPU single Codec system.
 
 config SND_AUDIO_GRAPH_CARD
 	tristate "ASoC Audio Graph sound card support"
@@ -16,7 +16,7 @@ config SND_AUDIO_GRAPH_CARD
 	help
 	  This option enables generic simple sound card support
 	  with OF-graph DT bindings.
-	  It also support DPCM of multi CPU single Codec ststem.
+	  It also support DPCM of multi CPU single Codec system.
 
 config SND_AUDIO_GRAPH_CARD2
 	tristate "ASoC Audio Graph sound card2 support"
-- 
2.38.1

