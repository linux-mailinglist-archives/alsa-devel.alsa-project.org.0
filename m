Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B783FDF11
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 14:38:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC68C1666;
	Fri, 15 Nov 2019 14:38:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC68C1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573825135;
	bh=g7HPBKt5ETPO8rX4bNbdwkhYztuuO4sapS8JTeXJYVM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=amVviEvZ8n7L2dQY8kYS7DMZYpKhMJrLD0zOUXC70lDgvGpIptWXRc/6/GXMw1Vlk
	 j23YZf5FXeF6pvgu7n7QDyA3OtAjw6kGGR9hRAKfOYDKrGFT1oavXuGdw5+Yvo+viJ
	 AZl2i5bOSWPS/v2mAxTGcZCXuV/K0ZEHjZFxT4aU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03A8CF80103;
	Fri, 15 Nov 2019 14:37:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE756F80104; Fri, 15 Nov 2019 14:37:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34C62F800CC
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 14:37:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34C62F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="exIVUUp5"
Received: from localhost (unknown [122.181.197.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E30EC20728;
 Fri, 15 Nov 2019 13:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573825022;
 bh=xw6+YS+K/aX6p3C3mvtL28AvnVECOYE38j0p3cjI+i4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=exIVUUp5a2Q2YN9kc/gsxvHncmC3Ty8P1XudP4oreOB/6MqS4o8V6SYYyUf+zXvaz
 a4QhGJ8J9jUJ4GjjizqVUdg3vNUmN7BJ58B61qzY0oEX3f5CxKYQX1b25HsZ8dIqpL
 G8I0vRA1AUrD7KMckbe7o/4eM/xzNtNvx+m/nETo=
Date: Fri, 15 Nov 2019 19:06:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191115133657.GA6762@vkoul-mobl>
References: <20191115102705.649976-1-vkoul@kernel.org>
 <s5h7e41jmvl.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5h7e41jmvl.wl-tiwai@suse.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [RFC PATCH 0/3] ALSA: compress: Add support for
	FLAC
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 15-11-19, 14:21, Takashi Iwai wrote:
> On Fri, 15 Nov 2019 11:27:02 +0100,
> Vinod Koul wrote:
> > 
> > The current design of sending codec parameters assumes that decoders
> > will have parsers so they can parse the encoded stream for parameters
> > and configure the decoder.
> > 
> > But this assumption may not be universally true and we know some DSPs
> > which do not contain the parsers so additional parameters are required
> > to be passed.
> > 
> > So add these parameters starting with FLAC decoder. The size of
> > snd_codec_options is still 120 bytes after this change (due to this
> > being a union)
> > 
> > I think we should also bump the (minor) version if this proposal is
> > acceptable so the userspace can check and populate flac specific structure.
> > 
> > Along, with the core header change, patches are added to support FLAC
> > in Qualcomm drivers. This was tested on 96boards db845c
> > 
> > Srinivas Kandagatla (1):
> >   ASoC: qcom: q6asm: add support to flac config
> > 
> > Vinod Koul (2):
> >   ALSA: compress: add flac decoder params
> >   ASoC: qcom: q6asm-dai: add support to flac decoder
> 
> Feel free to take my ACK for ALSA core part:
>   Acked-by: Takashi Iwai <tiwai@suse.de>

Thanks Takashi, should we bump the version for the header to check for.
Btw I plan to add other decoders required as well. I have mp3 working
without any additional params but rest need additional info

Thanks
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
