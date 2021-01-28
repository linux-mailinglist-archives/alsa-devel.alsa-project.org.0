Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F04CA3089C7
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 16:12:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C9F416AF;
	Fri, 29 Jan 2021 16:12:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C9F416AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611933174;
	bh=iO7ZSC72FkSO5msxnrNl3pzkNeuJI0KURaMGIetLQqA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q9Apy8LG5pbSJoqliZOpvbtZXISRxrSeRwzdFyjOKhL5CIpPorVmpFglzw7f0fdVv
	 hyZV1jULAflLCABv6FUOPqo0AP4Hng9lgKt4t1IqRNgqOzDV7qPrIr2DJip6pWE0Qd
	 AcZWG2SFLJLGToMpI7qy7MyuRQlkLdCSzmPmqL0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 175AAF804E1;
	Fri, 29 Jan 2021 16:10:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 941F7F8015B; Thu, 28 Jan 2021 21:23:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E799CF80158
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 21:23:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E799CF80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="We7XJH0G"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA9DF64DDE;
 Thu, 28 Jan 2021 20:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611865424;
 bh=iO7ZSC72FkSO5msxnrNl3pzkNeuJI0KURaMGIetLQqA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=We7XJH0G5nMQ6fnPVASdW/lPKdJOtJIBANLe2NM+9ZNg2tu7HZkxijytP9xkxCd/v
 HdYLQ18qG5hTw7DJnaZt7ZvK6hfdq0Pe3J1d+vpVnh5pOuRPYXuWPHXwP1qcUbKxCU
 N7tIqaorTkPh2jZBx4BQcNfw2wej30nLdaTpyik3lekkdwSHBYrLQCLuX2nL285Cby
 Yvsx9SkR1fghrl4eLc8385w5hE+xvfQafo+4D3/H7RJoizRbS8fbyXbW2hyt4Wocn6
 6QZWwC/7rnjGOkvq8yVJqG95Yq0+F22vSwj7SJLwY6p/nKStoz510U/yhQgo5R41sk
 0q2hosLtkFK5A==
Date: Thu, 28 Jan 2021 21:23:36 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] dt-bindings: Cleanup standard unit properties
Message-ID: <20210128202336.GA3094@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 Wolfram Sang <wolfram@the-dreams.de>, linux-hwmon@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-watchdog@vger.kernel.org
References: <20210128194515.743252-1-robh@kernel.org>
 <20210128201614.GA162245@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <20210128201614.GA162245@roeck-us.net>
X-Mailman-Approved-At: Fri, 29 Jan 2021 16:10:20 +0100
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-iio@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sebastian Reichel <sre@kernel.org>, linux-i2c@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-rtc@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 Wolfram Sang <wolfram@the-dreams.de>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
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


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 12:16:14PM -0800, Guenter Roeck wrote:
> On Thu, Jan 28, 2021 at 01:45:15PM -0600, Rob Herring wrote:
> > Properties with standard unit suffixes already have a type and don't ne=
ed
> > type definitions. They also default to a single entry, so 'maxItems: 1'
> > can be dropped.
> >=20
> > adi,ad5758 is an oddball which defined an enum of arrays. While a valid
> > schema, it is simpler as a whole to only define scalar constraints.

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmATHUQACgkQFA3kzBSg
Kbb6dA//VS8eldi8uAa1mEf6ElM2KDOvyEFV2uyartRr0Y//54CMkLEmCIu16Whx
AKOzpk7OOfMUlETV22cBsCRRLyZuJ/rDqgkphiLtPuQUi2h1sj89grqSUBL5Kg8C
MzqNNOnqdbiISFKTgyfNM9cVOxPkbJ+3TrZHou8QfKKtl8x7SuE+Wr6+xYUpxC6x
ZBI7NC1taOe8tHTM6DdsGTVh+sclfzaUXgxmabZfzBXlNM2rhANaWTa2MB2unWqk
Lf/O8VVLc1f3NbfDS0UVafL6M3zbLrzBvlZWyBSHdo56y1P1ejpDzDl9PDQvzcNA
ed9JmdQO0Jh+C6yESODylcOONiiQuGl4s11pId4+UPjWe/YSlnrd4BjncNBMWjb2
2WDAvHWJxRt8Gh95EgIZIVSDExFpnsfw4s0QW8pUcEDh/SeADHkP/rCnT5pJ04oO
AA8gfbdb7DpGzPo7+1M4DGMqfHC9nNk20bpByc0g10tDLfpf+fov01NJS95Ph4ms
np4yxEtQ5cV4qGO+5Qm615C0xCcmsqpgmOe60USL3eb1N7FwjTX9/eCYxc61UOsK
jQt6iVQaeoOXwJppAkSmzLa1q6er4BpPJyEK58HC77cmvr9X4udR7WNQY0+nUqpI
0P7HBGXr9c2zQY0mVC86pc0EN8rjY/CIVrwn1RJ7f+D+CgI1Fno=
=/5B3
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
