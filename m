Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFBF2FF9BD
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 02:05:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AC5A1A93;
	Fri, 22 Jan 2021 02:04:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AC5A1A93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611277529;
	bh=TGSxz1VzTBBE2jwrE1raFBwLVRSWhyzPYt6JF4ZQZLw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u05L+EKUDTpZnYsdDI3rsHwazVuS3UbzdTKQZdkqHSpjdfgzwFUCMpECyeC21gIfo
	 cPAjsi6Isj2Cn9zEYJJssMr/mKzuBxcCfQ7/042kiZbIk0oH4Pf5uS71crX3MaqMmy
	 M5EXm8vTGYy6QGNmTgWV73ILF1FrrRxDJsKhTrOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CD7CF8026A;
	Fri, 22 Jan 2021 02:03:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAE6CF80257; Fri, 22 Jan 2021 02:03:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7E68F80162
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 02:03:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7E68F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XhdA9ei1"
Received: by mail-pl1-x62b.google.com with SMTP id e9so2312750plh.3
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 17:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lw4cm+7RXhLgXHhIgHAntQuy6SsZDwNqhL+qH8M4o3Q=;
 b=XhdA9ei1rorZZbjDB1bxDSifSMzivWAG6Z/YPsqR6QqmUxc6VTdh+WLbjCztj5VjV2
 Y+dKEpFeuWM2An1Evn24rEmp+5Z1dm7qpRCibEQ+1GbNwX1r9T5/Gx9nSURWWwbIIe2r
 HfM82xGGVz+LObwR71Pbjpi2+oRPfDZQWmV9/DV6mcUFtH+iaAEuh/XYNUYmanyIPwXg
 ATzqC2zmij1Tegt2Xv3ZP71dx/wTol+Zu5oxZfoID7vldOsjrt6OxnB20MrihUv46wT5
 9Qbw8tCFYnUVghfTteSJg3nWRppmB8WPscLwqjlcs2JIeH8v07/c+Q9k08CQy2bIBPMN
 fXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lw4cm+7RXhLgXHhIgHAntQuy6SsZDwNqhL+qH8M4o3Q=;
 b=sYZpQUBJ03q2VhxVbpLvaArCR6GlRhfGAXRbtaIO7eLhC+BTtnw0KFjsOlwBggRI1q
 XHDtcsixKsD2iAqA4EyyfaLZTakaIZhzkDBuUcDqhRw0/p0Qm8xdmqmMCvprf3aGAQzG
 sc6bk0k2W3XzDBBOB6aDHih8vaxcpwn4vqkX/ymtLo0DY2b7fzDqGvEoK1dsBo/dDz68
 0H5odMPhr4dErm9/ZbBgDl0lZhUhhtN8cxQu7JRwEmoH0aNWwpAgolB0sAiBg8ChHd2v
 XeKcF4UKW7CrZlmILXwj/V+c66sc5gDqbKIpUw3IleO39gnI/r8D2kopVc/kDCUNTDr5
 fJyA==
X-Gm-Message-State: AOAM530yWGSYmqVnnZMIJgJuEgLnfx7irfDg0SA8CRXo88CDdoIE5ReV
 nI3vmcOypN8xHvBtkRa0YT4=
X-Google-Smtp-Source: ABdhPJzmb7nke4O74Aga3Has5vmSGhKK4Sa5I6pQqAuiHRHYi6rZ29DGdsXsL8nJ1Ji6VskHwOhaDA==
X-Received: by 2002:a17:90a:5513:: with SMTP id
 b19mr2363941pji.99.1611277425889; 
 Thu, 21 Jan 2021 17:03:45 -0800 (PST)
Received: from shinobu (113x33x126x33.ap113.ftth.ucom.ne.jp. [113.33.126.33])
 by smtp.gmail.com with ESMTPSA id
 e3sm6395565pgs.60.2021.01.21.17.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 17:03:44 -0800 (PST)
Date: Fri, 22 Jan 2021 10:03:32 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH v1 0/2] isa: Make the remove callback for isa drivers
 return void
Message-ID: <YAokZMNkgVfJ+csC@shinobu>
References: <20210121204812.402589-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PZu/ILMf5FNwdU4R"
Content-Disposition: inline
In-Reply-To: <20210121204812.402589-1-uwe@kleine-koenig.org>
Cc: alsa-devel@alsa-project.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-i2c@vger.kernel.org,
 Hannes Reinecke <hare@suse.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-scsi@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-input@vger.kernel.org, Pau Oliva Fora <pof@eslack.org>,
 Jakub Kicinski <kuba@kernel.org>, Wolfgang Grandegger <wg@grandegger.com>,
 linux-media@vger.kernel.org, linux-watchdog@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-can@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Finn Thain <fthain@telegraphics.com.au>,
 Michael Schmitz <schmitzmic@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
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


