Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9819C97455A
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 00:04:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF88583E;
	Wed, 11 Sep 2024 00:04:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF88583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726005887;
	bh=nANtCbEGch1km4xkErTueW+tgGVZb3bNVME4BOMGSfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PU1HGWjLlW+Mk/0LLbB7bKztw8g2WeSbNtwZvtChN/KvOkDgbjjAvnDETgYplQTpH
	 Bp05CTPGPe5Ei22DTfLDPbVOU7nJYO+PBueYyah2QVnEiNqWElrEcBSgyqjc9aIaSH
	 kG2HbcufKbhHLk9lda1Llg0vpQMcX66s5isaARbY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6F88F805A1; Wed, 11 Sep 2024 00:04:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F7B7F805AC;
	Wed, 11 Sep 2024 00:04:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2690BF801F5; Wed, 11 Sep 2024 00:04:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CD44F80107
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 00:04:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CD44F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mFg3heL/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C2A6DA400A5;
	Tue, 10 Sep 2024 22:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3455CC4CEC3;
	Tue, 10 Sep 2024 22:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726005846;
	bh=nANtCbEGch1km4xkErTueW+tgGVZb3bNVME4BOMGSfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mFg3heL/MwkexQqfywNygIYTri3JYVEWQCs+s0rcHCcxIykg0i73MK5h53K7kzsbv
	 QlA2p+xjbVmUcBqZsS5tkbOQ0k8E2cs7d1ijzjEP1SwiSQVnW9gtGm1KPrCMDcHNk3
	 jcljllPf+p2FbCTpg+Hkd3MzROCJKLarfNvf9QoDYfXq54ld2Swb6TUzPEFfaI/ceu
	 OeBtMSK7rmfGim0Gy0ZysSgOzcMlP7fwb3VtouQ0+M212CapoPEdi+UgvbC+yegFRO
	 0XfSB4M3ekRrr3vIErfZ+R16WvMsD1O73GHARri+5pC7MN2LGsx/GIDXs0+33PaYDT
	 Gg8UPIFeV0vCg==
Date: Tue, 10 Sep 2024 23:03:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Kreimer <algonell@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] ASoC: tlv320aic31xx: Fix typos
Message-ID: <a8e6f267-9eae-48db-8a8a-b9e6d93809c8@sirena.org.uk>
References: <20240910211302.8909-1-algonell@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X2MA07bZH1pe+BHB"
Content-Disposition: inline
In-Reply-To: <20240910211302.8909-1-algonell@gmail.com>
X-Cookie: You're not Dave.  Who are you?
Message-ID-Hash: 4KNO7DADPU6VHRQWCG6NLQHCLOCNWE6X
X-Message-ID-Hash: 4KNO7DADPU6VHRQWCG6NLQHCLOCNWE6X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4KNO7DADPU6VHRQWCG6NLQHCLOCNWE6X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--X2MA07bZH1pe+BHB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 11, 2024 at 12:12:41AM +0300, Andrew Kreimer wrote:

> -		/* See bellow for details how fix this. */
> +		/* See below for details on how to fix this. */
>  		return -EINVAL;

This is audio, bellowing seems entirely appropriate!

--X2MA07bZH1pe+BHB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbgwkcACgkQJNaLcl1U
h9BITgf9FDWYrZs0GMvGcamu6USwaHDlIZZsWkEWMT6/PmaATkePV2rM6GQ/qa7Y
CbT4iiWzr+4o6zgeVpP8XBkZhH2Ae1OSrvEPVseK6uLtUsEQmafNhtXQWYNoheuV
6PjN5bN8iDed8+rdy3A3tHxWtq6wv4mGaF80cWv5QoIstbdib9SFkhakn9XtCjrv
f3UGaqEQWTJuLqeeD6TgHg8EfL3YEj8SbyW10skBzw8FaIva2vWCYjXDGKwX1mrP
aEkg5gvaeJp4i49FDqOydzmS5hHrAUAoOdLh4hTr0qQn3q5ABhmPU2QC5K/0Irn0
2kTmCiOMufrnhYq7sMB49xlqGOAWWg==
=9XCi
-----END PGP SIGNATURE-----

--X2MA07bZH1pe+BHB--
