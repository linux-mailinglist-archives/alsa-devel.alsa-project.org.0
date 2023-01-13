Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A93E6697E3
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 14:01:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C8299307;
	Fri, 13 Jan 2023 14:00:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C8299307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673614863;
	bh=ZP8XIsS+80qkgSOQWeJfZPFezfHfSRD008tq6Tt5pVM=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gR0FZGaeucddTg2iYtVMIEr1/BCNdSfMBrc86iGQ9bsTwg3UDUuTt5sef7OSeBb5K
	 R0VK1hWLOnJKzDA7TEBDnvmIguRNutCnBn/xj2LTqtCNLxavgD9RarCS7zB/GW31jg
	 0Re41xq1uv6/lp5o5feuctATTXhplbyVQ9jv+ElY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74B31F80424;
	Fri, 13 Jan 2023 14:00:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E04FF8030F; Fri, 13 Jan 2023 14:00:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66298F8026D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 14:00:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66298F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q+TA5zAK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2491161904;
 Fri, 13 Jan 2023 13:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ECE6C433D2;
 Fri, 13 Jan 2023 13:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673614806;
 bh=ZP8XIsS+80qkgSOQWeJfZPFezfHfSRD008tq6Tt5pVM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q+TA5zAKqGXCmaGrYk99jkVIQKonzPOPIegiyi8+3I1BxmPRQIzsBF6XwqZ995nY1
 67EHFMpuyIpINrwtBWjLO72bP1/a+LErlP0dks1cZ/62ZeX991mzu6avglNIIT8IJn
 0QjWBnYyM69eY23rRuLQHJ1QdBNjTUWmagQKDB2y396+kya1S2yYGbFRYhDydcdDGX
 5cNH0vywKEefPBNhPGY4mnJqa5927Q27NJWbzohinWryB/AjfGSJ+fvX4VPb8mnMiC
 a14pIf0Xf35qcjB6F93E/vLbrioQ2MD0A+lRPvtIOLQP5cgQ2FpwKR7QScWVjdQTZz
 +s4zkg6xtizcA==
Date: Fri, 13 Jan 2023 12:59:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 2/3] ASoC: codecs: Add support for the Renesas IDT821034
 codec
Message-ID: <Y8FVz/Mp5xSdI34a@sirena.org.uk>
References: <20230111134905.248305-1-herve.codina@bootlin.com>
 <20230111134905.248305-3-herve.codina@bootlin.com>
 <Y77DKSdZf27qE+xl@sirena.org.uk>
 <20230111174022.077f6a8c@bootlin.com>
 <Y774bY4icD8RuMnX@sirena.org.uk>
 <20230113090431.7f84c93a@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tY5Grajt3iCZ58MK"
Content-Disposition: inline
In-Reply-To: <20230113090431.7f84c93a@bootlin.com>
X-Cookie: I know how to do SPECIAL EFFECTS!!
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--tY5Grajt3iCZ58MK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 13, 2023 at 09:04:31AM +0100, Herve Codina wrote:

> For DAPM (struct snd_soc_dapm_widget), no kind of .put() and .get()
> are available. I will use some Ids for the 'reg' value and use the
> .write() and .read() hooks available in struct snd_soc_component_driver
> in order to handle these Ids and so perform the accesses.

That's what the event hooks are for - there's plenty of widgets using
SND_SOC_NOPM as the register, look at those for examples.

--tY5Grajt3iCZ58MK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPBVc8ACgkQJNaLcl1U
h9AzVQf+IpbKw3nUOCd5FnoIfC7a9hLUt4eHIEqikDmn4Lb0N0OX7frf/8tR948l
KlKpueTgBz0TLqZUaI43dlzt2AeYsHcshaZ8Rkg+2YtAumavq3sc4rrq+9HxRn5X
akZKiao7FYUAVxqcVvyfatB3qtShtwes0I80YL/8JClxfd/vOZTUriymgeTemgwb
3h1esS5zNPKD1rp/h2Fm/AytOFrTE0xA+7HlZ5qmy357cwpc+JKYx9enGt6hwc95
zhE3+AZ1UIc0bFfp8xhGnW0YzlelN1grOl5oar0kdwTOY9kQTwVgTfMp3+L4BBBD
1xdRqnZEhFNnTC1IW724rzztEvTfuA==
=p0Is
-----END PGP SIGNATURE-----

--tY5Grajt3iCZ58MK--
