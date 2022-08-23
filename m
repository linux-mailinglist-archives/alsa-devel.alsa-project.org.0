Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8523459EE80
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 23:54:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E51F7AEA;
	Tue, 23 Aug 2022 23:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E51F7AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661291670;
	bh=p2hdPaD1Q7knbwjzPFx69d3HwO2H/zwBYj80slAGk44=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iaQ3faLj4P4agjH7VvztPzKlRjQXEN8L4f3BAoWTaqH2QBzaBJTPrEukDBi60aJ7t
	 Km7uQqLn7Dtfy28zW82EA2b3ZhDDfes194l30VpTEwWWfUoXxKTj6El/rSk4H3Ck3d
	 7aJSOizwH1K5qfRFUDIg6t3Wmynl/pSn+xYCK2vE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DF93F8027B;
	Tue, 23 Aug 2022 23:53:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7178F800C9; Tue, 23 Aug 2022 23:53:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F746F800C9
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 23:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F746F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=flatmax-com.20210112.gappssmtp.com
 header.i=@flatmax-com.20210112.gappssmtp.com header.b="obG8zpTD"
Received: by mail-pf1-x433.google.com with SMTP id z187so14678351pfb.12
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 14:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flatmax-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=FnXtIAn0IyAxdQUTX7XZR7kL9caPa6K/jTtIbR9ZQeI=;
 b=obG8zpTD+VGj/DhquSB91/B1nOh31Mf4zX+mS3y0p5WZzXTnSJmE6BQmTBA4htk1bt
 XRB+svL4DsVm3OkT5aF7hEmIk/4ALS2HX0O2/ztMnxBw49FnjkWu9FdCfnqi7jQqRU+d
 93bGDbVwtR9FlSajQpZw/u8rSYDVTNqP80KtM3yeeIfToDmxuUv9olyyqcQDpDJeWSGi
 Se31wC8WzlmZeIawaNAM86zcgRAoNetc+63r/+hXDvOEqTgzpIkonR8X/m6Zh4Os6+eX
 wJIR+cK/L+K6oi+d5tFd8eKuKOA39x2u5gtPHF2/ignKoLU990mH7UniqFXIep+6DPUG
 I9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=FnXtIAn0IyAxdQUTX7XZR7kL9caPa6K/jTtIbR9ZQeI=;
 b=IgnU3PnTYydJ7auDNMK/+VSIR7bVJk4xzMbxr1l6HCp/gGX/OzooI7ek54lAHtSJ+V
 X2GkeqfCNmQRiPu+JXTrFzJ3hClA5o7DLyk8MoSGVkgNoxRXv/7CtQ71CNFG1Gy7yCTk
 QpPFblXuLv4goVvWtpc1YvJtSsqW9XophA7D8G8KYYjMjvFgH/Pog7E+/1RdTC/1Vht3
 VErUpTHXIs7xcyKrfLrl6WGp39dvJnd1A04okUgcrJsCmhkABAbcWk9dXFBPVt4aa4KH
 DpXLG1sxUAJYxqngbk36mkfdtJ3XN7N8u5AnMRX8zjRGzs9iw5KZJ8ac446usgYKAya2
 E1Ew==
X-Gm-Message-State: ACgBeo3SoADVJIBrpBUsKWbBeWRFiPoHRP2Rcg0/hJ35JeBsYr6NhNDx
 /k88ZfP9ctm6LJH2wPQ+BEcDLA==
X-Google-Smtp-Source: AA6agR5ZlhUCW0kK8H4ShGD2wDJdvUWRcHbYtHdfzqHhFuCrXOYakw0jq4ZSaTBUiLOaY8O66jszSA==
X-Received: by 2002:aa7:9e4b:0:b0:536:68f0:dc93 with SMTP id
 z11-20020aa79e4b000000b0053668f0dc93mr15058614pfq.8.1661291599070; 
 Tue, 23 Aug 2022 14:53:19 -0700 (PDT)
Received: from ?IPV6:2406:3400:213:70c0:5c76:4280:5b6b:9ce0?
 ([2406:3400:213:70c0:5c76:4280:5b6b:9ce0])
 by smtp.gmail.com with ESMTPSA id
 f76-20020a62384f000000b0052f20d70845sm11232126pfa.150.2022.08.23.14.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 14:53:18 -0700 (PDT)
Message-ID: <95641765-17a4-79aa-1ce3-9cd760ed41f4@flatmax.com>
Date: Wed, 24 Aug 2022 07:53:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ASoC: codes: src4xxx: Avoid clang
 -Wsometimes-uninitialized in src4xxx_hw_params()
Content-Language: en-AU
To: Nathan Chancellor <nathan@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20220823151939.2493697-1-nathan@kernel.org>
From: Matt Flax <flatmax@flatmax.com>
In-Reply-To: <20220823151939.2493697-1-nathan@kernel.org>
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

This looks good.

Reviewed-by: Matt Flax <flatmax@flatmax.com>

On 24/8/22 01:19, Nathan Chancellor wrote:
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
>    sound/soc/codecs/src4xxx.c:280:3: error: variable 'jd' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>                    default:
>                    ^~~~~~~
>    sound/soc/codecs/src4xxx.c:293:59: note: uninitialized use occurs here
>                    ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_10, jd);
>                                                                            ^~
>    sound/soc/codecs/src4xxx.c:223:17: note: initialize the variable 'jd' to silence this warning
>            int val, pj, jd, d;
>                          ^
>                            = 0
>    sound/soc/codecs/src4xxx.c:280:3: error: variable 'pj' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>                    default:
>                    ^~~~~~~
>    sound/soc/codecs/src4xxx.c:288:59: note: uninitialized use occurs here
>                    ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_0F, pj);
>                                                                            ^~
>    sound/soc/codecs/src4xxx.c:223:13: note: initialize the variable 'pj' to silence this warning
>            int val, pj, jd, d;
>                      ^
>                        = 0
>    3 errors generated.
>
> The datasheet does not have any default values for these regmap values
> so pick some arbitrary values and print to the user that this is the
> case to silence the warnings.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1691
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
> Suggested-by: Matt Flax <flatmax@flatmax.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>
> v1 -> v2: https://lore.kernel.org/20220822183101.1115095-1-nathan@kernel.org/
>
> * Don't return early, just initialize the values to some arbitrary
>    numbers and try to hobble along, as other parts of the chip may be
>    functional.
>
> * Add message and comment to describe this situation.
>
>   sound/soc/codecs/src4xxx.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/src4xxx.c b/sound/soc/codecs/src4xxx.c
> index a8f143057b41..db4e280dd055 100644
> --- a/sound/soc/codecs/src4xxx.c
> +++ b/sound/soc/codecs/src4xxx.c
> @@ -280,9 +280,14 @@ static int src4xxx_hw_params(struct snd_pcm_substream *substream,
>   		default:
>   			/* don't error out here,
>   			 * other parts of the chip are still functional
> +			 * Dummy initialize variables to avoid
> +			 * -Wsometimes-uninitialized from clang.
>   			 */
>   			dev_info(component->dev,
> -				"Couldn't set the RCV PLL as this master clock rate is unknown\n");
> +				"Couldn't set the RCV PLL as this master clock rate is unknown. Chosen regmap values may not match real world values.\n");
> +			pj = 0x0;
> +			jd = 0xff;
> +			d = 0xff;
>   			break;
>   		}
>   		ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_0F, pj);
>
> base-commit: 94f072748337424c9cf92cd018532a34db3a5516
