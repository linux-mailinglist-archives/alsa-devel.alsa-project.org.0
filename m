Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 753D82FDFF7
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 04:11:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AFC11886;
	Thu, 21 Jan 2021 04:11:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AFC11886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611198710;
	bh=gc7qBF+fHsOLCs+ksR/OYV5OvGengemsiyjufE7d4Ns=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vcUTCpVDQcNiwEkKS3ZRRalV05Xkm3nhfARJTrxa5Gn9l6TDLGbXQKcJc+mQ0fJk3
	 dd4I5/Hbs1xgLiZJZnJ6XKPhEuWH4d2LWdMhzJAqScHVZmgUuuzyswWBZPyNMUharz
	 nlyOrlMPA24T1ghTb+ahzQ2dT0yG1SDL6ktVg14s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73186F8026A;
	Thu, 21 Jan 2021 04:10:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40837F80257; Thu, 21 Jan 2021 04:10:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C479F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 04:10:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C479F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="P1F6nDUi"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="X3KDGD+N"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4ECEF5C013B;
 Wed, 20 Jan 2021 22:10:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 20 Jan 2021 22:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=hAsia9x6krGJ36zLkcJwWI4uHeD
 G/bi7ZDSxijtXvq0=; b=P1F6nDUi9QDiq7cJq/kiHtPeTJjhlwRIZSiY54/8HKr
 17ZPC+mc7LHc8ycJ8hkNQVGHuIYK8uD7v5uQEyfBQGYE+92K8rbgFBUtd5EEjWcN
 QGIS2F8IRdH6N5gwy18RS+IULeXmpyg2Jt7OEcroFI3TwW41NiYEdzQUI45juNfQ
 u88P3DfRdrv8ROXvO24iSa2jZIYD5b9zr0pJaFTTtKNziyZovV0y0sBa33zWeT2y
 vXKEg5PmeW0AQONd09NUa5BvIKPvXf+pv1YPi2ZA2xJmzm/A3AFQ2XvFkzpm1ikD
 AkzHR4H8DM9BnnsAozfzTY2u/t1uGhLINXPxn8g0TNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=hAsia9
 x6krGJ36zLkcJwWI4uHeDG/bi7ZDSxijtXvq0=; b=X3KDGD+NX7d+ggGMfOjNSB
 4i0OQQFrQBYAUHAB1Lldlfj31Q4kBDWDz61igf+defd0fBxvc72cL7beGjz9SNKB
 dVWhap2orhE+qfjp+Zc5/7re5//G/rI5zx5BDWQRLwL4xGRG3Gf/wHZQE1D2GlEn
 r9sAPnBUzwXuZgawC+AXnjta+iIzXZBBf54jt6sLzk5oT21cf+wiw8KuX8hVqEu7
 bNM2k5A9FMeakq3tDlMKuPpfsgeJrB3B6/AeJ2FWqQSuiQpatdivHyj5RHWquTlG
 DiHodBwNSruY9lwr7ZVkv/1JGFGTDBMPZbvvkJm4veVSelm1heGwdJPJWGauvTMw
 ==
X-ME-Sender: <xms:jvAIYES51OjNleYoBWsO8aVqBczKbjQDtBwwPe98Q8lyyCv9pbJNrA>
 <xme:jvAIYDxl2H9UnWXRcTXks7_7nTWchfk9FIPdNx0LaYU_UGDuJSLcmyYZnNnyxF_eN
 CD4Ms0mpeMXN7xTS6M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnhepleefleeikeeiieevtdfffeeiheefhfdufeeiieffhfet
 ffefheefvdevuddugfdtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepud
 dukedrvdegfedrjeekrdehkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:jvAIYLOD3J15G8A8f4n1j10MWQ-cyi1cF9XC5yHZaYsYLWUjngSWqg>
 <xmx:jvAIYKPaX5lNphpku4yhAmH4hIGVAqjK1FNhqzVKVmTj0VRB7YRu9Q>
 <xmx:jvAIYFR2LRaECgqTrJl6KjQvtaBz8Qjtj-9itcVF6LQYr19g3eei8Q>
 <xmx:j_AIYOZEvWa6d7CR04zr9KNRJ-BsZgmlFF0x84ycfP8AdrHd7_m6tQ>
