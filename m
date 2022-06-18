Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA2C55057F
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Jun 2022 16:29:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05E131F00;
	Sat, 18 Jun 2022 16:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05E131F00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655562580;
	bh=emXIXt0Ydnstn6+Ldp6mrq1yBEegwedSsFYVvO+Z5yo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RrewwMlCAi6CUMfsDDC+tXiPzHii3bQ+FGZWybNFTft/remc6ps3K08k/ueita12u
	 gexiQUIipajZFz5xeePh1Kqrf2ktAfpwKJie4EeNtcvrQ1i0HyJY9YcJBTRz63uASW
	 bAdIL6xW7+PJy9ts/rUlHL5z3rBqXL70s5WTahAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7040BF804A9;
	Sat, 18 Jun 2022 16:28:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A0E7F8026D; Sat, 18 Jun 2022 16:28:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 614FCF80245
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 16:28:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 614FCF80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="tJPLGEOK"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="O2vR5/2g"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 787225C00DA;
 Sat, 18 Jun 2022 10:28:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 18 Jun 2022 10:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1655562495; x=1655648895; bh=ha
 mukNw3fi1kUaS5rGLtWuHYKMWkisqbqPPUzLN+YUg=; b=tJPLGEOKVpRrVZaqBV
 pTr62ll0MsUZW3XOLK3EqIOKrbYZfE1dKYdpqkROLzxGAFopRBVT2pZax73ejn5W
 6xAG/uRnLwTOIaJILqKJTa2aKAoS2s+rzr6utd5hLyr3AQkJPYuFUL802DoiMdAX
 UCOEI7Mhg+eRICF4865hxglc/9GgspIQarE7iEkWw+pLdmngmU4IIPzwt2BKKFTG
 m+Uo1z76qFd5inKPJr4tPCUL1TWqdKVQnoNKfOHHHdYcgp/oenbaSOXz3IlwLQEq
 J5uQjEH/0CbgfYPkqjkWf7ncycCi73F+iknqIkqZ26C4mUaSuGXqP0EQI7rpBMcv
 hrkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655562495; x=1655648895; bh=hamukNw3fi1kUaS5rGLtWuHYKMWk
 isqbqPPUzLN+YUg=; b=O2vR5/2gEf+nXU98qbqb0pCrro3vChrz7753iCDDwEMM
 /9g//FbA3rLNKGYP9bI7pJOyIVTlq3I0gMVU/mfFGc4LkIaJr2pC5+BBuriSOXVa
 xr29WQYrg0Kt1VcnjgQ7Wc/J2LN/ji31BClMKgnvAnc2G1wAza+LUotBlAuOpkHD
 Rbj7AtshC/MyDwNAfjsCSOHGN8bpjgju2fAjiFvHOYKf2xxbFtEhLeqBrWvnLG/W
 cmHUjCaqtz5TBd2QiTdhBjJBAmcq5M5ePveY6C1u2wso6dxkdQ29t44/eTo9T4ax
 VRX2ovj/HiS8XTmIMDWX3vhI/UfjDxMuOJWyjI/rqg==
X-ME-Sender: <xms:_uCtYg1mI5UntK8WEBj9T_Xsk2IN3KjhQMYixjw-FlstVF0qMkN-zw>
 <xme:_uCtYrE9tO8cZ5iiLyjbLZwwolHPgC5D9Xa4DgB02Iyty4W5s4bn2_xYfmt8P2cf6
 8-O4BpBwY3zJXgUleg>
X-ME-Received: <xmr:_uCtYo6it1Nc7OPD49LyL_1hnirMye6ZhVcZqLQiptAuW8segcX9CE6bV1X_6e-bCVBmKcZwneuOb-ZpZcHXlrJTIJ5y9GhW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvjedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
 ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:_uCtYp02B-U8lmXF84FGBYk1zPjtD4CuzNc6luxnXK54eWFZjzzqmA>
 <xmx:_uCtYjETI7rdQ7qZ8ldqzDKZ6XUQCeyY0s4FohLp4bwjPr0jDz0ZvA>
 <xmx:_uCtYi_OP3Qo1JNpiEIUksq21YzSefTLnbbCtsNI-z5mcJPjydt7CA>
 <xmx:_-CtYoT1ULnK8514IPW-Q7x33duyZj3DD9JFqsh05gYU35KfgVF-ow>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Jun 2022 10:28:13 -0400 (EDT)
Date: Sat, 18 Jun 2022 23:28:11 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 0/3] firewire: fix minor issues
Message-ID: <Yq3g+6+x+S0aKv8e@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, stefanr@s5r6.in-berlin.de,
 alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net
References: <20220615121505.61412-1-o-takashi@sakamocchi.jp>
 <Yqp3lvOYHwZyC0I5@workstation> <87zgib1y0k.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zgib1y0k.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, stefanr@s5r6.in-berlin.de,
 linux1394-devel@lists.sourceforge.net
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

Hi,

On Fri, Jun 17, 2022 at 10:42:51AM +0200, Takashi Iwai wrote:
> On Thu, 16 Jun 2022 02:21:42 +0200,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > I realized that the second patch still includes a bug that shorter
> > buffer is allocated for block request than received length since the
> > computation is aligned to 4 without care of remainder.
> > 
> > Actually in the case of block request, the length is not necessarily
> > multiples of 4 and the packet payload has enough size of field with
> > padding to be aligned to 4, according to 1394 OHCI specification. In the
> > implementation of firewire-core driver, the field is copied without
> > the padding.
> > 
> > Please abandon them. I'm sorry to trouble you.
> 
> So this implies that the type declaration of data[] rather looks
> wrong?

Your great insight.

Indeed, I can not find any code to dereference the array for u32
element. In all of cases, the 'struct fw_request.data' is passed losing
its pointer type (void *), then copied by the length in byte count. At
least, I can not find any warning or error at compiling the driver after
replacing the 'u32 []' with 'u8 []'.

Even if it were dereferenced, accessing over allocation boundary hardly
occurred since typical implementation of slab allocator maintains various
sizes of memory objects but multiples of 4.

It's possible to declare it with byte array, I think.


Thanks

Takashi Sakamoto
