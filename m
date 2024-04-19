Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 228048AA818
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 07:53:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34D42B65;
	Fri, 19 Apr 2024 07:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34D42B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713506015;
	bh=DDv5h5HCNwIchwKdYozppsYyGKsrmtNPVNB+kld7Csk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B5cjNOtpOnkehW4jOofyW2zYpMGgji5CoaKUnxRA37hA7L7NYQdpcPJoqQzI7mKqI
	 A89t3D67Xcajtrb2dLLhae/z42AVSYzvJfpjquAkLPPhx29/4VU02iQ4BtTITwceZX
	 F05rG90hylrKG/zTkc1JVnccLeWlyVSt8KKq9Dw4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9837F8057D; Fri, 19 Apr 2024 07:53:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70D52F8059F;
	Fri, 19 Apr 2024 07:53:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10C77F8025A; Fri, 19 Apr 2024 07:48:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D185FF801C0
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 07:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D185FF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kali.org header.i=@kali.org header.a=rsa-sha256
 header.s=google header.b=Ve68/ZsF
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56e47843cc7so1489205a12.0
        for <alsa-devel@alsa-project.org>;
 Thu, 18 Apr 2024 22:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1713505622; x=1714110422;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqAAIaynXWTmCZkKAS87XgyHGXeDGz4/5vtU3XxRi9k=;
        b=Ve68/ZsFJF1Ad9gh59QAhzDGUuUEbzG5o4AL27VoHSQqll34NQblvehwyhbWTcpnK3
         EaDdptIyOLIaEvPF9j32xWAzSJU/FzbND9p98APqQ/cSppGFpPGEnEXC/HnnuFgKjvou
         9f3zbjTYl2j2RwN2sdXcj5SAZs3CBv1eT3V2lfOaxXLOKS87+cACpdgvbnsth8dC/WRL
         8U9kr+M/J0xOR7CPDAdd5jw4jh21HBUIZiE7M7yQiV/n35+Spw7De04A2bEztj6nKRG1
         KcPrHRio3j9nGGf9r2r5T3ia0rdbGJBEUBIBhi+TBUztIJPLXvaJ4awBdAz233X+1lfh
         sI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713505622; x=1714110422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oqAAIaynXWTmCZkKAS87XgyHGXeDGz4/5vtU3XxRi9k=;
        b=mQWPKYL+olehdQCWvv0sGGhoJkWQIwA7iJ48jU75ar7W5zTQuR3P2tgBZs83Ti31Cw
         NGBjg6aEFN3vddNZQkxDqzyQfHTJfQPlfdQiKkuEnSYgiID/MOtbqFpruXxElPs4fN4A
         3Gvld9rBbWPHrCETAqOhmAZxdmvEwaly/DJgVekT1aGYXZ11F9BDTKYQZLOsgV1Dq1ch
         7FT7ngGeMD2E5hz/rI1G1ffB24VzejmcT1PX3ZugT0/1DyuqCjnTpEiPb8L0ZbnOKMQx
         f2iqWcfMajX3Un9CaSEjoO7GwHA/ly20KOBNQJavZoXytZXgMD8ibwP3QOE5x/UNVmKs
         YpJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrpR7VkT1mA80ZkVBrBWb6rHfinxmK8IVsJhHUSfLVhuX5wiCiooAG4Scl8z5DjRoiu0Mmd/px1yFjI0FgwJRpqALJOzvvE1ATW18=
X-Gm-Message-State: AOJu0Yw0gIq83VCd/MJ/H0VJTzOE4Q4Vfe09psczjVacVwi1txeG9d43
	RO1gJ3DIBJCtKr9W0cQIZ/ony2ijnMdofeQX8CQKjzjY6TRGltJlYFcZjot2lmZsptG0GouLi3M
	I9EkHpvCn0duvgnZwkfBBQFSrpdyQCnUOtHkRZg==
X-Google-Smtp-Source: 
 AGHT+IHHAfaZ1NZrYxHPy6GwaV4DPbUEBeZyilIDmUO+m3CqYQiH43kN2ZxvrBVG3Ivt8+6yminJOjlWWA8AYfUwV+c=
X-Received: by 2002:a50:c31c:0:b0:56c:2ef7:f3e6 with SMTP id
 a28-20020a50c31c000000b0056c2ef7f3e6mr748584edb.0.1713505621565; Thu, 18 Apr
 2024 22:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240413064225.39643-1-jenneron@postmarketos.org>
 <20240413064225.39643-2-jenneron@postmarketos.org>
 <3b245ae8-31ee-4576-a123-0dc3aba4ce10@linaro.org>
In-Reply-To: <3b245ae8-31ee-4576-a123-0dc3aba4ce10@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Fri, 19 Apr 2024 00:46:50 -0500
Message-ID: 
 <CAKXuJqhQssxfTQ+6Bf2JbHjX3f6k4whB1j-G189SNXmkTyvdQw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] soundwire: qcom: disable stop clock on 1.3.0 and
 below
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Anton Bambura <jenneron@postmarketos.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: UALEWDU4NKQLNPW3CY2AAJZRED4WFL4L
X-Message-ID-Hash: UALEWDU4NKQLNPW3CY2AAJZRED4WFL4L
X-MailFrom: steev@kali.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UALEWDU4NKQLNPW3CY2AAJZRED4WFL4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Srini,

On Wed, Apr 17, 2024 at 6:43=E2=80=AFAM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> This is not the right fix, this can be determined from codec
> clk_stop_mode1 flag.
>
> can you try this patch:
>
> ----------------------------->cut<-----------------------------
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Date: Wed, 17 Apr 2024 12:38:49 +0100
> Subject: [PATCH] ASoC: codecs: wsa881x: set clk_stop_mode1 flag
>
> WSA881x codecs do not retain the state while clock is stopped, so mark
> this with clk_stop_mode1 flag.
>
> Fixes: a0aab9e1404a ("ASoC: codecs: add wsa881x amplifier support")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   sound/soc/codecs/wsa881x.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
> index 3c025dabaf7a..1253695bebd8 100644
> --- a/sound/soc/codecs/wsa881x.c
> +++ b/sound/soc/codecs/wsa881x.c
> @@ -1155,6 +1155,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
>         pdev->prop.sink_ports =3D GENMASK(WSA881X_MAX_SWR_PORTS, 0);
>         pdev->prop.sink_dpn_prop =3D wsa_sink_dpn_prop;
>         pdev->prop.scp_int1_mask =3D SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT=
1_PARITY;
> +       pdev->prop.clk_stop_mode1 =3D true;
>         gpiod_direction_output(wsa881x->sd_n, !wsa881x->sd_n_val);
>
>         wsa881x->regmap =3D devm_regmap_init_sdw(pdev, &wsa881x_regmap_co=
nfig);
> --
> 2.21.0
> ----------------------------->cut<-----------------------------
>
>
> thanks,
> Srini
>
> >               if (!found) {
> >                       qcom_swrm_set_slave_dev_num(bus, NULL, i);
> >                       sdw_slave_add(bus, &id, NULL);
>

I tested it here on my c630 and can confirm that your patch does fix
the audio as well.
