Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 535362C99D4
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 09:46:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE3CC17BF;
	Tue,  1 Dec 2020 09:45:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE3CC17BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606812409;
	bh=ziCPo7oItnSC4a021+bORkV2XqysqISFvgpMU93k1eA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VsffPJ2wYzPbJE+K8P9F2k8/NVi7y/yPcr0qJ9u3KisEIJCjF3/uEKe15rm7Cedwg
	 hizrgR1Us0LU4OGe6k/U9hX57PQd+865bZMM/LuBJ33F9pUDU/7F0Bqt7RL3/vVXnX
	 Xoo+SLsa8vlrLWWpgaziU8VEAw5JUZoTyHUJR4BY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0D38F80515;
	Tue,  1 Dec 2020 09:42:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56887F80511; Tue,  1 Dec 2020 09:42:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, PRX_BODYSUB_1, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS, SPF_PASS autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67BE1F8050F
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 09:42:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67BE1F8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com
 header.b="11InS3IX"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ZNtE5X9k"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E67EA5C0191;
 Tue,  1 Dec 2020 03:42:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 01 Dec 2020 03:42:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=G5iYvQJ/IEHDDv47uDKzi67A92D
 +rXCZFinCidCd03M=; b=11InS3IX42AAAeeCRj+oZsOtlVM5IZFdzJ1vNsFrlUt
 KPc9FwfOG6e7/CRrhwFWV6AazmqRNeyCNJ8Wm2w+W1KSltoEQ40uhPxwlXb+N75Z
 vdyQsuXkLHO24rHwzsSiNYlOmB6UCnIXMihc9y0pMzj/GYhwa3ZwX3NFes9BjSFZ
 mBO/hc5Ojsd2Nubfwd1KAisFVcf6Q09mWTm//kcuwwCe/rKInWe0FLRSJMghY0qH
 genR+6/Xpz1utJTR6xjlJdqRGJIruj3q0q8IvtcOQ3KLWXA/SuNZPtU+w/TwLFTZ
 faE6Ljg3udAXg7PH3OCN1ua30y38TnFE0cLe95dFN9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=G5iYvQ
 J/IEHDDv47uDKzi67A92D+rXCZFinCidCd03M=; b=ZNtE5X9k6TAVuX5D5PPxzI
 l1aPMwyqkmsILeoaHLH6FTPFkM17103VB16PaV9osOqTuaZmNchBrGC08PgWFx8A
 ywDVpFrW3LVUlsnJO1uEjX6ul2DhuayJqmt1eZdGvn0hPhxZuN4KLA+oD/ZRsvMy
 5rVRKcbCQpZDspQYwtOkNorEhg3sbJYy3dPggnUQe3FuCoh8vVo26kJITnQjETg1
 m3V3St+jKMJlpty1U217INtQgXpvEdrtL580m6YbBLBsgXc2fTL2gSOEbaEgifcq
 FT8v03l6r0Gz1W9r/c5lqYL9e3X/d5tSvY40g+J7lWavSP8YtQD8r87LR35UHOtA
 ==
X-ME-Sender: <xms:4QHGXxro317dbOD_lMTCTIQa2kYbCm7TCJwTP7ihxx5lP4cFanxMFg>
 <xme:4QHGXzpLy1u4srOb9bONX2B7XuaxyQ7ttD_G3WlOhGyCqFDHyUWeC8D8wXJXKQTV8
 P1sCemez-zl0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeiuddguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepueelle
 dtheekleethfeludduvdfhffeuvdffudevgeehkeegieffveehgeeftefgnecuffhomhgr
 ihhnpehkvghrnhgvlhdrohhrghenucfkphepkeefrdekiedrjeegrdeigeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgr
 hhdrtghomh
X-ME-Proxy: <xmx:4QHGX-N7_VdZnuYAhcwxQ4X9CLbfdqIc1aX2Pon23MwvrwtWE9g7gA>
 <xmx:4QHGX84dY4gnXM4L0deaSr4ctc1Qm5FGXASzOLEZRdZqSVV59g_uJw>
 <xmx:4QHGXw6JJnnvPhdkEb5DzByLDrRhlEGz4ZtL1fjiyuK-wBlu-FhHeg>
 <xmx:4gHGX6SF1zFNXhdNzFQ1PXtgaLhXv1HypYGkWwkR00Ja1fmc5lr7tw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4F8233280063;
 Tue,  1 Dec 2020 03:42:09 -0500 (EST)
Date: Tue, 1 Dec 2020 09:43:22 +0100
From: Greg KH <greg@kroah.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/8] ASoC: Intel: Skylake: Fix HDAudio and DMIC for v5.4
Message-ID: <X8YCKiV8/MWKMAUd@kroah.com>
References: <20201129114148.13772-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201129114148.13772-1-cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 mateusz.gorski@linux.intel.com
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

On Sun, Nov 29, 2020 at 12:41:40PM +0100, Cezary Rojewski wrote:
> First six of the backport address numerous problems troubling HDAudio
> configuration users for Skylake driver. Upstream series:
> "ASoC: Intel: Skylake: Fix HDaudio and Dmic" [1] provides the
> explanation and reasoning behind it. These have been initialy pushed
> into v5.7-rc1 via: "sound updates for 5.7-rc1" [2] by Takashi.
> 
> Last two patches are from: "Add support for different DMIC
> configurations" [3] which focuses on HDAudio with DMIC configuration.
> Patch: "ASoC: Intel: Skylake: Add alternative topology binary name"
> of the mentioned series has already been merged to v5.4.y -stable and
> thus it's not included here.
> 
> Fixes target mainly Skylake and Kabylake based platforms, released
> in 2015-2016 period.
> 
> [1]: https://lore.kernel.org/alsa-devel/20200305145314.32579-1-cezary.rojewski@intel.com/
> [2]: https://lore.kernel.org/lkml/s5htv22uso8.wl-tiwai@suse.de/
> [3]: https://lore.kernel.org/alsa-devel/20200427132727.24942-1-mateusz.gorski@linux.intel.com/

Thanks for these, it was very easy to pick them up in this format, much
appreciated.

greg k-h
