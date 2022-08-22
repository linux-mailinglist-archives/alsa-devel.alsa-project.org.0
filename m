Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFAB59BCD9
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 11:30:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 662D415C3;
	Mon, 22 Aug 2022 11:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 662D415C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661160601;
	bh=HD0NCw+PTUxtrC3ae7ZLk2UJbVP7J4UBj9jhBp05QnI=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LJ/U3Qyx+0Dm2KURfFmi3VlFRiwKQ0zLtdIqIrJBrzi5Pegk5/yJAPPp6HJBJEWtm
	 R+500AIe9n6r/WacF7+OBtth2VuPTmFwaNM6AE6BB8i3ujia4fz2SlOqD7YyIyEqj4
	 9rFERTtLsZpOkUhXuj/AXopdvB7BPoq96gSHQ/Ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA430F8026D;
	Mon, 22 Aug 2022 11:29:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BEA2F8026A; Mon, 22 Aug 2022 11:28:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F39FDF800A7
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 11:28:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F39FDF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PpCeVcqM"
Received: by mail-wr1-x42e.google.com with SMTP id bs25so12424016wrb.2
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc; bh=LZiPZabk8uBgJRKOzhDJ2uC93G1aMkxBm+1//LLMvqw=;
 b=PpCeVcqMgILqQyzKcfm/hYQMiH5rJcmQtUa6hRVk7gORFWsMAM2eLp32v6iNcRPARn
 fsAkKZTs/7l5zKLu7ltMs1T/BZ5ZGFymB0XPU4Q+y0zBKGi1q/LoFDldlYrZL354K48/
 dTTuZPFwEoyiKuzStbwLcyQNTCvZUnIqnURkyotQO+xz5KeNVbRlCh9y0xRh6hqHpjyB
 R7VIFpAB70knHoCKjMHifSF9vovtTz7LBvXMpB4Djr0JBm98LGaAKUowFbNo7hMrzkWd
 l/bu3mEzm8qZoFWvCwQNw+SLYbKSyK0IyaIvnVsq0KYqo9jPcubYL8FXUg8GJieNuJvm
 NzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=LZiPZabk8uBgJRKOzhDJ2uC93G1aMkxBm+1//LLMvqw=;
 b=tOjBN91VBswnc1Qs9Ooq8rjQAbaQsgKnpKlwRWTgXLd03xngGa2+obXYmuwTij6jfR
 M2dwu5tbkVV5R6bLN2Rei9YRcqqs6V0uhUbdfbJzk3pMMPOLFAxasiGVC6rDQxqtsUtA
 Ff7UW6JC/xpeaoLTpXCKhkdBt5P5eVVBPwSePAselqk9kMyogY2ueVJXjjS64/ACt/x3
 8ExybC7HsKogmb8rd63+PMJI8Ya1GbSl4YaQ0YcHa5JWsT9vV1L0LLj6iSFvFnqs0QhK
 Gi+z+awbZ8BQ5AM6IWvNrsuGEJPQmv+G6IrQ8IK32tysIa0PdZgOt1xfwe4B1vCfUE5S
 2LzQ==
X-Gm-Message-State: ACgBeo0RPabTECstKNQi9u9tsxe6wut9JRxuPpOe0HRV4SrulMXWeO/2
 T7PAJV/bqIl20j6HgrAFV1g=
X-Google-Smtp-Source: AA6agR5TCN6tBlMC5N0TVpsdW5/8135kWB6j/OBUdEV/Us8d0j9b322vyx644RgsF8mNnzeqLXBAVA==
X-Received: by 2002:a05:6000:1acf:b0:222:cff7:3b6c with SMTP id
 i15-20020a0560001acf00b00222cff73b6cmr10285263wry.191.1661160532519; 
 Mon, 22 Aug 2022 02:28:52 -0700 (PDT)
Received: from debian ([167.98.27.226]) by smtp.gmail.com with ESMTPSA id
 i21-20020a05600c355500b003a5ee64cc98sm19491518wmq.33.2022.08.22.02.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 02:28:51 -0700 (PDT)
Date: Mon, 22 Aug 2022 10:28:50 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Matt Flax <flatmax@flatmax.com>, Mark Brown <broonie@kernel.org>
Subject: build failure of next-20220822 due to 4e6bedd3c396 ("ASoC: codecs:
 add support for the TI SRC4392 codec")
Message-ID: <YwNMUlAmu/qCjuva@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 clang-built-linux <llvm@lists.linux.dev>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Nathan Chancellor <nathan@kernel.org>,
 linux-next@vger.kernel.org
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

Hi All,

Not sure if it has been reported, builds of arm64 with clang failed to
build next-20220822 with the error:

sound/soc/codecs/src4xxx.c:280:3: error: variable 'd' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
                default:
                ^~~~~~~
sound/soc/codecs/src4xxx.c:298:59: note: uninitialized use occurs here
                ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_11, d);
                                                                        ^
sound/soc/codecs/src4xxx.c:223:20: note: initialize the variable 'd' to silence this warning
        int val, pj, jd, d;
                          ^
                           = 0
sound/soc/codecs/src4xxx.c:280:3: error: variable 'jd' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
                default:
                ^~~~~~~
sound/soc/codecs/src4xxx.c:293:59: note: uninitialized use occurs here
                ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_10, jd);
                                                                        ^~
sound/soc/codecs/src4xxx.c:223:17: note: initialize the variable 'jd' to silence this warning
        int val, pj, jd, d;
                       ^
                        = 0
sound/soc/codecs/src4xxx.c:280:3: error: variable 'pj' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
                default:
                ^~~~~~~
sound/soc/codecs/src4xxx.c:288:59: note: uninitialized use occurs here
                ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_0F, pj);
                                                                        ^~
sound/soc/codecs/src4xxx.c:223:13: note: initialize the variable 'pj' to silence this warning
        int val, pj, jd, d;
                   ^
                    = 0
3 errors generated.

git bisect pointed to 4e6bedd3c396 ("ASoC: codecs: add support for the TI SRC4392 codec").

I will be happy to test any patch or provide any extra log if needed.


--
Regards
Sudip
