Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8053F080C
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 17:28:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD2481691;
	Wed, 18 Aug 2021 17:28:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD2481691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629300537;
	bh=pfia9gO0icSDW8FyaA6UM0W2C3cMTPYtsdLnMTmMHPI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rWL1yVkKaKNXEtRxzwQYAhXh98nYwBrHBnS8g8Wfvh3ktmHaZOlY+NXy0ugk732D2
	 5XiAyVepbPiYt+lTVq2xvq3M4rA+0FlblzOuslAjLJkcQjNpN4t+vysJaavlnz+RQ+
	 CySClDJVUjqvr+ycT9/va9LNTOOk6QAifmYuZKx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31FE8F800EC;
	Wed, 18 Aug 2021 17:27:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6887AF80249; Wed, 18 Aug 2021 17:27:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A33F1F80169;
 Wed, 18 Aug 2021 17:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A33F1F80169
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="214502372"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="214502372"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 08:25:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="449796910"
Received: from ksawchu-mobl.amr.corp.intel.com (HELO [10.212.83.236])
 ([10.212.83.236])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 08:25:26 -0700
Subject: Re: [RFC PATCH 2/2] ASoC: SOF: trigger re-probing of deferred devices
 from workqueue
To: Mark Brown <broonie@kernel.org>
References: <20210817190057.255264-1-pierre-louis.bossart@linux.intel.com>
 <20210817190057.255264-3-pierre-louis.bossart@linux.intel.com>
 <20210818120700.GB4177@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3985f754-a0a2-92f7-1585-3b177c172664@linux.intel.com>
Date: Wed, 18 Aug 2021 10:25:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818120700.GB4177@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, tiwai@suse.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 vkoul@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Christoph Hellwig <hch@lst.de>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
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



On 8/18/21 7:07 AM, Mark Brown wrote:
> On Tue, Aug 17, 2021 at 02:00:57PM -0500, Pierre-Louis Bossart wrote:
> 
>> +++ b/sound/soc/sof/core.c
>> @@ -251,6 +251,9 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
>>  
>>  	sdev->probe_completed = true;
>>  
>> +	/* kick-off re-probing of deferred devices */
>> +	driver_deferred_probe_trigger();
>> +
> 
> I think we should move this into snd_soc_register_component() - the same
> issue could occur with any other component, the only other thing I can
> see kicking in here is the machine driver registration but that ought to
> kick probe itself anyway.  Or is there some other case here?

Thanks for the suggestion Mark, it would be more consistent indeed to
kick a re-evaluation of the deferred probe list when ASoC components are
successfully registered with something like this:

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c830e96afba2..9d6feea7719c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2677,7 +2677,14 @@ int snd_soc_register_component(struct device *dev,
        if (ret < 0)
                return ret;

-       return snd_soc_add_component(component, dai_drv, num_dai);
+       ret = snd_soc_add_component(component, dai_drv, num_dai);
+       if (ret < 0)
+               return ret;
+
+       /* kick-off re-probing of deferred devices */
+       driver_deferred_probe_trigger();
+
+       return 0;
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_component);

In the case of this SOF driver, it'd be completely equivalent to what
this patch suggested, the snd_soc_register_component() is what we do
last in the workqueue.

In the case of 'regular' drivers, the component registration is
typically done last as well before the end of the probe. This would
result in 2 evaluations (one on successful ASoC component registration
and one on successful probe), and maybe on the second evaluation there's
nothing to do.

I can't think of any negative side-effects.
