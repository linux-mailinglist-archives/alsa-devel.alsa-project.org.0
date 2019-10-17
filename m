Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73445DA3B2
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 04:27:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDEFB15E2;
	Thu, 17 Oct 2019 04:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDEFB15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571279237;
	bh=dV314u5xMK5eVJ9pPvUcWSaSF1JHhZK5bBDERPO4QsU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eEVOW0YAJ2ubd4qb3DjlAS+BRWSdzJHt+sfXUlJffFZU56moL33fqvCKDDBKcadLD
	 31o2F4Oy3uW5LHiShQr2RQyVxT91QVYiO1Vv13HmYhIxps89+yLqrDH8FgihIDxh+a
	 H0emzm8u/h/9M7w+Em+ojntwwjG3HAh7OxbFQnfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42A78F804A9;
	Thu, 17 Oct 2019 04:25:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C365CF804AA; Thu, 17 Oct 2019 04:25:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,FSL_HELO_FAKE,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1633F80322
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 04:25:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1633F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="T2rGOkQ+"
Received: by mail-pf1-x441.google.com with SMTP id v4so592744pff.6
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 19:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=STJjBhLE/m01ejeTMTB4LbJYMiaVitAPLxfsmldrX+w=;
 b=T2rGOkQ+VUFpK/WVOfmLr8Mh2huxuf6moXfqKu86NtPV3dpGQTIlm4yCPBUE5PwYWD
 hca+W7gYNsvl8M/ZeU98q0+B3yFGS/L7EUF/9KsomtmSaX+GhaR1D4dtSDmcIf8KQfzi
 ybkoXQ+K5AbRTJu2equUDWhzY7qXgW27w+fOTMTS15zCXSOFe5WUH42pPZf7v3WgFeFj
 VOsy6Z3ngBlx15Ao9qAmGYuXDaKVGlDwlcurS3+PvQcJ7KYAaqbXqk6rfoXuyjQ94ULG
 OqZRPXfKeyvGVrJJQ9DgmDFWUXZaY7TlfiPlpQlrRm38dRhBgBTzznMPFsJyeXSzTYRu
 aVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=STJjBhLE/m01ejeTMTB4LbJYMiaVitAPLxfsmldrX+w=;
 b=mocHUZJiHRi4NExLk+qYSS4gV3BoCAI15rF2CJvbHFsIs26Oj36ykzWqsjZa4Swwth
 ODxUourZVKPetN7QdpKdgLxzymphL7aolZsa89DwHupAq3jrCbuPft7thWVVSV5BLLvE
 S/br/J0pPdqUWcrwh81IG89j5uTL1EPW4e053nTVC9RNDCYlEfFpwRK94aCAYAV1pM1W
 UCN+pApVrocdo+pAPNcWVWZO35DZG11undZrFy6xaZiHdbm9uy55QiCP4FrS5h3i3yaG
 g2HAwbqjHjz7mxS8kDU4lIgpavmH1w6lqVAfsGHun9lJyTS/0GHDtqAzhw5/6abEoFoZ
 Yhjw==
X-Gm-Message-State: APjAAAU5nkBaJ3lQwHzKyKcay9KrP8vQr+UzqYus2MTHkP7p7oyJABro
 QIrcyOL4k/1JOFM6DsWn7vDDKA==
X-Google-Smtp-Source: APXvYqyvS2ZY7GaiHnRo9+9V5MBhCVFCjVMj2z2fV6My8g6R8J1Y2WkKdysTUlHk8e2d4Zd6ofBpRA==
X-Received: by 2002:a62:1953:: with SMTP id 80mr954802pfz.173.1571279122230;
 Wed, 16 Oct 2019 19:25:22 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:bc61:d85d:eb16:9036])
 by smtp.gmail.com with ESMTPSA id y10sm435680pfe.148.2019.10.16.19.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 19:25:21 -0700 (PDT)
Date: Wed, 16 Oct 2019 19:25:16 -0700
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20191017022516.GA60797@google.com>
References: <20191014102022.236013-1-tzungbi@google.com>
 <20191014180059.01.I374c311eaca0d47944a37b07acbe48fdb74f734d@changeid>
MIME-Version: 1.0
In-Reply-To: <20191014180059.01.I374c311eaca0d47944a37b07acbe48fdb74f734d@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, robh+dt@kernel.org,
 broonie@kernel.org, enric.balletbo@collabora.com, dgreid@google.com
Subject: Re: [alsa-devel] [PATCH v3 01/10] platform/chrome: cros_ec: remove
 unused EC feature
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
Content-Type: multipart/mixed; boundary="===============7574681078389042247=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7574681078389042247==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tzung-Bi,

On Mon, Oct 14, 2019 at 06:20:13PM +0800, Tzung-Bi Shih wrote:
> Remove unused EC_FEATURE_AUDIO_CODEC.
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Acked-By: Benson Leung <bleung@chromium.org>

Thanks,
Benson

> ---
>  include/linux/platform_data/cros_ec_commands.h | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/lin=
ux/platform_data/cros_ec_commands.h
> index 98415686cbfa..43b8f7dae4cc 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -1277,8 +1277,6 @@ enum ec_feature_code {
>  	 * MOTIONSENSE_CMD_TABLET_MODE_LID_ANGLE.
>  	 */
>  	EC_FEATURE_REFINED_TABLET_MODE_HYSTERESIS =3D 37,
> -	/* EC supports audio codec. */
> -	EC_FEATURE_AUDIO_CODEC =3D 38,
>  	/* The MCU is a System Companion Processor (SCP). */
>  	EC_FEATURE_SCP =3D 39,
>  	/* The MCU is an Integrated Sensor Hub */
> --=20
> 2.23.0.700.g56cf767bdb-goog
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCXafRDAAKCRBzbaomhzOw
woOiAQCH3Gf3aTm2PrJBGeHQ5DpoqTKLs7JbIZM9UJV32p34mAD/eZrQnbHqDjDb
Z8tl7YvqZ3afE1nuEWCuA1W3gxUipAg=
=f/vt
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--

--===============7574681078389042247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7574681078389042247==--
