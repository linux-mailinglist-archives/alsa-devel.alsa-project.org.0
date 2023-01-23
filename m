Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF7E6789BB
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 22:32:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AA4AE76;
	Mon, 23 Jan 2023 22:32:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AA4AE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674509577;
	bh=GAjjIq3XjvWZAINonQw0q61M7dadW556/tnGFN8GfiY=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kMprF1qaB4c84cxSaPooayEvKj9DEo6P3EYazeUWUEbisZmFTeRSQWYzGd8wp2HdB
	 qqO+hA8x4Xmwl4sX26w2Fd5HfoyR3QwtMQUXhWguGvC6mLG2Khhonyjyk2XflkPlE+
	 q/MkNj2Ih3KOCtxywlOU+ag/uCKaZu1kC/w6EIxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEA52F80132;
	Mon, 23 Jan 2023 22:31:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58878F804C2; Mon, 23 Jan 2023 22:31:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B0B0F80132
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 22:31:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B0B0F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com
 header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3
 header.b=l5P1k9VR; dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=StnIgDVN
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 60AF83200915;
 Mon, 23 Jan 2023 16:31:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 23 Jan 2023 16:31:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1674509504; x=
 1674595904; bh=5Nn3c2F56jjrxPcKUmzx8TX+ydLIXQP/7I8gJ3T6tZw=; b=l
 5P1k9VRWpBhy+Sfi/h1DjIQekoKcxwl366MTIR/fFF93kA9UIA6xNR49vy+sH5FY
 Nx8ZviMSPSpq83/iNlhqaS5JK0Q1Au0InEbpobhG25mFJ6OGNCKctKqG0NnLORA0
 VgHw3YnPdqdWpM38TY6gQTvtRsls6TBa8MTwGxiw2CKReGQ1i7ZZRp3vnN35FHQ0
 wZg7GKtLzZ9sEkr9jYRVvuCAX0/5DSrEfNstcGYtzHEiNuokCboAs7M/tlrYJuik
 dvazrd4CK7y78YGb8+DXRbS267+xgJYc6sANvQ1aNbraz2lP6L5LGPaa/IkC50gY
 +vlef0kj8TqKxhF4D9I6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674509504; x=1674595904; bh=5Nn3c2F56jjrxPcKUmzx8TX+ydLI
 XQP/7I8gJ3T6tZw=; b=StnIgDVN3UP2fLLat18WAnGVtw2us+SRCbNbh3QvtNhI
 01erGbpxDOmFLSNZFpRpCLxAEydO9/0eNO4t/wzFN13GVKDamuPyF/T8EM7tlgig
 WCRmXjvWu4j0KE6Bu3n0g7X9rTqe77WnYbTdzvdeXBlArmanNxpIpWIDjPK1x7mR
 ZIiRKpL72/YVkfzpkMOmT41Vtxk241oxIzpZ5Fw4k30LyNr4o1ChML+rJI8f++Fy
 WzIfCPrFDCkZEhMq4Tkh3xD+yX0gr1RrCvPZ0z3WfSkZ9t//ap4dij121C368VMh
 AVruFJtwC6Er/CWKSmnrD3jqRtwyTLZprYeGv0Rs/A==
X-ME-Sender: <xms:wPzOY4hoF5WvZXyBpjENdFaUb9kpkw8hxoNMr1qBBpmZU-QiddCP7A>
 <xme:wPzOYxDONxg0FU227TYUscxM3SZpGlv1ADRxqt1KW793Ujqo_LnhNCvbwYhjMSWwE
 ianHwLmFqTG9w>
X-ME-Received: <xmr:wPzOYwF1BUGc5nf1RMa0SFeqkSZ7sOmKywtZBQve-R2YblTOCKS1eW8jpAB7RWmW92JbXeowdvexLWFLxSdWgyvXVOdhYDyev-k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddukedgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
 vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
 hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
 udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
 khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:wPzOY5QjQZYKbD1knBxtZTEQUJv1325wxCLJ8lPTrpkCruYg3pizVg>
 <xmx:wPzOY1ziZuCCcLBE4DNPrewZPtt4lXbTI6rojboo6T8Wtm2CJ6vg3w>
 <xmx:wPzOY36l4_ASuuTFTEZ9b0p0gmH-rsFlgjNNiahR1Vupx-UslhDx2A>
 <xmx:wPzOYw9f8WvBYGHRT2Zv2wEHmKn25ggQvT43JQsAoBkpIW0aAZ5bXQ>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jan 2023 16:31:43 -0500 (EST)
Date: Mon, 23 Jan 2023 22:31:39 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
Message-ID: <Y878uwEqfQ9WWPZV@mail-itl>
References: <874jsp6r3q.wl-tiwai@suse.de> <Y8cGVGCWjODvMXUe@mail-itl>
 <87sfg85ic1.wl-tiwai@suse.de> <Y8fMVtWshr+yFLWk@mail-itl>
 <87fsc8t3s3.wl-tiwai@suse.de> <Y8nqIBJISq9Vm710@mail-itl>
 <Y8n7XkbM0aIEshlX@mail-itl> <87zgadpsz2.wl-tiwai@suse.de>
 <Y8qE9qBUi6Tuj0SS@mail-itl> <878rhxpcmr.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TE0qJaHlS2X1vFX1"
Content-Disposition: inline
In-Reply-To: <878rhxpcmr.wl-tiwai@suse.de>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Harald Arnesen <harald@skogtun.org>,
 Alex Xu <alex_y_xu@yahoo.ca>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--TE0qJaHlS2X1vFX1
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Jan 2023 22:31:39 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Alex Xu <alex_y_xu@yahoo.ca>,
	Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17

On Fri, Jan 20, 2023 at 02:19:08PM +0100, Takashi Iwai wrote:
> On Fri, 20 Jan 2023 13:11:34 +0100,
> Marek Marczykowski-G=C3=B3recki wrote:
> >=20
> It's puzzling, then.  The patch changes the allocation with the
> dma_alloc_coherent(), and that's what does with the Kconfig hack
> you've tested.  One possible significant difference is the use of the
> DMA address.
>=20
> > BTW, xen_domain() will also return true on PVH/HVM domain, which should
> > not need any of this special treatment. It's PV that is weird.
>=20
> OK, then it can be an overkill.
>=20
> Below is another try: it changes the different use of the DMA buffer
> address.  Let's cross fingers.

3 days update and it still works!

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--TE0qJaHlS2X1vFX1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPO/LwACgkQ24/THMrX
1yyImgf/au0XzUJ+OEKpQg8b7Gm1T6GYQPBEE1xNc6JNxIxgxHsMYk3fX+W+ehQC
ZzSZrWfXf4wjDCS7mdG+u0jKbVem03PXxw9hzAOfB4RHq3m4QEIj7CRZuJ3Ei4Rb
lYu0r/tqWAUc3/q6pfvwrjRQZ7zGhMBPJP9OeNPQ8BRledVbauVfAkC0rehP6IwQ
wAagyAChdfVqYPv5jQ5EX5TxBnGrEC3m7t1Z39CQ2MHbOux1sV508mwkpwK6dqF6
3mCLQimI5qCiPeg4dWjC0L+UXFjwmAwC+3qmOKFGABLimjOsObyMS2ujD2fZqKgD
aycdhsg6KzORTa4760o6yOKm+fpkTw==
=CYWS
-----END PGP SIGNATURE-----

--TE0qJaHlS2X1vFX1--
