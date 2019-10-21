Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CEFDEB08
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 13:35:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72F781660;
	Mon, 21 Oct 2019 13:35:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72F781660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571657755;
	bh=l+98L/bbJLoWagF8Dw3ds3l8LljC/pw7CKhzqK60OTQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mZ1gO+eXRq6Ai1RdAe9qx6wYNt+OK0QZuliKvPzvnnHLcYHExv9gdcsSysCgusZjm
	 qgkqAQHmGlj9KmS7EaLTg5tVNalWbAhlNwCFZ1j4T0HPedbTbDPKZJ90mXjOmQ7052
	 JwufJUXmWhGm4H6lud6FXxPMp4w0J9xYmxvUzd50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4E95F80321;
	Mon, 21 Oct 2019 13:34:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23E56F80368; Mon, 21 Oct 2019 13:34:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB656F80112
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 13:34:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB656F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="cOKznNRC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2fpuFD/uaHveGNLLm3zVcEpQ6gE6MaI40ovGx49daNk=; b=cOKznNRCCeOJ9iwGH5N5061hl
 VCjFwevF/dJzXLX7SM0yKu/IIvGoManvSFHrTffyVooWennRWn8H+hwHWF7JBhkOaui7KErYEP3DF
 Qy4QjF81+lNoLN7BzutxBNQ4s6OsGtijA30z6AYoKpU366wQPY/O/EBogbaWEzmcd8Skg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMVwr-00042e-DQ; Mon, 21 Oct 2019 11:34:05 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7F1BD274301C; Mon, 21 Oct 2019 12:34:04 +0100 (BST)
Date: Mon, 21 Oct 2019 12:34:04 +0100
From: Mark Brown <broonie@kernel.org>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20191021113404.GA4691@sirena.co.uk>
References: <VE1PR04MB647977B69BF05FA82CAC7D10E3920@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <VE1PR04MB647977B69BF05FA82CAC7D10E3920@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-Cookie: Why are you so hard to ignore?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "jiada_wang@mentor.com" <jiada_wang@mentor.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Question about "957ce0c6b8a1 ASoC: soc-pcm: check
 symmetry after hw_params"
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
Content-Type: multipart/mixed; boundary="===============6154771046743404733=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6154771046743404733==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 16, 2019 at 03:05:16AM +0000, S.j. Wang wrote:

>      The soc_pcm_params_symmetry can't take effect, because its position
> is after the change of cpu_dai->rate.

>    Is this an issue?

I think so, yes.

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2tl6kACgkQJNaLcl1U
h9AEvQf/beuywPIO1isOaHeZT+7jD/6X9xqpIgql+Fjp20yTSSQgVkVxTm9oYKCQ
aQVNNuNr4LovYxuFHBj4tZssfFqZakbaDmT4a/OA0/ulXD5WvRJ0kcxG6OQh1L4h
sKRExRjUewvZ52O3CI4rXF5Pvz7H1VUykZpjpu1YntzsOx2GaT6xSpdgMUaq3RSh
kBBD0AFYUYtCXK5JimXEBJUL+FvLRvIkL57OooBHcJBsBpaU9S2CRhJOoFcXHx3l
HOaFGpz7HEOxrrY/7AEuH9tZuLUrtK8GPrC249AtJbsMHyQnIVJSNMMgsybG7ReF
wA3Z+R1txCxGaMXUuUOfsY1CpD0r/g==
=1qD3
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--

--===============6154771046743404733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6154771046743404733==--
