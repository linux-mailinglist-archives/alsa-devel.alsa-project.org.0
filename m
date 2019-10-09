Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C58EDD131E
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 17:40:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54A021671;
	Wed,  9 Oct 2019 17:39:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54A021671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570635647;
	bh=tacDbGdR7TCRIyRuIWeJg5zYrrMayG+imO7i+Mc+hqo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mB/yc8iFBa8SMGqfmYQoRvRM2RXUES5x+ZMXbtIju0zoxqJUDiEGxxErZvwNteStn
	 scvKKr9EFiiTH9r+S6LwOTGWowPvRBESXObru4nZr/liFxOntuqlVIqt43XmtHE8b4
	 3IozRBqbxW8Qy9PaBMtolKsWdvoRc7T+iXUhkGts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1264AF80611;
	Wed,  9 Oct 2019 17:37:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7155F80610; Wed,  9 Oct 2019 17:37:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84BA9F800AE
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 17:37:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84BA9F800AE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2019 08:37:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,276,1566889200"; d="scan'208";a="223620854"
Received: from mmahler-mobl1.amr.corp.intel.com (HELO [10.251.30.188])
 ([10.251.30.188])
 by fmsmga002.fm.intel.com with ESMTP; 09 Oct 2019 08:37:31 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87r23mgxl7.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2a28be44-91ad-c140-062b-4d14982042e9@linux.intel.com>
Date: Wed, 9 Oct 2019 09:20:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87r23mgxl7.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Question about DPCM FE vs BE
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



On 10/9/19 2:57 AM, Kuninori Morimoto wrote:
> 
> Hi ALSA ML
> 
> In my understanding, DPCM needs FE and BE.
> And, one FE can have multiple BE, and one BE can have multiple FE.
> 
> My question this time is that one snd_soc_pcm_runtime can be both
> FE and BE in the same time (= Sometimes FE, sometimes BE) ??
> 
> In my understanding, it never happen.
> But, is this correct ?

It is my understanding that the current code would not support a case 
where a FE is also a BE.

That said, do we want to preclude it? at some point we probably want to 
get rid of the FE/BE distinction and have 'domains' that can be chained. 
So it may not be a good thing to cast a restriction in stone. If at some 
point we need a list of upstream/downstream clients maybe we should keep 
this.

> 
> I'm asking because do we need .be_clients/.fe_clients ?
> If one pcm_runtime can't be FE / BE in the same time,
> just .clients is enough I think.
> 
> 	static int dpcm_be_connect(...)
> 	{
> 		...
> -		list_add(&dpcm->list_be, &fe->dpcm[stream].be_clients);
> -		list_add(&dpcm->list_fe, &be->dpcm[stream].fe_clients);
> +		list_add(&dpcm->list_be, &fe->dpcm[stream].clients);
> +		list_add(&dpcm->list_fe, &be->dpcm[stream].clients);
> 		...
> 	}
> 
> 
> Thank you for your help !!
> Best regards
> ---
> Kuninori Morimoto
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
