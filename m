Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA29779E0D4
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 09:28:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05947A4A;
	Wed, 13 Sep 2023 09:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05947A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694590095;
	bh=kdgtIxC8l4hgNL1H4TcWeKbPhLBN88BmmdJGGOilwXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JQJhb+bV3iYKGTj3fW+XWqOoBUPLQoXiX0lkV1MjrSSkuZZ5beahQZMZW9RJir4eR
	 fg9COkUwu4STxcdp7MjckCqknWXUy/mqA7MgH8zWoGHefdgh5UpjShs9k3lrjjEwKJ
	 +eCn4/X3XcqNEW1nCHhuw9P2dK3MDAwxMdWGKTgs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC611F80549; Wed, 13 Sep 2023 09:27:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7632F80558;
	Wed, 13 Sep 2023 09:27:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8ADD4F8055A; Wed, 13 Sep 2023 09:27:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 253A5F80549
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 09:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 253A5F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=XwKMXQLS
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1bf11b1c7d0so4872715ad.0
        for <alsa-devel@alsa-project.org>;
 Wed, 13 Sep 2023 00:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694590033; x=1695194833;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/U+Y3lXkYu7caCIkdd3um0u2yWGnImH6AF8GWuY2Sng=;
        b=XwKMXQLSLE/V7TI/xZukZEI1gWIhIOq1gZjQIiBMeWMYy7F0QXX8pg7dmoATH9ysPE
         09uAS3xMNGLp3qUOXGx+1BjwmKTKOiHDjslcRzChd7f0NotHAXaPlKYrM7O4whvrphzs
         usrvi39C/fUx1UJYxjHS3aiuLLqK8QJ8zY+8EfQawtkJdYVLkqy1AbFJYZW3fCTjbxcs
         EK514d6V9l3PosrHQl/riuGyeNYxKXN+aQITnrY2trEk2R6Nkt4N3Xza9tsyCMujdApX
         ZgfquB4boZS0f3enp1TSRDc2YmAHY4WGFw7ldS6Kj4kcSH7C8q6EImcE3gp3r2PoUu8L
         4oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694590033; x=1695194833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/U+Y3lXkYu7caCIkdd3um0u2yWGnImH6AF8GWuY2Sng=;
        b=cNCOCDDk60JTFHuCVDMM8pHKJiq5JY6LXXx0GJCuaWR6vowLpqLGlGdq63f6RER7Pf
         EG5wPg2XFjJVjTkf+29eRrTBIwbdQd4MCgPrDFYXNQdkv+H4Drxq9BG7nRyHybPyrnlD
         92diKESJEHorh6x8ytmEjAzTIvARd/r2J++2UurwLswgqSlNl+g3+JIqWfntrPTHhJn8
         Y5tiGgnPpDFsgsE5M9QzzpVYj42LYq1axZ3oNuTNshaDwkezdPuFQDNQvc1rmMQdv2tc
         195csMU3TlfcIoRPXSuv50j12JVsPTKDu+j+ykAD+T08Aibfm2d7Do9bnfjtZRRhzHur
         wNGg==
X-Gm-Message-State: AOJu0YwHfHmtOZilzTp9teAdcNKU7K2CyEhqrt6J3wi/9KBgire9AUUG
	ammro7jXckJIFczlBBxT7WrBYC1Bl2Q=
X-Google-Smtp-Source: 
 AGHT+IGZWdmjxFZdnmgRLOwMQ8jZlp8YoTiqoeKbtipu94an5Ymgd1VKd/ABcnjQwkiXMVWRf1tBRg==
X-Received: by 2002:a17:903:22c3:b0:1c3:a814:a12b with SMTP id
 y3-20020a17090322c300b001c3a814a12bmr2872742plg.16.1694590033299;
        Wed, 13 Sep 2023 00:27:13 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id
 iz2-20020a170902ef8200b001bd99fd1114sm9713884plb.288.2023.09.13.00.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 00:27:12 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 575FF8212DD9; Wed, 13 Sep 2023 14:27:10 +0700 (WIB)
Date: Wed, 13 Sep 2023 14:27:09 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Myunguk Kim <mwkim@gaonchips.com>, alsa-devel@alsa-project.org
Cc: broonie@kernel.org, fido_max@inbox.ru, kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org, perex@perex.cz,
	tiwai@suse.com, u.kleine-koenig@pengutronix.de,
	xingyu.wu@starfivetech.com
Subject: Re: [PATCH] [v2] ASoC: dwc: fix typo in comment
Message-ID: <ZQFkTYqZ-QWxCjFu@debian.me>
References: <20230913024103.1454354-1-mwkim@gaonchips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ob7r/gzMky4stU9D"
Content-Disposition: inline
In-Reply-To: <20230913024103.1454354-1-mwkim@gaonchips.com>
Message-ID-Hash: ELWXCLRNAJPWWSZ3FGBSUCBPNLXLQL3N
X-Message-ID-Hash: ELWXCLRNAJPWWSZ3FGBSUCBPNLXLQL3N
X-MailFrom: bagasdotme@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ELWXCLRNAJPWWSZ3FGBSUCBPNLXLQL3N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Ob7r/gzMky4stU9D
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 11:41:04AM +0900, Myunguk Kim wrote:
> ISR_RXFO means "Status of Data Overrun interrupt for the RX channel"
> according to the datasheet.
>=20
> So, the comment should be RX, not TX

Thanks for better description!

The patch title though, I'd like to write it as "ASoC: dwc: correct ISR_RXFO
check comment".

>=20
> Signed-off-by: Myunguk Kim <mwkim@gaonchips.com>
> ---
>  sound/soc/dwc/dwc-i2s.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
> index 22c004179214..c71c17ef961d 100644
> --- a/sound/soc/dwc/dwc-i2s.c
> +++ b/sound/soc/dwc/dwc-i2s.c
> @@ -138,7 +138,7 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev=
_id)
>  			irq_valid =3D true;
>  		}
> =20
> -		/* Error Handling: TX */
> +		/* Error Handling: RX */
>  		if (isr[i] & ISR_RXFO)=20
> { 			dev_err_ratelimited(dev->dev, "RX overrun (ch_id=3D%d)\n", i);
>  			irq_valid =3D true;

In any case,

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--Ob7r/gzMky4stU9D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQFkSQAKCRD2uYlJVVFO
oyutAQClx0B4pl8pmOqjUxvXFRf0+/lJMGZQaaeply8sj17flgEAuE3xDs4OmWl9
crDoNHVRX2FbfnwnfY48vy4ehCyKQAU=
=uSnr
-----END PGP SIGNATURE-----

--Ob7r/gzMky4stU9D--
