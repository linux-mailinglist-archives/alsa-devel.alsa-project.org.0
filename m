Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD2195A867
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2024 01:38:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61E15827;
	Thu, 22 Aug 2024 01:38:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61E15827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724283538;
	bh=B7xbRhm6CKenuCvtsd4uC2BlZR6NQjvVgt3sZ6lJUYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ageaej6X/yLfCzCtdHy5tYmKA9DfK+ZNIFpU6vKEQED4tuJ/CKz85U25vsvgvw6kP
	 yFMWOG0zgXxvDopPicnS5j3r2lhwV5MEC4J6bXCAO/ut9oHdad74Hd+kLLNiiZaq6h
	 RLHS8N3oI14XOofjPsKvOSau0uvKz6qqRC8MPnrs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4353F805B6; Thu, 22 Aug 2024 01:38:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC422F805AF;
	Thu, 22 Aug 2024 01:38:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 537F0F80496; Thu, 22 Aug 2024 01:38:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FAFEF80107
	for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2024 01:38:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FAFEF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q847W3U/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7A4D0A4050C;
	Wed, 21 Aug 2024 23:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB77C32781;
	Wed, 21 Aug 2024 23:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724283490;
	bh=B7xbRhm6CKenuCvtsd4uC2BlZR6NQjvVgt3sZ6lJUYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q847W3U/7lguQ3lSku6eNK4vewqjReqefPBw5AxbYXRwC6HW03V+xPyT0Pk4WtlL7
	 3wTX6KyKIZ7p7wtR+5/C2JL6tD+KTeCfbu4YvFKYoSOOukzP23nI0gRlOn5MQ7W3IH
	 4hatNiAFrxtCmQzy/xBs2FNMAGBwhHuwU4nZi2oHETOeiYEZEPM7INDz0kUZlm6j+3
	 xz/lTQxUno9vxdiEja+kpYVYTNOTL2/qI3zBkjIQ9t1jOr8FDjYirfjPuW7efjuBL7
	 +1hxNYm6p37AQwgs93SMCq6F44pqREFEWvKsoDBbrA5DvAzR8Prdo+fgSX0JRWjrIq
	 WMkZl8tidEGOA==
Date: Thu, 22 Aug 2024 00:38:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v2 2/2] ASoC: soc-pcm: makes snd_soc_dpcm_can_be_xxx()
 local function
Message-ID: <a25ef02b-89ab-4f47-8174-b0bd67031955@sirena.org.uk>
References: <87le0qa9tc.wl-kuninori.morimoto.gx@renesas.com>
 <87ikvua9sf.wl-kuninori.morimoto.gx@renesas.com>
 <110f01db-f5e2-46ff-a3cf-90e1b00d289a@sirena.org.uk>
 <87v7ztjw9f.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DBTGD1fKlBQSQkEQ"
Content-Disposition: inline
In-Reply-To: <87v7ztjw9f.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Whatever became of eternal truth?
Message-ID-Hash: B3GVLGGOYMLPXITZJVQTUN74BA2HV47V
X-Message-ID-Hash: B3GVLGGOYMLPXITZJVQTUN74BA2HV47V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B3GVLGGOYMLPXITZJVQTUN74BA2HV47V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--DBTGD1fKlBQSQkEQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 21, 2024 at 11:23:24PM +0000, Kuninori Morimoto wrote:

> > > No driver is calling snd_soc_dpcm_can_be_xxx() functions. We don't need
> > > to have EXPORT_SYMBOL_GPL() for them. Let's makes it static function.
> > > One note is that snd_soc_dpcm_fe_can_update() is not used in upstream.
> > > Use #if-endif and keep it for future support.

> > We should just delete the code if it's not needed, it can always be
> > re-added later.

> The reason why this patch try to keep the code is that 2 functions
> (for fe/be) determination methods are unique. But be is used, fe is not
> used.

> 	snd_soc_dpcm_fe_can_update()
> 	snd_soc_dpcm_be_can_update()

> Of cource we can remove it and re-added later, but I'm afraid the person
> who will re-add it might not noticed that there was a code before, and
> re-add different determination methods, etc.
> To avoid such things, this patch disables it by #if-endif.

> But I can post v3 patch which doesn't have unneeded code.
> Please let me know which one is better.

I can see the symmetry argument, I don't know how other people working
more with DPCM feel though?  I think either the function should be
removed or it should be left with in #if 0, it's those that are the
issue with the change.

--DBTGD1fKlBQSQkEQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbGel4ACgkQJNaLcl1U
h9B01wgAgpL/MraFXrDVdMtIKjrSVF0K2OeWTZ/41IoaKZ6LRUlaTH0HtFmpwk38
4FRN8orRTSaayraHjLt0U5ef4GHigT2S8Pz6OvU1xnvqNsVRNJe12FySj4NjgVBu
YupBkZ3liG8IfsqIaSgjMIv3IAInL2N+zBicSJdUhHfY85s303n+2Ryjn3a29Tfu
IsnZnHXm+Eic1y15BkkzDHTCBPduZ53DhtVXY6HIyuHTgkBrDMJ+sMKX1n6LScog
eegNZZt+tcIPguzQ4Yew3XTS0q0mgYSzmZHgRXUvBjPviCVU37M9rSXE258qmuu8
a7E5CvDQi8J/l/+dANc/sHTy1XrPpQ==
=e7N7
-----END PGP SIGNATURE-----

--DBTGD1fKlBQSQkEQ--
