Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D9314AF0F
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 06:27:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AACA9F6;
	Tue, 28 Jan 2020 06:27:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AACA9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580189274;
	bh=wPfY6IvcxJCRTUUWfocJSA4rqc3B4CZLNBD1PxTcPh4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L62uYvagcdmjTDs1O22sAmKIOydnc4WjVJnaHrkEpUk/yoIPtmtO04rR/Goj5J3Tq
	 RoNKe7BV8DmFpI0FvXQiNKgPy1FfrRHYmF0jzLuxx7b/3wOZq+zBuVF7OTPRHIpih+
	 6YFaIjqg27qMLv7dhPiwdHO3THv43h4u2fkPzdoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34B9DF801EB;
	Tue, 28 Jan 2020 06:26:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0935F80150; Tue, 28 Jan 2020 06:26:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_13,SPF_HELO_PASS,SPF_NEUTRAL,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54E6FF80123
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 06:25:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54E6FF80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="e7L1OrJo"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 118422BA;
 Tue, 28 Jan 2020 00:25:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 28 Jan 2020 00:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=x9ZyJZqAl+8CjEI1SXIQhj9f077bPtotofO5iUujQ
 PM=; b=e7L1OrJoNWTUEr5wkkQmWmFpy6U18cyL8K40daxTgp3LUcvjjBjKOL2v3
 L7xaCwr1uWiL10YETpbnoFSX+P8e5Vp7lGMHomUfE9W006HplY2V8w6m8hHIzYbo
 2z5+pPiSlibRWHAct6kNW+RG5HNMcLe1QYq69DlWWPteWISyJnFOwM7HklQcqI6P
 PXL3z4qgY8NeW1zERhvNEp+OgKZoNLDQA4sA7ykRLKPAxv1Hv5QmtQYi87DEz6q+
 LpR5FdPOmIRG36741yiLh2/nHWju78PdkmBTSYmi8TNBr1iR9bLV8tDXppE+zYnF
 O21n2dkjVXzh/pGNqRoGLWQ0RwAAg==
X-ME-Sender: <xms:48UvXkhsDTgZV73Y3uInYaAvSKKpXWMuPe8zKT02HAf0_w0VKjjHWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeefgdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfggggfesthejre
 dttderjeenucfhrhhomhepvfgrnhhuucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhi
 rdhfiheqnecuffhomhgrihhnpehprghtrhgvohhnrdgtohhmpdhlihgsvghrrghprgihrd
 gtohhmnecukfhppeduleeirddvgeegrdduledurdduudegnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:48UvXjKu6ixtagF2FoxTWdDqSz4fKa0xPmXlJSbQXBhyxxX0DwLxLA>
 <xmx:48UvXinJtrQAIhjmLjcNIiBOKWft90FQ2zcvtq4ehrkQngLO6X0ozw>
 <xmx:48UvXvQR8_qrT3jKJxH9MJCrXx2181yhQYH3ItjcCSppB1qC-PfA0Q>
 <xmx:48UvXunp1-ANMlhYEeGExVYPHQk0t1rc9XCME6vbLqdzBJ-iWai2mw>
Received: from laptop (unknown [196.244.191.114])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7C13A3280062;
 Tue, 28 Jan 2020 00:25:54 -0500 (EST)
Message-ID: <96c8af9e690c242c1e59dd553769907739668db2.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel <alsa-devel@alsa-project.org>
Date: Tue, 28 Jan 2020 07:25:50 +0200
In-Reply-To: <684a3597-0a5d-bc31-3fc2-b2f1f4d4eaed@perex.cz>
References: <1b39817bef4a6531d303c171aea1c757046cb4d8.camel@iki.fi>
 <684a3597-0a5d-bc31-3fc2-b2f1f4d4eaed@perex.cz>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [alsa-devel] UCM file lookup logic
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 2020-01-27 at 09:07 +0100, Jaroslav Kysela wrote:
> Dne 27. 01. 20 v 4:38 Tanu Kaskinen napsal(a):
> > Hi all,
> > 
> > I was looking at the UCM files, and most paths have the following
> > structure:
> > 
> >      <cardname>/<cardname>.conf
> > 
> > I noticed that the "HDA Intel PCH" configuration uses some other
> > scheme:
> > 
> >      HDA Intel PCH/HDAudio-DualCodecs.conf
> >      HDA Intel PCH/HDAudio-Gigabyte-ALC1220DualCodecs.conf
> >      HDA Intel PCH/HDAudio-Lenovo-DualCodecs.conf
> > 
> > How are the directory and file names determined? If I write
> > configuration for some random sound card that I don't have myself,
> > where do I find the various identifiers in the alsa-info output? I
> > don't even really know for sure what the <cardname> in the first
> > example is, I've been assuming it's the name that appears in the square
> > brackets in /proc/asound/cards.
> 
> The ucm has scheme <longname>/<longname>.conf and 
> <drivername>/<drivername>.conf (fallback).
> 
> The ucm2 has scheme <drivername>/<longname>.conf and
> <drivername>/<drivername>.conf (fallback).
> 
> Example proc output:
> 
>   2 [device         ]: USB-Audio - USB Video device
>                        317GAWCM001LON3BC1AZ USB Video device at 
> usb-0000:00:14.0-4.2.4, high speed
> 
> The driver name is 'USB-Audio' here. The longname is '317GAWCM001LON3BC1AZ USB 
> Video device at usb-0000:00:14.0-4.2.4, high speed' here. The name in brackets 
> is the user selectable identifier for the card (card id). It can be used 
> instead the sound card number.

Thanks, seems pretty straightforward!

> > I think the lookup logic should be explained in the ucm2/README.md
> > file. I can write a patch if someone expains the logic to me, but
> > probably it's easier if you just write the patch yourself.
> 
> Yes, a better documentation for the internals is missing. Unfortunately, I hit 
> other real problems with the current UCM logic and trying to resolve them. 
> Unfortunately, I am interrupted with other things so things are going slowly 
> than I want.

Does this mean that the file lookup logic is likely to still change?

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
