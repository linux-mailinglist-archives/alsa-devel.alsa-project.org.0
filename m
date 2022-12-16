Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E30F64EB9A
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 13:51:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E6A21715;
	Fri, 16 Dec 2022 13:50:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E6A21715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671195096;
	bh=r4uwvemqi9ab1UjUC/31+CgXJktvKBdPy23ZIu5feg8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ubxth96p0/gvcJXC6HjW7OJha2vKFFcPFfu6Hbytqvi0pIsPq8OHM39EvyAVdgKum
	 t7drmKi0IgyxizgQYSvMf2af/zpyY+TSFyVbANTR1msTTx1uK2XIphz0ECSpNDoekq
	 jLlafLY8bE5ImbSAgEKsL+fW3d2nBAABHiuCU8SY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABDB7F804D0;
	Fri, 16 Dec 2022 13:50:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C325F804E2; Fri, 16 Dec 2022 13:50:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45483F804D7
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 13:50:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45483F804D7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=INKWuaBJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671195035; x=1702731035;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=r4uwvemqi9ab1UjUC/31+CgXJktvKBdPy23ZIu5feg8=;
 b=INKWuaBJU4oMGdgx8/0dK5Uq5JMN/pEaQph2/NRSO1Dqn81HNcGCQG6J
 UTi9qzzkkwwM4u/ivCeygVE/HP4x/9beykGnbbMe0fW9ZkEmqRxXrJKqz
 at3BT5lc4DRGU0/LHNAKf48/05LSxmtuJXE3HWR4g5H3pJlCcxj+IjXMR
 LoE43+KTJy8Mc8l6KRJP5/WAgB0JYvanRskyc8XSLleQhr18GfhSN4IHa
 RgIY41dNzIkjvR/mCinvTSrjwMrNpCb37hgeJ6XRispGdA8ajr2AQa3qy
 yJzc9/d0R9Y0gHE3pZI6c+25dNtYcFMAQIrKpd3irZKNy5JQr8G8Rta8t g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="319011507"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="319011507"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 04:50:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="627558337"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="627558337"
Received: from emnevill-mobl.ger.corp.intel.com (HELO [10.252.6.47])
 ([10.252.6.47])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 04:50:12 -0800
Message-ID: <b6d805e9-419f-951a-a6dc-903d7bda7618@linux.intel.com>
Date: Fri, 16 Dec 2022 14:50:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH 2/3] ASoC: SOF: pm: Always tear down pipelines before DSP
 suspend
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20221215185347.1457541-1-ranjani.sridharan@linux.intel.com>
 <20221215185347.1457541-3-ranjani.sridharan@linux.intel.com>
 <f062be0f-0022-b77f-b13a-3e722baaa446@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <f062be0f-0022-b77f-b13a-3e722baaa446@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: tiwai@suse.de, Curtis Malainey <cujomalainey@chromium.org>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 16/12/2022 11:06, Amadeusz Sławiński wrote:
> On 12/15/2022 7:53 PM, Ranjani Sridharan wrote:
>> When the DSP is suspended while the firmware is in the crashed state, we
>> skip tearing down the pipelines. This means that the widget reference
>> counts will not get to reset to 0 before suspend. This will lead to
>> errors with resuming audio after system resume. To fix this, invoke the
>> tear_down_all_pipelines op before skipping to DSP suspend.
>>
>> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>> Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> ---
>>   sound/soc/sof/pm.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
>> index 5f88c4a01fa3..f153881db189 100644
>> --- a/sound/soc/sof/pm.c
>> +++ b/sound/soc/sof/pm.c
>> @@ -192,6 +192,9 @@ static int sof_suspend(struct device *dev, bool
>> runtime_suspend)
>>       if (runtime_suspend && !sof_ops(sdev)->runtime_suspend)
>>           return 0;
>>   +    if (tplg_ops && tplg_ops->tear_down_all_pipelines)
>> +        tplg_ops->tear_down_all_pipelines(sdev, false);
>> +
>>       if (sdev->fw_state != SOF_FW_BOOT_COMPLETE)
>>           goto suspend;
>>   
> 
> Can tplg_ops even be null? Rest of SOF code seems to skip this check and
> only check for callback presence.

We have another series not yet sent which will re-visit these ops and
their optionality. This patch was created on top of that work in SOF's
sof-dev branch.

> Also won't tearing down pipelines few lines later become unnecessary then?
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/sof/pm.c?id=a12a383e59ce486abd719b6bda33c353a3b385e7#n220

Good catch. The original patch in sof-dev did the move:
https://github.com/thesofproject/linux/commit/62c1ccce6c6514a3ff8590156fbd7fff9d24586f

-- 
Péter
