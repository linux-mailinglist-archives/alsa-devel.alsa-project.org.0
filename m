Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD7613D16E
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 02:22:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D682B17AE;
	Thu, 16 Jan 2020 02:21:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D682B17AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579137769;
	bh=0KcciLQo15S7cwMB/XZIHj5Ve02ASRSJKnVeGQs0Qy0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kwgnqMClNTcQljmK6+sO/51RMl04tL2kabAkW0B5Pb0nPoSyVdERUwELYuARA9/Y0
	 FPD3INUa9DwrdwJSDGc4QzZQ0nrJDpf11Othalmp2i2CBp5HFqKxbPHE/+dW+fYXnw
	 aRLDDE63i4Am52WljLH7x/Wx66IjXkdCBbddgi8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72B5AF801EB;
	Thu, 16 Jan 2020 02:21:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 127E7F801EB; Thu, 16 Jan 2020 02:21:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_76, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E1D8F800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 02:20:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E1D8F800B9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2020 17:20:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,323,1574150400"; d="scan'208";a="423832903"
Received: from cecox1-mobl.amr.corp.intel.com (HELO [10.251.131.55])
 ([10.251.131.55])
 by fmsmga005.fm.intel.com with ESMTP; 15 Jan 2020 17:20:54 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20200114175152.3291-1-yung-chuan.liao@linux.intel.com>
 <a1d68a98-adab-32e6-c837-165c135f83ef@linux.intel.com>
 <87pnfk1b2w.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5f3318cd-4f9e-6c0f-b58f-53eb6271c69d@linux.intel.com>
Date: Wed, 15 Jan 2020 19:20:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87pnfk1b2w.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 bard.liao@intel.com
Subject: Re: [alsa-devel] [PATCH RFC v2 0/4] ASoC: Add Multi CPU DAI support
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



>> After this series of patches is applied, we have this in soc.h:
>>
>> 	struct snd_soc_dai *codec_dai;
>> 	struct snd_soc_dai *cpu_dai;
>>
>> 	struct snd_soc_dai **codec_dais;
>> 	unsigned int num_codecs;
>>
>> 	struct snd_soc_dai **cpu_dais;
>> 	unsigned int num_cpus;
>>
>> What is the intent behind keeping the two fields codec_dai and cpu_dai?
>>
>> Shouldn't we use the multi-dai structures in all cases, possible
>> degraded to a single element rather than maintaining what looks like
>> duplicate ways of accessing the same element?
>>
>> If removing these fields across all drivers is just too invasive for
>> now, shouldn't we start defining access macros so that those fields
>> can be deprecated and removed at a later time, platform-by-platform?
> 
> Actually, I have this patch (= remove cpu_dai/codec_dai from all drivers,
> and use macro for it), and have plan to post it.
> 
> But, I have many extra cleanup patches in my tree,
> and I want to post it before that
> (to avoid extra re-ordering dpendency break).

ok, thanks for the precisions!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
