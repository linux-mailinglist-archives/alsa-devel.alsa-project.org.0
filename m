Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECBE197942
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 12:25:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D24DB1666;
	Mon, 30 Mar 2020 12:25:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D24DB1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585563953;
	bh=rjezb/Ac1wX1IuJrq4uW/MBmAZ41KeZ8NrlVGNZBL0o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=COH+pnWc8JPK72s8B1vJJ5P3YMNJ9px5Oy6IGtt4CddANoWr7jVTybJOhDBrjY6aL
	 6of55/o7WWUzYcnwFHfNp8TBmjXZG8fHWd1Fj0pq37OZsdTXLRiwxlijYOWhnT/7cZ
	 HuOPYepQdlarScRlIcwtvCk8m267cyK5+nX+eZ/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0083F800EB;
	Mon, 30 Mar 2020 12:24:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB6C3F80148; Mon, 30 Mar 2020 12:24:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from isilmar-4.linta.de (isilmar-4.linta.de [136.243.71.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8066EF8010C
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 12:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8066EF8010C
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
Received: from light.dominikbrodowski.net (brodo.linta [10.1.0.102])
 by isilmar-4.linta.de (Postfix) with ESMTPSA id E96BA200107;
 Mon, 30 Mar 2020 10:24:05 +0000 (UTC)
Received: by light.dominikbrodowski.net (Postfix, from userid 1000)
 id 7A4912048A; Mon, 30 Mar 2020 12:23:56 +0200 (CEST)
Date: Mon, 30 Mar 2020 12:23:56 +0200
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
Message-ID: <20200330102356.GA16588@light.dominikbrodowski.net>
References: <20200318162029.GA3999@light.dominikbrodowski.net>
 <e49eec28-2037-f5db-e75b-9eadf6180d81@intel.com>
 <20200318192213.GA2987@light.dominikbrodowski.net>
 <b352a46b-8a66-8235-3622-23e561d3728c@intel.com>
 <20200318215218.GA2439@light.dominikbrodowski.net>
 <e7f4f38d-b53e-8c69-8b23-454718cf92af@intel.com>
 <20200319130049.GA2244@light.dominikbrodowski.net>
 <20200319134139.GB3983@sirena.org.uk>
 <a01359dc-479e-b3e3-37a6-4a9c421d18da@intel.com>
 <20200319165157.GA2254@light.dominikbrodowski.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200319165157.GA2254@light.dominikbrodowski.net>
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 curtis@malainey.com, tiwai@suse.com, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 Mark Brown <broonie@kernel.org>
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

On Thu, Mar 19, 2020 at 05:51:58PM +0100, Dominik Brodowski wrote:
> On Thu, Mar 19, 2020 at 04:48:03PM +0100, Cezary Rojewski wrote:
> > On 2020-03-19 14:41, Mark Brown wrote:
> > > On Thu, Mar 19, 2020 at 02:00:49PM +0100, Dominik Brodowski wrote:
> > > 
> > > > Have some good news now, namely that a bisect is complete: That pointed to
> > > > 1272063a7ee4 ("ASoC: soc-core: care .ignore_suspend for Component suspend");
> > > > therefore I've added Kuninori Morimoto to this e-mail thread.
> > > 
> > > If that's an issue it feels more like a driver bug in that if the driver
> > > asked for ignore_suspend then it should expect not to have the suspend
> > > callback called.
> > > 
> > 
> > Requested for tests with following diff applied:
> > 
> > diff --git a/sound/soc/intel/boards/broadwell.c
> > b/sound/soc/intel/boards/broadwell.c
> > index db7e1e87156d..6ed4c1b0a515 100644
> > --- a/sound/soc/intel/boards/broadwell.c
> > +++ b/sound/soc/intel/boards/broadwell.c
> > @@ -212,7 +212,6 @@ static struct snd_soc_dai_link broadwell_rt286_dais[] =
> > {
> >                 .init = broadwell_rt286_codec_init,
> >                 .dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
> >                         SND_SOC_DAIFMT_CBS_CFS,
> > -               .ignore_suspend = 1,
> >                 .ignore_pmdown_time = 1,
> >                 .be_hw_params_fixup = broadwell_ssp0_fixup,
> >                 .ops = &broadwell_rt286_ops,
> 
> That patch fixes the issue(s). I didn't even need to revert 64df6afa0dab
> ("ASoC: Intel: broadwell: change cpu_dai and platform components for SOF")
> on top of that. But you can assess better whether that patch needs care for
> other reasons; for me, this one-liner you have suggested is perfect.

Seems this patch didn't make it into v5.6 (and neither did the other ones
you sent relating to the "dummy" components). Can these patches therefore be
marked for stable, please?

Thanks,
	Dominik
