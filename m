Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 074B3C0550
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 14:40:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5900E1672;
	Fri, 27 Sep 2019 14:39:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5900E1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569588003;
	bh=TXIkhx4Jj0ZjDCPOE/HtObKxvMFlpG7Tz7S/CUac/wM=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JNErhKdUeQugov1+4JCGv2dd+Nl2VqgDQ9x6CktohPBqxYWmGPyqb209Z7pNJyLHd
	 wdIFEj53TfCUtDCSI1ibpOejDIX+JGEW2vZNe9NaSWMZ2QVGhtniznet/dZkTbbB+x
	 WbmytlbVBbBE/T+DFi3K7XGgEHZYfTHCLBVBs/90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0B34F8049C;
	Fri, 27 Sep 2019 14:38:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DC45F8049A; Fri, 27 Sep 2019 14:38:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DEE9F800B3
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 14:38:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DEE9F800B3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2019 05:38:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,555,1559545200"; d="scan'208";a="391148068"
Received: from kmsmsx155.gar.corp.intel.com ([172.21.73.106])
 by fmsmga006.fm.intel.com with ESMTP; 27 Sep 2019 05:38:06 -0700
Received: from pgsmsx108.gar.corp.intel.com ([169.254.8.138]) by
 KMSMSX155.gar.corp.intel.com ([169.254.15.100]) with mapi id 14.03.0439.000;
 Fri, 27 Sep 2019 20:34:33 +0800
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [alsa-devel] [PATCH] ASoC: bdw-rt5677: channel constraint support
Thread-Index: AQHVZFJP8PyrEMjcjUeZpcb0xW/mNqceLbmAgASxdDCAAEEEgIABJDyggAAwUICAAuppgIAAJ+iAgBgJ7jA=
Date: Fri, 27 Sep 2019 12:34:32 +0000
Message-ID: <CF33C36214C39B4496568E5578BE70C7402EABB2@PGSMSX108.gar.corp.intel.com>
References: <1567733058-9561-1-git-send-email-brent.lu@intel.com>
 <391e8f6c-7e35-deb4-4f4d-c39396b778ba@linux.intel.com>
 <CF33C36214C39B4496568E5578BE70C7402C9EA2@PGSMSX108.gar.corp.intel.com>
 <29b9fd4e-3d78-b4a3-e61a-c066bf24995a@linux.intel.com>
 <CF33C36214C39B4496568E5578BE70C7402CB9AC@PGSMSX108.gar.corp.intel.com>
 <99769525-779a-59aa-96da-da96f8f09a8a@linux.intel.com>
 <CF33C36214C39B4496568E5578BE70C7402DBB9B@PGSMSX108.gar.corp.intel.com>
 <34604b9a-f479-3f92-7917-84f295a82fd8@linux.intel.com>
In-Reply-To: <34604b9a-f479-3f92-7917-84f295a82fd8@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiM2I2MGNkZDAtNGE0ZC00MTkwLTlkMGMtNjEwNmUyZTA2NjEwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidzBOK0ZiUmJcL3A3QWtVOHptV2ZMbGdRcnViU0pvSXVsdEdWR0ltS1diaDhlUU9uZWVoN2ZGWm9QU2d3RHBhZjEifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "yang.jie@linux.intel.com" <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH] ASoC: bdw-rt5677: channel constraint
 support
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

> >
> > It's not only the mismatch but also the design limitation. According
> > to the information from google, the board (samus) only uses two
> > microphone so
> > 3 or 4 channel recording are not supported. That's the reason we
> > leverage the constraint from other machine driver (like
> > kbl_da7219_max98357a.c) to remove the 3 and 4 channel recording option.
> 
> The design limitation is already handled by the fact that the SSP operates in
> 2ch mode, so it's a different case from KBL where indeed the DMIC-based
> back-end can support 4 channels.
> 
> >
> > The difference after the constraint is implemented is that the
> > snd_pcm_hw_params_set_channels() function will return error (Invalid
> > argument) when channel number is 3 or 4 so the application knows the
> > configuration is not supported.
> 
> I get the error, I am just wondering if the fix is at the right location. I'll look
> into it, give me until tomorrow.

I think I got your point. I cherry-pick these commits back to v3.14 branch to fix
the FE/BE mismatch without adding constraint in machine driver. Thanks.

b073ed4e ASoC: soc-pcm: DPCM cares BE format
f4c277b8 ASoC: soc-pcm: DPCM cares BE channel constraint
4f2bd18b ASoC: dpcm: extend channel merging to the backend cpu dai
435ffb76 ASoC: dpcm: rework runtime stream merge
baacd8d1 ASoC: dpcm: add rate merge to the BE stream merge

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
