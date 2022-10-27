Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1BD610254
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 22:03:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A49D2D7E;
	Thu, 27 Oct 2022 22:02:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A49D2D7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666901027;
	bh=QQs8r/U/7Xong1BuwiGRewv2OEb4qdBoo+qRsynsdUg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gs7kqLYsA2VBeVQfTYk0EaLCbbpB7lejqirr69nvghQmRhaeIRfaB0PSU9ermxAbG
	 OaL7uv34uQKhNdxePym1Oc0UdEiubBxiTFcHbZK+uu4148o7QUwbsONbhxFf7oGaIH
	 ZSxeyz4+GXOb8SOHWqPhi3GhFvH/ryUI3A9iJR7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54A4CF80496;
	Thu, 27 Oct 2022 22:02:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9865F8025E; Thu, 27 Oct 2022 22:02:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF79DF80095
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 22:02:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF79DF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d9YIewQb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2669B82615;
 Thu, 27 Oct 2022 20:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F26FC433D6;
 Thu, 27 Oct 2022 20:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666900960;
 bh=QQs8r/U/7Xong1BuwiGRewv2OEb4qdBoo+qRsynsdUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d9YIewQbrdtcuD1CmmN5ih5QbIZ0QsTiZMMoDygSh0BAUYF0DJLd+7GbqqgbLZhTh
 CQuu4snhkwE5nbLDngiDtdTMnVUIAcCC2UaeofLlNP2fbM8sz9zfE9Wo9cAVSotGUt
 64DPCuCf32ZI8X+FEx+ksGt6AVZhHaziYyPqhOy1AtG6Ma8qSf+rdd04SwmISrZ8ZH
 yLcNn5zDepCSMIu4m7mX/zorCZkd2BFcw0qr/owas+owq6hYvZZtCj7aj0jIAai7kv
 wb+HcLOP52NZOgXilcbn+Yh/MmD6RVXM/xLddRA49iJwIOoj19Dj4vcy01abXjMbUK
 BcNF3IetZMT0Q==
Date: Thu, 27 Oct 2022 13:02:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 03/16] ASoC: SOF: ops: add readb/writeb helpers
Message-ID: <Y1rj3pyx2G7VFQa6@dev-arch.thelio-3990X>
References: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
 <20221024165310.246183-4-pierre-louis.bossart@linux.intel.com>
 <Y1rTFrohLqaiZAy/@dev-arch.thelio-3990X>
 <e3c4866f-54ab-bdd1-4ecf-504e947f8028@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3c4866f-54ab-bdd1-4ecf-504e947f8028@linux.intel.com>
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

On Thu, Oct 27, 2022 at 03:58:08PM -0400, Pierre-Louis Bossart wrote:
> 
> 
> On 10/27/22 14:51, Nathan Chancellor wrote:
> > Hi Pierre-Louis,
> > 
> > On Mon, Oct 24, 2022 at 11:52:57AM -0500, Pierre-Louis Bossart wrote:
> >> These will be used to add more consistency in the SOF core and
> >> drivers.
> >>
> >> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> >> Reviewed-by: Rander Wang <rander.wang@intel.com>
> >> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> > 
> > This change is now in -next as commit 74fe0c4dcb41 ("ASoC: SOF: ops: add
> > readb/writeb helpers"), where it breaks the build badly on at least
> > ARCH=arm:
> > 
> > $ kmake ARCH=arm CROSS_COMPILE=arm-linux-gnu- allmodconfig sound/soc/sof/
> > ...
> > In file included from sound/soc/sof/sof-client.c:16:
> > sound/soc/sof/ops.h: In function ‘snd_sof_dsp_writeb’:
> > sound/soc/sof/ops.h:309:75: error: macro "writeb" passed 3 arguments, but takes just 2
> >   309 |                 sof_ops(sdev)->writeb(sdev, sdev->bar[bar] + offset, value);
> >       |                                                                           ^
> > In file included from ./include/linux/io.h:13,
> >                  from ./include/linux/irq.h:20,
> >                  from ./include/asm-generic/hardirq.h:17,
> >                  from ./arch/arm/include/asm/hardirq.h:10,
> >                  from ./include/linux/hardirq.h:11,
> >                  from ./include/linux/interrupt.h:11,
> >                  from sound/soc/sof/ops.h:15:
> > ./arch/arm/include/asm/io.h:288: note: macro "writeb" defined here
> >   288 | #define writeb(v,c)             ({ __iowmb(); writeb_relaxed(v,c); })
> >       |
> > sound/soc/sof/ops.h:309:30: error: statement with no effect [-Werror=unused-value]
> >   309 |                 sof_ops(sdev)->writeb(sdev, sdev->bar[bar] + offset, value);
> >       |                              ^
> > sound/soc/sof/ops.h: In function ‘snd_sof_dsp_readb’:
> > sound/soc/sof/ops.h:336:74: error: macro "readb" passed 2 arguments, but takes just 1
> >   336 |                 return sof_ops(sdev)->readb(sdev, sdev->bar[bar] + offset);
> >       |                                                                          ^
> > ./arch/arm/include/asm/io.h:284: note: macro "readb" defined here
> >   284 | #define readb(c)                ({ u8  __v = readb_relaxed(c); __iormb(); __v; })
> >       |
> > sound/soc/sof/ops.h:336:37: error: returning ‘u8 (*)(struct snd_sof_dev *, void *)’ {aka ‘unsigned char (*)(struct snd_sof_dev *, void *)’} from a function with return type ‘u8’ {aka ‘unsigned char’} makes integer from pointer without a cast [-Werror=int-conversion]
> >   336 |                 return sof_ops(sdev)->readb(sdev, sdev->bar[bar] + offset);
> >       |                                     ^
> > cc1: all warnings being treated as errors
> > ...
> > 
> > I guess the preprocessor gets to these calls first and everything
> > explodes from there. Perhaps these should be namespaced somehow?
> 
> Thanks for the report. We've had these patches for a while and always
> compile for ARM, and didn't see any issues raised. Meh.
> 
> I don't have a strong appetite for changes in common parts, maybe it's
> just simpler to use read8/write8 as callback names to avoid the
> conflict, something like the patch attached (compile-tested only). In
> hindsight it'd also be more consistent with the use of read64/write64
> that was added earlier in SOF helpers.

That diff resolves the build failure for me as well. I will put it into
my test matrix and make sure that it does not cause any other build
issues.

Cheers,
Nathan
