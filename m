Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F22ACB63
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Sep 2019 09:50:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10810165E;
	Sun,  8 Sep 2019 09:50:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10810165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567929053;
	bh=AHVCU8InqRxzGOfPMhkG8l3cUfQLovj1p8aYe5dl/2w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RfHthSEm1xj9lz37/BBVRwYfxElQEZFpcq76dfJqrKs8VlP/SzwzItZW6Q4cExSJV
	 FAjy7VU+MAlMSgInVB9sDAEasN2stWE/UAi5uOqPgpc0WkvjiaeMWMwQDLXAZNiZuN
	 hHI9+ip6ZdSUTVkmuNgvINMBK4l7SMKWgTLmk+Qs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B08EF80368;
	Sun,  8 Sep 2019 09:49:09 +0200 (CEST)
X-Original-To: Alsa-devel@alsa-project.org
Delivered-To: Alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5A7CF800C1; Sun,  8 Sep 2019 09:49:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_NEUTRAL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0749F800C1
 for <Alsa-devel@alsa-project.org>; Sun,  8 Sep 2019 09:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0749F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="wpjofOz/"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 33E6421CDD;
 Sun,  8 Sep 2019 03:48:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 08 Sep 2019 03:48:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=rzeARmF+u5WSHLH7sYAaAxvxLobCK6aC/VUE9MXRF
 Ts=; b=wpjofOz/aafCv+8X7YlTj4HThoXkAEjjN8aXTF84Ikc7JpIF/rI6K0bB6
 bJOpgHrgP8u95mj2AbzFTo9uwZF4UNQiDhkTpbnhTg9aWxxr9johKnlsGJv7ZwqA
 9qz/SOPGCkyAWjeBI1cX2NCCdo+16rUtAYkfqw1cqfeFpyuAfZPXHLHHkNVRqp/i
 V0mIf4iU8TPaB4tJkqQCR7sRDbnmSs+ubWbY6SblnEogER5l+tm/tbb+RGNkqP7m
 Jqq0O4zeZKt8L/Mm87RR1fkPCIuNo7W5/domthsJ0hMGKoWSEI46enqvs5f9uARW
 BzoIu38cnOARu0zU3IzaZQi7awTOA==
X-ME-Sender: <xms:arJ0XUis6HT1cyDC1HN0rzEpSFdlyyrBT9SJ0E9a6niRCxEUpChrsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudekfedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
 ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuffhomhgrihhnpehlih
 gsvghrrghprgihrdgtohhmpdhprghtrhgvohhnrdgtohhmnecukfhppeekkedruddufedr
 vdduuddrjedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfih
 enucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:arJ0XSuZUsk2ZnsSN3SVNF3a4VwXvgHi5XxYlBEtmtX5tF_E2C81lA>
 <xmx:arJ0XdTrxLCmvPIFTmDlgzd69ttzMWQX11MCMtfqLmnJTYbaUg_2PA>
 <xmx:arJ0XTEbqbbsh5JhKc_InfCNQ7CfS88B5TLQzZkAB7siTb1pEcMFLA>
 <xmx:a7J0XRpouyKQxoYZUxbUbvwfEyYuVuc6wMqhxDMJP1Um-wns2iNFjA>
Received: from laptop (88-113-211-72.elisa-laajakaista.fi [88.113.211.72])
 by mail.messagingengine.com (Postfix) with ESMTPA id 462868005C;
 Sun,  8 Sep 2019 03:48:58 -0400 (EDT)
Message-ID: <c3986f3fde3a2e008d9c2d81542aaacf9d751e62.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Eric Desjardins <desjare@gmail.com>, Alsa-devel@alsa-project.org
Date: Sun, 08 Sep 2019 10:48:54 +0300
In-Reply-To: <CADsNRHsGeM3bMv3Xh++QbZXeR1PBr30VkzoweyCqMKeAguXRUg@mail.gmail.com>
References: <CADsNRHsGeM3bMv3Xh++QbZXeR1PBr30VkzoweyCqMKeAguXRUg@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [alsa-devel] 5.1 to stereo using libasound
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

On Sat, 2019-09-07 at 10:07 -0400, Eric Desjardins wrote:
> Hi,
> 
> I am playing a mkv with 5.1 channels from a mkv. I configure libasound for
> 6 channels and I feed them interleave audio using snd_pcm_writei. I use the
> default pulse audio device.
> 
> So far, nothing is wrong. However, I do not ear things correctly. I listen
> this on my stereo speaker. There is no mixdown to stereo and I was
> wondering how to do that. I tried to use chmap api but anything I try on
> the default device returns an error.
> 
> I was wondering what was the correct way to do that?
> Using the mixing api?
> How do we detect that my device output stereo if chmap doesn't work?
> 
> I am on a ubuntu 18.04 linux box.

The pulse plugin takes your audio and sends it to PulseAudio without
any modification. The ALSA API doesn't allow the application to tell
the channel map of the stream, so if you send 6 channels, the pulse
plugin assumes that you are using the default 5.1 channel map (front-
left,front-right,rear-left,rear-right,front-center,lfe).

The PulseAudio daemon then downmixes the audio to stereo in some way
(the details depend on PulseAudio configuration). You can't detect from
your ALSA application whether the device that PulseAudio is using is a
stereo device or something else.

Since it's apparently not working as you expect, does your application
use the default 5.1 channel map that I mentioned above? Is PulseAudio
configured to do remixing ("pulseaudio --dump-conf" should show
"enable-remixing = yes")?

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
