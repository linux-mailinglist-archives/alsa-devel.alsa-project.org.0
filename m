Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 658566FC2F9
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 11:38:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 223551104;
	Tue,  9 May 2023 11:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 223551104
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683625131;
	bh=B2Ek7Hs/kElRJRoibxY6cMPglO6fOODLUROYcoa4QUw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rhXw2zUXfBUpx2jHNdIAXvOfJtFWbkKRrh1lauTYiw+a2jMfPiCHgFSvVnk2wZGnS
	 XJvwNCv5kZh28eH3lYGJT4JmcCO9SxlOHLKoHrPKI6tjRYnTwQJobbpNqCvwpinvo2
	 NPyx8xh98sAz6Z6TPer1Tnd6Ls8dAlUXjx8KHWdk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74A7DF80310;
	Tue,  9 May 2023 11:38:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40B5BF8032D; Tue,  9 May 2023 11:37:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3981EF80087;
	Tue,  9 May 2023 11:37:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3981EF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BasNsIwS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8A8606329A;
	Tue,  9 May 2023 09:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C33CC433D2;
	Tue,  9 May 2023 09:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683625067;
	bh=B2Ek7Hs/kElRJRoibxY6cMPglO6fOODLUROYcoa4QUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BasNsIwS4lP2kjKygVWJuC432R5dX49Uoq0IE7S4s42DYd4RMp5mF+IgJpOj8uqMK
	 4Ebxs6HEf/0e6yx25oCWvQbsdOoiAcKIG9v/J5nusIxVwzRfimxZLTvpzmHgx0Q2lG
	 zLSeBpxI+UwNDkJRbXA7EhRwPNX+k8SFD5iY9ftmosiQpWLBSQeNDTU6fFfSg8AvCr
	 suqnkduZ19VytpWi8CHExXevqnpxNONhlMaXji8DqF1PDbYzMeOcDjByr0Il4uDfTg
	 S+Z2x2k3KvaSdL7Xjh1hUoUIBhqqXA/PTfiuSlamXFvvoGSMCMifheYJnUofPkdfBh
	 W3+4QX7XCZqOA==
Date: Tue, 9 May 2023 18:37:44 +0900
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
Message-ID: <ZFoUaNKBkIgbW0rD@finisterre.sirena.org.uk>
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <87o7n0mtv9.wl-tiwai@suse.de>
 <87ednwmssr.wl-tiwai@suse.de>
 <87wn1jdzuq.wl-tiwai@suse.de>
 <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mG+GHuwxgtwT0z+7"
Content-Disposition: inline
In-Reply-To: <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: KNP3BRQMONRWJ3Q76AOSTV6HKKTOLMN7
X-Message-ID-Hash: KNP3BRQMONRWJ3Q76AOSTV6HKKTOLMN7
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KNP3BRQMONRWJ3Q76AOSTV6HKKTOLMN7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--mG+GHuwxgtwT0z+7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 09:12:55AM +0200, Jaroslav Kysela wrote:
> On 08. 05. 23 9:52, Takashi Iwai wrote:

[alsa-devel rewriting mails in a way that renders them useless with b4]

> > Jaroslav, could you investigate it?  I checked again, and it seems
> > that all "approved" posts from non-subscribers are modified to the
> > sender addresses with alsa-project.org.  I guess there must be some
> > option to prevent it.

> The answer is DMARC. And the "mangling" applies only to senders which
> domains have restricted DMARC settings (reject or quarantine) -
> collabora.com has quarantine. More information:

> https://lore.kernel.org/alsa-devel/6f003598-4cae-a521-233f-2c19eb439359@p=
erex.cz/

> I am open to any suggestions, but the default mailman settings (do not do
> anything) causes that some (mostly gmail) users do not receive their e-ma=
ils
> because the ALSA's mail server has a bad reputation. Many companies are
> using the google mail service for their domains nowadays.

> The information is not lost - the original e-mail is just encapsulated (as
> an attachmnent) to new with the "allowed from" header for DMARC. But yes,=
 it
> requires some more work (reply to the attachment, update scripts).

Copying in Konstantin - as I said this is massively disruptive to using
b4 with anything that's been mangled, to the point where the messages
are unusable without substantial manual mangling (and signature
verification fails too).  It'd be more usable to just not have the
messages from the list getting to lore and manually bounce patches to
the list. =20

Is it possible to take steps to improve the reptuation of the ALSA
servers so this isn't needed, or could we migrate the lists elsewhere (I
know we set up linux-sound@vger at one point with the idea of
migrating).

--mG+GHuwxgtwT0z+7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRaFGgACgkQJNaLcl1U
h9Cg1Af9GknjI805QWjHPz+v97ZddasMr0d1xtvG4Wd6ghRK1aWM2TXSSEuST9VJ
5GfQAnDsWC+NEM1EWnq0Of+9lHPOYGQQwP+b1lF7gxY/BfHGEmQbZQv7b2SHmb86
0uIjujuK5tpS7hdZciePfhO5S0ifU9fKcy5DcyaTiXZ90gtgjDd0JCn5Do+C5USx
0xhPJu6kBBDtVd5yqQGno7mJnITWENxZemezcJLZNQqsqM0EetGiPi5Bqd/u0VcX
v1OF5RlNhDop0i3/WwWzNft6Uccds0TcYTo/cn+ckv2vjU/Luj8yIC2zSZshLzPU
NyDolWvJxxTGPx4D//36o9OdA/le/Q==
=AIUk
-----END PGP SIGNATURE-----

--mG+GHuwxgtwT0z+7--
