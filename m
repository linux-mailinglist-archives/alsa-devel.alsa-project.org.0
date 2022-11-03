Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC0F617F87
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Nov 2022 15:29:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5516164D;
	Thu,  3 Nov 2022 15:28:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5516164D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667485787;
	bh=DN2U+zHMYnYDwgy2AjoN9CxQeyhHUhZQ799Av3LTZss=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nB5fyP7KYuMvEutvHyOidGZVJe8GD8VwjpYJnmNuqnl1ZE4i0cYI+wVbhsJGLMAns
	 FpCV1UD0ul92AVenTO5DuRZMRWEjQf0yIZz4V50kfcTpyZ2s0uHRMkbDMfbLmNCJwc
	 Dp6xFEOFGDLpyByknvNtLtVXUaSyezFGQPOT0Tgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 239AEF80155;
	Thu,  3 Nov 2022 15:28:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E158FF8051E; Thu,  3 Nov 2022 15:28:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D73DFF80155
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 15:28:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D73DFF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QT0qCEuz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D367D61EE8;
 Thu,  3 Nov 2022 14:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A0FC433C1;
 Thu,  3 Nov 2022 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667485720;
 bh=DN2U+zHMYnYDwgy2AjoN9CxQeyhHUhZQ799Av3LTZss=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QT0qCEuzToqRdOi78UsQP4nWmCj9Qg/ZpOsbe5z5B5rPFYhTlSTu7csMVb+eL9Ppz
 iauBwEJLckJoDceYW0lB+sSR9EmKfPjdL1xd3jv9bLot8voUNe3DS+KQlFq0Q4h9/e
 LaHKlAk+u3oYrkqslNspUzd0qwb3owSqj5jvbFXQMzVLXaE3s9gXfB/thvpnVgVzZU
 YLMJDI8TwJCYLTHCx+yxfh988i9Km7rcBDqOO3EykIAicySG7pPldFieOXkf2w3Z3p
 Dpt99/1YqATgzW8JJpzwOuoxSBno9RdoaKsGXY7c2fSZVR57MMy19RWFGFM1xg51bg
 5YWuToDNhH9ZA==
Date: Thu, 3 Nov 2022 14:28:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Juan Alfonso Reyes Ajenjo <jareyes@gmv.com>
Subject: Re: [PATCH] Fix tas2562 volume table values
Message-ID: <Y2PQEvY5Iu7jzVVv@sirena.org.uk>
References: <VI1PR07MB5839C95198DD090316E87B78BA389@VI1PR07MB5839.eurprd07.prod.outlook.com>
 <Y2PA8Bo59YDKvlRG@sirena.org.uk>
 <VI1PR07MB583938C86519E34431A248F2BA389@VI1PR07MB5839.eurprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="AoDXkSSXIdUF6v5A"
Content-Disposition: inline
In-Reply-To: <VI1PR07MB583938C86519E34431A248F2BA389@VI1PR07MB5839.eurprd07.prod.outlook.com>
X-Cookie: Dead?	No excuse for laying off work.
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@denx.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Gustavo Plaza Roma <gplaza@gmv.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 =?utf-8?B?Ik1hcnRpbiBQb3ZpxaFlciI=?= <povik+lin@cutebit.org>
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


--AoDXkSSXIdUF6v5A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 03, 2022 at 02:22:52PM +0000, Juan Alfonso Reyes Ajenjo wrote:
> Sorry,
> maybe outlook is doing some weird things. I will try again with send-email as suggested.

Yeah, I'm not sure Outlook is able to cope with sending patches without
mangling things - I'm not aware of anyone using it successfully.  The
nearest it gets is sending as an attachment but that's really not good.

--AoDXkSSXIdUF6v5A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNj0BEACgkQJNaLcl1U
h9ARaQf9EqgOpZ/hYoHse/LAeK93F8o6OEPruckRCah5nJmt/BRqorRmIlH3mSU9
r0p3/OrJbm0dkYUyC0MMyE2lXS2TxfpekAYDqR/uIgnKCIPzeRZvWCT/EtRjL5he
yWo60S7jEsDutDTEZ0F7QIvVxFtvRD7d5lS4anSEGfJM0mIAz+YYmT0VOteCvv1A
SdoWGvXO6wXbpWsekyLWD/8d1Ex9IerJfstJHdvC9C9gllOs0X+GpkNuUqYUGeGY
MLa2Zq7emBYR5Vg2gwFDi8jbK/kzbnDDvjhOk9La8F56VtLi4URwEayApac5IBMH
LrHBpcLsgQEkfc1XNT4dzjViKLEG/A==
=4mnn
-----END PGP SIGNATURE-----

--AoDXkSSXIdUF6v5A--
