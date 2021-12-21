Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B724347C0EE
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 14:42:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 426B8172F;
	Tue, 21 Dec 2021 14:42:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 426B8172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640094172;
	bh=eSRAKEguAAkjv3Nyo40fStjl3Xy+JYHwyO/2MGhsBF0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Am6hlcLxWm5jXvBsUGczoX7NvowzTAXGHyEDQjXfNBTalc4kMsORYsmKjdecXklGd
	 2Bk3go30HA9kdFOfbeTfmVx/1M+6OFs9gczh4UTmSu6WxUc2snonf5twJlRqKzxK12
	 H4Twgglp4GtTfJ5m5w63skxb2odsq6PUVjy/jLqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96DDCF80125;
	Tue, 21 Dec 2021 14:41:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD0A8F80118; Tue, 21 Dec 2021 14:41:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9821F80084
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 14:41:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9821F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ngpn9O9v"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 281F261593;
 Tue, 21 Dec 2021 13:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169F3C36AE8;
 Tue, 21 Dec 2021 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640094098;
 bh=eSRAKEguAAkjv3Nyo40fStjl3Xy+JYHwyO/2MGhsBF0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ngpn9O9vOUb1mvwE+8ddU+bAzbpSoLq7DnHe59iQsaj8xkzdDj51g3xKCcuDE+TLu
 dqp5fkWt8FM3+ZFe3VFzH+8YqR4AwNEXqEaCZjNYUpMAJg8WLy1+XVo1me72os7aIN
 a1Q6wyLZRa37+rDXI/6qAA4HDT4b9fF8iHbO7vWXsPezhm7GOm6SEUwZ4Z9vp8Vu8h
 ym4i+SbW0UNdwe3LQKWekxX+gUqzPg4wlo2JVD6C2SaqC/2TK0KnBBuVFbWISHwwvo
 CXzTgvnWK4GxpJ/Z6wrJRQR0PB6l08w+e0iE5Lk41jDYom///Uv5Ly/Ol70M5yLMWP
 jJHjFu/d9TQzQ==
Date: Tue, 21 Dec 2021 13:41:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [RFC 06/37] ASoC: Export DAI register and widget ctor and dctor
 functions
Message-ID: <YcHZkEGk4bWR3DED@sirena.org.uk>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
 <20211208111301.1817725-7-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ChlaFMybOrZyC6No"
Content-Disposition: inline
In-Reply-To: <20211208111301.1817725-7-cezary.rojewski@intel.com>
X-Cookie: Have you locked your file cabinet?
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, peter.ujfalusi@linux.intel.com, lma@semihalf.com
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


--ChlaFMybOrZyC6No
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 08, 2021 at 12:12:30PM +0100, Cezary Rojewski wrote:

>  	dev_dbg(dev, "ASoC: Registered DAI '%s'\n", dai->name);
>  	return dai;
>  }
> +EXPORT_SYMBOL(snd_soc_register_dai);

EXPORT_SYMBOL?

--ChlaFMybOrZyC6No
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHB2Y8ACgkQJNaLcl1U
h9AQuwf9Gs3N1SZrZPO3E8YQEcvlKfH2UEcvjqVqqyljyyn0hsE/O5NFkeqyKckT
cHrjPyQij8NCPAUxTsUAJyTrWQzF/gJ361+gqf+UouoIKjMETy4Ztsz+EC+xUNJl
TV66dDMooFGkB64sUalutmVLe4B5B1K0kxaSXtLDSeDOvLMkr2fq2xONWcDDYWlS
e8RPBiiwksZWCn32hWvxXkZKObNB/rsI+o/m3Q22NOCaVh/dDsDXymF0qg9+r8av
q3OB6idrmIakRkvn0aO1Xtd8U7aVoc0/Sv59XwOoIUgNW6PhwhaTW9/pQOaJjQtJ
uSXId1Ou2u1skXPd2AmvrvZmnz5d1A==
=mWSG
-----END PGP SIGNATURE-----

--ChlaFMybOrZyC6No--
