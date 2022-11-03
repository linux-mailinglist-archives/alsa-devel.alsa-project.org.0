Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3F9617A4C
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Nov 2022 10:55:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCF581637;
	Thu,  3 Nov 2022 10:54:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCF581637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667469310;
	bh=SuPxQUnuka3lJ9BJEEtw8WqrtOugCgQ4IbwfNKt+TeU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AAW3TRtxVlYsNXnNPV9B7+Ij+90ojhVHWLpv+M/q44b1Utt+mND+JUSJOcukJzmrv
	 FnPNkTlkXyKJL2kHthpqcmjhp6XDpBnhZ1oRClia6rhyiSB12SqBRyfKmQs27qHHMa
	 peRIo3+Ywasf6KB2LxNLuxoUgSWRoWHwY+U95JME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDA6AF800BF;
	Thu,  3 Nov 2022 10:54:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6438F8051E; Thu,  3 Nov 2022 10:54:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0251AF801D5
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 10:54:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0251AF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dg8tFkt5"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A38ROUw017318; Thu, 3 Nov 2022 04:54:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=s5fn7UnHs2rik/6xyDDQcgIyHGMrOE+H5STIId2f7Tg=;
 b=dg8tFkt5fanT2SXveudKjkn44gf7RcWp7xJr2sB7r8crs9OVSks9plr9HA70Xxd7U3vZ
 2lHZtp/8lsSnm4wvZqzLks8XpBPkUwQNTGGv4bvIM905NbZTdfb0TMiEcelo3J5T6G0y
 YnfRB6ittmGKK/eh31gTCcm6/t9zKPv7Jot+uZ28xeQnFlwmvcTfxptdAmQapA8R/Cy+
 ZsrUYPO1GLXVb0BPfwyJf246XnK7XqLQbhcqPAG5kTmS6VjeEZ3p8lgJz4OS9aDmLqm4
 5jIY9VZ8vpg9nypsAuPdXsgDq6aPjqSkgcFCGS2JrSpAISo6G10lC5lqNayk607F5xvz Tg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kh1k1e3pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 04:54:07 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Thu, 3 Nov
 2022 04:54:05 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.15 via Frontend Transport; Thu, 3 Nov 2022 04:54:05 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E62C746A;
 Thu,  3 Nov 2022 09:54:04 +0000 (UTC)
Date: Thu, 3 Nov 2022 09:54:04 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] Fix kbl_rt5663_rt5514_max98927 regression
Message-ID: <20221103095404.GI92394@ediswmail.ad.cirrus.com>
References: <20221102200527.4174076-1-jmontleo@redhat.com>
 <2bbe7bed-21d4-018a-8957-10d9dbe0c661@linux.intel.com>
 <87a658o4e0.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87a658o4e0.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 7Ja-leyKq_N1BpJI7koX_atxgXwepwUw
X-Proofpoint-GUID: 7Ja-leyKq_N1BpJI7koX_atxgXwepwUw
X-Proofpoint-Spam-Reason: safe
Cc: oder_chiou@realtek.com, cezary.rojewski@intel.com,
 regressions@lists.linux.dev, Jason Montleon <jmontleo@redhat.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

On Thu, Nov 03, 2022 at 08:59:03AM +0100, Takashi Iwai wrote:
> On Wed, 02 Nov 2022 23:05:14 +0100,
> Pierre-Louis Bossart wrote:
> > 
> > On 11/2/22 16:05, Jason Montleon wrote:
> > > Starting with 6.0-rc1 these messages are logged and the sound card
> > > is unavailable. Adding legacy_dai_naming to the rt5514-spi causes
> > > it to function properly again.
> > > 
> > > [   16.928454] kbl_r5514_5663_max kbl_r5514_5663_max: ASoC: CPU DAI
> > > spi-PRP0001:00 not registered
> > > [   16.928561] platform kbl_r5514_5663_max: deferred probe pending
> > 
> > Thanks for reporting this regression, much appreciated.
> > 
> > a) you need to CC: maintainers Mark Brown and Takashi Iwai
> > b) the commit title should be something like "ASoC: rt5514: fix legacy
> > dai naming".
> > c) it's not clear if this is actually enough. there's no
> > legacy_dai_naming for e.g. rt5663 and the .endianness member is not set.
> 
> IIUC, rt5663.c should be fine; it used to have non_legacy_dai_naming
> flag and it was dropped after the switch.
> 
> But, through a quick glance, rt5677-spi.c seems to be the same pattern
> as rt5514-spi.c.  The rt5677.c was covered properly but the *-spi.c
> wan't.
> 

Yeah I think these got missed as they are effectively CPU side
devices but living in the CODEC space. Looks like it would be
reasonable to add legacy_dai_naming to both of them to me.

Thanks,
Charles

> > >  static const struct snd_soc_component_driver rt5514_spi_component = {
> > > -	.name		= DRV_NAME,
> > > -	.probe		= rt5514_spi_pcm_probe,
> > > -	.open		= rt5514_spi_pcm_open,
> > > -	.hw_params	= rt5514_spi_hw_params,
> > > -	.hw_free	= rt5514_spi_hw_free,
> > > -	.pointer	= rt5514_spi_pcm_pointer,
> > > -	.pcm_construct	= rt5514_spi_pcm_new,
> > > +	.name			= DRV_NAME,
> > > +	.probe			= rt5514_spi_pcm_probe,
> > > +	.open			= rt5514_spi_pcm_open,
> > > +	.hw_params		= rt5514_spi_hw_params,
> > > +	.hw_free		= rt5514_spi_hw_free,
> > > +	.pointer		= rt5514_spi_pcm_pointer,
> > > +	.pcm_construct		= rt5514_spi_pcm_new,
> > > +	.legacy_dai_naming	= 1,
> > >  };
> > >  
> > >  /**
> > 
