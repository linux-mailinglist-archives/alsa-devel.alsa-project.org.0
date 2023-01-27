Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3101A67E800
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 15:19:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C5B1950;
	Fri, 27 Jan 2023 15:18:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C5B1950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674829153;
	bh=H5yG2Ip8mH/6PiVE8w45zw8501pyRAqnMW39NYephOc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=j8MvezN72Ia8vTrTzTxElLtxbfJWHRxrRcEqFbuG77zTvr04HXne4/JqI+VD+ey90
	 Dv56wpG26UdcjIVWbeg7XqZAXd2VIeUIajCWK2v8cZpWNvRcWnWovvWndg/rwFjXGE
	 JBp/sUbNo2RG/h7D8RNLYdT3PNABSqx8HIzf0aHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94716F80154;
	Fri, 27 Jan 2023 15:18:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F19AEF80424; Fri, 27 Jan 2023 15:18:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 650B5F80154
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 15:18:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 650B5F80154
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=f58sIoIZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674829087; x=1706365087;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=H5yG2Ip8mH/6PiVE8w45zw8501pyRAqnMW39NYephOc=;
 b=f58sIoIZJiGB+2m1CoLZLaHzbNXcHBUtnJgK2cAiRQ8t2feTEcTnnMrr
 zxj+CcjS9L/pqH3JYbJrkP3PksYe1sBcs1TF4hx8Gh5W29Z0Rv4JSz4Gy
 enalu9IXPOHaZQTbPu1SC/dMW0J203ZMCWbie+CzdaE3TV/lm1d64CudM
 0T1CBzXdcYsuqx/vXXQXzax0/tqEH2OnC5zENBT97Ee+YCiWsbDU/QJG2
 TdHnY6C8F2/MITFSqsuCmxZXuXH4JV66UKZmegdvYXmToDStMfI4fnX2u
 l35LxTyLrWJhYEA+N1Be5pVSCjuw4Y6WXizP8Z8qePAR+SMeSDUqc2ldR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="315045555"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="315045555"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 06:18:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="695546185"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="695546185"
Received: from vmodi-mobl2.amr.corp.intel.com (HELO [10.212.9.128])
 ([10.212.9.128])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 06:18:03 -0800
Message-ID: <9f7b76db-c788-cd2a-f873-f8a3382f368c@linux.intel.com>
Date: Fri, 27 Jan 2023 07:38:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 11/11] ASoC: topology: Unify kcontrol removal code
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20230125194649.3485731-1-amadeuszx.slawinski@linux.intel.com>
 <20230125194649.3485731-12-amadeuszx.slawinski@linux.intel.com>
 <40207a2a-3f2a-bbef-74f6-9e85ced3150a@linux.intel.com>
 <5f7e9b31-ad1f-0948-5673-0732d73a185e@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <5f7e9b31-ad1f-0948-5673-0732d73a185e@linux.intel.com>
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/27/23 05:12, Amadeusz Sławiński wrote:
> On 1/25/2023 4:15 PM, Pierre-Louis Bossart wrote:
>>
>>
>> On 1/25/23 13:46, Amadeusz Sławiński wrote:
>>> Functions removing bytes, enum and mixer kcontrols are identical. Unify
>>
>> they are identical because of the change in patch10.
>>
>> Please clarify that this is not a cleanup removing duplicated code
>> that's been there forever, it's become useless as a result of the
>> previous patch.
>>
> 
> There is no dependency on previous patch - it is just order I've send
> them in - those functions have same implementation in current code.

Not following, sorry. What is this addition in patch 10?

diff --git a/include/sound/soc-topology.h b/include/sound/soc-topology.h
index b4b896f83b94..f055c6917f6c 100644
--- a/include/sound/soc-topology.h
+++ b/include/sound/soc-topology.h
@@ -62,7 +62,7 @@ struct snd_soc_dobj {
 	enum snd_soc_dobj_type type;
 	unsigned int index;	/* objects can belong in different groups */
 	struct list_head list;
-	struct snd_soc_tplg_ops *ops;
+	int (*unload)(struct snd_soc_component *comp, struct snd_soc_dobj *dobj);

That's not in 'current code', is it? How is this not a dependency?
