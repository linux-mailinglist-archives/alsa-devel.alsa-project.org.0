Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCA2284CD
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 19:22:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDFBD839;
	Thu, 23 May 2019 19:21:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDFBD839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558632150;
	bh=knUG1HYbjPFBaR/MC+x0kvzzkhVaq5/tQ4XM1akAyqY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xi8ZMIgCr53MGCkQYZXZlKXpzbuUdsacDZzYLX6lIeSZMODHbYBnZu2nJ27URvxvK
	 gNIr2F729UJfQxFxHNt+NhI9urFSb8BRkuddxzKl8JiRHXRkzkNPMX2Jzbyi0EfynC
	 2twfEMxVMyOPjeQd9MwX4CkzLjpi+Q49uY5dAIN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64E21F89709;
	Thu, 23 May 2019 19:20:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84AC4F89674; Thu, 23 May 2019 19:20:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55132F89625
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 19:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55132F89625
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 10:20:35 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 23 May 2019 10:20:34 -0700
Received: from avabhyan-mobl2.amr.corp.intel.com (unknown [10.251.156.56])
 by linux.intel.com (Postfix) with ESMTP id 59C485803C2;
 Thu, 23 May 2019 10:20:34 -0700 (PDT)
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190523171201.31104-1-ranjani.sridharan@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8ab92ac1-2952-fe0c-f8a8-d75d41aa70b1@linux.intel.com>
Date: Thu, 23 May 2019 12:20:34 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523171201.31104-1-ranjani.sridharan@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: core: lock client_mutex while
 removing link components
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

On 5/23/19 12:12 PM, Ranjani Sridharan wrote:
> Removing link components results in topology unloading. So,
> acquire the client_mutex before removing components in
> soc_remove_link_components. This will prevent the lockdep warning
> seen when dai links are removed during topology removal.
> 
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

GitHub issue: https://github.com/thesofproject/linux/issues/967 for more 
details.

> ---
>   sound/soc/soc-core.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index ce8c057bcd5b..bbb52fbd195e 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1010,12 +1010,14 @@ static void soc_remove_link_components(struct snd_soc_card *card,
>   	struct snd_soc_component *component;
>   	struct snd_soc_rtdcom_list *rtdcom;
>   
> +	mutex_lock(&client_mutex);
>   	for_each_rtdcom(rtd, rtdcom) {
>   		component = rtdcom->component;
>   
>   		if (component->driver->remove_order == order)
>   			soc_remove_component(component);
>   	}
> +	mutex_unlock(&client_mutex);
>   }
>   
>   static void soc_remove_dai_links(struct snd_soc_card *card)
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
