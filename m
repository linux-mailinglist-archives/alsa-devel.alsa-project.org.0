Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0BE19DDA9
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 20:11:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16221167A;
	Fri,  3 Apr 2020 20:10:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16221167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585937476;
	bh=hpHVyBP9VXRjdb1/MNntk0ehfYCTa2oQE0INhxXESLU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k+QJlqXX7hcx5Ii2rPy1WOZa6X20icIBsHGsvHstFXjdOXOPpuoV/TNVTupL3FIJC
	 O3lAupSx2D/W828z7Sui0XNrddVXhRanjz4ChxpspDMjdAQmoPAv0KuCivbhmvM2K5
	 mG1v3GRGGW6Dk7FwVpblGHmfAkagHWKQVoPxUpOg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 315C8F8014B;
	Fri,  3 Apr 2020 20:09:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2684FF8014C; Fri,  3 Apr 2020 20:09:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1104F800E4;
 Fri,  3 Apr 2020 20:09:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1104F800E4
IronPort-SDR: 4K/Zhmjn+F1GGV3QY4SoY7weaVyuQscuK6a97EEhZg/AIFzzc612+Tc3nKkYtKNxs0n6pT6Maz
 bSxnjPI3HVZQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 11:09:22 -0700
IronPort-SDR: m2ipRex36t3AXAuj3ykNFv0QHOblvbNn2BGRca01wj1bFrjaLOYVFVuzAKjePSzL1uC+rIGDU9
 vLJzkiIKakTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,340,1580803200"; d="scan'208";a="241184620"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.36.113])
 by fmsmga007.fm.intel.com with ESMTP; 03 Apr 2020 11:09:20 -0700
Date: Fri, 3 Apr 2020 20:09:19 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [Sound-open-firmware] [PATCH v2 00/12] [RESEND] ASoC: SOF DSP
 virtualisation
Message-ID: <20200403180918.GA25646@ubuntu>
References: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
 <20200403092842.GB4286@sirena.org.uk>
 <20200403110404.GA23734@ubuntu>
 <29be8be8d9b8700588da693d93b9f10adbb10016.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29be8be8d9b8700588da693d93b9f10adbb10016.camel@linux.intel.com>
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

Hi Liam,

Thanks for the clarifications.

On Fri, Apr 03, 2020 at 05:10:20PM +0100, Liam Girdwood wrote:
> On Fri, 2020-04-03 at 13:04 +0200, Guennadi Liakhovetski wrote:
> > Hi Mark,
> > 
> > On Fri, Apr 03, 2020 at 10:28:42AM +0100, Mark Brown wrote:
> > > On Fri, Apr 03, 2020 at 11:13:54AM +0200, Guennadi Liakhovetski
> > > wrote:
> > > > This patch series extends the SOF driver to add support for DSP
> > > > virtualisation to ASoC. It is built on top of VirtIO, contains a
> > > > guest driver and a vhost in-kernel guest driver. This version
> > > > supports a single playback and a single capture interface on the
> > > > guest. The specific guest audio topology is supplied by the host
> > > 
> > > I've asked a couple of times for documentation of the protocol here
> > > but
> > > don't think I've seen anything yet?
> 
> Sorry Mark, the whole series should not have been sent since we are
> still pending on some OASIS standards being ratified. Guennadi, please
> just send the patches that add the protocol independent dependencies to
> ASoC and SOF driver only for review atm (patches 1,2,3,5,6 & 7).
> 
> The full series is blocking on
> 
> 1) the virto-snd patches being merged. This will then allow the code
> (when modified) to run HDA like audio on SOF DSPs.
> 
> 2) virtio DMA buffer sharing being concluded for "zero copy" usage.

I don't think we're blocked by this. If I understand correctly it is our 
intention to first upstream the present copying solution and then 
implement zero-copy as a next step.

> 3) rpmsg integration. The SOF IPC will use rpmsg virtio transport
> between host and guests.

We started discussing this on github, unfortunately this didn't come to a 
conclusion. From what I've read in the kernel, RPMSG is currencly used 
there in scenarios, that are very different from ours. Typically you have 
a Linux host, that uses RPMSG to communicate with an "embedded" 
counterpart, where that communication includes boooting ELF firmware on 
that counterpart, and then using RPMSG on top of Virtual Queues to 
communicate with it. Our case is quite different. I'm not saying, that it 
is impossible to use the Linux RPMSG subsystem for use-cases like ours, 
but it seems to me, that this would require a significant effort on the 
Linux RPMSG core implementation, and we would be the first use-case for 
this.

The rest has to be discussed.

Thanks
Guennadi

> This series does not mandate a DSP IPC standard, since this may differ
> between DSP vendors, but it will use OASIS standards for virtio-snd,
> DMA buffers and rpmsg.
> 
> I would say that parts of the "SOF protocol" may be useful for other
> vendors in the DAPM/topology areas where users want to connect guest
> topologies to host topologies (connected internally with DAPM).
> 
> Thanks
> 
> Liam
> 
> 
> 
