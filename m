Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ABA9767A7
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2024 13:23:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C4AA1E8;
	Thu, 12 Sep 2024 13:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C4AA1E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726140231;
	bh=wi4eh6Bhf9065g9IPgV5aYCLO5OYDMz5Y4IF0FbnzQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PlpticvDmKEBYNQDnK7F6BtDvNJm5P72xrXBJHjMw6fwQL+PrQLhsno9+bgCJthKR
	 U9eQefqt0Ey10PtY3ppZHjmtE7LOTOrRSw7RA5tneAhTvPYpSNDdkNUdBMbe5KzBA7
	 sXBIVD5adiUKPzcAgaNWyoV/SmeuGDYE8r+Z8WGY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 094D1F805AD; Thu, 12 Sep 2024 13:23:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 233AEF80107;
	Thu, 12 Sep 2024 13:23:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86D60F801F5; Thu, 12 Sep 2024 13:23:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4D30F80074
	for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2024 13:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4D30F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LYypDVPT
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0FD22A45253;
	Thu, 12 Sep 2024 11:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED17C4CEC3;
	Thu, 12 Sep 2024 11:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726140190;
	bh=wi4eh6Bhf9065g9IPgV5aYCLO5OYDMz5Y4IF0FbnzQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LYypDVPT/2O7zA+CCnkJJI/4Q7dXlEtC2dhiM+Rt92Ia/bpG9WzM9uZNT5tvAGl0g
	 zq8dhAIlzsM1ewm8TpYnGXK6uZ8kUC3baxoy/Tou8ZTlcFdeLqwYSxrqf964KMOhJJ
	 LhFmZcfrTglZfOJY1522QVD6F9zNsynbB9BgBxf9o/+HmGdpQjOMaACLLli//2IVdO
	 1K7kfjz5ArCKl1tflR6Xn1WCqOXx+WpjMEK4Kq7fMK3P0SRSjU7J5bqywXR/WaptEr
	 torRixbRVxncJa7DlZVz/SBpkXoLg4ma7GoEMM8paT0J7IxFnH2A1XesgYLHuWPADc
	 Cmq4cbc5xxuKg==
Date: Thu, 12 Sep 2024 12:23:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Application <application@irondevice.com>
Subject: Re: [PATCH v2 1/3] ASoC: sma1307: Add driver for Iron Device SMA1307
Message-ID: <9c672897-3470-4994-8f22-3e1911ef3c36@sirena.org.uk>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-2-kiseok.jo@irondevice.com>
 <51e05109-049f-4efa-b923-60943fe82777@sirena.org.uk>
 <SL2P216MB23371B88485C16DF14A274058C642@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wUoJipqS0jGmv+Ga"
Content-Disposition: inline
In-Reply-To: 
 <SL2P216MB23371B88485C16DF14A274058C642@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
X-Cookie: Happiness is the greatest good.
Message-ID-Hash: Z5T2GOUJUF6LLWUKW3OVB6CZ4A2ALDDK
X-Message-ID-Hash: Z5T2GOUJUF6LLWUKW3OVB6CZ4A2ALDDK
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z5T2GOUJUF6LLWUKW3OVB6CZ4A2ALDDK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--wUoJipqS0jGmv+Ga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 12, 2024 at 08:35:05AM +0000, Ki-Seok Jo wrote:

> > > +static DEVICE_ATTR_RW(check_fault_period);

> > Any reason the fault stuff isn't an ALSA control?

> I'm planning to change it to ALSA control as per the feedback.
> Could you please let me know how to set the default value for a control?
> For example, I would like to set it to a value of 60.
> (For controls with a boolean value, I would like to initialize it with a true value.)

For something like this which isn't coming from the register map you can
just pick a value and set wherever the data is stored during the CODEC
init function.

--wUoJipqS0jGmv+Ga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbizxUACgkQJNaLcl1U
h9BTLgf/Ua7Ov5hjGscJFUzYbRL9HCfAEC0w6vw+uu7adii69RTeDHc70LFCy/zq
gFNQ3oXSfwTCwFMiTBdEibyni2fbNWeAvQIT0ouGOcx5q2UOIko5tPMRexboNcQN
5OCDh+8AMjcgrk4btDzwhGCZPbU0/XatSVGFZheCbXkfp4rsERSfemTEE4zRz0B0
eexOHmpqLOM0Mp480ZhgEXdd7WffkZtfHWF8iStuIJquqlnON+CF5Ie+U2e8B/bs
WTae7DVRD0R+gm3jgn2RpcTdooqY460vicDEU1AhbQRG3FJ+ThRJIRFsxR+xwBJd
d+o632wkwU7kga9nFeME0oZCw2PiFQ==
=rA+w
-----END PGP SIGNATURE-----

--wUoJipqS0jGmv+Ga--
