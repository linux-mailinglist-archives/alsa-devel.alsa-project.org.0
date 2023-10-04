Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9EB7B7FCC
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 14:52:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 335A1829;
	Wed,  4 Oct 2023 14:51:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 335A1829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696423943;
	bh=c6QQXA+7W0GahabdLoea8Fnreawlp87nM3kQgCGLyjA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aLRRKh+XsVnRS/iYh1+dNjElrh0gqRSpreGlXP+qCzdNzae9Cjdwr1PJiJjRogwfk
	 moe1F6pDjMUqKa3Gsv23UdnIYeBZokXzXOXdd0LlajbRFTGz1e/0yedOYcqo2Skukh
	 krnefw5MF5kWDaTdBOdvQZ7d7iklQtENe7EtW58Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D783F80310; Wed,  4 Oct 2023 14:51:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2838F80310;
	Wed,  4 Oct 2023 14:51:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BE3EF8047D; Wed,  4 Oct 2023 14:50:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 275B8F80166
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 14:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 275B8F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ARsR3eBe
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3af5fda8f6fso1367576b6e.3
        for <alsa-devel@alsa-project.org>;
 Wed, 04 Oct 2023 05:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696423849; x=1697028649;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JJDQBnBL5OpSHnZeFWSOHsKz7Vu0XjLjDoRLw0uoAM=;
        b=ARsR3eBe5JJwB7vLK0G1PkzB1p2TFsygCgSqJQBmeKijiL7XgF48belc1DiIHvQDmj
         XiZZddhiWzzWKzJ5bFH5kmWWAWBRPuNzxLNsrmfoivFkXBjzYGg/9Vkl1DYYUbM3zLg1
         YA1pw4a3WeFHSTaICso9rwg1QEQDYCDrmoR2We9WK9gA3UG/XYfo3Zz6XdkZuLT8OPV+
         UgNmAtcMH22tHLyhVpsW1wnPvq0T0jPEd4e86jluVFZGecos2yzsqV51+wwN5g60GYNX
         1tSbS/EZq9274v9rdLSspE7pk+or7+LpTCNr3RspTr9InNoIptyaH7D11psm9ryJpEdj
         +6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696423849; x=1697028649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JJDQBnBL5OpSHnZeFWSOHsKz7Vu0XjLjDoRLw0uoAM=;
        b=C2bBgkMNAqAFr5J5p1brlv9dZc3ZJdaf2tTA0Cq+lhQmB/CkKhD8/+tiRY+lK39bvR
         u7B4Pey6r/g8myazQqWb3WKYongAlJUKCGrexBmrqH+P7PF5XTu8MRen4hvhB6M2Mi5e
         DdkfpV1pE1bovhM/lAD6th/txM9KX9geeJj57RECsAI3yPRht+Lk79BOIZA/LuyzcwZR
         pmz2fHKTNtrjqUIW5x+USWVPrMuOLs4k0gAFLgNOdD5FuU6FMXfpcjMojYOQhdQx7U16
         272zpuQDLQTD8cZxGG1Aut5KfdOhw4AX2ruF3DLRbjgO9U1bQtZbYTL+L2/0glxtP1ld
         Znkw==
X-Gm-Message-State: AOJu0YwIK66VBRbse3EWlB+M2tY9KFegRzz4EqiQ5KHgDdP0eSgxuYbu
	gCt1qtLTqo0viegXFuMGRmYTdGCmF3Cv0ZtbePs=
X-Google-Smtp-Source: 
 AGHT+IFP2VHVG8ZZhl48jAMzQt9MI4WSt35NkKpkfiQ7hhc4V4Gf4yGHxHUIi3UsX+H72PGVDWgCdmXe+EnAB8G+0dU=
X-Received: by 2002:a05:6358:e49d:b0:133:a8e:6feb with SMTP id
 by29-20020a056358e49d00b001330a8e6febmr2061553rwb.12.1696423848474; Wed, 04
 Oct 2023 05:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231004122935.2250889-1-festevam@gmail.com>
In-Reply-To: <20231004122935.2250889-1-festevam@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 4 Oct 2023 07:50:37 -0500
Message-ID: 
 <CAHCN7xK=2RcJX4GhKOOD=AsTHP810Ndd3-zF-Dkg781ApzG_QQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: fsl,micfil: Document #sound-dai-cells
To: Fabio Estevam <festevam@gmail.com>
Cc: broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, shengjiu.wang@nxp.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: OPORXIUDVQEL6YTT362OVWR3RT2CAIS6
X-Message-ID-Hash: OPORXIUDVQEL6YTT362OVWR3RT2CAIS6
X-MailFrom: aford173@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OPORXIUDVQEL6YTT362OVWR3RT2CAIS6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Oct 4, 2023 at 7:30=E2=80=AFAM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> imx8mp.dtsi passes #sound-dai-cells =3D <0> in the micfil node.
>
> Document #sound-dai-cells to fix the following schema warning:
>
> audio-controller@30ca0000: '#sound-dai-cells' does not match any of the r=
egexes: 'pinctrl-[0-9]+'
> from schema $id: http://devicetree.org/schemas/sound/fsl,micfil.yaml#
>
Should we add a fixes tag, so it gets back-ported to stable branches?
It seems like patch 02d91fe47100 ("ASoC: dt-bindings: fsl,micfil:
Convert format to json-schema") may be appropriate.

> Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Adam Ford <aford173@gmail.com>

> ---
>  Documentation/devicetree/bindings/sound/fsl,micfil.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml b/Do=
cumentation/devicetree/bindings/sound/fsl,micfil.yaml
> index 4b99a18c79a0..b7e605835639 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> @@ -56,6 +56,9 @@ properties:
>        - const: clkext3
>      minItems: 2
>
> +  "#sound-dai-cells":
> +    const: 0
> +
>  required:
>    - compatible
>    - reg
> --
> 2.34.1
>
