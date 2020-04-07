Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B5F1A0CC7
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Apr 2020 13:26:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13B4C1662;
	Tue,  7 Apr 2020 13:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13B4C1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586258767;
	bh=ejUUSnoisJW40wSwNHezfSBxmL645g0X2x1oDrRFdD4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E0qnGYsdlJN3MXCA2XWChCAzc3bcEinlOXPAT2FBn+xOi9XZnvq4sx0q5tOQUA0ts
	 iCSZrgNDaIxzuuYQhE6VpAWQ8KrYSyDstztVebdo39t5T280eWKbrDilcAEQA8k4Ra
	 VaqvNrPwiye0SWVprZ9hkvn+BeSyLLuSPhokmzlw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CDD9F801F9;
	Tue,  7 Apr 2020 13:24:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04791F801DA; Tue,  7 Apr 2020 13:24:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52BD8F80121;
 Tue,  7 Apr 2020 13:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52BD8F80121
IronPort-SDR: X0UDSfQE1uO5pCg79y0juMlu4zRXXfFj0E6UXZtlXzbXgbMXfnQSEL3evI/RuaewNDNEN5wxms
 SpwEKmWHj7EA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2020 04:24:14 -0700
IronPort-SDR: oTeaQZXU5o0sC8QTIgjLyGfCu4Dlvh6iu/Fn0wWvdTZ2QbDsdrN2ImFYmFbpFItqjFdqNbT46H
 LiK2RJL+aVmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,353,1580803200"; d="scan'208";a="451187923"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.252.39.168])
 by fmsmga005.fm.intel.com with ESMTP; 07 Apr 2020 04:24:12 -0700
Date: Tue, 7 Apr 2020 13:24:11 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [Sound-open-firmware] [PATCH v2 00/12] [RESEND] ASoC: SOF DSP
 virtualisation
Message-ID: <20200407112411.GA10133@ubuntu>
References: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
 <20200403092842.GB4286@sirena.org.uk>
 <20200403110404.GA23734@ubuntu>
 <29be8be8d9b8700588da693d93b9f10adbb10016.camel@linux.intel.com>
 <20200403180918.GA25646@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403180918.GA25646@ubuntu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

On Fri, Apr 03, 2020 at 08:09:19PM +0200, Guennadi Liakhovetski wrote:
> Hi Liam,
> 
> Thanks for the clarifications.
> 
> On Fri, Apr 03, 2020 at 05:10:20PM +0100, Liam Girdwood wrote:
> > On Fri, 2020-04-03 at 13:04 +0200, Guennadi Liakhovetski wrote:
> > > Hi Mark,
> > > 
> > > On Fri, Apr 03, 2020 at 10:28:42AM +0100, Mark Brown wrote:
> > > > On Fri, Apr 03, 2020 at 11:13:54AM +0200, Guennadi Liakhovetski
> > > > wrote:
> > > > > This patch series extends the SOF driver to add support for DSP
> > > > > virtualisation to ASoC. It is built on top of VirtIO, contains a
> > > > > guest driver and a vhost in-kernel guest driver. This version
> > > > > supports a single playback and a single capture interface on the
> > > > > guest. The specific guest audio topology is supplied by the host
> > > > 
> > > > I've asked a couple of times for documentation of the protocol here
> > > > but
> > > > don't think I've seen anything yet?
> > 
> > Sorry Mark, the whole series should not have been sent since we are
> > still pending on some OASIS standards being ratified. Guennadi, please
> > just send the patches that add the protocol independent dependencies to
> > ASoC and SOF driver only for review atm (patches 1,2,3,5,6 & 7).
> > 
> > The full series is blocking on
> > 
> > 1) the virto-snd patches being merged. This will then allow the code
> > (when modified) to run HDA like audio on SOF DSPs.
> > 
> > 2) virtio DMA buffer sharing being concluded for "zero copy" usage.
> 
> I don't think we're blocked by this. If I understand correctly it is our 
> intention to first upstream the present copying solution and then 
> implement zero-copy as a next step.
> 
> > 3) rpmsg integration. The SOF IPC will use rpmsg virtio transport
> > between host and guests.
> 
> We started discussing this on github, unfortunately this didn't come to a 
> conclusion. From what I've read in the kernel, RPMSG is currencly used 
> there in scenarios, that are very different from ours. Typically you have 
> a Linux host, that uses RPMSG to communicate with an "embedded" 
> counterpart, where that communication includes boooting ELF firmware on 
> that counterpart, and then using RPMSG on top of Virtual Queues to 
> communicate with it. Our case is quite different. I'm not saying, that it 
> is impossible to use the Linux RPMSG subsystem for use-cases like ours, 
> but it seems to me, that this would require a significant effort on the 
> Linux RPMSG core implementation, and we would be the first use-case for 
> this.

After a discussion we agreed, that we shall try to port SOF VirtIO support on 
top of RPMSG, even though this would be the first ever such use of RPMSG. And 
since this likely will take a while and be a big change we suspend this 
review process for now. 

We'll be back.

Thanks
Guennadi

> The rest has to be discussed.
> 
> Thanks
> Guennadi
> 
> > This series does not mandate a DSP IPC standard, since this may differ
> > between DSP vendors, but it will use OASIS standards for virtio-snd,
> > DMA buffers and rpmsg.
> > 
> > I would say that parts of the "SOF protocol" may be useful for other
> > vendors in the DAPM/topology areas where users want to connect guest
> > topologies to host topologies (connected internally with DAPM).
> > 
> > Thanks
> > 
> > Liam
> > 
> > 
> > 
