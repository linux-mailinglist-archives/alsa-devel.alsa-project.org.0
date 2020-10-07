Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A36D1286217
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 17:25:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A89C116C3;
	Wed,  7 Oct 2020 17:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A89C116C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602084351;
	bh=y5jQVvlKqyqmkygx24ViuGLCNgt17OQV6UXGQRiizAA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NsX1N+P3SvuaRleK6W743/txFyxATo+yiVK7zWW4+M9pjPrE+FLVIG2cXdB5kSTiB
	 8P7eRS0VXDYBsBcdNsF9Ho0TSL34OgCq3+T2NhVYxUcr8I75ypp74FV+8/ePwAKzC/
	 kqn2j2onoY9NAwNW9ZH4HFbRq8C4d5K4kSU/hk70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F8E8F800EE;
	Wed,  7 Oct 2020 17:24:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 213A2F80128; Wed,  7 Oct 2020 17:24:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 838BFF800EE
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 17:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 838BFF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="VAa/OwEd"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="oG0+tRcz"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 5EB4B3C2;
 Wed,  7 Oct 2020 11:23:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 07 Oct 2020 11:23:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=F3wxxdxDutE2V1vm1ttQwn8wC5g
 kMeHgT4hBmU03O/Q=; b=VAa/OwEdqvTIdivf0jrsmEvL53TgPzC9tydcVxGPJy/
 HR6Zro7SdmI3hONqX83OPjIUyxazK1WLI9Xf3C4XqqMLRl2rwtkgReIV2L1tpTMp
 x7iABAWvYyVT4I49T7mS33Xr/2nLzV6pRKAR5z/IGncPL7HgFiZDEK4Qhp0Abp82
 tEJpy19pV9SeBqIGvskLqNgiqKQBPkG6rHhvXd1hXi5x/hMkrkOxyY7hHJgR/+TT
 tVKr1moFTrUrKOUS/k2+1QR19YXgiDM7LXxpkeuVIkfFeLc0Aw22JqSVYP4R/dVf
 gCK/CoWzwQRviX0ZAshlK8GVCbSQd4VgrIuAP9sp50w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=F3wxxd
 xDutE2V1vm1ttQwn8wC5gkMeHgT4hBmU03O/Q=; b=oG0+tRczAFiU5Gofz/Ue//
 ETkie8mwDx62Eoe1oVaDsGdPcYE83nfoNqbqZAJy8tSAioTzfeZHURp9rnpfvuwF
 QV0JAZ47DvfAgRHU/Xf4YeqKbjUCJ79hQDfwJhdbCWbGOsHt5UQfLQktznXcgAVh
 57OtQDvIsiFc0szOd8N4j92OvcGgNkQpC6W7IcU1jvcLtEqO3bwMSAjRmX6xsbzt
 OFOImyQk/r+tHVRDILyXjB3G0Poj5prp1RiBDVAr7YEQ0phkiITLaF86ly9oM2SU
 goXsubm3kCPL1kziELRJo0BPkuYKF62FdBzib32nmdyUyDZQGdOLGaKznZXpjtqA
 ==
X-ME-Sender: <xms:iN19Xysnm0NXal8kSLPmReoKV2TODKENxE7cvkqe-H7U91paVCYH8w>
 <xme:iN19X3dr2ttvoVNCC6RxZw7djmWpSLZ-eKwbgTrSHRCKlr42zH4yWQUR3gfyttM4j
 A_LjlTh7U4I51QcUGo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeeigdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueeivedt
 tdegteejkedvfeegfefhnecukfhppedugedrfedrieegrddvtdejnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgr
 khgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:iN19X9wDoROkDY7AYpUVzQuDCqCHACklGp559g7nACjZ51VMhlJqqA>
 <xmx:iN19X9O4uaB6jL_Ql7GB0KXW6QDaN1eu3x1Qn432ikob3zYQgWu8vQ>
 <xmx:iN19Xy8I6eNVK2P0FZyDHTcrhqfmAns9_sUixAQIfhRZC9N-sr-uiA>
 <xmx:id19X5bNiwxMeKvFLGpj-udYtfwxui9L593R1GDFgRuCwqoAWaFoLg>
Received: from workstation (ae064207.dynamic.ppp.asahi-net.or.jp [14.3.64.207])
 by mail.messagingengine.com (Postfix) with ESMTPA id A817B306467E;
 Wed,  7 Oct 2020 11:23:50 -0400 (EDT)
Date: Thu, 8 Oct 2020 00:23:48 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Clemens Ladisch <clemens@ladisch.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ALSA: bebob: potential info leak in hwdep_read()
Message-ID: <20201007152348.GB73459@workstation>
Mail-Followup-To: Dan Carpenter <dan.carpenter@oracle.com>,
 Clemens Ladisch <clemens@ladisch.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
References: <20201007074928.GA2529578@mwanda>
 <20201007130437.GA73459@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007130437.GA73459@workstation>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
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

Oops, I forgot to add my tag to the former message.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

On Wed, Oct 07, 2020 at 10:04:37PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> Thanks for the patch.
> 
> On Wed, Oct 07, 2020 at 10:49:28AM +0300, Dan Carpenter wrote:
> > The "count" variable needs to be capped on every path so that we don't
> > copy too much information to the user.
> > 
> > Fixes: 618eabeae711 ("ALSA: bebob: Add hwdep interface")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  sound/firewire/bebob/bebob_hwdep.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/sound/firewire/bebob/bebob_hwdep.c b/sound/firewire/bebob/bebob_hwdep.c
> > index 45b740f44c45..c362eb38ab90 100644
> > --- a/sound/firewire/bebob/bebob_hwdep.c
> > +++ b/sound/firewire/bebob/bebob_hwdep.c
> > @@ -36,12 +36,11 @@ hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
> >  	}
> >  
> >  	memset(&event, 0, sizeof(event));
> > +	count = min_t(long, count, sizeof(event.lock_status));
> >  	if (bebob->dev_lock_changed) {
> >  		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
> >  		event.lock_status.status = (bebob->dev_lock_count > 0);
> >  		bebob->dev_lock_changed = false;
> > -
> > -		count = min_t(long, count, sizeof(event.lock_status));
> >  	}
> >  
> >  	spin_unlock_irq(&bebob->lock);
> > -- 
> > 2.28.0
> 
> Indeed, the bug can leak the contents of kernel memory into user space
> unintentionally for the size indicated by ALSA HwDep application...
> 
> I will check the other drivers in ALSA firewire stack later for safe.
> 
> 
> Thanks
> 
> Takashi Sakamoto
