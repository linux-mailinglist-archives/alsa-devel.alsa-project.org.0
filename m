Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E6665D174
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 12:32:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4377393D;
	Wed,  4 Jan 2023 12:31:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4377393D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672831963;
	bh=v+0G+kQjDPZcgzyLAonltcocpIDs/oeo0yIa+WxMioo=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tftmI4Ex3P2QbIZ1gx/sv3INQ/wJiZTl/ZGqBMzxynyOrdZtb7t+tKloX/Cj4ZKbO
	 CNP5AOY7TBUXp8scmiKWLLsSJZ7OY+u58H0GLtUn6HHLxWzGyiYtwwmKFlwUowtqL2
	 1nqirejfs1n38qG2xYLD5M40N0x0iEEpRk/RGJwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F5E1F80240;
	Wed,  4 Jan 2023 12:31:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24947F8024E; Wed,  4 Jan 2023 12:31:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 887E7F8023B
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 12:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 887E7F8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=jaW9/2IE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B0C6FB8162A;
 Wed,  4 Jan 2023 11:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24DCC433EF;
 Wed,  4 Jan 2023 11:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1672831901;
 bh=v+0G+kQjDPZcgzyLAonltcocpIDs/oeo0yIa+WxMioo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jaW9/2IEM6Wvyg0dBgFkIqCUmk40O7invRLZNi5z3G6eRQS0M/I8BJCxXeDt6jZu2
 itU3Ge1LXKNw1pubUjO1rVPjB3O81IxgjffO85Ushs/3Fno6PE4MU1lJTTrBeHlu29
 SvE+gXqm/dD+yOdwidUi09q+SuhjN5JJK/qDuIGU=
Date: Wed, 4 Jan 2023 12:31:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Request for cherry-picks for sound (Re: [regression, 5.10.y] Bug
 216861)
Message-ID: <Y7Vjmod9m/Zmp4v2@kroah.com>
References: <bebd692d-7d21-6648-6b7a-c91063bb51c2@leemhuis.info>
 <Y7K1WDmPYi3EMOn1@eldamar.lan> <87wn65umye.wl-tiwai@suse.de>
 <CALp6mkJhM1zDcNr9X_7WL09+uqcaAhNFFMhrjme0r7584O+Lgw@mail.gmail.com>
 <CALp6mk+rdqGXySUowxZv3kEEVWrh96m_x-h8xcFNQ9YZPkbc5w@mail.gmail.com>
 <87h6x7r7w6.wl-tiwai@suse.de> <87sfgrpos6.wl-tiwai@suse.de>
 <87wn62obhm.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wn62obhm.wl-tiwai@suse.de>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Alsa-devel <alsa-devel@alsa-project.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>,
 =?iso-8859-1?Q?P=C1LFFY_D=E1niel?= <dpalffy@gmail.com>,
 Salvatore Bonaccorso <carnil@debian.org>, Sergey <zagagyka@basealt.ru>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 04, 2023 at 11:11:33AM +0100, Takashi Iwai wrote:
> Greg, just in case you missed my previous post.
> 
> Could you cherry-pick the following two commits to 5.10.y and 5.15.y
> stable trees?
> 
> e8444560b4d9302a511f0996f4cfdf85b628f4ca
>     ASoC/SoundWire: dai: expand 'stream' concept beyond SoundWire
>  
> 636110411ca726f19ef8e87b0be51bb9a4cdef06
>     ASoC: Intel/SOF: use set_stream() instead of set_tdm_slots() for HDAudio

Took a bit of work, but both now queued up, thanks.

greg k-h
