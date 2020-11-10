Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ACA2AD0F5
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 09:14:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C26DE16CF;
	Tue, 10 Nov 2020 09:13:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C26DE16CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604996044;
	bh=6ZrvfE7Ze2PK3ksLyvJCUPNt6Oik+V4p/wavks6ZSZ8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k+7/cA47PvTRmoAyPwaTLWrwP3cM9tYkB+OpSs4U4R2xzWlL9nCA6PPiIc218/cfo
	 TbuF4OOGIJRIM9ke1cep0f+k2j/gYxbU3U+o+slpFo4tk4Va/2qJzA7XuDKQh5kBUT
	 RVDdgxF1z8TUxKwoNammJIBC4puFqK5szM63Z5F8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49928F80059;
	Tue, 10 Nov 2020 09:12:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FD19F801D5; Tue, 10 Nov 2020 09:12:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0264F800AE
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 09:12:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0264F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="FTPc/fhL"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="jzDwyVq3"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D3A4B5C0180;
 Tue, 10 Nov 2020 03:12:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 10 Nov 2020 03:12:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=U1LfiC5Xa/E1oIfmlMHoNEZwb+i
 nOk2P6HGJve+Wjqs=; b=FTPc/fhL77+zD5OahwzAQueOBSarEzpSfubCMBgKUhz
 JJwofjjQeXu7p6mWe3mSzwk9W+vDZX27NLGyHto1woOmcfQi1h+bCGL44g+vxWLr
 ga2eFHbF0g+12PjjKoffZeBbKsE3mjCb73PFadVb+gTGwYyX5LaUb3UhnKOIo/2A
 hAYA45elLVRHG0fMgwFqb0CwW4S6dJU4R6dqLa9f9EH2EqvDYaUUzE5gs7XplLat
 h10xK7o0arW7kGiG9fNjzaj3C5Q41dRMcEfR20sVT3gYapeuOEyVIMEBMo9XWDfO
 85AO29itaPzYFNg7v9e7f7LPzmJvLlQqK3COwh3Yp/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=U1LfiC
 5Xa/E1oIfmlMHoNEZwb+inOk2P6HGJve+Wjqs=; b=jzDwyVq30MthjCAju/F3md
 f+bT5ikVV2oNiWQtJFT2LVWEPzRRQbeIOvUylkgRPi7ws4VL8cJWGtUgByjelK/2
 nffC+mGube0FO0aAWWMiW7trvkQztvTPD2nVxNf5lzTJiy6Zv4bLrMBIrW/GI0i9
 2q7zP2yuYF+YHxLRFU/0g1zhKh5pqIZzv4XM19a1nj83qwxM8jg6C2shyJZBlijk
 7esWPQNNWgQ8tQo7eufv+i6/hOZ5PpFGjOPrFZHahwaGgsfc+XV+RTMKSVyr1uZz
 6gmUXKngpReKt1zyvCHGSu3moX6rXEkiYXJIwlD9OBRzgLwub9sbFipxJzLslIjw
 ==
X-ME-Sender: <xms:ZUuqX0kGhji1b0zOUEC77QCvWTIlsk2r-EbDw9rk6kVe3glkmi71Tg>
 <xme:ZUuqXz1f-NsBjojz4lc0yKxcFd7lDXdUARbEyGydWBZOByBIAYU6T69j-nbGNYvLM
 rAicWHLwuB75UuSiDY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudduiedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueei
 vedttdegteejkedvfeegfefhnecukfhppedugedrfedrieegrddvtdejnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihes
 shgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:ZUuqXyqz7Xcy6C696irGOpfpKpPa62ZOHMzNXWkve4jNMOOznPrqlg>
 <xmx:ZUuqXwlxyHprMiNMY8QbKU69fLrCSHnwptXKOIlt24QzX2lp6YgyFw>
 <xmx:ZUuqXy37dZuaTt8X3DTlTCZ7CCZnfDv-lU5BrK4mx8G23ezkJVyjDw>
 <xmx:ZUuqX3xWqAvlpvb53u6OTQU3XjizaegHbL9hvQqfffiRGN6ZBR_4NQ>
Received: from workstation (ae064207.dynamic.ppp.asahi-net.or.jp [14.3.64.207])
 by mail.messagingengine.com (Postfix) with ESMTPA id DFBF13063080;
 Tue, 10 Nov 2020 03:12:19 -0500 (EST)
Date: Tue, 10 Nov 2020 17:12:17 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: firewire: fix comparison to bool warning
Message-ID: <20201110081217.GA50128@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, xiakaixu1987@gmail.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Kaixu Xia <kaixuxia@tencent.com>, tiwai@suse.com
References: <1604765611-8209-1-git-send-email-kaixuxia@tencent.com>
 <s5hblg5ljp6.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hblg5ljp6.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Kaixu Xia <kaixuxia@tencent.com>,
 linux-kernel@vger.kernel.org, xiakaixu1987@gmail.com, tiwai@suse.com
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

On Tue, Nov 10, 2020 at 09:06:29AM +0100, Takashi Iwai wrote:
> On Sat, 07 Nov 2020 17:13:31 +0100,
> xiakaixu1987@gmail.com wrote:
> > 
> > From: Kaixu Xia <kaixuxia@tencent.com>
> > 
> > Fix the following coccicheck warning:
> > 
> > ./sound/firewire/amdtp-stream.h:273:6-19: WARNING: Comparison to bool
> > 
> > Reported-by: Tosk Robot <tencent_os_robot@tencent.com>
> > Signed-off-by: Kaixu Xia <kaixuxia@tencent.com>
 
The message seems not to reach my mailbox. Anyway:

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> Thanks, applied.
> 
> 
> Takashi
> 
> > ---
> >  sound/firewire/amdtp-stream.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
> > index 2ceb57d1d58e..a3daa1f2c1c4 100644
> > --- a/sound/firewire/amdtp-stream.h
> > +++ b/sound/firewire/amdtp-stream.h
> > @@ -270,7 +270,7 @@ static inline bool amdtp_stream_wait_callback(struct amdtp_stream *s,
> >  					      unsigned int timeout)
> >  {
> >  	return wait_event_timeout(s->callback_wait,
> > -				  s->callbacked == true,
> > +				  s->callbacked,
> >  				  msecs_to_jiffies(timeout)) > 0;
> >  }
> >  
> > -- 
> > 2.20.0

Regards

Takashi Sakamoto
