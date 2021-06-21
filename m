Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7373AE857
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 13:47:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AF6016A1;
	Mon, 21 Jun 2021 13:47:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AF6016A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624276071;
	bh=o2BrqAEzQ18i2RIwqxFr1jTlLo7zkIjHvzpelLDjh5g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HT5F5OhaFoRy2svAMfhXxaxOAhWD5H1PJBBRBfq8wCCcvlav1qORxT50O3OUHadtA
	 Q3qKSa1ztBmADLWccEdLrDWUq/WpKBJSzk9lZiK9/peiQS86cVgJE7wF38Gfjbo+pe
	 Du8nZEp0yrkwOatGLHXQYAEAOmuENlZen/S1Yj6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D56CF8016D;
	Mon, 21 Jun 2021 13:46:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0BB2F8016B; Mon, 21 Jun 2021 13:46:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A8F4F80163
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 13:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A8F4F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K0qeyHxs"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 020A261042;
 Mon, 21 Jun 2021 11:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624275969;
 bh=o2BrqAEzQ18i2RIwqxFr1jTlLo7zkIjHvzpelLDjh5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K0qeyHxscw0e50hQ1s4ED722x4ZoOQjFFfsw0bWIPNhKjWZhfm5c13usRjMnlrK0P
 KxF1nkH1kSePSbHmLqwh2jDQ1AAWasPKgyzxs6xTuACig8sAFCViRWG9OjCC6Oss7E
 PGCxK9d9LgwILRJ59h6sjRc/E1NBkS+SdzLrHn+D4WyCYWLPCXRGp0SZM7xr2/teK8
 GEvmYHfpL58vyn5V93I1pLYWMplk9O1pPzbW0Nqk+jT+Pgx1kjGHFsHZ/oeoMZvphT
 kbtexOUdUKqV2ohEX99Hvbst8tFH138C42EhTLQGYBYgqJ0l1Y2xW1tHzusiYUsOtU
 3Fmpe0865cpkA==
Date: Mon, 21 Jun 2021 12:45:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Judy Hsiao <judyhsiao@chromium.org>
Subject: Re: [PATCH] ASoC: snd-soc-dummy: add Device Tree support
Message-ID: <20210621114546.GD4094@sirena.org.uk>
References: <20210621074152.306362-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Qrgsu6vtpU/OV/zm"
Content-Disposition: inline
In-Reply-To: <20210621074152.306362-1-judyhsiao@chromium.org>
X-Cookie: I hate dying.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 Andy Gross <agross@kernel.org>, dgreid@chromium.org,
 devicetree@vger.kernel.org, judyhsiao@google.com, tzungbi@chromium.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 cychiang@google.com, Takashi Iwai <tiwai@suse.com>
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


--Qrgsu6vtpU/OV/zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 21, 2021 at 03:41:52PM +0800, Judy Hsiao wrote:

> Support for loading the snd-soc-dummy via DeviceTree.
> This is useful to create dummy codec devices where we need to have some
> DAI links without a real Codec.

Why would it be useful to create DAI links to a dummy device that has
no properties?  If you've got a device with no software control it's
still going to have some limits on things like what formats and sample
rates it can accept so you should describe that in DT.

Please try to keep the CC lists for patches you are submitting relevant
to the patch, people get a lot of mail and reviews for irrelevant
patches add to the noise.

--Qrgsu6vtpU/OV/zm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDQe+oACgkQJNaLcl1U
h9DvcAf+OEQdZ8mpmDx64FNAM+JYbFmXKYuVAq6hARBk0HPXzJvIOIs9QeQtvj8d
GObICfD9GNrHXO+4+QWsToFDBSEff+lwDBMZ/fQtTLQIOwsFSiGGz6T940Ln5PnD
l3XErztXHn8QfavfE5pnQX5pU9vlXZ8GCucUa7jCn0rTko1Qp0WrUEuE35+3Sl/3
rMohutM+1vubyep03x3pRR7dPMyL3EOlq08bGXqzKkfO56oZ/RVrOKCx0ytG97tb
x0Ef9xlJalRgDK0s1xASY6KK4we8ses7pbHrsJ3zLV6SI72ND4HrnkdNiylxou9O
PCISf/t7SFF7MvLP5norF8md0ihGgg==
=PlEf
-----END PGP SIGNATURE-----

--Qrgsu6vtpU/OV/zm--
