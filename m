Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F26D3EF55A
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 07:05:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BA10170F;
	Tue,  5 Nov 2019 07:04:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BA10170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572933917;
	bh=aoEDgvmJGGTK4mUERPGFtAPV/w4MglHcSWvdmD6KyMo=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qbd/VgSwN+RP+tChk/f2OsYErO1o18Z99W8/oTWtABIOKuD/BUSpQpUn1FC/EUuBY
	 nSL2j4V2b1bwoD4QR1VuN/fXlpzdlD7rw7S1Y8vfL8SpyAR4qe+pnEkhySByBHVnzl
	 30RuVi4aiiizzKW75ffSD0bgBxe0moYHfHfPmWX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C044FF8053B;
	Tue,  5 Nov 2019 07:03:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CCB5F8049B; Tue,  5 Nov 2019 07:03:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 773BAF800F3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 07:03:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 773BAF800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 22:03:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,270,1569308400"; d="scan'208";a="200702984"
Received: from kmsmsx157.gar.corp.intel.com ([172.21.138.134])
 by fmsmga007.fm.intel.com with ESMTP; 04 Nov 2019 22:03:14 -0800
Received: from pgsmsx108.gar.corp.intel.com ([169.254.8.51]) by
 kmsmsx157.gar.corp.intel.com ([169.254.5.204]) with mapi id 14.03.0439.000;
 Tue, 5 Nov 2019 14:03:08 +0800
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [alsa-devel] [PATCH] ASoC: bdw-rt5677: enable runtime channel
 merge
Thread-Index: AQHVeQDQJxSKmeHo60W0FoozADL3CqdkfMRQgAADboCAF8XX4A==
Date: Tue, 5 Nov 2019 06:03:07 +0000
Message-ID: <CF33C36214C39B4496568E5578BE70C74032F8BA@PGSMSX108.gar.corp.intel.com>
References: <1570007072-23049-1-git-send-email-brent.lu@intel.com>
 <CF33C36214C39B4496568E5578BE70C74031B9FD@PGSMSX108.gar.corp.intel.com>
 <63da3995-b807-f9e6-6f09-a90e6b8e8e53@linux.intel.com>
In-Reply-To: <63da3995-b807-f9e6-6f09-a90e6b8e8e53@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNmEwZTU0MjEtYWI3NS00MTc3LWE1NGItMjA0M2RiZmRhZGZiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVXFLMjJZZFd4WURZVTJsS2daTHZvNUVtclwvRzZhekNtWVNrRmE2d2ozQlMyMWplMDA3UWtDa1JMSjFFazNcL0FiIn0=
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, "Zavras,
 Alexios" <alexios.zavras@intel.com>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH] ASoC: bdw-rt5677: enable runtime channel
 merge
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

> >> In the DAI link "Capture PCM", the FE DAI "Capture Pin" supports
> >> 4-channel capture but the BE DAI supports only 2-channel capture. To
> >> fix the channel mismatch, we need to enable the runtime channel merge
> for this DAI link.
> >>
> >
> > Hi Pierre,
> >
> > This patch is for the same issue discussed in the following thread:
> > https://patchwork.kernel.org/patch/11134167/
> >
> > We enable the runtime channel merge for the DMIC DAI instead of adding
> > a machine driver constraint. It's working good on chrome's 3.14 branch
> > (which requires some backport for the runtime channel merge feature).
> > Please let me know if this implementation is correct for the FE/BE mismatch
> problem.
> 
> Sorry, I don't fully understand your points, and it's the first time I see anyone
> use this .dpcm_merged_chan field for an Intel platform.
> 
> If I look at the code I see that the core would limit the number of channels to
> two. But that code needs the CPU_DAI to use 2 channels, which I don't see.
> So is this patch self-contained or do we need an additional constraint on the
> FE?
> 
> Thanks
> -Pierre

Hi Pierre,

We don't need constraint on FE because dpcm_runtime_merge_chan() modifies
the channel number of snd_pcm_hardware structure directly. The structure will
be used to initialize the snd_pcm_hw_constraints structure later in the
snd_pcm_hw_constraints_complete() function. Since the channel number is already
modified, we don't need a constraint to install an extra rule for it.

The result of using dpcm_merged_chan flag and machine driver constraint should
be the same when user space programs calling HW_REFINE ioctl call but I think the
flag is more elegant for machine driver code.


Regards,
Brent
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
