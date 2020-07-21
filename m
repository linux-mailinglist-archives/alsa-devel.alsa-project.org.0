Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 335912276A0
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 05:23:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C87CB10E;
	Tue, 21 Jul 2020 05:22:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C87CB10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595301793;
	bh=KJqeA/6F+LiUiDkfxJw9MW/X41+6VQ8RHlEgHrLC3m0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FCrwe5djX3H5mw/5kdXqKjz8i+aln9csjNblJ+18VkE02B+Qx4hGhoJGJV3Hn30WB
	 VYse0DmVP0IV140CXXf1PyTi6H3twKcoVAgniLYdQS3O24U8ZlALI53trl/qmFLxnx
	 SKrIJEUCFnTOpKsk/PkY1uWLO7RH+LAFtGOLiqAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECFC6F80268;
	Tue, 21 Jul 2020 05:21:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 538ABF8024A; Tue, 21 Jul 2020 05:19:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D635F80117
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 05:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D635F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="NNYEK4ke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595301527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvHTqf3N2UBCBfimzRRDXZNRWSQDDfsB47kO82KCfgE=;
 b=NNYEK4kec2Zps1pWwKJhY5kUmg0gP8VzsJOCf9CBNKfJZnVNO326uKzxAhmWXV3Q/Uvlnn
 UGcpu9Fzj1cL04qMYZGpsb3rqvEsqsaujQ7mD3+6le6iN0aEcYV0ESOkT+mIJR/hxEJMCF
 D2olNL+oWXVG2lqlzeh1Tx0gcQLap0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-aRvlxbx0MhmcXL9aaJevTA-1; Mon, 20 Jul 2020 23:18:45 -0400
X-MC-Unique: aRvlxbx0MhmcXL9aaJevTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F902800477;
 Tue, 21 Jul 2020 03:18:43 +0000 (UTC)
Received: from dhcp-128-65.nay.redhat.com (ovpn-13-4.pek2.redhat.com
 [10.72.13.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48EC560BF1;
 Tue, 21 Jul 2020 03:18:39 +0000 (UTC)
Date: Tue, 21 Jul 2020 11:18:36 +0800
From: Dave Young <dyoung@redhat.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: omap-mcbsp 49022000.mcbsp: TX Buffer Overflow!
Message-ID: <20200721031836.GC5271@dhcp-128-65.nay.redhat.com>
References: <20200711033356.GA164619@dhcp-128-65.nay.redhat.com>
 <e4fc5a03-0343-d9c7-757f-b9652f0cd0ed@bitmer.com>
 <74f478d4-4028-0c5f-da21-f6cdf8d7e13e@ti.com>
 <d8829b8a-eca7-f0e3-600f-3263619332b3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8829b8a-eca7-f0e3-600f-3263619332b3@ti.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
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

Hi Peter
On 07/20/20 at 12:32pm, Peter Ujfalusi wrote:
> Hi,
> 
> On 20/07/2020 12.03, Peter Ujfalusi wrote:
> > Hi,
> > 
> > On 14/07/2020 21.03, Jarkko Nikula wrote:
> >> Hi
> >>
> >> On 7/11/20 6:33 AM, Dave Young wrote:
> >>> Hi,
> >>>
> >>> I'm trying to use g_audio on my Nokia N900 with mainline kernel. Seems
> >>> it does not work.  No sound when I play from a laptop, and also see a
> >>> lot of error like below:
> >>> [ 4729.557647] omap-mcbsp 49022000.mcbsp: TX Buffer Overflow!
> >>> ...
> >>>
> >> Head 0dc589da873b ("Merge tag 'iommu-fixes-v5.8-rc5' of
> >> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu") records and
> >> plays fine here (arecord -f dat |aplay), although I see some of those
> >> errors but don't hear any glitches etc.
> >>
> >> Peter, does above indicate a serious issue or is it perhaps a false
> >> alarm on OMAP3 (no audible glitches)?
> > 
> > I need to dig out my n900 or beagleXM, but it is hard to believe it is
> > not a result of a glitch.
> > The DMA is triggered by McBSP and it should write exactly what McBSP
> > expects to be receiving.
> > 
> > I can not recall any changes in the past years which would have
> > introduced regressions in McBSP or the sDMA driver.
> 
> I have booted linux-next on my BeagleXM (OMAP3630, McBSP2 <-> twl4030)
> and I don't see the TX overflow print.

Just to clarify, the sound works well on n900 for normal use cases.
The TX overflow only happens when I use it as an usb audio gadget.
Because n900 is old, I tried to use it as an external audio device.

> 
> I have checked element and threshold modes and it looks fine.
> I'm not sure why we have TX Overflow printed on n900.
> 
> >> I believe you don't have some mixer knob on, N900 audio path is somewhat
> >> complex and needs bunch of mixer switches and volumes to be set. I
> >> attached my N900 mixer scripts for you to try.
> > 
> > This could be the reason for the silence, I have asoundrc files
> > somewhere to restore a 'good' mixer config.
> > 
> >> Set first everything off:
> >> ./aic34_scripts/shutdown.sh
> >>
> >> Then enable internal digital microphone and speakers:
> >> ./aic34_scripts/dmic.sh
> >> ./aic34_scripts/speakers.sh
> >>
> >> Hopefully these help you get going :-)
> >>
> > 
> > - Péter
> > 
> > Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> > Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> > 
> 
> - Péter
> 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 

Thanks
Dave

