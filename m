Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9429530FA33
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 18:50:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC8111671;
	Thu,  4 Feb 2021 18:50:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC8111671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612461052;
	bh=BqE3NzIBhf0wB4Ix872BWZ7vvkL5yuLrLoGC1BF3Ijg=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lrwb8BaSOaVdkTp9rwUYK1YhcesFE5vHh7w3Nt3E9FdUMTx2B368SWGsKdCKoHlex
	 krW/ocnnjEaf9EtNZij02DsM3iTDWUNIM6Y6slzhRiq1qwhs4c/0Q6CbSRFlYaJ7Fd
	 8sCZxhyVPdx3+pr2RGEsVSL611pekWo/dk34LvkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB1D3F8023E;
	Thu,  4 Feb 2021 18:49:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41712F8023C; Thu,  4 Feb 2021 18:49:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5488BF80139
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 18:49:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5488BF80139
IronPort-SDR: B3jkgHdl2QrmV28TeNsrBqS8CsPzx4fmBV5spCy82U7FWRg5u+MI7kVoMIyom2pEy/tqOOy4Cr
 +Z8qL1zkzHtA==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="242799201"
X-IronPort-AV: E=Sophos;i="5.81,152,1610438400"; d="scan'208";a="242799201"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 09:49:45 -0800
IronPort-SDR: +0Yidrz+5Lgua4mPn18SEKeEKRGsxmuY6xLt2JI2I48K5FwwybEgSrCdoYwTd1LNaIz0qvZ4Fa
 hg+95cjbT41g==
X-IronPort-AV: E=Sophos;i="5.81,152,1610438400"; d="scan'208";a="393295265"
Received: from samgoodw-mobl1.amr.corp.intel.com ([10.209.119.164])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 09:49:45 -0800
Message-ID: <456785d40883f61636de9bd4ca0655b5b25fe464.camel@linux.intel.com>
Subject: Re: [PATCH] ASoC: rt5682: Fix panic in rt5682_jack_detect_handler
 happening during system shutdown
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Thu, 04 Feb 2021 09:49:45 -0800
In-Reply-To: <s5ha6sj688n.wl-tiwai@suse.de>
References: <20210204172724.2299583-1-ranjani.sridharan@linux.intel.com>
 <s5ha6sj688n.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Jairaj Arava <jairaj.arava@intel.com>,
 broonie@kernel.org, Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Shuming Fan <shumingf@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
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

On Thu, 2021-02-04 at 18:41 +0100, Takashi Iwai wrote:
> On Thu, 04 Feb 2021 18:27:24 +0100,
> Ranjani Sridharan wrote:
> > From: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
> > 
> > During Coldboot stress tests, system encountered the following
> > panic.
> > Panic logs depicts rt5682_i2c_shutdown() happened first and then
> > later
> > jack detect handler workqueue function triggered.
> > This situation causes panic as rt5682_i2c_shutdown() resets codec.
> > Fix this panic by cancelling properly delayed work.
> > 
> > Panic log:
> > [   20.936124] sof_pci_shutdown
> > [   20.940248] snd_sof_device_shutdown
> > [   20.945023] snd_sof_shutdown
> > [   21.126849] rt5682_i2c_shutdown
> > [   21.286053] rt5682_jack_detect_handler
> > [   21.291235] BUG: kernel NULL pointer dereference, address:
> > 000000000000037c
> > [   21.299302] #PF: supervisor read access in kernel mode
> > [   21.305254] #PF: error_code(0x0000) - not-present page
> > [   21.311218] PGD 0 P4D 0
> > [   21.314155] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > [   21.319206] CPU: 2 PID: 123 Comm: kworker/2:3 Tainted:
> > G     U            5.4.68 #10
> > [   21.333687] ACPI: Preparing to enter system sleep state S5
> > [   21.337669] Workqueue: events_power_efficient
> > rt5682_jack_detect_handler [snd_soc_rt5682]
> > [   21.337671] RIP: 0010:rt5682_jack_detect_handler+0x6c/0x279
> > [snd_soc_rt5682]
> > 
> > Fixes: a50067d4f3c1d ('ASoC: rt5682: split i2c driver into separate
> > module')
> > Signed-off-by: Jairaj Arava <jairaj.arava@intel.com>
> > Signed-off-by: Sathyanarayana Nujella <
> > sathyanarayana.nujella@intel.com>
> > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
> > Reviewed-by: Shuming Fan <shumingf@realtek.com>
> > Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com
> > >
> > ---
> >  sound/soc/codecs/rt5682-i2c.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/sound/soc/codecs/rt5682-i2c.c
> > b/sound/soc/codecs/rt5682-i2c.c
> > index 37d13120f5ba..6effd2611e3c 100644
> > --- a/sound/soc/codecs/rt5682-i2c.c
> > +++ b/sound/soc/codecs/rt5682-i2c.c
> > @@ -273,6 +273,8 @@ static void rt5682_i2c_shutdown(struct
> > i2c_client *client)
> >  {
> >  	struct rt5682_priv *rt5682 = i2c_get_clientdata(client);
> >  
> > +	cancel_delayed_work_sync(&rt5682->jack_detect_work);
> > +
> >  	rt5682_reset(rt5682);
> >  }
> 
> The driver has two works.  Doesn't another one need Canceling?
> 
> Just to be sure...
Good point, it looks like maybe we need to cancel &rt5682-
>jd_check_work as well.

Thanks,Ranjani
> 
> thanks,
> 
> Takashi

