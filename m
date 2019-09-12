Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4167B08A6
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2019 08:06:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38CC2171E;
	Thu, 12 Sep 2019 08:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38CC2171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568268375;
	bh=nqQPyHCPfEAlZlfAofwpu/INYVKCszKGSEAZuXiot3s=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IKfFZFjWmlSb7B7Rrp39ZE6h4iaZgzZ8QU85DzYwTcLU+NXwEC5HTdAA+JyJhJ4Wr
	 uOAFegtFFVm0viYbRXIb9nn8B16JFkyyilsIeKvZdImk1FMpbgGcd71TDUbQDo/CHI
	 hhU/tXu67da8nKtZLW2CcxqiT5IHyDQeX6VN/ijs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B29BF80393;
	Thu, 12 Sep 2019 08:04:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D1A0F80368; Thu, 12 Sep 2019 08:04:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2599EF802DF
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 08:04:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2599EF802DF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2019 23:04:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,495,1559545200"; d="scan'208";a="186036010"
Received: from kmsmsx152.gar.corp.intel.com ([172.21.73.87])
 by fmsmga007.fm.intel.com with ESMTP; 11 Sep 2019 23:04:17 -0700
Received: from pgsmsx108.gar.corp.intel.com ([169.254.8.138]) by
 KMSMSX152.gar.corp.intel.com ([169.254.11.65]) with mapi id 14.03.0439.000;
 Thu, 12 Sep 2019 14:00:45 +0800
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [alsa-devel] [PATCH] ASoC: bdw-rt5677: channel constraint support
Thread-Index: AQHVZFJP8PyrEMjcjUeZpcb0xW/mNqceLbmAgASxdDCAAEEEgIABJDyggAAwUICAAuppgA==
Date: Thu, 12 Sep 2019 06:00:45 +0000
Message-ID: <CF33C36214C39B4496568E5578BE70C7402DBB9B@PGSMSX108.gar.corp.intel.com>
References: <1567733058-9561-1-git-send-email-brent.lu@intel.com>
 <391e8f6c-7e35-deb4-4f4d-c39396b778ba@linux.intel.com>
 <CF33C36214C39B4496568E5578BE70C7402C9EA2@PGSMSX108.gar.corp.intel.com>
 <29b9fd4e-3d78-b4a3-e61a-c066bf24995a@linux.intel.com>
 <CF33C36214C39B4496568E5578BE70C7402CB9AC@PGSMSX108.gar.corp.intel.com>
 <99769525-779a-59aa-96da-da96f8f09a8a@linux.intel.com>
In-Reply-To: <99769525-779a-59aa-96da-da96f8f09a8a@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjdlZjY3NDgtNTUxMi00YWYyLTk5OTUtZGE2MWU2MmU1MzMzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiYkdvakhBVEpJWFBTT0Z4Vkh6cXRYaHNEajkzQjUxMkZxaEh0STlrMWJtNkxQRVVcL1hDdkQ4ZU1kU29LQXJZWGcifQ==
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
> > The story is Chrome has a tool called alsa_conformance_test which runs
> > capture or playback against a PCM port with all possible
> > configurations (channel, format, rate) then measure if the sample rate
> > is correct. Since the channel max number reported is 4, it tests the
> > 4-channel 48K capture and reports the actual sample rate is 24000
> > instead of 48000. That's the reason we want to add a constraint in
> > machine driver to avoid user space programs trying to do 4 channel
> recording since this machine does not support it in the beginning.
> 
> ok, that helps get context, thanks for the details.
> 
> I would have expected some error to be returned if there's a front-end
> opened with 4 channels and the back-end only supports two. Adding the
> constraint seems like a work-around to avoid dealing with the mismatch
> between FE and BE. I don't understand DPCM enough to suggest an
> alternative though. Ranjani, can you help on this one?
> 
> And even if we agree with this solution, it'd be nice to apply it for the
> Broadwell machine driver for consistency.

It's not only the mismatch but also the design limitation. According to the 
information from google, the board (samus) only uses two microphone so 
3 or 4 channel recording are not supported. That's the reason we leverage 
the constraint from other machine driver (like kbl_da7219_max98357a.c) 
to remove the 3 and 4 channel recording option.

The difference after the constraint is implemented is that the 
snd_pcm_hw_params_set_channels() function will return error (Invalid 
argument) when channel number is 3 or 4 so the application knows the 
configuration is not supported.


Regards,
Brent

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
