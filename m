Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 578F22845F4
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 08:23:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1B64176E;
	Tue,  6 Oct 2020 08:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1B64176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601965379;
	bh=kseTSq4ZoQgAMTbzp+IGzWV39cBms3xzRqYsfrXY9UY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kaJXoAVD8qUfI079kENwaqdfvG28CnO3LP+8Led6vyMpxLNPfTmnIWa4drxTHe6vN
	 jHExOcwf7ifLpdYQ1dsoZFdsJSgIptiKNsLECsdqXgrfK8otA44ibAoSlsobLhtF2k
	 jWrWHUn8IBxacSXBvfE0uiK2bb1XAMHYxiRighwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00CC9F8015B;
	Tue,  6 Oct 2020 08:21:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 152A5F80246; Tue,  6 Oct 2020 08:21:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 294D2F8015B
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 08:21:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 294D2F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A+ZE2KaS"
Received: from localhost (unknown [122.167.144.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 05AA320796;
 Tue,  6 Oct 2020 06:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601965269;
 bh=kseTSq4ZoQgAMTbzp+IGzWV39cBms3xzRqYsfrXY9UY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A+ZE2KaSvisWzO2ss8iSPsD1ZGOBPTV2wp/3ft+f+60Y5cMNzl5tJ8sOgQEJMTil8
 vxTvZDxee+CTpq4W6u3QJa+OblT69TkKS1xD6J9yBzOHn2lnx1arcqlr5Xg1oJBLB1
 rk40WEmTvZ9kifk79+g+9/Zf4ZssH6fvJeLHu7Ug=
Date: Tue, 6 Oct 2020 11:51:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ALSA: compress: allow pause and resume during draining
Message-ID: <20201006062105.GQ2968@vkoul-mobl>
References: <CGME20200929084051epcas2p35fb2228ed1bdfce6a7ddf5b37c944823@epcas2p3.samsung.com>
 <000001d6963c$3cc53690$b64fa3b0$@samsung.com>
 <s5heemlklo0.wl-tiwai@suse.de> <20201001102938.GU2968@vkoul-mobl>
 <2bf52360-bd11-b4cd-b255-8a5610b4aa5f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bf52360-bd11-b4cd-b255-8a5610b4aa5f@linux.intel.com>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com,
 Takashi Iwai <tiwai@suse.de>, s47.kang@samsung.com, lgirdwood@gmail.com,
 tiwai@suse.com, kimty@samsung.com, hmseo@samsung.com,
 Gyeongtaek Lee <gt82.lee@samsung.com>, pilsun.jang@samsung.com,
 tkjung@samsung.com
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

On 01-10-20, 10:28, Pierre-Louis Bossart wrote:
> 
> 
> 
> > > > > Hrm, this resulted in rather more complex changes than the original
> > > > > patch.  It shows that introducing yet another state is no good idea
> > > > > for this particular case.
> > > > > 
> > > > > Since the possible application's behavior after this pause is as same
> > > > > as the normal pause (i.e. either resuming pause or dropping), I find
> > > > > it OK to take the original approach.
> > > > Thank you for the review.
> > > > I think that I should resend the original patch.
> > > 
> > > Let's wait a bit for other opinions.  We may add rather a new flag
> > > instead of introducing a new state, too, for example.
> > 
> > I was out for a week, back now ;-)
> > 
> > So bigger question is if kernel should handle this change or we ask
> > userspace to handle this. Userland knows that bit rate is less so small
> > buffer can be for longer duration so instead of sending dumb X bytes,
> > should it not scale the buffer based on bit rate?
> 
> what about variable bit-rate? or cases where you have a 'bit reservoir' in
> previous frames?
> 
> You really cannot in general translate bytes to time with compressed data,
> which is the reason we introduced the API in the first place...
> 
> Userspace *may* know the duration for specific formats or based on metadata,
> but in some cases the only way to know is actually to decode the data.
> 
> I suggest we keep the compressed API based on bytes and non-periodic events
> when the bytes were consumed/generated.

Changing the API away from bytes was not proposed so not sure...

The SM in kernel might be bit more convoluted so was wondering if we can
handle this in userland. The changelog for this patch says that for
test case was sending whole file, surely that is not an optimal approach.
Should we allow folks to send whole file to kernel and then issue
partial drain?

-- 
~Vinod
