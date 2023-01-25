Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DEC67B60A
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 16:35:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 719C3843;
	Wed, 25 Jan 2023 16:34:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 719C3843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674660903;
	bh=p9/lf49U4PHe9w04CV9h7pHFommhtOFCfPP73qcz3WY=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=a194pEQ46qcl8tsFFKHyVO6Oqz7py8mtiq9rhzjNfWAvRxyNKYl7fsORLLkY5Rdak
	 A58qJs3Q1CpkaV+e8sNE3Q7JuuyVWSL9RY/3373ZApHv9pTxsaK8I5paIA3JuqjyB5
	 KJeblhnwmevF1B6A+W3GZtAURCg0JPdqYHaN5Pgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45E95F800FB;
	Wed, 25 Jan 2023 16:34:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25DFCF80424; Wed, 25 Jan 2023 16:34:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77F38F80163
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 16:33:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77F38F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com
 header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3
 header.b=X5HxLc0S; dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=R5z7xMpp
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3E0B55C01B7;
 Wed, 25 Jan 2023 10:33:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 25 Jan 2023 10:33:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1674660831; x=
 1674747231; bh=CDGI9yfvKLA16CZgTC7w7ljo6opAPCeJws8q0Zld1bc=; b=X
 5HxLc0SvOuGUndsy74lCI6PfJaMZD4zEqsEhn0KPuHL7KGYF+Px51wzKeFQ/kb4k
 DFYWT1sBAgQxi9ltJcFTtp0eYemDeClIkamQd+9nlYODuywOIJqW4Qgz+uTk/gGp
 X85+iI1kDGgAYHiBgR8WHC+dzsiWhZymLS6J9pGBBNpalU/6Wz9Bf2NzDiw6Z0iP
 uGBrScLP2y/TGbythN5YpQbzwaMpXXKOkC4QWFSb9r9OL+70flrSNSW+926lQd2L
 ZCcdgvMb9tveAzX10eU1x96NFKd/1mFxaDALoQqF9b9PxssFOwzEEJb8jg8F1yFA
 77snYnKVl1jrEQyFlf57A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674660831; x=1674747231; bh=CDGI9yfvKLA16CZgTC7w7ljo6opA
 PCeJws8q0Zld1bc=; b=R5z7xMpp5RCMSYbldC8hF37F1uCMYMCM1/qEf9rN4zRq
 rc+RGHsdgXJFliWZIS01QOyYZHsQizF9C0ceNuiVAiHaCjka/a9B+E2faZS4EKIG
 StgsGVgzaZmtOIMepu/MA7KV8fm1Iy3vRtMeR3iw1kfsXOJTPCeLzU5kKlNXfQoc
 gOJo6KcsLabIMKzLUqipsNu44qQ0OBBwXbCuNfUUBKa3CuqRXpmT17+bhlIU0Fh4
 jNfKbx0W78CHqJOGu3qoWFb/HLU9XQY6JPidjSZmKNTXA7UdBYUY/0YLyIxPzfBy
 phUjjBCJYLm+CX8kCNHvL2OlLACx/2dtvczMQsoPuw==
X-ME-Sender: <xms:30vRYyRYchoxDJIAKRMNdexYihPLmMbj5nlwXrXmtZg341mttrOgPA>
 <xme:30vRY3z7Bb8h6mxJyQxMoKMqyuvSWjpILq0gkea-TkshR-V-V543eNRNMlSU8u7vv
 qGAObTt8oZX7Q>
X-ME-Received: <xmr:30vRY_3TLQsWiluQL01AGPKEz1iDu3tC9xrum-kmfrna_u8_i1JP3gdPX1OQgLu1xRzlLqmXNTelyIQcI94rBcQwxB5tqG3KIAU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvvddgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
 leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
 sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:30vRY-D8FweYMM9Tq7kJu6b3x0GuKKfhUhJuVhQ8T9vgv-_8_uFIMQ>
 <xmx:30vRY7ivKy0-YHeWBlb8RgD1wWDm6F1JA2DTHvIdWf3y1XC1DB8Qxw>
 <xmx:30vRY6q9_4kUOURRL3yqCLemK-61NRo9G3mXf4jivjVp3EIdeAIEaQ>
 <xmx:30vRY9ehpyO2TJGP2UVWmv_gZ_wbxPAd7RFSmWbenpafBs_wG2VzDw>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jan 2023 10:33:50 -0500 (EST)
Date: Wed, 25 Jan 2023 16:33:45 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/2] ALSA: memalloc: Fix for Xen PV and non-IOMMU systems
Message-ID: <Y9FL2SOln564i6cE@mail-itl>
References: <20230124092744.27370-1-tiwai@suse.de>
 <87o7qmtyy8.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yWi1MkSZBLE4jw0w"
Content-Disposition: inline
In-Reply-To: <87o7qmtyy8.wl-tiwai@suse.de>
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--yWi1MkSZBLE4jw0w
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Jan 2023 16:33:45 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/2] ALSA: memalloc: Fix for Xen PV and non-IOMMU systems

On Wed, Jan 25, 2023 at 04:29:19PM +0100, Takashi Iwai wrote:
> On Tue, 24 Jan 2023 10:27:42 +0100,
> Takashi Iwai wrote:
> >=20
> > Hi,
> >=20
> > this is a patch series to address the recent regression on Xen PV (and
> > possibly non-IOMMU) systems about the SG-buffer memory allocation.
> > We switched to use dma_alloc_noncontiguous() as hoped it handling
> > everything right, but it turned out that this doesn't work always.
> > So this is one step back, use the explicit SG-buffer with
> > dma_alloc_coherent() calls, but in a bit more optimized ways, and also
> > applying only for those systems.
>=20
> It seems that the second patch causes a problem; at least I see casual
> Oopses on my system after using the patch.  Let's scratch.
>=20
> I'll resubmit the fix.  Marek, could you try that later and report
> back if it still works and doesn't break things again?

Sure, just cc me.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--yWi1MkSZBLE4jw0w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPRS9oACgkQ24/THMrX
1ywRtQf+IFrHKwnmgxYD3lIYm4cfpgPuoA/wpp1LiOUqAqQDrKVpX3/NpOfNnBE0
MKdT/sdYbfg1sxWM8/UstyMadrwlUJv3QM8+a9TGzSpVRUOxGP5oJ2rKICH8wyur
kctZCLQkuCUPqI7j+OHlpJCrvVlQEgH595U0f4Ch/lkxs3wXvoUM8ZT6U/uNhohW
n2w1/CGJWLDW4WLIGFZtz5S8LQd4aSc8ko0baPxAlGwz4PwpbJ12k5R5VmPSNsAb
k6iQJybZ/K/OjNqnnnonJBE21zkx7Nd/IkrIM8PZmq31AJI+OmMez8yk1E7v0/C5
sNqsUQYWFqfmoyOV88etw9kIOjZY9w==
=kWtY
-----END PGP SIGNATURE-----

--yWi1MkSZBLE4jw0w--
