Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 424BD72E715
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 17:25:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EF06E88;
	Tue, 13 Jun 2023 17:24:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EF06E88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686669900;
	bh=Mi+mI7N46ZxzzZLb/TXUcDy1ynizAZzA47svx3Q14sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X4b/2KoE0UcoeZC3GXCxcsvKzVs4WimnFKve8Wik0oOAV/SxUp4o+rdZfhdTMNHml
	 mifFI/4ZCiQEF+yYZP4UsosRjprLeyfqDKl+Yry0klHizjG/jB65Kt6KeH2goXzGVT
	 7oLwogYjYl3U0EDAjGT5jUmPlsHHd+PH+QhTetxU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCD2DF80553; Tue, 13 Jun 2023 17:23:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A280F80558;
	Tue, 13 Jun 2023 17:23:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34F47F80544; Tue, 13 Jun 2023 17:23:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F211F80533
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 17:23:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F211F80533
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=maobcKQo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 27A656310C;
	Tue, 13 Jun 2023 15:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED41EC433D9;
	Tue, 13 Jun 2023 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686669813;
	bh=Mi+mI7N46ZxzzZLb/TXUcDy1ynizAZzA47svx3Q14sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=maobcKQoh6GI014NM4dpO69qO3Z32zkLGDzKUc3qUJlLtIi5jKuQUArg/20JvSxgi
	 OlBlaGd/IKH9xxJdWythhnPj7hSjP9a6xsUY8o+EytJbAqqlP+1nXMlAWLoV6ibIdA
	 nsIfpSJZvrrLQ3H/hJ2WBozgqZKS329hcqeaRPQrKTyEOZSt21I7X0Vgw51dKTy00w
	 mlLYbAX/gEzk6nWdRto5freDs7B+KHZgRwGloAh1f2yfOdMmiwfNyjc0aF51Wpir+l
	 seMNpfqifr6ept0O6vK4tWR4JZRnXFgPCxNPp/5kFvogGvHWErWJ7sz0wphWLyTRZ/
	 RkexTX+4bH1Iw==
Date: Tue, 13 Jun 2023 16:23:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Yingkun Meng <mengyingkun@loongson.cn>, Conor Dooley <conor@kernel.org>,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org, lgirdwood@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: Re: [ PATCH v2 3/3] ASoC: dt-bindings: Add support for Loongson
 audio card
Message-ID: <fb8ef8e7-15d2-4fc3-8d9b-4edf1b3bced1@sirena.org.uk>
References: <20230612085614.3039498-1-mengyingkun@loongson.cn>
 <20230612-booted-french-186dd95e78a9@spud>
 <bda7c25f-65cf-d45f-3ac0-f2471e3aacf8@loongson.cn>
 <20230613-zoologist-panorama-a87858bba075@wendy>
 <887f9cc4-6457-9d14-8aef-011ff4c9aeda@loongson.cn>
 <20230613-depletion-garnet-ccc2009111c3@wendy>
 <449d07d9-5538-4f36-83a0-3a81a9ab9ea2@sirena.org.uk>
 <20230613-crewmate-levitate-597ab96ea2d7@wendy>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l11+GZHPld2NB1XO"
Content-Disposition: inline
In-Reply-To: <20230613-crewmate-levitate-597ab96ea2d7@wendy>
X-Cookie: Not a flying toy.
Message-ID-Hash: 7TJQA7ZZUNRE5ILFMRZXHPM7NMQIC4PY
X-Message-ID-Hash: 7TJQA7ZZUNRE5ILFMRZXHPM7NMQIC4PY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7TJQA7ZZUNRE5ILFMRZXHPM7NMQIC4PY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--l11+GZHPld2NB1XO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 13, 2023 at 03:29:33PM +0100, Conor Dooley wrote:
> On Tue, Jun 13, 2023 at 02:54:36PM +0100, Mark Brown wrote:

> > are also important to the audio configuration.  A card binding describes
> > the interconections between the devices in the system and provides
> > identification information for the audio subsystem.  This system level
> > audio integration is a physical thing that can be pointed at that
> > requires real software control.

> The bit you were responding to with that was a disingenuous question.
> Probably not fair of me to ask one of a non-native speaker like that,
> when all I wanted to know was whether it was appropriate not to add
> a more specific compatible, or whether this was something invariant.

I don't think that's particularly useful - you'd end up adding a
compatible for every single board which we've got no real intention of
adding except in the cases where we end up being able to merge a more
specific machine driver into a generic one.  It'd be more likely to lead
to bikeshedding than anything useful I think.

--l11+GZHPld2NB1XO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSIie4ACgkQJNaLcl1U
h9AEeAgAhZ6Nnbye3sNtvMwQaRERwepufwIWsUfpfSJkhRHcfJsVgVpsigqOkqQm
Ww5V12dg4E8ljvAjGNUDrwAJ98LcmRikl5uE6P06jl6ujwtdoUQ1M7WfAQW15+is
NGYylD/mE4SSGcuvHhxpgKOOISsVvyu4LI1/6ZDZbMF33Uas9HRRixagjcVgJawG
ySBXnlv/WS2GKJ06X0LhRAYGgDHXqsGoxu+cDw+RrTMd8pHoZElVNefvdNI62ZUy
LHRMc2YaiyDxkvZVdrJ3jJhzUAPVcehEVCgCWmKeSN0ht55OmoBnNhKXUcWIv0Zd
ZO23yw2R7z5P8Q7aEAJ208kmhU+4rg==
=v32h
-----END PGP SIGNATURE-----

--l11+GZHPld2NB1XO--
