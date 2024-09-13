Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C94B09785CE
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 18:32:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8BD5B76;
	Fri, 13 Sep 2024 18:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8BD5B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726245177;
	bh=BcbLsJ+E0JCcewxIt4ozfn2rIALLXnWZgLE5/Mkax7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IpcB55/opUFHofiHUdyqr/mT6hwt36E2ximiVGPcebRWynCy3Y5lxWu8+8fVS+980
	 jG7DE1beBfk0rwK6Pv+8gdo0Imq3zECHF9pv6MPJxOzmoGzBYNwlNc5i39I7Mw0amg
	 iQ6wGW/whaVI+qpFF0ky/8rmeV6jxAuDu7zQKrxc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FC32F805B3; Fri, 13 Sep 2024 18:32:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5EEDF805AA;
	Fri, 13 Sep 2024 18:32:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3D94F801F5; Fri, 13 Sep 2024 18:32:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B3B2BF80074
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 18:32:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3B2BF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tjATxHBV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 37B40A43283;
	Fri, 13 Sep 2024 16:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BF5C4CEC0;
	Fri, 13 Sep 2024 16:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726245137;
	bh=BcbLsJ+E0JCcewxIt4ozfn2rIALLXnWZgLE5/Mkax7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tjATxHBVDxX6BFEQdu/QTEge+COGQBoOOFhOUsAaglrBJ95DVy3eflJjZhfHpFIpf
	 uj/81u+s24kIpdQjkJ8vl2o9eROynDxKV7P7q3l2rQ+l1BC1/gA/WEAAZVPH4bx334
	 aLB2PBqQo/H4PAm7QPapKIMpkYi0e3cVBSE42+1xbSCYaJrQdogyFcg6XeSSGC2tjj
	 X7lYh/DmvbEpd4GTUNLK0oXOnszPIZhZDdqxg0yXberL+pSwGQuKAKD65SeWm6hO7T
	 Z66QSGyW989N3IHJwufPnMYt4uAI/86EKHIHCa6LsGxd98DdPFdb738X6GkpHbpUcX
	 hzvjTwchuZfKg==
Date: Fri, 13 Sep 2024 17:32:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] [RFC] ASoC: Conditional PCM support
Message-ID: <cce327f2-03dd-4c6f-9218-e54aa76a78e7@sirena.org.uk>
References: <20240821101816.1494541-1-cezary.rojewski@intel.com>
 <83f81553-6dfa-46a3-9ca2-d42f54295eb1@linux.intel.com>
 <d5db8a15-64c9-45be-8f8c-977fd5ed282b@intel.com>
 <2ac45376-5df6-44e9-83d6-cdea49eea916@sirena.org.uk>
 <b95e8c62-db61-4678-8c2d-2224dfb1dd60@intel.com>
 <67b30310-6fbc-4d1d-926b-f4cc7bf68896@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UaELuzA42Q0pL3aG"
Content-Disposition: inline
In-Reply-To: <67b30310-6fbc-4d1d-926b-f4cc7bf68896@linux.intel.com>
X-Cookie: In space, no one can hear you fart.
Message-ID-Hash: 4SEIUPG5FFKMLXHZWAEXEY3EZI4JSW62
X-Message-ID-Hash: 4SEIUPG5FFKMLXHZWAEXEY3EZI4JSW62
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4SEIUPG5FFKMLXHZWAEXEY3EZI4JSW62/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--UaELuzA42Q0pL3aG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 13, 2024 at 01:53:41PM +0200, Pierre-Louis Bossart wrote:
> On 9/13/24 12:59, Cezary Rojewski wrote:

> > Instead, I'd suggest to have a second, separate DPCM implementation
> > present next to the existing one and have users opt in during a so-
> > called deprecation period of the existing one. Once certain amount of
> > time passes, switch all of them. Clean slide also makes it easier for a
> > developer to be creative.

> > Do you view the second option as viable?

> Classic problem without a good solution. In practice new features or
> corrections get added to the 'old' framework and the new one is not used
> by anyone just yet so it keeps running behind in terms of
> features/maturity. And due to limited validation resources or limited
> access to a wide variety of hardware, no one is quite ready to enable
> the new framework on 'old' platforms because that would break quite a
> few devices.

Yeah, there's no idea way of doing things here.  I do think that keeping
things going in parallel is probably the most viable way of doing
things.  You'd need at least one lead platform using the new stuff, and
probably each platform would have a flag day to transition.

I'm a little more optimistic than Pierre about making progress,
hopefully things would be sufficiently nicer that once there's something
to build on it'd start to get more attractive to do the incremental
investments needed in the core to enable more platforms, and reduced
maintainance costs get more appealing.  This approach has worked for
other things (regmap springs to mind, and if you look at some of the way
API transitions are done in the memory management and arch code there's
a bunch of this going on) though it's rarely fast.

> The other problem is that the 'switch' would mean a compatible solution,
> but the problem is to get rid of the very notion of front- and
> back-ends. Existing users of DPCM have undocumented hard-coded
> dependencies on the order in which callbacks are handled, it's not easy
> at all to change the routing engine.

Each platform is going to need to be pretty careful with the conversion
and validating that things work.  There are some simpler ones which will
probably have an easier time of it, though.  There's some of them like
Kirkwood that are just at the lower end of needing DPCM support at all,
and others that didn't upstream so much stuff yet so there's less
knowledge embedded in the upstream code.

--UaELuzA42Q0pL3aG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbkaQsACgkQJNaLcl1U
h9DYCAf7Br1R0ar6NcUU7odqkM+D7kigPVpmNj6OaA2+A+yQqjOs5phzcAFsvJXG
ku4ARFeur1jhko/+VUEtnXtfmvm90RjLoGAS3VSaewUT5Yv7hHoAOCmYUsxUSJTE
Z3CeZb1sWyPkV8HRkRGiJ44Q9neD37veiDjnngebHwoMXW1eeOY7O8ESvhmw4dxB
VnDheeUpCJ8SER51whR8bou2zo7ztjeihCYJ9+wNsoElsqPVUcYUg5OOv2xboRnH
6ZGPxIrK6oWFvZq2oUs5qIdK6j52usbyZpcedvtTzOnwKURk9le+JiPPsEWwU1sf
8vhiTGJCBJbKGwqIcl17Bvh87LoSfw==
=5j+R
-----END PGP SIGNATURE-----

--UaELuzA42Q0pL3aG--
