Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCF02CA66
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 17:36:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36418182D;
	Tue, 28 May 2019 17:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36418182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559057811;
	bh=7WQufj0GdzVVsBbCF14S5FYaZq9+2OJxcI41irle2Tw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GpBWaAtFEgrpQ7YK0r9bS3lhKV8p30LGUFNQnJxyv02w4LJ/RpkdcoLacBGpym+R8
	 5PA9Dc+XpYCFv11uuE2gERcSQo654Dtw4CBIrFhM3wZtTFh2JZkMEi6+FHIiozxRAM
	 sSD5JZjCiViQWInxuZA4g/+575yHKuVWWzoQr67c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DAE5F89708;
	Tue, 28 May 2019 17:35:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4337F89706; Tue, 28 May 2019 17:35:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B75F8F896B8
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 17:34:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B75F8F896B8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 May 2019 08:34:57 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 28 May 2019 08:34:57 -0700
Received: from msakib-mobl2.amr.corp.intel.com (unknown [10.254.189.121])
 by linux.intel.com (Postfix) with ESMTP id B94EC580372;
 Tue, 28 May 2019 08:34:56 -0700 (PDT)
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87sgt7p3zo.wl-kuninori.morimoto.gx@renesas.com>
 <03cf0a3b-3464-57fd-c313-cfe8db01d2cd@linux.intel.com>
 <8736l0u1dc.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <63a87d66-1058-8c36-6d7d-52cceb895b6c@linux.intel.com>
Date: Tue, 28 May 2019 10:34:56 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8736l0u1dc.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 000/145] ASoC: modern dai_link style support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> Ahh, yes, it is using 1 tag only and not aligned to open parenthesis.
> But, if it aligned to open parenthesis, then, it will be 80 char over
> warning instead.
> # ?? or does your "functional code changes" means "fixup checkpatch.pl" ?
> 
> But, yes, can you send me the changes ?

I'll send you suggested changes, I saw other cases where we want to use 
dmic_codec instead of dmic01_codec.
Small potatoes really, this is a really nice work you've been doing!

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
