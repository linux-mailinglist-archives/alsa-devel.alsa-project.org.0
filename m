Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5025479DE09
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 04:00:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB25D852;
	Wed, 13 Sep 2023 03:59:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB25D852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694570403;
	bh=GCbLyeplcynYI+Xgbni4vNp37xJwevxhsRtfsFDl5NA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N5pTMJhJedK7vSDbkuLvR5YNvGbW+wR/pv4fv5IaSGE+OXw7Lj3CnoGHu8Ua3R6lw
	 wA7qVB4txrFLOF2s/XjJs7t/BqyahoK/wNXCbDpu5fAFJ9lMs+FaVYxsIUvaSgkOwa
	 hL8Urr1HlXZ+hco/wFOsLrwYKWfH2vt6qGKogEeE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AC44F80537; Wed, 13 Sep 2023 03:59:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCA4DF80246;
	Wed, 13 Sep 2023 03:59:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E628F80425; Wed, 13 Sep 2023 03:59:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD0D3F80212
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 03:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD0D3F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=pN2iDZm/
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-26f4bc74131so344673a91.1
        for <alsa-devel@alsa-project.org>;
 Tue, 12 Sep 2023 18:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694570329; x=1695175129;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWYBlc9fX+NrYYXcR1aoALLzzFrwI8piW2a3vusS9vc=;
        b=pN2iDZm/n/Nj8Etp6GHoMj3K+Jzm87vneVFe8wYnTlcbWkd7G9JDrIetNRp4iMKTuS
         ZaFPiFXQydCnju2hv7zbuDffsXQXfQeRsyO2+I5XiVAeb2ii4XTm3WKzSLSgiu6EWJJM
         L9yLWMd7875dEnQ5G1w2qHQFcI8iYK+hLvdRSsdY07PvhEhcRvj5dH1HvmRfIN9+9Gqp
         w1usKwD0LrjPU0OEY/++3VpYIiuNLt7byA8ZFLshPnw1sHFubq5iM2N2FZkQHdWJrGrq
         InuWtjWKEl/qdhGU+y5/Qgbb6K0wbTT94N3DQ2gMGGYMpVl8ULEICzYboZIQ+lvUFear
         Mwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694570329; x=1695175129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWYBlc9fX+NrYYXcR1aoALLzzFrwI8piW2a3vusS9vc=;
        b=i0BZI4qnoAmvUSZF8XzCAH9KoA6Ahpg5OzVdmX1UE+pjIXVZ7pCgzFUw+dbAiP38ZN
         NVHPV8ZoAcQb/q/xxZgcgWXpioxjCM/uGtzn5O8L6STBMxdxTFeQc8X3Pl2xyp2hHOee
         mtwPu3UyUV97VLQp1ZdUF5HnDz2qyY1VMq2x4fJncJMQrJvZaaaioqR/aSl5Xz16VINI
         3bBWdIgg4TZ1E1hRV/PjevSG55bH2zGH7Sa+lv7qcO+NOTzdjfD96oKGep3+1h7LgdDq
         /sLxgXCQbZwkctXq3/ZpONtdeI1uvN324iFkWX+XfYnZo4nEiK2+FNjaxbm7FZC38fkH
         +3jA==
X-Gm-Message-State: AOJu0YxMler7IBRboaUPQ8Khuj9LbP7qhqGVLT9D6uaLYPhX/ttztntG
	2lZG7Jrct7nYy4BMVqLfgNvkhPQLTsUsRN7EuwY=
X-Google-Smtp-Source: 
 AGHT+IHsPeAEi+Pt7uDHC/LSLO186AhqFY1MS7mJupHG/wYqca31PB6IIXjOpC7ed6FIDlsT7m27Br4CeepGA1g4R9g=
X-Received: by 2002:a17:90a:b790:b0:26b:36a4:feeb with SMTP id
 m16-20020a17090ab79000b0026b36a4feebmr5652532pjr.8.1694570329218; Tue, 12 Sep
 2023 18:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230912063329.2260360-1-chancel.liu@nxp.com>
In-Reply-To: <20230912063329.2260360-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 13 Sep 2023 09:58:37 +0800
Message-ID: 
 <CAA+D8APddGVWXEH7kmAeuwOyd9S-CcbOQcpo8NjeB4YRtU0+gg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-rpmsg: Set ignore_pmdown_time for dai_link
To: Chancel Liu <chancel.liu@nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VWFJQHBXZYTUFMKTXXNXGFCFK5S4EIBF
X-Message-ID-Hash: VWFJQHBXZYTUFMKTXXNXGFCFK5S4EIBF
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VWFJQHBXZYTUFMKTXXNXGFCFK5S4EIBF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Sep 12, 2023 at 2:34=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> i.MX rpmsg sound cards work on codec slave mode. MCLK will be disabled
> by CPU DAI driver in hw_free(). Some codec requires MCLK present at
> power up/down sequence. So need to set ignore_pmdown_time to power down
> codec immediately before MCLK is turned off.
>
> Take WM8962 as an example, if MCLK is disabled before DAPM power down
> playback stream, FIFO error will arise in WM8962 which will have bad
> impact on playback next.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  sound/soc/fsl/imx-rpmsg.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
> index 3c7b95db2eac..d2ecd5e821b1 100644
> --- a/sound/soc/fsl/imx-rpmsg.c
> +++ b/sound/soc/fsl/imx-rpmsg.c
> @@ -89,6 +89,13 @@ static int imx_rpmsg_probe(struct platform_device *pde=
v)
>                             SND_SOC_DAIFMT_NB_NF |
>                             SND_SOC_DAIFMT_CBC_CFC;
>
> +       /* i.MX rpmsg sound cards work on codec slave mode. MCLK will be

Comments for multi line start from empty line with "/* "

Best regards
wang Shengjiu
> +        * disabled by CPU DAI driver in hw_free(). Some codec requires M=
CLK
> +        * present at power up/down sequence. So need to set ignore_pmdow=
n_time
> +        * to power down codec immediately before MCLK is turned off.
> +        */
> +       data->dai.ignore_pmdown_time =3D 1;
> +
>         /* Optional codec node */
>         ret =3D of_parse_phandle_with_fixed_args(np, "audio-codec", 0, 0,=
 &args);
>         if (ret) {
> --
> 2.25.1
>