Received: from workstation (y078058.dynamic.ppp.asahi-net.or.jp
 [118.243.78.58])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7E018240068;
 Wed, 20 Jan 2021 22:10:05 -0500 (EST)
Date: Thu, 21 Jan 2021 12:10:02 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: control: remove limitation on the number of
 user-defined control element set per card
Message-ID: <20210121031002.GA12087@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20210120085541.28607-1-o-takashi@sakamocchi.jp>
 <s5hwnw8dkkw.wl-tiwai@suse.de>
 <0fbe411d-0fbe-b337-c93e-d8788ee6b67a@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fbe411d-0fbe-b337-c93e-d8788ee6b67a@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

On Wed, Jan 20, 2021 at 10:38:36AM +0100, Jaroslav Kysela wrote:
> Dne 20. 01. 21 v 10:27 Takashi Iwai napsal(a):
> > On Wed, 20 Jan 2021 09:55:41 +0100,
> > Takashi Sakamoto wrote:
> >>
> >> ALSA control core allows usespace application to register control element
> >> set by call of ioctl(2) with SNDRV_CTL_IOCTL_ELEM_ADD request. The added
> >> control element set is called as 'user-defined'. Currently sound card has
> >> limitation on the number of the user-defined control element set up
> >> to 32.
> >>
> >> The limitation is inconvenient to drivers in ALSA firewire stack since
> >> the drivers expect userspace applications to implement function to
> >> control device functionalities such as mixing and routing. As the
> >> userspace application, snd-firewire-ctl-services project starts:
> >> https://github.com/alsa-project/snd-firewire-ctl-services/
> >>
> >> The project supports many devices supported by ALSA firewire stack. The
> >> limitation is mostly good since routing and mixing controls can be
> >> represented by control element set, which includes control element with
> >> the same parameters. Nevertheless, it's actually inconvenient to device
> >> which has many varied functionalities. For example, plugin effect such as
> >> channel strip and reverb has many parameters. For the case, many control
> >> elements are required to configure the parameters and control element set
> >> cannot aggregates controls for the parameters. At present, below models
> >> are implemented with the control elements and actually add control element
> >> sets over 32:
> >>
> >>  * Apogee Emsemble (snd-bebob-ctl-service)
> >>  * TC Electronic Konnekt 24d (snd-dice-ctl-service)
> >>  * TC Electronic Studio Konnekt 48 (snd-dice-ctl-service)
> >>  * TC Electronic Konnekt Live (snd-dice-ctl-service)
> >>  * TC Electronic Impact Twin (snd-dice-ctl-service)
> >>
> >> It could be investigated to increase the number; e.g. quadruple to the
> >> current (=128), however it's hard to find criteria about the number for
> >> existent sound card. This commit just removes the limitation for the
> >> reason. ALSA control core uses UINT_MAX as the maximum number of control
> >> elements added to a sound card. It's limitation for both in-kernel driver
> >> and userspace application.
> >>
> >> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > 
> > I'm still worried by the unlimited number of possible additions.
> > Did you check what would happen if you run a test program to add
> > user-space ctls (with the max count) in a loop repeatedly?  If that
> > doesn't blow up too much, it might be OK.  Otherwise we have to add
> > some practical limits.
> > 
> > So, let's prove that it's absolutely safe to release the limit at
> > first.
> 
> I agree. The UINT_MAX limit is really big in my eyes. The condition was added
> to check for the insane allocations. I basically agree to increase this limit
> (512, 1024?), but it should not be UINT_MAX.

Thanks for your comments. I have no objection to relax current limitation
instead of removal.

Either 512 or 1024 (of course 32), it just comes from multiples of 2 and
seems not to be reasonable for the practical limits. However, as I
note in the commit message, I cannot find no criteria for the limitation.
In this time, 40-50 control element sets are enough for the service program,
thus I'll post v2 patch with 128 as limitation enough large to the
requirement.


Thanks

Takashi Sakamoto
