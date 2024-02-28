Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF81186B5DD
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Feb 2024 18:23:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E1DD93A;
	Wed, 28 Feb 2024 18:23:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E1DD93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709141025;
	bh=evNttuUon9tazsxXMKIkVG5dhOyYfZ8Y77/5OFQehaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J68vsbjeMCh3aX3pPjIZPjekX2SzN+JuuG4y3jIlVVzaDnqd2pB8CsM9v5AYaoJl1
	 Ry99o7dvUWPKtPm9Vmr+59sWqkvZ8UIHIIOJTlxLMSEIe5pGvKcdD7OSsZODgoeiPI
	 jst4fx+QKszUCTNkaqBcluJVCY0WZw7SDIxXWzLQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 587FEF8057E; Wed, 28 Feb 2024 18:23:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAC4AF8057E;
	Wed, 28 Feb 2024 18:23:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DD0BF801C0; Wed, 28 Feb 2024 18:22:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D31EFF8013D
	for <alsa-devel@alsa-project.org>; Wed, 28 Feb 2024 18:22:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D31EFF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=s08hT55s
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DFB9C618FB;
	Wed, 28 Feb 2024 17:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED270C433F1;
	Wed, 28 Feb 2024 17:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709140958;
	bh=evNttuUon9tazsxXMKIkVG5dhOyYfZ8Y77/5OFQehaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s08hT55saQcImzVbA/nOrLPJ81PDdmdEqxrRsCDnGEUqVZjp9wC+CjyzvQUEzAssl
	 MVIGIWukJrhTryxVC8yZZZFVWC3gLdtE/d0qD3z/QftuBbKPSDgua8LDsTK/rfRtsl
	 dUt/7M/K7/JQjpRysU6kmIcGWn3On3u5p+NFGOnineflpS8HL4Mi9iUB2+djrsbU8/
	 APcPiVMZPbcQJU4PRFP6dJHMp0958yP3u12xOcMaZrmKnH39ivNwGXo9wWDNTttsiH
	 emjT3VgOXN6qZkOozt/1/kKGx98I7clto+Kw+BPW7N80Hrz/98EqNgK+cvrrpJuK4K
	 2WXrxjOGTQkMw==
Date: Wed, 28 Feb 2024 17:22:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	tiwai@suse.com, perex@perex.cz, jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH v3 3/5] ASoC: Intel: avs: Ignore codecs with no suppoting
 driver
Message-ID: <d7a5c567-b085-4eca-b12b-ff0626116b5f@sirena.org.uk>
References: <20240226124432.1203798-1-cezary.rojewski@intel.com>
 <20240226124432.1203798-4-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pfFywTWBH8wMNQLq"
Content-Disposition: inline
In-Reply-To: <20240226124432.1203798-4-cezary.rojewski@intel.com>
X-Cookie: Function reject.
Message-ID-Hash: V46P6OXJLKHVZDHG2TCWFGIO2CEEJBVM
X-Message-ID-Hash: V46P6OXJLKHVZDHG2TCWFGIO2CEEJBVM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V46P6OXJLKHVZDHG2TCWFGIO2CEEJBVM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--pfFywTWBH8wMNQLq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 26, 2024 at 01:44:30PM +0100, Cezary Rojewski wrote:
> HDMI codecs which are present and functional from audio perspective lack
> i915 support on drm side what results in -ENODEV during the probing
> sequence. There is no reason to perform recovery procedure e.g.: reset
> the HDAudio controller if this is the case.

Acked-by: Mark Brown <broonie@kernel.org>

--pfFywTWBH8wMNQLq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXfa9gACgkQJNaLcl1U
h9AU/gf+I3nstWc8uH7TGRyZ4L+HznVtBLiaeJINkFfzFFNX6FdxdDY3JEMvitjj
IR/v0m9u2n94Z8SmE+T2dqKhdOD1ARfxIwHPZ5JoxCn0RBj/Lo+7M4qLTo2xzSzy
czj9qzLOAgIP4WNv+XVcZ8CVRfv/nSvx/ZIfM0K8+dz0aqjTLMMSTbZ+vxlkM42D
wLkMI3M2pp7J43ltS5ha7qvehHyQ/7P1/BC2TxQp6p4z+M4hGyTu6Glru1KE/nDz
QCJJ+z6FnX+Q13Fq17aD1lg2xbjixOcrDWgDgb16dhO4tpzXoP36zRIuorrl56og
9SxnRsI8090hDwXKMVXe5KIsO8bOGQ==
=KbLi
-----END PGP SIGNATURE-----

--pfFywTWBH8wMNQLq--
