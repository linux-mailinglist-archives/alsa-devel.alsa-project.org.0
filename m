Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC42159E585
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 17:00:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F33441692;
	Tue, 23 Aug 2022 16:59:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F33441692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661266830;
	bh=RJxA4qodSpFLISncEbqyG+AwxtW5neeHBxyAFpfBW3U=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C6Tisql0683TCtuVT5mvO2gfMHmPYHkCCdqRD0jXnF53iKwHXGVIVYsD7DTKVeqtw
	 r65uholU8MOKEVvW+qvtBdKH6gFNJ+8+coIhtv9eiuhx5A1EZ5QqGBBvd4QSjofJDK
	 GFCaqHXSz0RcIAnElIdiZ7EeNkpePncqOBbv9aQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60AFBF80527;
	Tue, 23 Aug 2022 16:58:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5531BF8026A; Mon, 22 Aug 2022 23:24:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3BEDF80152
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 23:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3BEDF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dQUnMFNv"
Received: by mail-pl1-x62e.google.com with SMTP id c2so11090035plo.3
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 14:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc; bh=4ebzqLCs3SrxMclVVXsZRPtzFUgFO7EsLBOSaZ0M4sE=;
 b=dQUnMFNvn/Jw4UhNCCGDzQDssEEv1gkvreAunFL6PsEuZhy7RaHckAfWfOSsy8y0Nv
 rJ4FzgkrAw7fDL3Fs++9+VNEXJoYOH9ryxZTITaSNO00t+xmmMIHPodc37MZBYclSQS9
 cKTjKdL3k/4VEXanQVc8bwEC2c8hc3ZzrcUutL7CTtbogx67yesgS4zOboqH9ZgkcTj4
 ZBN45PKH/D4fmTOBOxC+DDSd1B5ZdQuE0SWn5GRuBaTBIMNEYYrYVMvkIGA1D1oO4DKV
 EfEbndIlCeQdXoIIrEa0+JXDLlFk1eKrbk6RkRQ8NYS1hVIAjt6s3sVxPB8RRPob6yux
 UJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=4ebzqLCs3SrxMclVVXsZRPtzFUgFO7EsLBOSaZ0M4sE=;
 b=OkMb7JOZQJLq6/mEBTtfDYSA+3AYQAeWwxLdylh0BxhlmnOSi1kZXSUgMyBIjVUtyE
 YDKXhcNWhnBGTivZauyRc+u3DvvHAAbJsIURvb88vynmAJLsb5WwMlsrBUwkoPH40IgH
 6UdaFXyc28Jtugptl59wdlBTcE+xnpXtyAPrvmo4hrEyXNQVq+fxslpGoOhBTN6iQhQi
 QrlNWLQB1vssss9ne0MOkoHP9v+mTxubFTN8murbZLB/bJnKeeuSAfZL2CMhjhVIXW59
 EvUxvNdCjjVWWCOXkFPACTiQo58+ozF0F//aSsRLbDZD4d1N2gPQSksVUL2Sk4L2pToN
 Th3Q==
X-Gm-Message-State: ACgBeo173CwhnsxYyWH3sJ6mcSEkje+y03UP4nEqi8UnRCj0hI1HgRwI
 J894R4R4iEkIfhtDuKatgQ4=
X-Google-Smtp-Source: AA6agR53rG7CX8SQHU+QGo8ThqkDcr6UrtDHwB25bS694mnEY+8rePZuQRiaT/GtJ+gSngSDILtDkg==
X-Received: by 2002:a17:90b:3b8a:b0:1f5:56c3:54ac with SMTP id
 pc10-20020a17090b3b8a00b001f556c354acmr267891pjb.2.1661203460140; 
 Mon, 22 Aug 2022 14:24:20 -0700 (PDT)
Received: from thinbox ([12.231.191.170]) by smtp.gmail.com with ESMTPSA id
 p18-20020a170902ead200b0016a6caacaefsm8823755pld.103.2022.08.22.14.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 14:24:19 -0700 (PDT)
Date: Mon, 22 Aug 2022 14:24:16 -0700
From: Maurycy Z <10maurycy10@gmail.com>
To: lgirdwood@gmail.com, alsa-devel@alsa-project.org, broonie@kernel.org
Subject: Re: [PATCH/RESEND 2 v1] ASoC: trival spelling fix.
Message-ID: <YwP0AETRn+iubU2G@thinbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 23 Aug 2022 16:58:46 +0200
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

"system" is mis-spelled as "ststem" in the help for SND_AUDIO_GRAPH_CARD.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Maurycy Zalewski <10maurycy10@gmail.com>
---

diff --git a/sound/soc/generic/Kconfig b/sound/soc/generic/Kconfig
index b6df4e26b..72f3446e1 100644
--- a/sound/soc/generic/Kconfig
+++ b/sound/soc/generic/Kconfig
@@ -16,7 +16,7 @@ config SND_AUDIO_GRAPH_CARD
 	help
 	  This option enables generic simple sound card support
 	  with OF-graph DT bindings.
-	  It also support DPCM of multi CPU single Codec ststem.
+	  It also support DPCM of multi CPU single Codec system.
 
 config SND_AUDIO_GRAPH_CARD2
 	tristate "ASoC Audio Graph sound card2 support"

