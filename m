Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3738C4BC304
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Feb 2022 00:47:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC7801753;
	Sat, 19 Feb 2022 00:46:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC7801753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645228059;
	bh=Nf4QWHJQf6uMYeqUXDUKolXQIDg74FWqWkoKRg8EeRc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SrO90fNJimbrH7uUJ5isgounJail5yxVMd17mnd/U/Ncrchll1cxR2aywMBSfhQYc
	 4Uh3frGQvB7F4VE+jHHsWsyi0jbEOACUNtaBHRYg8Bie3y844sNKRl5at5Ffx2mJfk
	 PqDtLsCJijutjt3LnCXRjWFCQ+yHLZdKVnbxcIVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21AB5F80154;
	Sat, 19 Feb 2022 00:46:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A9DFF8013C; Sat, 19 Feb 2022 00:46:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D93CF800CE
 for <alsa-devel@alsa-project.org>; Sat, 19 Feb 2022 00:46:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D93CF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rz7jPVer"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1F8E1B8272A;
 Fri, 18 Feb 2022 23:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90654C340E9;
 Fri, 18 Feb 2022 23:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645227983;
 bh=Nf4QWHJQf6uMYeqUXDUKolXQIDg74FWqWkoKRg8EeRc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rz7jPVerk5V3ozJNYK+1G0lFwI7OHwQibB57qbd/3lYLBpf5zVMpECQ0OkN3v2gzs
 PhbYL3SES+sxuboenAfJFiNcfjBlU54dVYWi2Wi4wLA4Vjy8KhhGDaZzDW20NnXVM4
 d0lnj5b+wmWMYOSRWuyvAMBaZMBDELpldDT+I7zmomwHOx/cItN3fzjdKvc/Fu7wz2
 I7cDcm6tBTlefJ77THO1X4X1m/kmIsOCI2tKBdnEmJVppeWPFsoOJ5Lt750EnKsP3j
 e+ki2oHlkMdRb5zrwuEc5aX9RxQmK3j9LfcH4/2vn5xANxWlTQg5fTBIgR7AleZrP0
 PSnZniAT+XGIg==
Date: Sat, 19 Feb 2022 00:46:18 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Mark Brown
 <broonie@kernel.org>
Subject: Re: [PATCH 0/1] sound: add quirk for Huawei D15
Message-ID: <20220219004618.07cb69a9@coco.lan>
In-Reply-To: <c17173cb-290c-9ecd-54e3-b74f9d4e9061@linux.intel.com>
References: <cover.1640351150.git.mchehab@kernel.org>
 <164519450743.1836505.3912962145996830275.b4-ty@kernel.org>
 <c17173cb-290c-9ecd-54e3-b74f9d4e9061@linux.intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Huajun Li <huajun.li@intel.com>
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

Em Fri, 18 Feb 2022 12:11:59 -0600
Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> escreveu:

> On 2/18/22 08:28, Mark Brown wrote:
> > On Fri, 24 Dec 2021 14:09:48 +0100, Mauro Carvalho Chehab wrote:  
> >> Based on my tests, Huawei D15 (Intel) uses SSP0 on es8336.
> >>
> >> Add a quirk for it.
> >>
> >> Please notice that, currently, only the internal speaker is working.
> >> The topology for the internal microphone and for the headphones
> >> is wrong. Enabling/disabling the other two quirks (GPIO and/or DMIC)
> >> doesn't cause any audible results, nor change the devices listed
> >> on pavucontrol (tested with pipewire-pulse).
> >>
> >> [...]  
> > 
> > Applied to
> > 
> >    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> > 
> > Thanks!
> > 
> > [1/1] ASoC: Intel: sof_es8336: add quirk for Huawei D15 2021
> >       commit: ce6a70bfce21bb4edb7c0f29ecfb0522fa34ab71  
> 
> I'll probably revert this change in my next update [1], I have a set of
> changes where we can detect which SSP is used by parsing the NHTL
> information in platform firmware.

Mark,

Yeah, I tested Pierre-Louis pull request from:

	https://github.com/thesofproject/linux/pull/3338

and indeed this quirk is not needed anymore for the speaker to work.

So, once his new update gets merged upstream, feel free to revert
this one.

Pierre-Louis,

When you submit your next update from PR#3338, feel free to add:

Tested-by: Mauro Carvalho Chehab <mchehab@kernel.org>

and my Acked-by at the revert patch:

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> 
> I am still trying to figure out how to detect which MCLK is used, and
> once this is done I'll send the patches upstream.
> 
> [1] https://github.com/thesofproject/linux/pull/3338



Thanks,
Mauro
