Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBD0629C00
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 15:24:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ED76E11;
	Tue, 15 Nov 2022 15:24:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ED76E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668522291;
	bh=P5WdhA2QQhaM/ksmRjFkTat2kGJkn3+1H3T4X/UZ9ws=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nrgun0MKdNe2A2JzUccPsPHzovijhMG6uaxuhRPvfZa3iakdx0dOa/8qKiLz42V3T
	 ye9vOp9p+yorbcQBq4kAhVIlQZb3CWPq6iMchhTPW5UXG1WTjf9f93kRB0qMBC9PiK
	 DnKCAz6p09YrhtcavGXj0Wgsxb/SJPvLHCMhn1pA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36535F8047C;
	Tue, 15 Nov 2022 15:23:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10400F800AA; Tue, 15 Nov 2022 15:23:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F0E0F800AA
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 15:23:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F0E0F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="bZ236k1s"
Received: by mail-lj1-x22d.google.com with SMTP id u11so17653714ljk.6
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 06:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZpL11cNJx2l9z+r6z/7+POcZMvt9C9FRB9mdY/4v0yc=;
 b=bZ236k1sR9rLsZmH2QLK/jWvz5w55IXdkp1pkw0jB+lj12y+GkMBVdGMjPGLfWYzsr
 YQW6QNgFrUiSbt/oUHQCSZmwJKKsqjPJcU64+Wa+4cdvHGHHrs8bn9fE/rc/IiiWE09C
 CqzZJs9Qupqm1iwIFBn5QIEY3lk/bvNvSa7pe1/KKB5k1Rrel4F1heY792b7gvbdtBs9
 voXHqYupPmcnCRRIsCh1ZTraRuj0JJoYO8iWcZrGkggQ+73mmrEWUR0p7jVs020G2zS4
 h8U3kw1yPFda0FtmhaeLa9wg+0pZg7PZ4AbxOPpCGlALEU0GGq/Bo6EE2h3b/ADt4s8g
 jyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZpL11cNJx2l9z+r6z/7+POcZMvt9C9FRB9mdY/4v0yc=;
 b=hRpXeFjNfeWlRbdGWgafg73FPLSEc04apAFJ9jDTMOivrXa9l5z3sn+OWOXjOyrcfE
 VMQKM0AQ/eLJP07W53M7QpepmiU/hQKttOwi8XKOJHIi9rDWvz8VbNMOaHED8ERhMvvB
 57l0rJfpOM6V00JTK/woOJROgkUENjOdLYlGHBfFo0VxOxmzKWVbcyTGQcLs4pLwZZVw
 +4S7G/EJ3kkKwN+07b4WRjSFxYEI72sqaIsWdZKIWD6Pr8CvoEXrEnNRNFHy28FPfaW/
 pLxJV+pqe2itExnrdweGpTFIQcMpBa3OCrcETHvaqC7p4E0kgLgXyj4gK1bj2H+CdPcM
 VgGQ==
X-Gm-Message-State: ANoB5pnctH2i6pAw3i8wZ1io4xmWqE4vIhXs4YJUsRxwpMyEGvja+UAi
 NAH1ItzywKwf8lKBzivuCX6qUg==
X-Google-Smtp-Source: AA0mqf5cGkz19RcK9Ps9BvdlLxu3x3Y78oitxCK1++IR4SM4ClgTCHxDYPY+NRbRPH/u/b+2Yx+vpw==
X-Received: by 2002:a2e:8184:0:b0:277:139d:78d2 with SMTP id
 e4-20020a2e8184000000b00277139d78d2mr5619258ljg.22.1668522231137; 
 Tue, 15 Nov 2022 06:23:51 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 a17-20020ac25e71000000b0049aa20af00fsm2221593lfr.21.2022.11.15.06.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 06:23:50 -0800 (PST)
Message-ID: <090831eb-2c7a-56c2-601e-e910431a9403@linaro.org>
Date: Tue, 15 Nov 2022 15:23:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] ASoC: codecs: va-macro: add npl clk
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20221115105541.16322-1-srinivas.kandagatla@linaro.org>
 <20221115105541.16322-3-srinivas.kandagatla@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115105541.16322-3-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
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

On 15/11/2022 11:55, Srinivas Kandagatla wrote:
> New versions of VA Macro has soundwire integrated, so handle the soundwire npl
> clock correctly in the codec driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/lpass-va-macro.c | 41 +++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index b0b6cf29cba3..d59af6d69c34 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -205,6 +205,7 @@ struct va_macro {
>  	int dec_mode[VA_MACRO_NUM_DECIMATORS];
>  	struct regmap *regmap;
>  	struct clk *mclk;
> +	struct clk *npl;
>  	struct clk *macro;
>  	struct clk *dcodec;
>  	struct clk *fsgen;
> @@ -1332,6 +1333,9 @@ static int fsgen_gate_enable(struct clk_hw *hw)
>  	struct regmap *regmap = va->regmap;
>  	int ret;
>  
> +	if (va->has_swr_master)
> +		clk_prepare_enable(va->mclk);

No error path?

> +
>  	ret = va_macro_mclk_enable(va, true);
>  	if (!va->has_swr_master)
>  		return ret;
> @@ -1358,6 +1362,8 @@ static void fsgen_gate_disable(struct clk_hw *hw)
>  			   CDC_VA_SWR_CLK_EN_MASK, 0x0);
>  
>  	va_macro_mclk_enable(va, false);
> +	if (va->has_swr_master)
> +		clk_disable_unprepare(va->mclk);
>  }
>  
>  static int fsgen_gate_is_enabled(struct clk_hw *hw)
> @@ -1386,6 +1392,9 @@ static int va_macro_register_fsgen_output(struct va_macro *va)
>  	struct clk_init_data init;
>  	int ret;
>  
> +	if (va->has_swr_master)
> +		parent = va->npl;
> +
>  	parent_clk_name = __clk_get_name(parent);
>  
>  	of_property_read_string(np, "clock-output-names", &clk_name);
> @@ -1512,6 +1521,14 @@ static int va_macro_probe(struct platform_device *pdev)
>  	/* mclk rate */
>  	clk_set_rate(va->mclk, 2 * VA_MACRO_MCLK_FREQ);
>  
> +	if (va->has_swr_master) {
> +		va->npl = devm_clk_get(dev, "npl");

I think you miss:
ret = PTR_ERR(va->npl);

> +		if (IS_ERR(va->npl))
> +			goto err;
> +
> +		clk_set_rate(va->npl, 2 * VA_MACRO_MCLK_FREQ);
> +	}
> +
>  	ret = clk_prepare_enable(va->macro);
>  	if (ret)
>  		goto err;

Best regards,
Krzysztof

