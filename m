Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7685A724890
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 18:11:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB2EF823;
	Tue,  6 Jun 2023 18:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB2EF823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686067881;
	bh=gRgcx3PlM1lkDs/ejUMYDSVg/Hy+quxERjLKcCkMACM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E01QLWyGtaxdiiujpPbwFZf/RztV1M4ad+a/fUtBgoy4wrLoOFyqc7CVxwU+780QU
	 bW15XnDNXAmi5s1KVh9sETpUEVBcW41EpjqXv2HpKTLgzURxpRO/DBFmsCUalOlizO
	 nzqndwotPsDON0gXEbLVt6OxiTK874dfDfppHNLY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B93B5F804DA; Tue,  6 Jun 2023 18:10:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71008F8016C;
	Tue,  6 Jun 2023 18:10:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD0A2F80199; Tue,  6 Jun 2023 18:10:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E124F800ED
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 18:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E124F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hAZQk+On
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 19812612CC;
	Tue,  6 Jun 2023 16:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB1AC433D2;
	Tue,  6 Jun 2023 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686067820;
	bh=gRgcx3PlM1lkDs/ejUMYDSVg/Hy+quxERjLKcCkMACM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hAZQk+On2KXCEEAO9ksHbkS7d3It/UE7DcVEcHqfVi48gnnZR/OT2AIjZ+jjyEIri
	 p1DHw9bGh5dRBvbnesVuKNwxRSOXTdtMV03eTh+PFvU4YFgPgibrm8ZurACIykorFt
	 Imxzr96VmZUaX9FMxduNL5OOaMZGmKQumJ9u0uA0atPU4MLHDDfeTmOj1vCHA/2PCm
	 lg9FvP4e7bY4hWqNAB8Kas4JAYEglD1UZkLUpx9GNulbCa2L9PU3/xYUI4BblSB6o7
	 Y132ddlFjV0SVyJGAro8FcxrUOB9kqnWzXOPDCftciXsLusNYDxI2M9OQskTwjwmw5
	 Dz+SUVB33iAzA==
Date: Tue, 6 Jun 2023 17:10:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Shenghao Ding <13916275206@139.com>, devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
	shenghao-ding@ti.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com,
	navada@ti.com, gentuser@gmail.com, Ryan_Chu@wistron.com,
	Sam_Wu@wistron.com
Subject: Re: [PATCH v4 5/6] ALSA: hda/tas2781: Add tas2781 HDA driver
Message-ID: <65ef4914-dc0e-4f0f-a6f8-3016931488bd@sirena.org.uk>
References: <20230527223613.11106-1-13916275206@139.com>
 <874jnkfu98.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lEOJfeNRUJcYTo9Q"
Content-Disposition: inline
In-Reply-To: <874jnkfu98.wl-tiwai@suse.de>
X-Cookie: Keep out of the sunlight.
Message-ID-Hash: 6LRQJSHPAZO6RDGSVGL2YWEAF622BRHG
X-Message-ID-Hash: 6LRQJSHPAZO6RDGSVGL2YWEAF622BRHG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LRQJSHPAZO6RDGSVGL2YWEAF622BRHG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--lEOJfeNRUJcYTo9Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 06, 2023 at 06:08:51PM +0200, Takashi Iwai wrote:
> Shenghao Ding wrote:

> > +	//Lenovo devices
> > +	if ((subid == 0x387d) || (subid == 0x387e) || (subid == 0x3881)
> > +		|| (subid == 0x3884) || (subid == 0x3886) || (subid == 0x38a7)
> > +		|| (subid == 0x38a8) || (subid == 0x38ba) || (subid == 0x38bb)
> > +		|| (subid == 0x38be) || (subid == 0x38bf) || (subid == 0x38c3)
> > +		|| (subid == 0x38cb) || (subid == 0x38cd))
> > +		tas_priv->catlog_id = LENOVO;
> > +	else
> > +		tas_priv->catlog_id = OTHERS;

> Hmm, I don't like checking subid here, but we can live with it for
> now...

Might be more idiomatically/neatly written as a switch statement though.

--lEOJfeNRUJcYTo9Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR/WmQACgkQJNaLcl1U
h9DX7Qf8D1/so4MXwyyoryqUqBwhZILjp3cE1N3KqUivAOfiCwP4EU67H1I76Q/C
4FJiHX5VWstaLjPa0VyxetmE2HizEf1gZrwKlUWK8d1i4j9Z+17nCK9K51ErRKfF
+bh+7o3MQWugxzVVCbwtcErGwoM+qbh29rsQXpUqJLS26oTh1lE+/bafxZEJIl4t
Tl+UErh4wWdD+KspoYgN+E1DEhUdH5SexOrLOekZmvi5mZMT8dXeeiKaHgo4Xvx9
v1UjUVA/kjgVlAx9dR4SyQPYvol76iAxv4EU/jWaR1IPh8lVEHR/wKCCqMAUduy8
f0MrL9Fm9g0HhxzaljsrSH9P2xUPzg==
=MogT
-----END PGP SIGNATURE-----

--lEOJfeNRUJcYTo9Q--
