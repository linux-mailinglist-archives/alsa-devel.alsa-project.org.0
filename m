Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 470452C3E6F
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 11:51:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAC2B171E;
	Wed, 25 Nov 2020 11:50:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAC2B171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606301459;
	bh=7KmwxXAsBh4qIazmZU7gg8dA45ZvQ4ryCkJMzgmynrI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JhIaLgnn2Ei58TWjBjGFhN8NwahNtyHTLKZ4qkSYIDfoJghhYuSh3p+sCCF7yNCrb
	 48wPjlnveZ4yVutR8MTA6HAkqJqI/kTI4VGXEupmdBEgrDtHZAGAJXzHZlkOZ9HuY1
	 Fqtya2S/pQX0zcP0rvZ1xmbcB4qNp+e5Z7NhxrYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F774F8015A;
	Wed, 25 Nov 2020 11:49:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22D0FF8019D; Wed, 25 Nov 2020 11:49:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14BCAF8015A
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 11:49:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14BCAF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ip71s8ai"
Received: from localhost (unknown [122.179.120.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E978B2075A;
 Wed, 25 Nov 2020 10:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606301351;
 bh=7KmwxXAsBh4qIazmZU7gg8dA45ZvQ4ryCkJMzgmynrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ip71s8aixoGZIAME/43fNdrVvRNMrF6B3s6rCXeZD3oxvjrfs2kU+aFM2LwqmLeSl
 NT2owae54mLlq4I6wKdTGhf2eteUg3WsNeiFklbzsGBAXoS6GGFFtql8BP+3ZVwbbE
 MAbri21fH7P9OP/fzsuaooWLl7BIk9zXzmief3Tk=
Date: Wed, 25 Nov 2020 16:19:06 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] ALSA: compress: allow pause and resume during draining
Message-ID: <20201125104906.GE8403@vkoul-mobl>
References: <CGME20201027015726epcas2p1af97e3b6d4a54948a0e29fced35a1cd6@epcas2p1.samsung.com>
 <000501d6ac04$85019b50$8f04d1f0$@samsung.com>
 <s5h4km2rhe7.wl-tiwai@suse.de>
 <000001d6be1e$dc0e2860$942a7920$@samsung.com>
 <s5h4kldq0om.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h4kldq0om.wl-tiwai@suse.de>
Cc: 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, khw0178.kim@samsung.com, kimty@samsung.com,
 lgirdwood@gmail.com, tiwai@suse.com, hmseo@samsung.com, tkjung@samsung.com,
 Gyeongtaek Lee <gt82.lee@samsung.com>, pilsun.jang@samsung.com,
 s47.kang@samsung.com
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

On 25-11-20, 09:51, Takashi Iwai wrote:
> On Thu, 19 Nov 2020 03:51:19 +0100,
> Gyeongtaek Lee wrote:
> > 
> > On Fri, 06 Nov 2020 09:58:24 +0100, Takashi Iwai wrote:
> > >On Tue, 27 Oct 2020 02:57:25 +0100,
> > >Gyeongtaek Lee wrote:
> > >> 
> > >> With a stream with low bitrate, user can't pause or resume the stream
> > >> near the end of the stream because current ALSA doesn't allow it.
> > >> If the stream has very low bitrate enough to store whole stream into
> > >> the buffer, user can't do anything except stop the stream and then
> > >> restart it from the first because most of applications call draining
> > >> after sending last frame to the kernel.
> > >> If pause, resume are allowed during draining, user experience can be
> > >> enhanced.
> > >> To prevent malfunction in HW drivers which don't support pause
> > >> during draining, pause during draining will only work if HW driver
> > >> enable this feature explicitly by calling
> > >> snd_compr_use_pause_in_draining().
> > >> 
> > >> Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
> > >> Cc: stable@vger.kernel.org
> > >
> > >I personally find the approach is fine, but let's see what others
> > >think.
> > >
> > >One remaining concern to me is about the setup of
> > >use_pause_in_draining flag.  This is done by an explicit function call
> > >after the snd_compr object initialization.  It's a bit uncommon style,
> > >but OTOH I understand it from the current initialization code of
> > >compress-offload API.
> > Thanks for your kind review.
> > 
> > It's been almost 2 weeks.
> > So, I think that there is no further comment for this patch.
> 
> I guess it's just overlooked.  Vinod?

Sorry indeed this seems to have slipped, this mostly looks okay to me
(saw some code style nits will reply on those)

I have todo in my list to fix use of PCM_STATE in compress, i will send
that later

-- 
~Vinod
