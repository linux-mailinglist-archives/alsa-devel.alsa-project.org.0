Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FB0375FD
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 16:05:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D5841616;
	Thu,  6 Jun 2019 16:05:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D5841616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559829951;
	bh=Wtjs1oeBTXG++7gid8TQ3H8VsCe9EKofk8kP7yEumDE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ETlKToXBI6vKbmTTVhujbefEdZIavSRgz9NG0ob66fQ1swLkVnxXV72iKH/ikROj7
	 XMNQqn6HLtVqSDOaQyBVABN0qNmBVKcrQ5pNfgg+GnnHYk/2pvGU7dH0I7tpHoEDFK
	 xk9xenL/xtq+0IY/IoDi1+xnwh9HlRNwRy7MnKwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5509CF896FE;
	Thu,  6 Jun 2019 16:04:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D752F896F7; Thu,  6 Jun 2019 16:04:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1785F80768
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 16:03:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1785F80768
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2019 07:03:57 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 06 Jun 2019 07:03:57 -0700
Received: from kwong4-mobl.amr.corp.intel.com (unknown [10.252.203.122])
 by linux.intel.com (Postfix) with ESMTP id 32BEF580490;
 Thu,  6 Jun 2019 07:03:57 -0700 (PDT)
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87h893mkvi.wl-kuninori.morimoto.gx@renesas.com>
 <87v9xjfjgo.wl-kuninori.morimoto.gx@renesas.com>
 <20190606151747.343ddd4c@xxx>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <10285830-e164-13b6-05c7-966806f45c18@linux.intel.com>
Date: Thu, 6 Jun 2019 09:03:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606151747.343ddd4c@xxx>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 114/146] ASoC: soc-topology: use modern
 dai_link style
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


>> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
>> index 3299ebb..f485f7f 100644
>> --- a/sound/soc/soc-topology.c
>> +++ b/sound/soc/soc-topology.c
>> @@ -560,7 +560,7 @@ static void remove_link(struct snd_soc_component
>> *comp,
>>   	kfree(link->name);
>>   	kfree(link->stream_name);
>> -	kfree(link->cpu_dai_name);
>> +	kfree(link->cpus->dai_name);
>>   
>>   	list_del(&dobj->list);
>>   	snd_soc_remove_dai_link(comp->card, link);
>> @@ -1879,12 +1879,22 @@ static int soc_tplg_fe_link_create(struct
>> soc_tplg *tplg, struct snd_soc_tplg_pcm *pcm)
>>   {
>>   	struct snd_soc_dai_link *link;
>> +	struct snd_soc_dai_link_component *dlc;
>>   	int ret;
>>   
>> -	link = kzalloc(sizeof(struct snd_soc_dai_link), GFP_KERNEL);
>> +	/* link + cpu + codec */
>> +	link = kzalloc(sizeof(*link) + (2 * sizeof(*dlc)),
>> GFP_KERNEL); if (link == NULL)
>>   		return -ENOMEM;
>>   
>> +	dlc = (struct snd_soc_dai_link_component *)(link + 1);
>> +
>> +	link->cpus	= &dlc[0];
>> +	link->codecs	= &dlc[1];
> 
> While I understand what is going on here, I find this bit ugly.

It's not so bad and it avoid multiple tests and tags that are just as 
ugly IMHO.

> Can it perhaps be changed to something like:
> 
> 	link = kzalloc(sizeof(*link), GFP_KERNEL);
> 	if (link == NULL)
> 		return -ENOMEM;
> 	link->cpus = kzalloc(sizeof(*dlc), GFP_KERNEL);
> 	if (link->cpus == NULL) {
> 		ret = -ENOMEM;
> 		goto err;
> 	}
> 	link->codecs = kzalloc(sizeof(*dlc), GFP_KERNEL);
> 	if (link->cpus == NULL) {
> 		ret = -ENOMEM;
> 		goto err;
> 	}
> 
> (...)
> err:
> 	kfree(link->cpus);
> 	kfree(link);
> 	return ret;
> 
> While it has a bit more of boiler plate it's easier to follow.
> 
> And while I look at soc_tplg_fe_link_create() it could use some
> more memory checks, but it's a topic for separate patch.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
