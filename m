Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6882B7A63C7
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 14:51:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94376DE5;
	Tue, 19 Sep 2023 14:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94376DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695127908;
	bh=Ts1/vWR8E3gSY5HRxTv0W2ImXFgrzR2SUe8PTVj4SZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cT4ytEsKMSFW9aqhL+taxhmxbAJKJMjVQG8zbuhDHaCx9VBlyIJvL9xYkzD6PMLJ3
	 KHOVBDV9H9QMnfi+fh8DqMef+ywdxwbnivhMUspLlDSBPSHUMPO4PmkWcbs2Rfh1cZ
	 nl9XU5T/A+0PXjpHxCtIdTWaxt767o4Btmo/05OE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96418F80558; Tue, 19 Sep 2023 14:50:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12469F801F5;
	Tue, 19 Sep 2023 14:50:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF5C4F8025A; Tue, 19 Sep 2023 14:50:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69EA5F80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 14:50:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69EA5F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kOghHXoD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id F32EFCE11A1;
	Tue, 19 Sep 2023 12:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D249DC433C8;
	Tue, 19 Sep 2023 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695127815;
	bh=Ts1/vWR8E3gSY5HRxTv0W2ImXFgrzR2SUe8PTVj4SZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kOghHXoDUB4dEyyHKxw2EacQTYG9fvn3lN6HDaacXpqqhAUSR/sTcEiLlIw1bSlAg
	 SONKr0PPh1SRcZo/MaeCk0OD0rg2RcqggPshcXkhdBTETg5x7uEg1IYOqv+1K91UIB
	 ZTfOOm5maevxxe/9JjOlzJlRMsIAti+YNUOpY/XE7lxRNOP7tXOnRgdnEJDAimH9tv
	 9P6BCiCSNLpqXFjowTlWzoDeOo7pLI2cL06dioPlnjOVnUesh5/WXCNU+GsRfjJp3V
	 afDhehT3CKghdPx6yO2etw25zwB6Gxv6YdBPf6edX0odE0jN226+pd/d9ueLwZFT6g
	 BCdULh2Ylic6A==
Date: Tue, 19 Sep 2023 13:50:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH v2 04/17] ASoC: pcm: Honor subformat when configuring
 runtime
Message-ID: <8ccb2246-e13f-4eb9-8f30-282e9393c378@sirena.org.uk>
References: <20230918133940.3676091-1-cezary.rojewski@intel.com>
 <20230918133940.3676091-5-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n0pDs6gLIE0P1lGy"
Content-Disposition: inline
In-Reply-To: <20230918133940.3676091-5-cezary.rojewski@intel.com>
X-Cookie: You buttered your bread, now lie in it.
Message-ID-Hash: 7DDSBIN4HWLFCUGM54YNV4THWAH7FLY3
X-Message-ID-Hash: 7DDSBIN4HWLFCUGM54YNV4THWAH7FLY3
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7DDSBIN4HWLFCUGM54YNV4THWAH7FLY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--n0pDs6gLIE0P1lGy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 18, 2023 at 03:39:27PM +0200, Cezary Rojewski wrote:
> Subformat options are ignored when setting up hardware parameters and
> assigning PCM stream capabilities. Account for them to allow for
> granular format selection.

Acked-by: Mark Brown <broonie@kernel.org>

--n0pDs6gLIE0P1lGy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUJmQAACgkQJNaLcl1U
h9A6awf+PY0Y+zudo9IbDfYa/9MYiw39Gkb+3so1yGFmDmyeFJmv9eWXgKHk3/sA
y6SK3x8ky2mkCf1qeuHrq6JboAEawu4rXjqJYUPRAZ9jO9nUul1Y5WzrtoKdHND4
Ge3yPAOZjprKRr6be/F0yR/OvrZruTAeYy/UYP/4kjDAGKJZn/t+OlobSV6mjdlP
FQzPCKeMkO5XoudDwhrvK0rbu7YSuiYqeOdbCy5T7Y+Kd0tv/O2eA563r/hf2g9G
t6uZauyjLbp+4JPl4rg4RF9EmrQX+yNWRnnRzEhSe7/jc+GdHO+uhD3zVpMoPP1p
7xX5jHc6T9j88xooXFXmhk0V2f8EuA==
=CMEX
-----END PGP SIGNATURE-----

--n0pDs6gLIE0P1lGy--
