Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E86EB262974
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 10:01:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F39B3170C;
	Wed,  9 Sep 2020 10:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F39B3170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599638483;
	bh=3rAE+SPjRZ4i3GefKC27FMyuZcbvx2plcxvfQTsIqXw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jnNyoVriTePqEpiBXVbuiTn0G24MePVSA0H/4Eml1GL6qthcuMyIseyG+kvy9pm11
	 UIZPuYMsK63HOEt3JCVMPGI8YSJmRQ3X2KCW7prdioZqn18MOeVe42MwMjI4HLZmMn
	 t0ohPrkqeXNNuH8xwqxtKUropDVG3+/hRq6PM52o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15225F8015F;
	Wed,  9 Sep 2020 09:59:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0B2AF80227; Wed,  9 Sep 2020 09:59:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9CFDF800FD
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 09:59:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9CFDF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ma/Y0tsg"
Received: from localhost (unknown [122.179.21.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B2C22087C;
 Wed,  9 Sep 2020 07:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599638368;
 bh=3rAE+SPjRZ4i3GefKC27FMyuZcbvx2plcxvfQTsIqXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ma/Y0tsgx/97CgY0J2Nm/BIU53y37cgwef+KkNlKsUPxvIXzEdJWs80Biln9Mku8S
 +R5Wim6IxJda9gXOZk2DG617IPPriTIqez1a5G6zxSNyYkSSW60spxDxOxMbXuZs/B
 z0tQRKoB1A/Oq4rNqbyYGHOSY/nvcHBG0x33EnhM=
Date: Wed, 9 Sep 2020 13:29:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] soundwire: cadence: fix race condition between suspend
 and Slave device alerts
Message-ID: <20200909075922.GM77521@vkoul-mobl>
References: <20200817222340.18042-1-yung-chuan.liao@linux.intel.com>
 <20200819090637.GE2639@vkoul-mobl>
 <8d60fa6f-bb7f-daa8-5ae2-51386b87ccad@linux.intel.com>
 <20200821050758.GI2639@vkoul-mobl>
 <29ea5a44-b971-770a-519c-ae879557b63f@linux.intel.com>
 <20200828080024.GP2639@vkoul-mobl>
 <77ecb4bc-10d6-8fbd-e97f-923d01a5e555@linux.intel.com>
 <3e4dee4b-1309-2d3e-ae20-e2dcbadb2f40@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e4dee4b-1309-2d3e-ae20-e2dcbadb2f40@perex.cz>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 ranjani.sridharan@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 bard.liao@intel.com, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 rander.wang@linux.intel.com, linux-kernel@vger.kernel.org
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

On 08-09-20, 13:58, Jaroslav Kysela wrote:
> Dne 28. 08. 20 v 17:14 Pierre-Louis Bossart napsal(a):
> > 
> > 
> > 
> >> Is this timeout for suspend or resume? Somehow I was under the
> >> assumption that it is former? Or is the result seen on resume?
> >>
> >> Rereading the race describe above in steps, I think this should be
> >> handled in step c above. Btw is that suspend or runtime suspend which
> >> causes this? Former would be bigger issue as we should not have work
> >> running when we return from suspend call. Latter should be dealt with
> >> anyway as device might be off after suspend.
> > 
> > This happens with a system suspend. Because we disable the interrupts, 
> > the workqueue never completes, and we have a timeout on system resume.
> > 
> > That's why we want to prevent the workqueue from starting, or let it 
> > complete, but not have this zombie state where we suspend but there's 
> > still a wait for completion that times out later. The point here is 
> > really  making sure the workqueue is not used before suspend.
> > 
> 
> Vinod, there is no acceptance progress on this. The patch is really straight
> and for the Intel controller. They know what they're doing. I would apply
> this. The code can be refined at anytime. It's a fix. I tested it and I can
> confirm, that it fixes the issue. It's a vital patch for 5.10 to enable
> finally SoundWire drivers for the Intel hardware.

I do feel that there is something else going on, but not able to pin
point, anyway this fixes the issue so I am applying it now
> 
> Acked-by: Jaroslav Kysela <perex@perex.cz>

Thanks for ack

-- 
~Vinod
