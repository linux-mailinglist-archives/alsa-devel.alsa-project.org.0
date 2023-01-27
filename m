Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B25FA67E909
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 16:11:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91232851;
	Fri, 27 Jan 2023 16:10:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91232851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674832278;
	bh=JovEU/tv9cMEu4oheaCqCXPJ9VxZiBJIyi5ljJzrRaM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SkVdk8LbQbbX331/DhjwWWKvt/lgN22xBOwwb0uMfRJd3JY4TtLuW/0OWYdcOaIgE
	 ynZDO0Wsazq5DZdj09o4Icm+llsrkuJwSfPhxRqEQyoPQIrbBE8uySHqiPgxh9xDdn
	 FzLNJIsLI+7GsBfDfs/A5azoz2GeYkFJlT3tBSyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4875F80074;
	Fri, 27 Jan 2023 16:10:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09B08F8028B; Fri, 27 Jan 2023 16:10:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D941F80074
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 16:10:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D941F80074
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=d3JVVZax
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674832208; x=1706368208;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JovEU/tv9cMEu4oheaCqCXPJ9VxZiBJIyi5ljJzrRaM=;
 b=d3JVVZaxO84jtrC7rm+v63YuS6U6QCD1Ddu0byDdqDc5+Z1Ztn61eZmy
 E8JFsv1OjUptlTtQyWDdN/uqt8xSSKHwfwU49HRFVgzeX2qw6lq/OxKgb
 LchfnYyo5JdVJCbAGblWbOrULWqN8DOhEz/UGdhf7wCSHMFQDMaFYCFrP
 tJVIbmFK6CulYhYdEpALhsN/s1HR7t8Tg5vYmTNIY0LWsM42Ep47omWtC
 qdGnMcIrg4uICVOkqlabnpxg5bEYCr2GPOCDYhV9FUV3yR2SrgSbfQtVA
 4GwB2DwApHOLUYBwir+rTVrGpMVN7dqUUCmXZcYXzM/xnOWhw0/JSlUJu A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="307448361"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="307448361"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 07:10:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="992104640"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="992104640"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 07:10:01 -0800
Message-ID: <cab5343c-a1cc-3173-c7f5-41ed0eec631f@linux.intel.com>
Date: Fri, 27 Jan 2023 16:09:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 11/11] ASoC: topology: Unify kcontrol removal code
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20230125194649.3485731-1-amadeuszx.slawinski@linux.intel.com>
 <20230125194649.3485731-12-amadeuszx.slawinski@linux.intel.com>
 <40207a2a-3f2a-bbef-74f6-9e85ced3150a@linux.intel.com>
 <5f7e9b31-ad1f-0948-5673-0732d73a185e@linux.intel.com>
 <9f7b76db-c788-cd2a-f873-f8a3382f368c@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <9f7b76db-c788-cd2a-f873-f8a3382f368c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 1/27/2023 2:38 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 1/27/23 05:12, Amadeusz Sławiński wrote:
>> On 1/25/2023 4:15 PM, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 1/25/23 13:46, Amadeusz Sławiński wrote:
>>>> Functions removing bytes, enum and mixer kcontrols are identical. Unify
>>>
>>> they are identical because of the change in patch10.
>>>
>>> Please clarify that this is not a cleanup removing duplicated code
>>> that's been there forever, it's become useless as a result of the
>>> previous patch.
>>>
>>
>> There is no dependency on previous patch - it is just order I've send
>> them in - those functions have same implementation in current code.
> 
> Not following, sorry. What is this addition in patch 10?
> 
> diff --git a/include/sound/soc-topology.h b/include/sound/soc-topology.h
> index b4b896f83b94..f055c6917f6c 100644
> --- a/include/sound/soc-topology.h
> +++ b/include/sound/soc-topology.h
> @@ -62,7 +62,7 @@ struct snd_soc_dobj {
>   	enum snd_soc_dobj_type type;
>   	unsigned int index;	/* objects can belong in different groups */
>   	struct list_head list;
> -	struct snd_soc_tplg_ops *ops;
> +	int (*unload)(struct snd_soc_component *comp, struct snd_soc_dobj *dobj);
> 
> That's not in 'current code', is it? How is this not a dependency?

It only depends on it because of order I did changes in, but there is 
really no dependency here. I will send v2 with reversed order.
