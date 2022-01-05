Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14130485183
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 11:57:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C81317BE;
	Wed,  5 Jan 2022 11:56:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C81317BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641380232;
	bh=uLT/4ZmZ4gCruF3sfsgP2zbntUDWjS4C+YlQN7+XDZk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZNNV1ginCkMRqoYe/+p66yVkcpyEmmilpTDEzgmgdBzMASdLRK1QrPcVE7S8abJbx
	 qkJBBQaW4oujHq+hQrvi7aCWOQwsJonyX56TNP7MVafkB4cgEHHs97vaNjQxaF+Zsw
	 h5QKF0ne0CyP4nCE9EXU0gfB0Pps+LEguVvB1Asw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC2B3F8020C;
	Wed,  5 Jan 2022 11:56:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC3F8F801D8; Wed,  5 Jan 2022 11:55:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71BBEF800BB
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 11:55:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71BBEF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="RVveCEns"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 64F16616A3;
 Wed,  5 Jan 2022 10:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44491C36AE9;
 Wed,  5 Jan 2022 10:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1641380146;
 bh=uLT/4ZmZ4gCruF3sfsgP2zbntUDWjS4C+YlQN7+XDZk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RVveCEnsIo/WopjVWPTZVf98pVF4/mTZDkQ8XXdRbSr1qtmxQe+pbTD/nsLJuLFqn
 ttUwVFG7SusGF7/0u4/we2M+8Xb50pWoXzSCY85HX2154gvSDZTfLoTgjmGtHt52pV
 RS76wcNUoWSIoykRb0kxqfpdZPeHoJNkTChrdDLw=
Date: Wed, 5 Jan 2022 11:55:44 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Legion Y9000X 2020
Message-ID: <YdV5MNWOwgrtH2UC@kroah.com>
References: <20220105034103.12484-1-fbl718@163.com>
 <s5ha6gak2qf.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5ha6gak2qf.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, linux-kernel@vger.kernel.org,
 Baole Fang <fbl718@163.com>, Takashi Iwai <tiwai@suse.com>,
 Werner Sembach <wse@tuxedocomputers.com>, Hui Wang <hui.wang@canonical.com>,
 Sami Loone <sami@loone.fi>, Cameron Berkenpas <cam@neo-zeon.de>,
 Elia Devito <eliadevito@gmail.com>
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

On Wed, Jan 05, 2022 at 09:26:16AM +0100, Takashi Iwai wrote:
> On Wed, 05 Jan 2022 04:41:01 +0100,
> Baole Fang wrote:
> > 
> > commit 25960cafa06e6fcd830e6c792e6a7de68c1e25ed upstream.
> 
> I couldn't find this commit.  Is this a bogus information?
> 
> > Legion Y9000X 2020 has a speaker, but the speaker doesn't work.
> > This can be fixed by applying alc285_fixup_ideapad_s740_coef
> >  to fix the speaker's coefficients.
> > Besides, to support the transition between the speaker and the headphone,
> > alc287_fixup_legion_15imhg05_speakers needs to be run.
> > 
> > Signed-off-by: Baole Fang <fbl718@163.com>
> 
> The code change itself looks fine, so I'd apply it if the line above
> can be omitted.

That commit id comes from 5.15.12, and it is the commit id of the
release commit:
	25960cafa06e ("Linux 5.15.12")
which makes no sense at all.

Baole, why did you add this line?

confused,

greg k-h
