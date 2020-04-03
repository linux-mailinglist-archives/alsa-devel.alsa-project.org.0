Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9401A19DAF6
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 18:12:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E652167D;
	Fri,  3 Apr 2020 18:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E652167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585930337;
	bh=3Z3iPjxAMl7+7KTQ4m2RT0yibP2LPn5y57Uu0b4Fyz0=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KgMNYOV28GsEQTScSWEnswcsFpumukr5c2wcvSIqTpN+weLP7viZh9/ybkEy2MbkI
	 /xl3VqLCanEie1sAMheqnBxgnuMkXvK/WHv1TGuXWA7pr2Y0qjkjr8EBirYzxoZOpG
	 WmRTer7SYnvevnQs128uz21ud4H7JjMK2xO9e6WA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 447DAF800C2;
	Fri,  3 Apr 2020 18:10:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3755F8014B; Fri,  3 Apr 2020 18:10:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB037F800C2;
 Fri,  3 Apr 2020 18:10:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB037F800C2
IronPort-SDR: co0zuTOLLuZnpwaShfr4mRq+4BnnHCYThuRHdrKIPFIepMwWzkpEG6/y6DOpmJjkacDJN2AWj3
 tksExLvoszBQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 09:10:24 -0700
IronPort-SDR: MDZlxxxjyn/0l5oSCTV5sKUbt8lBL/3vmHzoZ7pMVeR4YHZIf171db2suK/3OvnkhG/1jsnqem
 GnF2mhFgv40A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,340,1580803200"; d="scan'208";a="329206146"
Received: from unknown (HELO hod) ([10.252.63.212])
 by orsmga001.jf.intel.com with ESMTP; 03 Apr 2020 09:10:22 -0700
Message-ID: <29be8be8d9b8700588da693d93b9f10adbb10016.camel@linux.intel.com>
Subject: Re: [Sound-open-firmware] [PATCH v2 00/12] [RESEND] ASoC: SOF DSP
 virtualisation
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, Mark
 Brown <broonie@kernel.org>
Date: Fri, 03 Apr 2020 17:10:20 +0100
In-Reply-To: <20200403110404.GA23734@ubuntu>
References: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
 <20200403092842.GB4286@sirena.org.uk> <20200403110404.GA23734@ubuntu>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
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

On Fri, 2020-04-03 at 13:04 +0200, Guennadi Liakhovetski wrote:
> Hi Mark,
> 
> On Fri, Apr 03, 2020 at 10:28:42AM +0100, Mark Brown wrote:
> > On Fri, Apr 03, 2020 at 11:13:54AM +0200, Guennadi Liakhovetski
> > wrote:
> > > This patch series extends the SOF driver to add support for DSP
> > > virtualisation to ASoC. It is built on top of VirtIO, contains a
> > > guest driver and a vhost in-kernel guest driver. This version
> > > supports a single playback and a single capture interface on the
> > > guest. The specific guest audio topology is supplied by the host
> > 
> > I've asked a couple of times for documentation of the protocol here
> > but
> > don't think I've seen anything yet?

Sorry Mark, the whole series should not have been sent since we are
still pending on some OASIS standards being ratified. Guennadi, please
just send the patches that add the protocol independent dependencies to
ASoC and SOF driver only for review atm (patches 1,2,3,5,6 & 7).

The full series is blocking on

1) the virto-snd patches being merged. This will then allow the code
(when modified) to run HDA like audio on SOF DSPs.

2) virtio DMA buffer sharing being concluded for "zero copy" usage.

3) rpmsg integration. The SOF IPC will use rpmsg virtio transport
between host and guests.

This series does not mandate a DSP IPC standard, since this may differ
between DSP vendors, but it will use OASIS standards for virtio-snd,
DMA buffers and rpmsg.

I would say that parts of the "SOF protocol" may be useful for other
vendors in the DAPM/topology areas where users want to connect guest
topologies to host topologies (connected internally with DAPM).

Thanks

Liam