--PZu/ILMf5FNwdU4R
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 09:48:10PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> as described in the commit log of the 2nd patch returning an error code
> from a bus' remove callback doesn't make any difference as the driver
> core ignores it and still considers the device removed.
>=20
> So change the remove callback to return void to not give driver authors
> an incentive to believe they could return an error.
>=20
> There is only a single isa driver in the tree (assuming I didn't miss
> any) that has a remove callback that can return a non zero return code.
> This is "fixed" in the first patch, to make the second patch more
> obviously correct.
>=20
> Best regards
> Uwe
>=20
> Uwe Kleine-K=C3=B6nig (2):
>   watchdog: pcwd: drop always-false if from remove callback
>   isa: Make the remove callback for isa drivers return void
>=20
>  drivers/base/isa.c                   | 2 +-
>  drivers/i2c/busses/i2c-elektor.c     | 4 +---
>  drivers/i2c/busses/i2c-pca-isa.c     | 4 +---
>  drivers/input/touchscreen/htcpen.c   | 4 +---
>  drivers/media/radio/radio-sf16fmr2.c | 4 +---
>  drivers/net/can/sja1000/tscan1.c     | 4 +---
>  drivers/net/ethernet/3com/3c509.c    | 3 +--
>  drivers/scsi/advansys.c              | 3 +--
>  drivers/scsi/aha1542.c               | 3 +--
>  drivers/scsi/fdomain_isa.c           | 3 +--
>  drivers/scsi/g_NCR5380.c             | 3 +--
>  drivers/watchdog/pcwd.c              | 7 +------
>  include/linux/isa.h                  | 2 +-
>  sound/isa/ad1848/ad1848.c            | 3 +--
>  sound/isa/adlib.c                    | 3 +--
>  sound/isa/cmi8328.c                  | 3 +--
>  sound/isa/cmi8330.c                  | 3 +--
>  sound/isa/cs423x/cs4231.c            | 3 +--
>  sound/isa/cs423x/cs4236.c            | 3 +--
>  sound/isa/es1688/es1688.c            | 3 +--
>  sound/isa/es18xx.c                   | 3 +--
>  sound/isa/galaxy/galaxy.c            | 3 +--
>  sound/isa/gus/gusclassic.c           | 3 +--
>  sound/isa/gus/gusextreme.c           | 3 +--
>  sound/isa/gus/gusmax.c               | 3 +--
>  sound/isa/gus/interwave.c            | 3 +--
>  sound/isa/msnd/msnd_pinnacle.c       | 3 +--
>  sound/isa/opl3sa2.c                  | 3 +--
>  sound/isa/opti9xx/miro.c             | 3 +--
>  sound/isa/opti9xx/opti92x-ad1848.c   | 3 +--
>  sound/isa/sb/jazz16.c                | 3 +--
>  sound/isa/sb/sb16.c                  | 3 +--
>  sound/isa/sb/sb8.c                   | 3 +--
>  sound/isa/sc6000.c                   | 3 +--
>  sound/isa/sscape.c                   | 3 +--
>  sound/isa/wavefront/wavefront.c      | 3 +--
>  36 files changed, 36 insertions(+), 79 deletions(-)
>=20
>=20
> base-commit: 5a158981aafa7f29709034b17bd007b15cb29983
> --=20
> 2.29.2

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

--PZu/ILMf5FNwdU4R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmAKJFgACgkQhvpINdm7
VJLzPQ/9FPQmfnPF1kWcQikWSXr31BdrY/bU1k3tsN3+yIFcnAkjeW5mH5TGysY8
zpAFfnbdVIMz5er9oBLPRcOztSwitbQeOuLQHNnm5Bf8Vs/BBYahD8iK0Z11CLzU
NaOcLr3iJYTisqqbPjiadkoKUeCh6vizab5oaZUR/5jn6YvtFX1vB3amb2J0600r
mNVDoLHL4BnWW40jTxr12OQF/Z27BGaRqUImGhmgUqvLY8WMz79zGTgg4qHYMujs
MYZxWX9ILt3oXKwFrd58mIcG9cIP9q18ndjkyMdH3sXMMYHPm6vKuVnVHcOjSqBn
sX0ciA2HizGr7V2o1AhQiU3loQEaE3uHZ1t0te/vEqVRLlWlqSevRdNxxpgNk58Y
iQe3J72kgc2Pb3009+FpzMMO4MaGfpNTXBeVP9qurmHmaAGBQLAoNxqmSOFnXx7I
aSmNOW9wTuijQeUWN7WlYGtaRlEldvQlPiPbut8p9M7/5kTkW8GTXxvbJd1ylwwF
Oxz1NxLAEvJN3NuwPoAkywW930fVXy4JJigSwMjKlc+vXvJgGqGP20HqeHKBxTdE
GglZQJ0FunBNAYckgJwTqt6A84+wCwZ/5erqRqsJDipn8qcnQ79YiKjh+L4za0QA
yyItzFeVSsa/lPxJ3OrDiOD2LsTb9hkJhmT5OHPFjwxt++d7KiA=
=WpSs
-----END PGP SIGNATURE-----

--PZu/ILMf5FNwdU4R--
