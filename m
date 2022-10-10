Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F30CB5FA726
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 23:52:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 661613265;
	Mon, 10 Oct 2022 23:51:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 661613265
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665438759;
	bh=rpBVhQk5UAQBeLz9Wj9al8x+/KWr2QPTJzXQc8qVA3Y=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y58ksGiVHl5zK0i8tL+7SKLANXEuD4EI4swpc/TvKPbDUnECMr8rVuAj/7nBpNdkV
	 NvZQBrxqjOk9mM9ShUk1wK5XYvw2vy32Df+W1k37qzAHBvn3pcpX71oEhKO0QKkcs4
	 p6zhqiLvZ0sSDpsxNgb7Eu9stUn/RaPCbZ0jNgYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D28D7F80155;
	Mon, 10 Oct 2022 23:51:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60FB9F80256; Mon, 10 Oct 2022 23:51:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A9B6F80155
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 23:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A9B6F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev
 header.b="H1MMxhne"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="MI/DX6XA"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C42B25C010C;
 Mon, 10 Oct 2022 17:51:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 10 Oct 2022 17:51:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1665438690; x=
 1665525090; bh=rpBVhQk5UAQBeLz9Wj9al8x+/KWr2QPTJzXQc8qVA3Y=; b=H
 1MMxhne69iw66AdXtMiewZX4q90l8HAGeTWeIOvfjlrL7RLDMv0fT+njsF4KrEnG
 NCBm9IBdjAJ/VxPS/eqiUz9vVdOya8eN3SoOE/vLrsEz5yDnZ/ht/GWA7zoPJkYI
 gWcTWyYecYfRcQ4Nj0zsUXIqBzF1aRgW9nc10RQm5ewrIwdZiyEDHqlp4dJJN+8C
 0KDuRj7wFSzjkCNCNAI6AeW3l0uDPSYXK4gX/W1pTTFQ6kPn3vQGYelmcZ4wBxFc
 1bz6H74VTdx/DCiLlp0wXUlLwoUGcUqtK5rSWjyLFSB5nSU02ef76w+v6Bgl0QRV
 hSSEnUpL5qXz+TrWTeLtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665438690; x=
 1665525090; bh=rpBVhQk5UAQBeLz9Wj9al8x+/KWr2QPTJzXQc8qVA3Y=; b=M
 I/DX6XAVtlo+vMeCQlHDN9gN/BkKLNTXTj5RLSoFq7aVjVsz5h8deP8CUZGD9pvO
 8FEfsmcdMWYiuHde5Y5oP3tjttT7AovpaauWFD+k/J+3oCfp9BJP3zK7h+Rm4OMB
 f28jCIFLxZRGaUcYQLnU72TbffI4zydMWmfGFU2HWq3W36qfbzZYJBwqGL7ntaQ5
 FuwiA9MKWoaBxfvXWbBXMFoOkrlw9kBmX73EAPWP/WKRlforOiu7SYOCIlobIZO8
 0oy9Q8lraOwyqzDQ6Sj/c+w4SiMvkVM2ycEfwhe4Cvyw+74HUBQDQL7s90F0I1p0
 BB6coXjDfGw/OG8BDQG5Q==
X-ME-Sender: <xms:4ZNEY00MXSo8vAfJaSdLeToykZqUrdp6EQEpcGYKtvOwEjq75DCmHg>
 <xme:4ZNEY_GGnQfAinBjoEMAys0K7zN8kokG7McbDZMB66sAx4dgrzVYvLxfGd6E3x5ER
 C_gnulbspLeFWGL59U>
X-ME-Received: <xmr:4ZNEY85S2yA58xybut3SH7kIonoVxLKAQHg2M6oDlc6emX-8rP6cj-OcgGSGVs3VFuZZfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejhedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpefnuhhk
 vgculfhonhgvshcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrh
 hnpeekfeffueejveeujeeugeelleehtdegvdeludektddtfffhieefledvudehfeejieen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvg
 eslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:4ZNEY93BkkghopCCxueFIxIXOJv5kxKoZwxWZxRBKu5Eh7FpBkPojw>
 <xmx:4ZNEY3HdqFrvb8DS8rLpN4v1CAm_rx--kQlqEPz4M51jpz1m8iO8xQ>
 <xmx:4ZNEY29r7PMNZKqRprjOIpVG5GgZXZGtZh82t5DeARmBNs_ntOyNEg>
 <xmx:4pNEY8THbX7nhFh9oLv6MmsEZOSzUrRM2aLxnKB_YwGQ-5B7Jw8Irg>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 17:51:26 -0400 (EDT)
Message-ID: <e5de59f50c8e4141edc96f882253feb4a12a6536.camel@ljones.dev>
Subject: Re: [PATCH] Fixes bc2c23549ccd ("ALSA: hda/realtek: Add pincfg for
 ASUS G533Z HP jack")
From: Luke Jones <luke@ljones.dev>
To: Takashi Iwai <tiwai@suse.de>
Date: Tue, 11 Oct 2022 10:50:29 +1300
In-Reply-To: <87zge3etjw.wl-tiwai@suse.de>
References: <20221010065702.35190-1-luke@ljones.dev>
 <87zge3etjw.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0 (by Flathub.org)) 
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 2022-10-10 at 14:45 +0200, Takashi Iwai wrote:
> On Mon, 10 Oct 2022 08:57:02 +0200,
> Luke D. Jones wrote:
> >=20
> > The initial fix for ASUS G533Z was based on faulty information.
> > This
> > fixes the pincfg to values that have been verified with no existing
> > module options or other hacks enabled.
> >=20
> > Enables headphone jack, and 5.1 surround.
> >=20
> > Signed-off-by: Luke D. Jones <luke@ljones.dev>
>=20
> The changes look OK, but the subject line should be rather describing
> what about the patch is about.=C2=A0 I corrected the subject and put the
> proper Fixes tag (as well as Cc-to-stable).
>=20
> Also, the indent level wasn't right, so I corrected it locally, too.

Oh... Sorry about the hassle there, I could have sworn it was correct.
Thanks for accepting regardless :)

>=20
> thanks,
>=20
> Takashi

