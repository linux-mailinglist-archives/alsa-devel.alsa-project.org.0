Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FCB832A4
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 15:22:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20C9384F;
	Tue,  6 Aug 2019 15:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20C9384F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565097760;
	bh=vTIr8QhN3CaXpMA+AgHmerpbCNN4EFXe3Vwj92Hl9p8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d2DPylLbMOLbdl+VFy90nqhx5ly23WmZbnCO9GHDj48XpZgLtFcR7Oeqqv3MNr33D
	 Kon7s3JoZ1BxYpaB1oud1fh/bm8dGT9CZI+tVrweiIn4QHcBOJW2Y8wuj+Lojnr2bF
	 OORGG5wvBnhdUQSZr8LLkEhG6KjOk7ffuwvmPRfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6410BF80483;
	Tue,  6 Aug 2019 15:20:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5C3EF80483; Tue,  6 Aug 2019 15:20:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_NEUTRAL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43D9EF800F4
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 15:20:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43D9EF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="oGJWDPWM"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 854B32202C;
 Tue,  6 Aug 2019 09:20:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 06 Aug 2019 09:20:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=oajZVZ5i8s17xFuddwZURWuNkgdotAcBuDD+sZG6F
 3o=; b=oGJWDPWMs+Pjqz5dHavVrZCcI2ZUu3hECfbUTbx+WBTBnpftX4FF9TUKB
 XFUamXSbnpfeeDE6Iw8KubjGZRT//R11cpghdl/stklswl0AT+pf+Y7zPrv1FKMZ
 C53Tzmqf4VkWSZ3FhLcWpAFFCgbb+Z9PEmR1VtVnugUKX0VtXo86AAJJCZh9zK3y
 sWZBO4Dp0yDuuSuD4UkHWXkGDA88fVRvthNJfVX2TGFog9wNT0ZTKU1Jqxka93p3
 h4GYC1mP+fyuRKO2+ux2+YAQbvnl00ihDBEa+0bf3/IgId19WHOkfE/+LRjY49iF
 0Qf4nQjTUCjMEbIhfsQLAMaAuAEqg==
X-ME-Sender: <xms:r35JXfBKl25xuWgrDrGRS5c5nRGBSXtsFjPjPpprKg_mIn8O0RVDxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddutddgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
 ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuffhomhgrihhnpehlih
 gsvghrrghprgihrdgtohhmpdhmvghgrgdqnhgvrhgurdgtohhmpdhrvghpohhlohhghidr
 ohhrghdprghlshgrqdhprhhojhgvtghtrdhorhhgpdhprghtrhgvohhnrdgtohhmnecukf
 hppeduleeirddvgeegrdduledurddutdeinecurfgrrhgrmhepmhgrihhlfhhrohhmpeht
 rghnuhhksehikhhirdhfihenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:r35JXXVWyrrjWXlbE_4obssjFgUYJwTrix06dBvac_qy36khc3lpRg>
 <xmx:r35JXZsLtZKG6xjqYpFNy5W1_9HvZJj5YpllImHdZyaflju0ru5J8Q>
 <xmx:r35JXVG8QBBwBSrYmJpKhwZ1_8wW_HN6S1aE5_RVnmkKuanvxhe6-w>
 <xmx:sH5JXVxX44Lyv2O_LJgNyw332n7HtzP5mo5j9fF4LRPreZXGmyUNvw>
Received: from laptop (unknown [196.244.191.106])
 by mail.messagingengine.com (Postfix) with ESMTPA id CE10C38009A;
 Tue,  6 Aug 2019 09:20:46 -0400 (EDT)
Message-ID: <5e969a5245d6922d28d71a7c453dd6e3f5fd2228.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: karina filer <kafiler0911@gmail.com>, alsa-devel@alsa-project.org
Date: Tue, 06 Aug 2019 16:20:42 +0300
In-Reply-To: <CAM+cExEBpgWctFLKcVej9UnLS2VVx9CoaOigu9y3BvYGNOi1zA@mail.gmail.com>
References: <CAM+cExGffwFD7U--tZqd_PxFwgdy6YA_tZHvw6B3au9KNygEhA@mail.gmail.com>
 <CAM+cExEBpgWctFLKcVej9UnLS2VVx9CoaOigu9y3BvYGNOi1zA@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>
Subject: Re: [alsa-devel] Alsa-Plugin 1.0.25 License
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

On Mon, 2019-08-05 at 22:44 +0530, karina filer wrote:
> Hi Team,
> 
> Greetings !!
> 
> I am facing difficulty to understand the Alsa-Plugin Licensing, Could you
> please help me to make understand?, Is it under GPL 2.0 or LGPL 2.1 because
> after extracting the folder I can see 2 copying file one for GPL and other
> for LGPL.
> 
> https://repology.org/project/alsa-plugins/packages

alsa-plugins seems to lack a README or other overview document about
the licensing... alsa-plugins is primarily licensed under LGPL 2.1, and
to my knowledge the only exception is the libsamplerate based rate
plugin. The licensing is explained here:

https://git.alsa-project.org/?p=alsa-plugins.git;a=blob;f=rate/rate_samplerate.c

So this particluar rate plugin is licensed under GPL 2.0 "to follow the
license of libsamplerate", unless you have a commercial license to
libsamplerate. I don't think the rationale for that exception makes
much sense (LGPL would have worked just fine, as far as I can tell),
but at this point relicensing may be very difficult due to many
contributors.

libsamplerate was relicensed under the 2-clause BSD license in 2016[1],
which may or may not allow you to apply LGPL to the rate plugin (my
guess would be that it doesn't allow you to do that, but IANAL).

[1] http://www.mega-nerd.com/SRC/license.html

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
