Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 361F46FC925
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 16:36:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41F2CFCE;
	Tue,  9 May 2023 16:36:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41F2CFCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683643010;
	bh=TgwHFaGmSMg4fYkUV2MLZJ1HAa45RX7WXpmDg/oFpnc=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e1BrCzL7v8DgV2P1L4X09idcWvRjdFKtG3YBHN2GFxu84RTIi4zqPjOuKxqKaoYLo
	 fVTy8/akL2GrA/Hs8nLx2OAhNmsQOLP2cJErgNcVYxAQXHaDy/qvTie0YVbd53AfQl
	 Foe58y28NiwXExHBoyhe31x/3k8/2H9lx5sn5vBw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DD52F80310;
	Tue,  9 May 2023 16:35:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB52EF8032D; Tue,  9 May 2023 16:35:54 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F591F80087;
	Tue,  9 May 2023 16:35:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F591F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=X//TcaqC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3EA1F625AE;
	Tue,  9 May 2023 14:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AFE1C433EF;
	Tue,  9 May 2023 14:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683642940;
	bh=TgwHFaGmSMg4fYkUV2MLZJ1HAa45RX7WXpmDg/oFpnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X//TcaqCc8J85d557c/5FVY6LlPb1RXnJAk5TN+sayP9CJTHrqmg4XI9uCZjECtMF
	 KBnfaEeA7obSSuKZB+i5r3gVI2XP28e526Oe9fr753hM7jUWm/4YBykBYO2nDVjQ4U
	 JbII/ulK0poryQhAH5oZSaDpo4a7ZDIlSV9WxWF4NeZNBtXXAZbpk39JiOV415OO13
	 2rDyKO6nyU7pjHTkPBFLHIrUQyo+Oe9I+mo18hxRjAQ1n5/lt8QEVsBJq3ElT1gtsd
	 RXggkaWJfk87UA/SwUace3cGSSIx4zsxzvci/0UZpq/Ikehfua0k6m41F7/Hxxl7MC
	 noCB9jUjv/VOA==
Date: Tue, 9 May 2023 23:35:37 +0900
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
Message-ID: <ZFpaOVRc2E/CZBHI@finisterre.sirena.org.uk>
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <87o7n0mtv9.wl-tiwai@suse.de>
 <87ednwmssr.wl-tiwai@suse.de>
 <87wn1jdzuq.wl-tiwai@suse.de>
 <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
 <ZFoUaNKBkIgbW0rD@finisterre.sirena.org.uk>
 <ff43dccf-ba6d-d7fa-352a-5d5a8c4b977f@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eg5bJP/jVKQHKJ1q"
Content-Disposition: inline
In-Reply-To: <ff43dccf-ba6d-d7fa-352a-5d5a8c4b977f@perex.cz>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: RC6PJ65YXYZLCVJ6G7IQ6SZMKEIVTP47
X-Message-ID-Hash: RC6PJ65YXYZLCVJ6G7IQ6SZMKEIVTP47
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RC6PJ65YXYZLCVJ6G7IQ6SZMKEIVTP47/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--eg5bJP/jVKQHKJ1q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 11:54:18AM +0200, Jaroslav Kysela wrote:

> The signature is correct in the encapsulated original e-mail. The b4 shou=
ld
> be improved in my opinion.

It's not b4 that's the issue here except in that it causes me to fetch
copies of the message that went to the list instead of my inbox which
didn't get mangled by the list.  git am just does not understand what's
happening with attachments.  For example for:

   168198605952.26.13645408104113633580@mailman-core.alsa-project.org

if I try to apply it the top of the commit message looks like:

| commit 8f0e0ee514b189cf7b4e7fa09581e3f1d246fa09 (HEAD -> tmp)
| Author: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
| Date:   Thu Apr 20 11:20:43 2023 +0100
|
|     ASoC: cs35l56: Remove duplicate mbox log messages
|   =20
|     Received: by alsa1.perex.cz (Postfix, from userid 50401)
|             id 7A47CF80155; Thu, 20 Apr 2023 12:20:56 +0200 (CEST)
|     X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.pere=
x.cz

with all the headers dumped in there which is just completely mangled.
Note the rewritten author. =20

mutt also represents this incredibly badly, it just shows the
"attachment" as the body of the message with all the headers dumped in
like they're just plain text in the body of the mail - I wouldn't have
thought this was an attachment if it hadn't been mentioned in this
thread, none of the atacment UI shows.  To reverse the mangling you have
to view attachments then save the root of the message to a folder.  AIUI
mutt assumes that whatever the root of the message is is intended to be
the message body and does the best it can to display it as such.

Lore *does* show the body of the message as an attachment.

> As you see, the header and all signatures are correct in the attachment:

None of our tooling or processes understand this, they're working with
the top level message.

> > Is it possible to take steps to improve the reptuation of the ALSA
> > servers so this isn't needed, or could we migrate the lists elsewhere (I

> It is not possible to talk with gmail administrators. I tried that several
> times. The outgoing ALSA server is not on any spam list.

I know there is a lot of discussion going round about which hoops to
jump through to play nice with gmail, I don't know if there's any new
stuff that's come up there recently.

> > know we set up linux-sound@vger at one point with the idea of
> > migrating).

> I guess that the vger servers have similar issues, because servers with
> DMARC enabled on the ingress side can reject e-mails. It's related to e-m=
ail
> standards.

The issue I'm seeing here is the rewriting which I'm not aware of any
other lists having turned on, even infradead ones which are also mailman
based.  Either they're just tolerating people having issues with gmail
(which seems reasonable TBH) or they're jumping through some additional
hoops to avoid issues.

I believe vger does sometimes manage some backchannel which probably
helps it somewhat.

--eg5bJP/jVKQHKJ1q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRaWjgACgkQJNaLcl1U
h9DA2wf/VQQJ58vugCTwaMze6LpK+nBTwq63/aJSkQLyPXQ39VPrrs8c+oCT9tJP
UqgGSuUuo7Kj3HfVvilvmooybsQZepuXKCC9nxUD2D0DRVZVXQHzihSyur0CLY5m
QTCUSJ7t0saEf5f1Bff8Rch+LQQsPJ/slfIOpR9kaYbjZXcuPT7E6+wIrx/opS/n
Z7xj7A87pypTT0IQnza5jqydRMabCiZh5phKBg7gF8dawIDQv8hdC0Nr0v5NCs5K
R22Fmk81a2AyS1IhVS2VrZhWhRDpgyy37GTK3vOkNz+P2NlL2d91cn45ryzbyoJH
rcvIvd1qKFWngiHk2iXZ+YhjMxhaHQ==
=PXh/
-----END PGP SIGNATURE-----

--eg5bJP/jVKQHKJ1q--
