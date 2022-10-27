Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 011C66100AF
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 20:52:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B5D22E0B;
	Thu, 27 Oct 2022 20:51:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B5D22E0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666896732;
	bh=nJjjyokRFuf/TnbwG1gfPnzIF9X5pFBrP2mJXBn8l9k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eIm6Cj2hub6U1YYJcIUAd/Mvw5ebO/9bT6EzSx+J1dalmxM/pLw7Ge8eULgGDEsSu
	 AcPYutA8OGEmVE/3aWUxziR59HGZp51IMCOv2scJCi1BscO+B1FKjMDzKdzB2v8IIV
	 P785GeC1XaggBiA4BvsRAc39VDRHMAXacZtSMCKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA12DF80095;
	Thu, 27 Oct 2022 20:51:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2F90F8025E; Thu, 27 Oct 2022 20:51:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F59BF8016C
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 20:51:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F59BF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="W2S2MT3M"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A2F1CCE2754;
 Thu, 27 Oct 2022 18:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4B0C433C1;
 Thu, 27 Oct 2022 18:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666896665;
 bh=nJjjyokRFuf/TnbwG1gfPnzIF9X5pFBrP2mJXBn8l9k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W2S2MT3Myoa8ArJwY0Xi+ZwTZjWtyh03cM45smNiok24aL0TMjvC/PlKiy6Hf3y5g
 W0snQVpl4whqjukuAC1AEg6YrfDZbdVtk09opLshVRYyCWxgftMIf+YWB8fMm4sZkS
 BNIv+EPVdZT0bmvGJKw2c4QV0X27mzjoCyPdnb9VQBwMCTAd9LJj+j0ZViyEtxcW+6
 ytNwGfeGGx4rHnrDncWMNwdwaOqiuq7t8R6f3E9+6O3zRg2QbVEtTVjS1JdGeeD5io
 da7Ea250CsqwlzPPwQptdOe+HDqwhtNDh2XQNwY42YUdpwpc3ZDYOpINegC4gqCEou
 5ETFDzluPeg/g==
Date: Thu, 27 Oct 2022 11:51:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 03/16] ASoC: SOF: ops: add readb/writeb helpers
Message-ID: <Y1rTFrohLqaiZAy/@dev-arch.thelio-3990X>
References: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
 <20221024165310.246183-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221024165310.246183-4-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
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

Hi Pierre-Louis,

On Mon, Oct 24, 2022 at 11:52:57AM -0500, Pierre-Louis Bossart wrote:
> These will be used to add more consistency in the SOF core and
> drivers.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>

This change is now in -next as commit 74fe0c4dcb41 ("ASoC: SOF: ops: add
readb/writeb helpers"), where it breaks the build badly on at least
ARCH=arm:

$ kmake ARCH=arm CROSS_COMPILE=arm-linux-gnu- allmodconfig sound/soc/sof/
...
In file included from sound/soc/sof/sof-client.c:16:
sound/soc/sof/ops.h: In function ‘snd_sof_dsp_writeb’:
sound/soc/sof/ops.h:309:75: error: macro "writeb" passed 3 arguments, but takes just 2
  309 |                 sof_ops(sdev)->writeb(sdev, sdev->bar[bar] + offset, value);
      |                                                                           ^
In file included from ./include/linux/io.h:13,
                 from ./include/linux/irq.h:20,
                 from ./include/asm-generic/hardirq.h:17,
                 from ./arch/arm/include/asm/hardirq.h:10,
                 from ./include/linux/hardirq.h:11,
                 from ./include/linux/interrupt.h:11,
                 from sound/soc/sof/ops.h:15:
./arch/arm/include/asm/io.h:288: note: macro "writeb" defined here
  288 | #define writeb(v,c)             ({ __iowmb(); writeb_relaxed(v,c); })
      |
sound/soc/sof/ops.h:309:30: error: statement with no effect [-Werror=unused-value]
  309 |                 sof_ops(sdev)->writeb(sdev, sdev->bar[bar] + offset, value);
      |                              ^
sound/soc/sof/ops.h: In function ‘snd_sof_dsp_readb’:
sound/soc/sof/ops.h:336:74: error: macro "readb" passed 2 arguments, but takes just 1
  336 |                 return sof_ops(sdev)->readb(sdev, sdev->bar[bar] + offset);
      |                                                                          ^
./arch/arm/include/asm/io.h:284: note: macro "readb" defined here
  284 | #define readb(c)                ({ u8  __v = readb_relaxed(c); __iormb(); __v; })
      |
sound/soc/sof/ops.h:336:37: error: returning ‘u8 (*)(struct snd_sof_dev *, void *)’ {aka ‘unsigned char (*)(struct snd_sof_dev *, void *)’} from a function with return type ‘u8’ {aka ‘unsigned char’} makes integer from pointer without a cast [-Werror=int-conversion]
  336 |                 return sof_ops(sdev)->readb(sdev, sdev->bar[bar] + offset);
      |                                     ^
cc1: all warnings being treated as errors
...

I guess the preprocessor gets to these calls first and everything
explodes from there. Perhaps these should be namespaced somehow?

Cheers,
Nathan
