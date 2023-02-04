Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C42168A75D
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Feb 2023 01:56:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7531882C;
	Sat,  4 Feb 2023 01:55:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7531882C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675472209;
	bh=ndN/UwWoKqkW/WHgKQ8nkKiCOCfrKwsPrXr+6CAqdnA=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Edo0YAA9Y8bhZfyQloOKl13tLqL0OjsX0CcHUQzIM5GSchINrAddueYNBK+8g95RB
	 U6KYUJb5TLfTTp64vtLWemKc18i/1WHz+1xm1T8Lao0lszHrtcxBszAkMYGKLTJZX1
	 Cr4j4mBuyHHGuIeyZn4FvwggCQtBht4tOr8o7enE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76795F8001D;
	Sat,  4 Feb 2023 01:55:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A523EF80254; Sat,  4 Feb 2023 01:55:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05FE6F8001D
 for <alsa-devel@alsa-project.org>; Sat,  4 Feb 2023 01:55:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05FE6F8001D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=Oei2SY/a; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=rhzlbidY
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 52DA33200957;
 Fri,  3 Feb 2023 19:55:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 03 Feb 2023 19:55:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1675472132; x=1675558532; bh=tV
 uII4AF89FKnx3QGDvk5mB0zQTJEHij/awVkST/Nuc=; b=Oei2SY/aENZuIOI//j
 SrpFOwk/2W8XrWVaXiAibDY5N+l8FVE3ne5k+Ynbj/XqvyK0AwfP89kMhF+ovloj
 KtTBCICPyr48m/AI6hL11ronmBKpgRx8D+J3fP5ZwdEDKkRU8iw3Jc7Bb1MfkkGP
 TGBBjcK1gZ44UqNP/MBZcDhXS0Y7/ZQAnb0OR2F8NH5g9skUIUHWLFMXmTUeEgix
 zRAngwvakyM9xEowfbbrAbDbp2nm2wuaX497T1qITQ3EepaxilqcqK9f3wY0tULF
 Q/7wmXJ1+b491hcBxQK2dcJ9MT9EwxMhnys9d3EXaJsyxWgDH/12Dwi5VF8A2mBv
 JQpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1675472132; x=1675558532; bh=tVuII4AF89FKnx3QGDvk5mB0zQTJ
 EHij/awVkST/Nuc=; b=rhzlbidYScI3jG7Q0pn2klTWj6yUKa20UQodjrX4gsbE
 iA3puCq+tBHX8wK29F4A0ZdELLrUNZOAEVWG42qMiJgiw3mK9666K7WNlnTzd0pe
 fPAXnBnp+Wt53dKp6oRDA9Qh3ukn6XAXnVBVZcoxQWxBshyDM+bm2VxvhBrcBTiz
 3K6J4sVPorMSDDFAKII61PxKio72wg+deIxPpV0fHU1J22MIvY/6UVuoWYqevqF+
 C1bqZx5letAQ1NytU2ykdTcw3AKDLmWsN9qFyjDk8TYHXofVWYsZXCTE2PzEAwDB
 mdJodCwLHsCNeRmUkkR4QpKEggEIjVOOCOSI2XiH1A==
X-ME-Sender: <xms:BK3dY827VkE8b59E-i20mdp722g9fuqljOXjF0-ekAWAc7kJwWKuzQ>
 <xme:BK3dY3FAmu1T2LbUxt2QHgDloQTIRomWblqr_fDFk4lTJ91cTT99FEz8cwoJ5yhwk
 jgbH940ahOWqblA42g>
X-ME-Received: <xmr:BK3dY05OHx7SHuobTHxbOFemTuRRv0_B3xWZc3sHH5gl2PzfS8w0anORAoInk4_0A3a59hZ-tHREWudeJtsFzgHhJn5DO2l2EAPU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeguddgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhepveeilefhudekffehkeffudduvedvfeduleelfeeg
 ieeljeehjeeuvdeghfetvedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:BK3dY13XeQwR9yvBUxJMIccXiYjAMntpjnRddf12W0JU-9yFGoLejg>
 <xmx:BK3dY_EEXjN5C0FoZd-KaAjhBqwTIOdcwtSG1kJMCHDaEtSatQjVJw>
 <xmx:BK3dY-88i2QZEivzb4gY011P5_cHkh3aSwtFTrVxVbnJBTtrB6ENtA>
 <xmx:BK3dYyOnPj-5TYq_Mgyb9-mzxV9mW48XsRUiwcDLUuZtPVQiRAQAFQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Feb 2023 19:55:31 -0500 (EST)
Date: Sat, 4 Feb 2023 09:55:27 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: fireface: add field for the number of messages
 copied to user space
Message-ID: <Y92s/z+41aKOii/b@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20230202133708.163936-1-o-takashi@sakamocchi.jp>
 <87fsbmn2gf.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fsbmn2gf.wl-tiwai@suse.de>
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

Hi,

On Fri, Feb 03, 2023 at 05:22:40PM +0100, Takashi Iwai wrote:
> On Thu, 02 Feb 2023 14:37:08 +0100,
> Takashi Sakamoto wrote:
> > 
> > Current structure includes no field to express the number of messages
> > copied to user space, thus user space application needs to information
> > out of the structure to parse the content of structure.
> > 
> > This commit adds a field to express the number of messages copied to user
> > space since It is more preferable to use self-contained structure.
> > 
> > Kees Cook proposed an idea of annotation for bound of flexible arrays
> > in his future improvement for flexible-length array in kernel. The
> > additional field for message count is suitable to the idea as well.
> > 
> > Reference: https://people.kernel.org/kees/bounded-flexible-arrays-in-c
> > Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> 
> Wouldn't changing this break the existing application that talks with
> the older ABI?  Just to be sure...

You may well have the concern, indeed.

The structure is not exposed to user space yet, since it was added by a
commit ab811cfffa9 ("ALSA: fireface: update UAPI for data of knob
control"). It just exists in your (and mine) tree at present.


Thanks

Takashi Sakamoto
