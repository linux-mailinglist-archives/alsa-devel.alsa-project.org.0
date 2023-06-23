Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 799CB73B4FF
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jun 2023 12:16:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7141A857;
	Fri, 23 Jun 2023 12:15:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7141A857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687515398;
	bh=/aSXCSqv/VKsWuNl5ddGk7ozs2KUpTx2lvAt2RmeF3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hGtxzYe0TK+mZvYZ0bRzxxND5ltfcuACq0Yy5m3lyM5r9dG7L8K+GMqJn+AIcm86L
	 nDfT/c9SVNBNuLAzmBgCBz03CdLAlRDivPErsJkHOCrQ7w1NZW055TEQ0K2g2ZjmJj
	 TmjWmgDc6PvSue/cy7N/ulv+FLvYrXFbahaaX2jk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 707E0F80544; Fri, 23 Jun 2023 12:15:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4607BF80130;
	Fri, 23 Jun 2023 12:15:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DA05F80141; Fri, 23 Jun 2023 12:15:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D37CAF80093
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 12:15:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D37CAF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JxkTY8En
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CCCC0619F1;
	Fri, 23 Jun 2023 10:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B31C433C0;
	Fri, 23 Jun 2023 10:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687515305;
	bh=/aSXCSqv/VKsWuNl5ddGk7ozs2KUpTx2lvAt2RmeF3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JxkTY8Enhzt7H27iMQEXUf2PbJWEQa9lEfZ17TkIvKUN9+8mC5+mr9/dMY5EOktns
	 Tfb9ZnNv22yKQxYJaWgiamaEs1vSkxDUl+6OvJLo/lrtl6ElygDBccyFm7ENPT8EGT
	 FSa8cooDxj5QGu37PCaBw/gjYbp/buOMZ1r9hvXaMG7CQL84zO8amPpc6tGI7ZFGEw
	 onNGQfXEZ5IoxPAOT3Kq3FrlFZaA6KGgqWtHxoqhkCYwfU8Hys/l7pPQcrYU+rVzIj
	 2xec7N955iYgAeLM8plG5wNLEI9B0KBZapjgi1dpAbnbCXPhoFNFRoD+BG6hlVGFW7
	 EKRG1WR2lHbIA==
Date: Fri, 23 Jun 2023 11:15:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Cc: robh+dt@kernel.org, krzk+dt@kernel.org, thierry.reding@gmail.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	jonathanh@nvidia.com, mkumard@nvidia.com, sheetal@nvidia.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/8] ASoC: tegra: Fix AMX byte map
Message-ID: <ZJVwpE5KeL8rgvB9@finisterre.sirena.org.uk>
References: <1687433656-7892-1-git-send-email-spujar@nvidia.com>
 <1687433656-7892-3-git-send-email-spujar@nvidia.com>
 <ad4b4dc9-7466-45a9-a008-c2301a7485dd@sirena.org.uk>
 <7893c366-e6aa-d606-c3d6-e85f73a345e0@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vnl+KoOKISxFJemC"
Content-Disposition: inline
In-Reply-To: <7893c366-e6aa-d606-c3d6-e85f73a345e0@nvidia.com>
X-Cookie: Slow day.  Practice crawling.
Message-ID-Hash: C2FOBH2EETZ7XP4RK3XQN6EP3HFB54WT
X-Message-ID-Hash: C2FOBH2EETZ7XP4RK3XQN6EP3HFB54WT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C2FOBH2EETZ7XP4RK3XQN6EP3HFB54WT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--vnl+KoOKISxFJemC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 23, 2023 at 11:09:32AM +0530, Sameer Pujar wrote:
> On 22-06-2023 17:37, Mark Brown wrote:
> > On Thu, Jun 22, 2023 at 05:04:10PM +0530, Sameer Pujar wrote:

> > > Byte mask for channel-1 of stream-1 is not getting enabled and this
> > > causes failures during AMX use cases. The enable bit is not set during
> > > put() callback of byte map mixer control.

> > > This happens because the byte map value 0 matches the initial state
> > > of byte map array and put() callback returns without doing anything.

> > > Fix the put() callback by actually looking at the byte mask array
> > > to identify if any change is needed and update the fields accordingly.

> > I'm not quite sure I follow the logic here - I'd have expected this to
> > mean that there's a bootstrapping issue and that we should be doing some
> > more initialisation during startup such that the existing code which
> > checks if there is a change will be doing the right thing?

> The issue can happen in subsequent cycles as well if once the user disables
> the byte map by putting 256. It happens because of following reason where
> 256 value is reset to 0 since the byte map array is tightly packed and it
> can't store 256 value.

...

> > > Also update get() callback to return 256 if the byte map is disabled.
> > This will be a user visible change.  It's not clear to me why it's
> > needed - it seems like it's a hack to push users to do an update in the
> > case where they want to use channel 1 stream 1?

> Though it looks like 256 value is forced, but actually the user sees
> whatever value is set before. The 256 value storage is linked to byte mask
> value.

> I must admit that this is not easily readable. If you suggest to simplify
> this, I can check if storage space increase for byte map value can make it
> more readable. Thanks for your feedback.

This could definitely use more clarification I think.  It's not obvious
that storing 256 won't actually hold (and that should trigger a
complaint from mixer-test if that's what happens).

--vnl+KoOKISxFJemC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSVcKQACgkQJNaLcl1U
h9ChNAf8Dc9guHHicnKRVmRXvQ/BAUbK3nW/Sj1OA5p9qg7p+/GYuii6LDx6P9Ot
Is7FImWjHZSLY9pG2ym1CvV022stiZ54g4B/Wqmh7MTerAOrdu0RddPMo9zn/dP6
mTQLPLwYKcd/p+3DFvDQIjJPsik21pCP/p/6nwNIyJvabevapr9bPEpbU6e+4gYb
BE7RDSx/sen2JbDP9a5RjDt/SgGVinAaEUVtDxcOyPXYN0IZ1JawmJd7NG7mLJg7
yZauxzEyW0sEPPFcG0tjnLGcmOfQOhm28dsG0T+05fUBS+SPArut78CmDeyxXsHz
BV2BrsupkV3HVoa2IaGFb8jyms2lng==
=BPLR
-----END PGP SIGNATURE-----

--vnl+KoOKISxFJemC--
