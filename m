Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3336B8BA8
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 09:37:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E134167E;
	Fri, 20 Sep 2019 09:37:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E134167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568965077;
	bh=9KQfmlUeTwlSyAcbYOvnqdlsj1wLgfYlIcGPgg6DMo4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fFUPVJlsvOuDuEhz36cI9SusqUhitKvfUiVyBQteUX7fYH3xjz0CCu4KgFaMlsb56
	 6go2tZarIhwS96ZsJkDzbvnhhI9aTS6I9bzjYsLgi1dVF7LwSeOVZgJGr/LU5uibrM
	 /7+GwThTlsppeUAlxtBs9wFs+t5K6Bwo+IG1BPXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB0C6F80527;
	Fri, 20 Sep 2019 09:36:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AECCF80506; Fri, 20 Sep 2019 09:36:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_PASS,SPF_NEUTRAL,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C672DF80096
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 09:36:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C672DF80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="s+kwXW0U"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 528173851;
 Fri, 20 Sep 2019 03:36:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 20 Sep 2019 03:36:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=47P8aLoR50rM5tOSn96HFR2GfHC8MapJoF2FHbPbG
 g8=; b=s+kwXW0UYzK9O3d7eVLMJ/ob1vI0Rdth+nyiNc9AnQ+WsUtgr3ZQ49Uo5
 J9LyPYYR6ZAFDMvqx02Lg0q9TtNVsUF7y8b3JXY3TM7AycW1HPrqkX41yVuPzNeG
 VpfCdbRTzbHQLxsg3dCkO4LeyRFQk11R4/VP7tEykB1lpjGNIaA0vpv55+AbPwtC
 XQ4ll3OGloGqKY1px7xEieXhMVMrOsEwkQ/zXWdutiG/Jy7MRyOnR85f5eor8GQ9
 ViGrCqzan4I+RGZmFfLyHksZirDBQ2kJXIjFzwe9NPhjKhUZATo2rxizCnQ843Bi
 zjIq6DmTIBf2C/FJ1NHGT4YwumlpA==
X-ME-Sender: <xms:ZIGEXfTnxusXJYux0--FK615shoOUoUcJg7qGG-OJQG7aMe0bxtL1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddugdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gorfhhihhshhhinhhgqdfkphfpvghtfihorhhkucdlfedttddmnecujfgurhepkffuhffv
 ffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhuucfmrghskhhinhgvnh
 cuoehtrghnuhhksehikhhirdhfiheqnecuffhomhgrihhnpehlihgsvghrrghprgihrdgt
 ohhmpdhprghtrhgvohhnrdgtohhmnecukfhppeduleeirddvgeegrdduledurdeltdenuc
 frrghrrghmpehmrghilhhfrhhomhepthgrnhhukhesihhkihdrfhhinecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:ZIGEXdqMLC4lW-0TbiRe5P35gD3veCNoivMBG7RWhyE0HZlE3RAr_Q>
 <xmx:ZIGEXTn-5DmIiAoknAdnDR_CwlzpPNwPbqZGQWwAb-io2XB733PbTQ>
 <xmx:ZIGEXTRzpmwt4VXV6dJg5f9otz7rhBEY_UgGS5vI2dBJ4A5HDWTOsw>
 <xmx:ZYGEXQt-gyXELYewXD09VFh39AfflprL-XKPxaY1pRGGYfi7uRQ1rA>
Received: from laptop (unknown [196.244.191.90])
 by mail.messagingengine.com (Postfix) with ESMTPA id B527780061;
 Fri, 20 Sep 2019 03:36:03 -0400 (EDT)
Message-ID: <7c81ae80233efb25b25f2d1f941e9c11acb3967b.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: frederik@ofb.net, Takashi Iwai <tiwai@suse.de>
Date: Fri, 20 Sep 2019 10:35:59 +0300
In-Reply-To: <20190919211244.buu3d6ey4k2dxyul@localhost>
References: <20190904164706.gwjbcywbj7emnwvr@localhost>
 <s5hv9u19x2f.wl-tiwai@suse.de> <20190910173345.63bv2xa4vlkxicxj@localhost>
 <365e4bcc033c151076140471225db51c80808b7f.camel@iki.fi>
 <s5himprulnt.wl-tiwai@suse.de>
 <e294e2985eda906be3c3625235cc28643208dab2.camel@iki.fi>
 <s5hblvjukn6.wl-tiwai@suse.de> <20190919211244.buu3d6ey4k2dxyul@localhost>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] parameter for pulse device?
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

On Thu, 2019-09-19 at 14:12 -0700, frederik@ofb.net wrote:
> Thank you for the tips.
> 
> I don't know if my input is still needed, but I figured out from
> looking at some of the syntax you linked to that I can put this in
> ~/.asoundrc and it does the job (this is what I had had in mind when
> I asked about "magic with macros", it is somewhat advanced for me):
> 
>     pcm.!pulse {
>         @args [ DEV ]
>         @args.DEV {
>             type string
>             default "default"
>         }
>         type pulse;
>         device $DEV
>     }               
> 
> Now I can set up a filter like this:
> 
>     ecasound -i alsa,pulse:mic -o alsa,pulse:monitor
> 
> Is something like this going into the alsa-plugins repo?

I'm sure something like this will be accepted if you submit a patch. I
got the impression that Takashi isn't willing to write the patch
himself, and nor am I, so you're in the best position to make this
happen.

Note that

            default "default"

doesn't do the intended thing with the current pcm_pulse.c code. With
the current code the plugin will request PulseAudio to use a device
named "default", which most likely won't exist and playback or
recording will fail. The plugin code needs to pass NULL as the device
name to pa_stream_connect_playback() and pa_stream_connect_record()
when it detects that the default device is requested, so you'll need to
modify pcm_pulse.c in order to make this work. Instead of "default" as
the special string in the configuration, I suggested using "".

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
