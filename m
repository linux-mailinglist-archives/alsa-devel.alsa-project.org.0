Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4889959CB43
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 00:01:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6366F15C1;
	Tue, 23 Aug 2022 00:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6366F15C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661205682;
	bh=Su/U5YgD1gBPrfwGldF53FA1kWxgSHkTZrhMLmvh2a0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CtgmYzGamrma8L0t/Nato8ve9GI2TtnckgqQ6iJ7xLZm4T1f49TsS7+G+UDrDczkq
	 xLkDJyp3v3jEKnv6VET/QmWVNvpmhGNb8Q4vZsE9/vlwk131mrvgzP//YpnOYHpKvF
	 uYhhN7jyyVvtcb70oot2Ao0LirTofE/X+e1GAvXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7D9BF80517;
	Tue, 23 Aug 2022 00:00:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9632AF8026D; Tue, 23 Aug 2022 00:00:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B9A2F80152
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 00:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B9A2F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=flatmax-com.20210112.gappssmtp.com
 header.i=@flatmax-com.20210112.gappssmtp.com header.b="c/WEgMnC"
Received: by mail-pf1-x434.google.com with SMTP id y141so11649522pfb.7
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 15:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flatmax-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=k7QztPNY6f5UPLhFzQe/bCAaGoEOsA+9S8peUjdBlTk=;
 b=c/WEgMnCXQKbLNgvEBP8td0Sx3mSDaOuW5vJixarP5cB4HVOlwXWV7YHZNlHV6wKk1
 qap2wSHRjwj8hGabgU8iqHb7uEBpz7J82eh8P6R8Q1qRSFYIFU8aQh+1WW2j8FwiMA3A
 HQfQDT4JHh7UiHHwrVjOG6IWx19Lv7rlRPKMS3Ua4lKhD8k7mBr5pcCrF7p17wcUTG9U
 W+PsUGz0g8Sj+XTMw6EZr72lPcqggh+SUb1apuwoYAQRl6FQ+hcYt1MN/4QzCsc/B9vI
 SuTwVo2Ev6dG9sTc5hD2uIrrYKMKwf1qnd/Ihd7R5viPBb1A9MVu6SEVEoSw5IygzRXp
 IXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=k7QztPNY6f5UPLhFzQe/bCAaGoEOsA+9S8peUjdBlTk=;
 b=jRr2i1jrpSS2XUl27JpOMaDcUSWfMar89IUgd3FoKs8wWn3BbtMRRiTEXFm850Dk+y
 Nnt2dUy/+eaj7Uef0IjjKrMPJZ4KcgVRRXYWSQJtGEfDuc8FSsDrjsNhiueBCvx5MPsq
 NOgWjilQaA5WCDhULw1ZO/GJVFoZUwOJbqUSntzg5DXV9pEV4KpcdhniUJW7ym71dZD4
 1RLdVtOnZFWpJmZ4fEMZWeezDu0B3cAV5tIBHe7aA3m3b2cFRiy1HKjZODlraeBB6cWA
 30df1ZEkL8Ss39Bn6LW+BpvWHwGlQocC+TbbJIu17/QUZrXVhhZQuYhbg2Gvj6oKve09
 cNkw==
X-Gm-Message-State: ACgBeo2jJX+rkouDJnJ2iwZ0oYkH+Q2OoY9H4A4GbiMAzZLTrTG5SR42
 adm/R8v3b/sVQNk5qaOO4YeGNg==
X-Google-Smtp-Source: AA6agR6duxF3m0MIusH+8dSELwpye5RmZc+z35IyCWoipxGYYNLN70/tfTT/CqoBOD/cFCtjYZ5d9A==
X-Received: by 2002:a05:6a00:2486:b0:536:777b:6a64 with SMTP id
 c6-20020a056a00248600b00536777b6a64mr9649685pfv.65.1661205614943; 
 Mon, 22 Aug 2022 15:00:14 -0700 (PDT)
Received: from ?IPV6:2406:3400:213:70c0:73b4:2cc5:1ada:53cd?
 ([2406:3400:213:70c0:73b4:2cc5:1ada:53cd])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a170902bccc00b0016db7f49cc2sm8817503pls.115.2022.08.22.15.00.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 15:00:14 -0700 (PDT)
Message-ID: <72de09df-5dee-8bd0-5c91-359e4bc36ca8@flatmax.com>
Date: Tue, 23 Aug 2022 08:00:07 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: codes: src4xxx: Avoid clang
 -Wsometimes-uninitialized in src4xxx_hw_params()
Content-Language: en-AU
To: Nathan Chancellor <nathan@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20220822183101.1115095-1-nathan@kernel.org>
From: Matt Flax <flatmax@flatmax.com>
In-Reply-To: <20220822183101.1115095-1-nathan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev,
 "Sudip Mukherjee \(Codethink\)" <sudipm.mukherjee@gmail.com>
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

Hi Nathan,

On 23/8/22 04:31, Nathan Chancellor wrote:
> Clang warns:
>
>    sound/soc/codecs/src4xxx.c:280:3: error: variable 'd' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>                    default:
>                    ^~~~~~~
>    sound/soc/codecs/src4xxx.c:298:59: note: uninitialized use occurs here
>                    ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_11, d);
>                                                                            ^
>    sound/soc/codecs/src4xxx.c:223:20: note: initialize the variable 'd' to silence this warning
>            int val, pj, jd, d;
>                              ^
>                              = 0


If you really want to get rid of these warnings, you can use this 
default for the variables :

pj = 0x0;
jd=0xff;

d = 0xff;

It doesn't really make sense why we would choose to initialise these 
variables, but if you want to silence the preprocessor, then perhaps 
those values. Put a message that defaults are not known nor specified in 
the data sheet and these values are chosen to be unlikely matches of 
real world values - which ensures regmap updates later from an initial 
unknown chip state after refresh. All a bit messy really.


> According to the comment in the default case, other parts of the chip
> are still functional without these values so just return 0 in the
> default case to avoid using these variables uninitialized.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1691
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   sound/soc/codecs/src4xxx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/src4xxx.c b/sound/soc/codecs/src4xxx.c
> index a8f143057b41..cf45caa4bf7f 100644
> --- a/sound/soc/codecs/src4xxx.c
> +++ b/sound/soc/codecs/src4xxx.c
> @@ -283,7 +283,7 @@ static int src4xxx_hw_params(struct snd_pcm_substream *substream,
>   			 */
>   			dev_info(component->dev,
>   				"Couldn't set the RCV PLL as this master clock rate is unknown\n");
> -			break;
> +			return 0;


Don't return here, the rest of the chip is still functional and probably 
in use. Print the dev_info and continue.



