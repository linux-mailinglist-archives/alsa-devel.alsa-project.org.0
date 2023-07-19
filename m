Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A31759556
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 14:40:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 732F71F4;
	Wed, 19 Jul 2023 14:39:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 732F71F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689770423;
	bh=CmB+8wE+aQO1hdxAVJr7RrNwCnQwZePeGN7F20WkmUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bYZwbr4TiX5TPQfaEc78zawadVRiTwEJ8bcdpej6keq8hEABsnSviwHjuc5KGbrYk
	 hKpNoGSFwh73jyEvcRijQ3Wl6j3eTS8+GW0XGvkmf2J2ijQcuCbqsCCpUItg6i+YZz
	 SxPfW33NCckjT0Dfdk4bc9wPk/uZj3PAQYKSXecg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEB79F804DA; Wed, 19 Jul 2023 14:39:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86620F8032D;
	Wed, 19 Jul 2023 14:39:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BF84F8047D; Wed, 19 Jul 2023 14:39:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A035F800D2;
	Wed, 19 Jul 2023 14:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A035F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Sq9osdpb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 33253615C3;
	Wed, 19 Jul 2023 12:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1249C433C7;
	Wed, 19 Jul 2023 12:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689770359;
	bh=CmB+8wE+aQO1hdxAVJr7RrNwCnQwZePeGN7F20WkmUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sq9osdpb4LlrZNrRv7NAAl94NjzfcyLgKc4Ywwv7Ww+88IB1PHXkFjN+5c6dSCja+
	 PkN/yx6nAb+p2vzJpr7UW5tFEd38LxB6w+0DGJ74bg+irs8L0nxPhyTYdwAd62Zb5I
	 AJ8zP/zoU1Yl/JxbV9sTDnq2JPnW+qNpuZLJcPKrb0voPV8QQjTGjLwybmymx6jxcb
	 xVgX2KixbSR0PTVnYgAY6jwQZRqd5reDEz5DxoMz2YAWGFGOK0wDq5fCOwOKogT33S
	 UehFEcv9agZig6BYKScZ+2RcX1d3EIDA/54RKQma1F7gCVLbRqNK+7kLjZT5izrtEc
	 XNJgpYer49pEw==
Date: Wed, 19 Jul 2023 13:39:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Alsa-devel <alsa-devel@alsa-project.org>,
	sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: Remove deferred probe for SOF
Message-ID: <04ed7ed8-8a8d-427a-84e1-a326feee5547@sirena.org.uk>
References: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
 <20230718084522.116952-7-maarten.lankhorst@linux.intel.com>
 <alpine.DEB.2.22.394.2307181922160.3532114@eliteleevi.tm.intel.com>
 <874jm0modf.wl-tiwai@suse.de>
 <66d22637-069f-5262-2249-6041ef9d4614@linux.intel.com>
 <875y6g5feo.wl-tiwai@suse.de>
 <2ed288d0-c8fe-1856-dbe9-74f4f7c075ba@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kvCIDaYOYoh3Q9Er"
Content-Disposition: inline
In-Reply-To: <2ed288d0-c8fe-1856-dbe9-74f4f7c075ba@linux.intel.com>
X-Cookie: They just buzzed and buzzed...buzzed.
Message-ID-Hash: BQF3IN2NAJK6JNEFVVIRSW2HLD2DNL3K
X-Message-ID-Hash: BQF3IN2NAJK6JNEFVVIRSW2HLD2DNL3K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BQF3IN2NAJK6JNEFVVIRSW2HLD2DNL3K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--kvCIDaYOYoh3Q9Er
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 02:13:59PM +0200, Maarten Lankhorst wrote:
>=20
> On 2023-07-19 13:06, Takashi Iwai wrote:
> > On Wed, 19 Jul 2023 11:48:06 +0200,
> > Maarten Lankhorst wrote:
> > >=20
> > >      The 60 seconds timeout is a thing "better than complete disablem=
ent",
> > >      so it's not ideal, either.  Maybe we can add something like the
> > >      following:
> > >      - Check when the deferred probe takes too long, and warn it
> > >      - Provide some runtime option to disable the component binding, =
so
> > >        that user can work around it if needed
> > > A module option to snd_hdac_i915_init would probably be the least of =
all evils
> > > here.
> >=20
> > Yes, probably it's the easiest option and sufficient.
> >=20
> >=20
> > thanks,
> >=20
> > Takashi
> Hey,
>=20
> Patch below, can be applied immediately iresspective of the other patches.
>=20
> ---->8----------
>=20
> Selecting CONFIG_DRM selects CONFIG_VIDEO_NOMODESET, which exports
> video_firmware_drivers_only(). This can be used as a first approximation
> on whether i915 will be available. It's safe to use as this is only built

Please don't bury new patches in the middle of mails, it just makes it
hard to apply the patch since tooling doesn't understand what's going
on.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--kvCIDaYOYoh3Q9Er
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS32W8ACgkQJNaLcl1U
h9DFNQf+JoAoRAzXMzLzPZ15cYtJAJA0zNP7JlIcMDsWKJPtZn8SzrU/jeCKhrJE
SV6C5/umfGMgpi7FOVjO+XNecsstrTTcX7QtWtOdGPHRuZn8rhjeEsu5zMwmBfgH
Ei02irX/xZdkgo1b0x0ju4zUrKHvbUMKOdtfNlHgJrTHmT4PdqJt7RLp9NJXViRG
Ev8us7xmWgvnBVGt8BLRC+Z5l/W44mJNAAWe7hM2XxWH0k6n3GkOL/d0elrdu9ac
QfLHy86WaxTzfShKxVwnZyRJnYC0+qoJGjxtT6y4Kxhl9zoA/vVHXzom+GIHrnLj
Koior/rT1HgDMVHnu07rdUEg8fM0jA==
=zqCu
-----END PGP SIGNATURE-----

--kvCIDaYOYoh3Q9Er--
