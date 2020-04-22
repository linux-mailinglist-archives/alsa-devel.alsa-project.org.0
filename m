Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B991B5074
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 00:41:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A75716A9;
	Thu, 23 Apr 2020 00:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A75716A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587595310;
	bh=DY2zYIls/Nnn/qbge4Gm6+EobXCCM8lj6/K/Cti0b0s=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lxVBDa/PX0Ww4AJl11Y42Lf+cT0HtGImlwE6nMgW0Fh3BPeaWit4jxlkSzLzInyBj
	 ujpWjtw4I+iX+3RvDL4LJOOLF0CGAu93EMnJ1vtnvHyvIKOKNXCRL9cwq/8NFoMn7t
	 Q1FS43MnNKRqvcHUXervqQUO7dXrNYKoOSbYTAUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C689F800FF;
	Thu, 23 Apr 2020 00:40:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF839F801D9; Thu, 23 Apr 2020 00:40:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D97BCF800F2
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 00:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D97BCF800F2
IronPort-SDR: l887Bgr34Lm0KP7B9Z3gE0QEbg3ofYGXk4+w8bxtmfQLa2/yz1MlAi1lHlAqRgKyhfZBXvXaD+
 oYwziO0nh83w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 15:39:59 -0700
IronPort-SDR: 6KcZIDgHNFgXHvJepoRz7a8Ga3rtEvz1kejbSOwv81iDWhL8X5tYRaWuuUl3/EIag2LyP9KljY
 0u7xm/wuIs/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,304,1583222400"; d="scan'208";a="292088532"
Received: from aacostaz-mobl.amr.corp.intel.com ([10.255.74.8])
 by orsmga008.jf.intel.com with ESMTP; 22 Apr 2020 15:39:59 -0700
Message-ID: <ebe305743178c4548b779f25e6400863094ef5a9.camel@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC:: don't use snd_soc_rtdcom_lookup()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 22 Apr 2020 15:39:58 -0700
In-Reply-To: <874ktbuq4j.wl-kuninori.morimoto.gx@renesas.com>
References: <87d080unyx.wl-kuninori.morimoto.gx@renesas.com>
 <d20cc18d0fa10b52437e0ac29ea98792e0a3d45d.camel@linux.intel.com>
 <874ktbuq4j.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fontana <rfontana@redhat.com>, Shunli Wang <shunli.wang@mediatek.com>,
 YueHaibing <yuehaibing@huawei.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Stephen Boyd <swboyd@chromium.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Eason Yen <eason.yen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Takashi Iwai <tiwai@suse.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Colin Ian King <colin.king@canonical.com>
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

On Thu, 2020-04-23 at 07:12 +0900, Kuninori Morimoto wrote:
> Hi
> 
> Hi Ranjani
> 
> > > These patches are tring to not to use snd_soc_rtdcom_lookup()
> > > function
> > > on each drivers as much as possible,  because we might have same
> > > name
> > > component under multi component situation.
> > > It can't find correct component in such case.
> > > 
> > > I tried to add new feature on each drivers to not to use it,
> > > but I can't test.
> > > Thus, these patches should get Acked-by or Tested-by from each
> > > drivers
> > > user/maintenor. Please test these.
> > > 
> > > After these patches, Intel / SOF drivers are still using
> > > snd_soc_rtdcom_lookup(). Because it is very complex, I couldn't
> > > try
> > > not to use it.
> > > If possible, each drivers should try to not use it,
> > > and it should be removed from ASoC.
> > 
> > Morimoti-san,
> > 
> > For my education, I understand the concept of multi-cpu/codec
> > components, but when or who would need multiple platform
> > components?
> > This would help me able to remove the snd_soc_rtdcom_lookup() call
> > in
> > SOF.
> 
> I don't know concrete system.
> But it is "possible" today.
> And, we don't know the future system,
> having flexibility is good idea, I think.
> 
> I'm thinking removing lookup function is nice idea,
> but don't feel pressure to it.
> "Now you know it" is very enough for me.
I am having a hard time visualizing a scenario where we would have more
than one platform component. And even if we did, I'd think that the
driver registering these components would make sure to not duplicate
the driver names. Of course, we dont really check if thats really the
case. 
Do you think it makes sense to add that check when registering a
component? If we do that, then keeping snd_soc_rtdcom_lookup() might
not be such a bad idea. 

Thanks,
Ranjani

