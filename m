Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 171F626C3CA
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 16:37:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8D611692;
	Wed, 16 Sep 2020 16:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8D611692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600267074;
	bh=7QJ846KKJa1CA4kjgiEVNNe6kuPVqfuEC/PJB0njcL4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gr4PXq1t/NnceDbMP+SMK68otZlpr6aiXOTl+eCKqCD/0GVICXaBCZxurNh8HjteF
	 /ih/OOWo2P/yZ5BGiEauZT4mgh80fMzJE/wsd16+B0ike1/mezM+FsMv7mLzl1UBwi
	 tYfkx9Aq5nzzAv3e+Licj66daz4AQqGFh0I0kY8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3BDEF80150;
	Wed, 16 Sep 2020 16:36:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32E18F8015A; Wed, 16 Sep 2020 16:36:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8220CF800E8
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 16:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8220CF800E8
IronPort-SDR: 9X/vVNL1AmApqyDDiWlyBIRDTjmnA2kehVDxBVqICBpJkCTO3bZ8/R7qKga7ReI0SLKlASQSo+
 Kyz2Wraznuww==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="177547068"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="177547068"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 07:36:02 -0700
IronPort-SDR: 9vflgM7vQtpr7bUeEoXhYRQcvsmlrp+E3k7y2J5qr5AMndwoBz/ZUYEdvbzo1cxTyEzo1O3Nym
 fteSH2tygVsA==
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="483335716"
Received: from abkhadil-mobl.amr.corp.intel.com (HELO [10.209.66.227])
 ([10.209.66.227])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 07:36:01 -0700
Subject: Re: [PATCH v2 1/3] soundwire: qcom: clear BIT FIELDs before value set.
To: Vinod Koul <vkoul@kernel.org>
References: <20200916092125.30898-1-srinivas.kandagatla@linaro.org>
 <20200916092125.30898-2-srinivas.kandagatla@linaro.org>
 <20200916124634.GM2968@vkoul-mobl>
 <24401c7c-b12c-0924-9d8f-fde633d15918@linux.intel.com>
 <20200916142929.GR2968@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <42bbf464-2bc9-2b13-5f08-a19ad1848277@linux.intel.com>
Date: Wed, 16 Sep 2020 09:36:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916142929.GR2968@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 9/16/20 9:29 AM, Vinod Koul wrote:
> On 16-09-20, 08:18, Pierre-Louis Bossart wrote:
>>
>>>> According to usage (bitfields.h) of REG_FIELDS,
>>>> Modify is:
>>>>     reg &= ~REG_FIELD_C;
>>>>     reg |= FIELD_PREP(REG_FIELD_C, c);
>>
>>
>> if this is indeed the case, all the code in cadence_master.c is also broken,
>> e.g:
>>
>> 	dpn_config = cdns_readl(cdns, dpn_config_off);
>>
>> 	dpn_config |= FIELD_PREP(CDNS_DPN_CONFIG_WL, (p_params->bps - 1));
>> 	dpn_config |= FIELD_PREP(CDNS_DPN_CONFIG_PORT_FLOW, p_params->flow_mode);
>> 	dpn_config |= FIELD_PREP(CDNS_DPN_CONFIG_PORT_DAT, p_params->data_mode);
> 
> This should be replaced with u32_replace_bits(), i am sending the fix

wondering if we should replace all uses of FIELD_PREP with either 
u32_insert_bits() or u32_encode_bits() then?

