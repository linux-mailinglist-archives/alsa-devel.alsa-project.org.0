Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 523AE3549F6
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 03:18:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D403316E9;
	Tue,  6 Apr 2021 03:17:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D403316E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617671910;
	bh=xTaSZak/JLseQDHwGQbsKoQRPq69fZma58tcPsuG/l8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rx/Z/IYrN91FPuWy8ntdSDH9zRQ6W3CYHRmyFYz1kvTfL1a6D4k+quwlJogfoxD3H
	 Vx0WmnPkgR7T8NqdjYxFXEFiJo4Ir9KUujNnW9kJjE1aK+XyDbt4pFXQYZiOR4jnsd
	 t6jjZnNKujRcUIcxYWAQds2fdSEfGEg8XkyuoO9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF635F8003A;
	Tue,  6 Apr 2021 03:17:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15EE5F80169; Tue,  6 Apr 2021 03:16:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1E6EF80164
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 03:16:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1E6EF80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ZM1DQRFb"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="tPXXmHxm"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3A0941671;
 Mon,  5 Apr 2021 21:16:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 05 Apr 2021 21:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=97X2znkot/8ImskeFqXUb6rniKU
 y/QMYtVxogu2XVaA=; b=ZM1DQRFb2C/94qX/dFA8kl8RY5Dr+lVHB8ZIbAoMGhT
 OgsjdTJiQoSDQW2SVWhWdaE2PU8shdSq8+dNnF1cFUky7duHtqdc5q31uRrDuoHp
 mLH/rhdV31rhk6krnXtoa/P39kFkr1HyhNK66jWjTwzzL5ScfBvd4MfwQa3X61F2
 +pXmOCruVn8sRZ3kpOuS7uN8EF86/8HZjQ7j3bdHvzuhSHJ5Hy3+lrZpSymP7Ucu
 92tFwOiGo6U5x/DYzgNuMVxOsuR5vOQbd4SxOAyAtlWzQ4bxcyZriF15VlZNs0hx
 og4wNOIher2aiobU/N+o5Qvojr5aRsm1DFXrLslAyRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=97X2zn
 kot/8ImskeFqXUb6rniKUy/QMYtVxogu2XVaA=; b=tPXXmHxmh4a3dOZ6gwQAsb
 p1WpQCCH82XyZF8i28YFfcg2AgeO7OJE10GWUxXzMRq2SvImpGHebz3xJWfvgHgQ
 tcDbPYjWgQC+o2aTBF24DSzhCxMWw+IwdD7mZ+8yYT2tR1aKodSDHE3kr2G21aVj
 S0g9a10wGYziUQA6z3AGaOCWnbhqM492vjO2DlugF2B1GSErIQY1SGjNMXwx7pl8
 c5GE2oJkG0DZuHiRZaqoZt/GwJZDHXZr9LesQjV5lHKkh5FzjF+d5n2SX/HikU3Y
 rbh3lrv0eiyn1j7UTUgJnqE/5zHrc1V0REH1ecZj7Nm34gIOAm4UzZfFVgyNvn1Q
 ==
X-ME-Sender: <xms:d7ZrYPVTsZL_qy8Z5NaMBEm52c8_P8yeq3euJu2nYoK7JOnFNaJsPg>
 <xme:d7ZrYHn5wOruzbsKr7b9Un5HPiaS8QznSblZyqRLMdjux_CjzuXj3yf0Z0cHqXPvW
 aTxgNwlMugCyqTXdaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejfedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnheplefhueegvd
 ejgfejgfdukeefudetvddtuddtueeivedttdegteejkedvfeegfefhnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:d7ZrYLZGOTU6T5kJUFGsf1NnhCQ4oQEDVbn7mu8wSz_zEhs-nNPErA>
 <xmx:d7ZrYKULlmfFSrrwGBIafdszUOU7h1_eprZxWeBTVtDdrd_fxqkdFA>
 <xmx:d7ZrYJn3uPeU79RTLKtJ3Ow48PIHkfLFvPz-XjOR7E-1-oV4JOlVUQ>
 <xmx:d7ZrYItE6NnVlf2ImbKcmWjjrJLgEkL3speGTzl1FZPISW6SHLXmUw>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 222811080057;
 Mon,  5 Apr 2021 21:16:37 -0400 (EDT)
Date: Tue, 6 Apr 2021 10:16:34 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: core: control_led: fix memory leak in
 snd_ctl_led_set_state()
Message-ID: <20210406011634.GA53518@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>, tiwai@suse.de,
 alsa-devel@alsa-project.org
References: <20210404064031.48711-1-o-takashi@sakamocchi.jp>
 <f0490845-a455-ceb7-3dae-6dda23cef070@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0490845-a455-ceb7-3dae-6dda23cef070@perex.cz>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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

On Sun, Apr 04, 2021 at 10:16:03AM +0200, Jaroslav Kysela wrote:
> Dne 04. 04. 21 v 8:40 Takashi Sakamoto napsal(a):
> > When inquired control element is not in led group, snd_ctl_led_set_state()
> > attempts to add the element into the group, according to function
> > arguments. Although an memory object is allocated for led instance, it's
> > left as is without being released.
> > 
> > This commit fixes the memory leak.
> > 
> > Fixes: 22d8de62f11b ("ALSA: control - add generic LED trigger module as the new control layer")
> > Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > ---
> >  sound/core/control_led.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> > index 788fd9e275e0..b97f118cd54e 100644
> > --- a/sound/core/control_led.c
> > +++ b/sound/core/control_led.c
> > @@ -161,6 +161,7 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
> >  			list_add(&lctl->list, &led->controls);
> >  			UPDATE_ROUTE(route, snd_ctl_led_get(lctl));
> >  		}
> > +		kfree(lctl);
> 
> NAK: The lctl pointer is added to led->controls list to track the related
> kctl. The kfree is called from snd_ctl_led_clean().

Ah. I overlooked it. Please abandon the patch.


Regards

Takashi Sakamoto
