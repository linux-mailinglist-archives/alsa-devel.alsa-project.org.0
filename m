Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CA34D7B35
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:05:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D53CD17EB;
	Mon, 14 Mar 2022 08:04:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D53CD17EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241522;
	bh=9Pc+ngnKqJAQ4iQ7cZwc+uE5HW5V+khIiUcnV8aFHHY=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rPwuKEIG0uGisFOoDt+WY77vYjcDKIbYgw11fG4dkWeFVR0k+RP64KIEflPE/NnpA
	 i790GCw/58ewt1IWGGszuockSEqqvXPovdZFEKIaKu8vSbXk2QNp6Ao9oq8ehmFciU
	 16sHs2lUupHCz5fvZy70wfmHMacroiwzMZX5EHsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78120F805A0;
	Mon, 14 Mar 2022 07:59:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08004F801D5; Sat, 12 Mar 2022 13:58:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 863EDF800D2
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 13:58:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 863EDF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pO7UtVED"
Received: by mail-wr1-x42e.google.com with SMTP id r6so16464552wrr.2
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 04:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=SzJcPIpw2JXSwwwvNaXXSXBsRq1AgljXBKYO5oStGHk=;
 b=pO7UtVEDqveP8U1xbSpyJkEwmft9WFMBLT6vqYHN9QjVof9ikVIOopW+wrRwJHdOTr
 LQgBW0ReyV8hSVEtq1/gIPaRY2wYZ9pMin5aLpCyyvfrtxHV0DnsrP1TXBZ05xFVHXPy
 qAtoez1q9BFr645tkh1ban0xu68W1Hgz9RGN06cxo3+k1+H6JrLU5YLJjAQqn9NDKY53
 7DaCqTCQd3qSlzpMAPEaOn6ENZqKLtAdNcPLxHzRkx+DMBSAOv9pvTKc0o4JNTxiu6as
 aHISOPcS0d5YQ1Y9zR+b/FhCWaBz09bsAhhQ8r1dOy5UnmVnspfTwZjDGXEg0dKVlCEk
 z4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=SzJcPIpw2JXSwwwvNaXXSXBsRq1AgljXBKYO5oStGHk=;
 b=MosmMWPfcbSb66VwV/tGwjTcFKqKFYcdZm3/OPMTYOpanVS0Kx6/LGBwee7qgGcHYa
 fplCJbYKGxJKFkgQukkfXAaFkhFL57hIcLpG27fsTd3+br5VV8Z5QSY7GBNq4UHgi5yO
 tc53d2jyCjRAQvDUtLsdigqQgYjZyDc02DQC9iP4e002mBPX1ytgnrjg5ydQzX6xE4mV
 /d+o6WwChk7mFFpMw7X+cHdWPWyx/i1WsXALIWnc0nosp92zC2jj6NmqPgzqdgEq0HgH
 eF5AXq0i7IJCStlW9cBahHcdpIQReuwSFRPjqtD5LyhVHMC2luWXlygIYW3cFQS//bjH
 SPzw==
X-Gm-Message-State: AOAM533wW12ZNZDjghjwxFiRMfSPLuaWbzct96jII9r32jDb9vsLfskn
 DIRQmSw5xz/Q8dFcYM5ip+I=
X-Google-Smtp-Source: ABdhPJz7XDVCI5t5omhSN7nPqlb4ZQ7TTcueBgnQwIDdowh9jKTk3K4TdanVoNJt8Ke7whyyytj+LA==
X-Received: by 2002:adf:e4cb:0:b0:1f0:3429:8386 with SMTP id
 v11-20020adfe4cb000000b001f034298386mr10497856wrm.177.1647089910270; 
 Sat, 12 Mar 2022 04:58:30 -0800 (PST)
Received: from ?IPv6:2001:a61:13b1:c801:ecd8:aa7c:b70:c2cc?
 ([2001:a61:13b1:c801:ecd8:aa7c:b70:c2cc])
 by smtp.gmail.com with ESMTPSA id
 h188-20020a1c21c5000000b00385699a8993sm10531804wmh.11.2022.03.12.04.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Mar 2022 04:58:29 -0800 (PST)
Message-ID: <8f4a088ffc0fc1d4aa14aa1d0adf575cdc94291b.camel@gmail.com>
Subject: Re: [RESEND V2] ASoC: max98390: Add reset gpio control
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Steve Lee <steve.lee.analog@gmail.com>, lgirdwood@gmail.com, 
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com,  geert@linux-m68k.org,
 rf@opensource.wolfsonmicro.com, shumingf@realtek.com, 
 srinivas.kandagatla@linaro.org, krzk@kernel.org, jack.yu@realtek.com, 
 nuno.sa@analog.com, ryans.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org,  alsa-devel@alsa-project.org
Date: Sat, 12 Mar 2022 13:58:27 +0100
In-Reply-To: <20220312002429.16175-1-steve.lee.analog@gmail.com>
References: <20220312002429.16175-1-steve.lee.analog@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:51 +0100
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

On Sat, 2022-03-12 at 09:24 +0900, Steve Lee wrote:
>  Add reset gpio control to support RESET PIN connected to gpio.
> 
> Signed-off-by: Steve Lee <steve.lee.analog@gmail.com>
> ---
>  sound/soc/codecs/max98390.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/sound/soc/codecs/max98390.c
> b/sound/soc/codecs/max98390.c
> index 40fd6f363f35..9a9299e5cc5a 100644
> --- a/sound/soc/codecs/max98390.c
> +++ b/sound/soc/codecs/max98390.c
> @@ -1022,6 +1022,7 @@ static int max98390_i2c_probe(struct i2c_client
> *i2c,
>  
>         struct max98390_priv *max98390 = NULL;
>         struct i2c_adapter *adapter = i2c->adapter;
> +       struct gpio_desc *reset_gpio;
>  
>         ret = i2c_check_functionality(adapter,
>                 I2C_FUNC_SMBUS_BYTE
> @@ -1073,6 +1074,17 @@ static int max98390_i2c_probe(struct
> i2c_client *i2c,
>                 return ret;
>         }
>  
> +       reset_gpio = devm_gpiod_get_optional(&i2c->dev,
> +                                            "maxim,reset-gpios",
> GPIOD_OUT_LOW);

A reset GPIO is a standard property so there's no need for a vendor
prefix. This should be devm_gpiod_get_optional(&i2c->dev, "reset",
...). And, as said before, you need to add a reset-gpios property to
the bindings in a different patch.

I'm also not sure why you have this as RESEND...

- Nuno Sá
> 

