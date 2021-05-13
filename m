Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7E6380D84
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 17:42:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CDE61778;
	Fri, 14 May 2021 17:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CDE61778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621006970;
	bh=YtSmk0Ro4yIjMe2M3z2jM/eJzMXejRL2txCGlEKnxVo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q40aMTKuRu7wMbqR91V2L/tY/l2BdPW7GzqXNZ71ysx8dZCayMUt/CxtM+Ks/K39z
	 cKZZPJ8cf9pFm/J914phVYRB4SwRirOMV7461awNloUjS9jr+Hkug/qERADaoCjxvf
	 NJ45h7IfAkMzBcQiPrsfsEVo5d82xvV/6xwzpPCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AA95F804AA;
	Fri, 14 May 2021 17:39:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D5B6F80163; Thu, 13 May 2021 17:34:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17C5AF8012E
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 17:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17C5AF8012E
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 4FF711F42C47
Received: by earth.universe (Postfix, from userid 1000)
 id D36D73C0C95; Thu, 13 May 2021 17:34:02 +0200 (CEST)
Date: Thu, 13 May 2021 17:34:02 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: More removals of type references on common
 properties
Message-ID: <20210513153402.q3w42oayif2l7rf4@earth.universe>
References: <20210510204524.617390-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6zntmlcncahxaxdz"
Content-Disposition: inline
In-Reply-To: <20210510204524.617390-1-robh@kernel.org>
X-Mailman-Approved-At: Fri, 14 May 2021 17:39:48 +0200
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>, linux-input@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, devicetree@vger.kernel.org,
 Odelu Kukatla <okukatla@codeaurora.org>, linux-pm@vger.kernel.org,
 Luca Ceresoli <luca@lucaceresoli.net>, Mark Brown <broonie@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-arm-kernel@lists.infradead.org, Alex Elder <elder@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Baolin Wang <baolin.wang7@gmail.com>, Georgi Djakov <djakov@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
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


--6zntmlcncahxaxdz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 10, 2021 at 03:45:24PM -0500, Rob Herring wrote:
> Users of common properties shouldn't have a type definition as the
> common schemas already have one. A few new ones slipped in and
> *-names was missed in the last clean-up pass. Drop all the unnecessary
> type references in the tree.
>=20
> A meta-schema update to catch these is pending.
>=20
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Olivier Moysan <olivier.moysan@foss.st.com>
> Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Georgi Djakov <djakov@kernel.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang7@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
> Cc: Odelu Kukatla <okukatla@codeaurora.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
> Cc: linux-clk@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> [...]
>  .../devicetree/bindings/power/supply/sc2731-charger.yaml        | 2 +-
> [...]

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

--6zntmlcncahxaxdz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmCdRuoACgkQ2O7X88g7
+pp2eRAAji89IV6U3huPwd3QFqIvXt4J/smg1VWppBF8MRaAl/GQyC0ulamRL7Nw
JjkjziYNiLcykycKuiWb89OfBsoCPVS5WKRNvI5ckZTu2egIE+lEr7mACjughIpk
xp0NvbW8iIO3WxjnYh8LkFwJm4GxphCqlUkl32HKbafHkW9UKVEh8Ex6eoqnUk63
RXluSTs0bDdfkeGzWaR4/2ZBJh+iHoaoVbPiqTr4lLCfIEpg+6tERKBeIHFL82fE
8bxpm8/YAiG3ymllKDDzQIMTt1NHbBs4WtUcUq4X2gIlRFrLnV8w0DXmVPwDynKW
tN9mYEhHqR1y8bc0dx5X++M9ZEWX67GbuGa1+Om1rdSnnM2uxEwQEjht7JjpLFg3
n4urCpUbQjh+uW/hkNZjQlWb43TuUmslUrutHts+vlwf2vD6srxH0uy9I/GwtVGg
7CtZBtofKACRiYO2Aud7iaMuWYd8wYFx6gfuw7WY9tUJ5vlwQacPeLqedRcYWLPj
N5y/tY01/DqTBHFJmjUqCsvR2R+W17P9zO0Q4sB+wYLtE82H7O5suUkZFpe79bn5
rVpnaz3YAWirzucHrMpOsPVP8gs5taBkdSTKClnSQLek1Z/WJKwPAq26gqZ/EPOw
EJBYc0TMSmzTJIoRSkXxJGAeSwiDp8wCTFJA6r/QyASeQkGfqrM=
=Tg1h
-----END PGP SIGNATURE-----

--6zntmlcncahxaxdz--
