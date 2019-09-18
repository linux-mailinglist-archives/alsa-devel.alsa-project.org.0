Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3C9B5AE9
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 07:30:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC9EE167B;
	Wed, 18 Sep 2019 07:29:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC9EE167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568784599;
	bh=riRx13pww9FUR3LlgPRsj/u88auBUSHT+7KQKkUVUek=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aYgVfarztNy4sBh7ypDCQRczsTLmZ7ZyOXyFgG0vICVgwP3+GepOD/bphpsChZapE
	 euz1cQSbL96D84jmmxJeol88uVeBTJSrpiIp4ZAKVvZvaERy+QqdETVQjATI24Gzfm
	 8jaJFlvTSqc7ecf13LSEkslUqL1bkuS1kVvnILRk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB2A9F80146;
	Wed, 18 Sep 2019 07:28:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17ECDF80506; Wed, 18 Sep 2019 07:28:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1150FF80146
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 07:28:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1150FF80146
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Sep 2019 22:28:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,519,1559545200"; d="scan'208";a="177610908"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga007.jf.intel.com with ESMTP; 17 Sep 2019 22:28:01 -0700
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 17 Sep 2019 22:28:01 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.92]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.89]) with mapi id 14.03.0439.000;
 Wed, 18 Sep 2019 13:27:59 +0800
From: "Liao, Bard" <bard.liao@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Thread-Topic: [PATCH] ASoC: core: delete component->card_list in
 soc_remove_component only
Thread-Index: AQHVbTaQ2ok0yj9UNUGKVA8zkqZyvKcwFfkAgACPtND//6aZgIAAm3+g
Date: Wed, 18 Sep 2019 05:27:58 +0000
Message-ID: <567A313375B6F043A9BE3A1D9B8C6E7F0B4970C2@SHSMSX101.ccr.corp.intel.com>
References: <20190916210353.6318-1-yung-chuan.liao@linux.intel.com>
 <87ef0ewhnd.wl-kuninori.morimoto.gx@renesas.com>
 <567A313375B6F043A9BE3A1D9B8C6E7F0B49706B@SHSMSX101.ccr.corp.intel.com>
 <878sqmw8nh.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878sqmw8nh.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTdkMTMyNjgtNTE0ZC00Mjk1LTk1ZTgtMjNmYzdjNzAxYmM0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoianJuXC9xNlhLRjY1d211WmV4Rkd2SXdSOGdZY29XbVBoZmFCVUoxcWRjUzBjZTVWMFpHZk55R1hFMmpaV3VscTMifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "tiwai@suse.de" <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: core: delete component->card_list in
 soc_remove_component only
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

> -----Original Message-----
> From: Kuninori Morimoto [mailto:kuninori.morimoto.gx@renesas.com]
> Sent: Wednesday, September 18, 2019 12:06 PM
> To: Liao, Bard <bard.liao@intel.com>
> Cc: Bard liao <yung-chuan.liao@linux.intel.com>; broonie@kernel.org;
> tiwai@suse.de; alsa-devel@alsa-project.org; pierre-
> louis.bossart@linux.intel.com
> Subject: Re: [PATCH] ASoC: core: delete component->card_list in
> soc_remove_component only
> 
> 
> Hi Liao
> 
> Thank you for your feedback
> 
> > > I tried to create an error on purpose at soc_probe_component(), but,
> > > there was no kernel oops, no warning, etc.
> > > It just can't create sound card. It is very normal for me.
> > > Or, which kernel are you using ?
> >
> > Somehow I can only see the second attempt of component probe when it
> > return
> > -517 (EPROBE_DEFER) in the first attempt by using below kernel.
> > https://github.com/plbossart/sound/commits/fix/soundwire-split-lookup-
> > init
> >
> > To me, the easiest way to see the issue is force return - EPROBE_DEFER
> > on codec driver's probe function and call
> > list_del(&component->card_list); before calling
> > soc_cleanup_component(component); So list_del() will be called twice and you
> will see the issue.
> 
> OK, I could reproduce your issue.
> And I think it will be solved if you can use
> list_del_init() instead of list_del() at soc_cleanup_component() ?
> (= without your patch)
> 
> 	- list_del()
> 	+ list_del_init()
> 
> If possible, I want to cleanup all component related resource at
> soc_cleanup_component(). Because it is easy to read / understand.

Thanks Morimoto san, I verified the solution works and agree with
you. Will you send a patch to upstream?

> 
> Thank you for your help !!
> Best regards
> ---
> Kuninori Morimoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
