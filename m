Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADE716E9FB
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Feb 2020 16:25:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1AEE1684;
	Tue, 25 Feb 2020 16:24:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1AEE1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582644325;
	bh=bQZsLRZ40pldf/bJ2SeEMf3DlHR8cFhFdzEIvKwZhtE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c4cHo0sYI59BSkuJ1Sk+D5l/EgFTip1KfSXP8zLs+lyt8EnrqLIZW72bk6fkJ3YTt
	 d4BQ/zcQNw5Ce21zq7Z09wb5iQHRkJR9FxRXFdDLIS4O0nQ6Za0SOaQk6g1f/mfP1D
	 WEFdGQRPH2WCCQVHe/P2n7lz3f+DW6RqVUvGeLZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8A71F800AD;
	Tue, 25 Feb 2020 16:23:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ED33F80142; Tue, 25 Feb 2020 16:23:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E56CF80090
 for <alsa-devel@alsa-project.org>; Tue, 25 Feb 2020 16:23:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E56CF80090
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 07:23:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="231485289"
Received: from sabhimji-mobl3.amr.corp.intel.com (HELO [10.251.137.190])
 ([10.251.137.190])
 by fmsmga008.fm.intel.com with ESMTP; 25 Feb 2020 07:23:34 -0800
Subject: Re: [PATCH 00/10] soundwire: bus: fix race conditions, add
 suspend-resume
To: Vinod Koul <vkoul@kernel.org>
References: <20200115000844.14695-1-pierre-louis.bossart@linux.intel.com>
 <20200225102734.GO2618@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e5e992cb-7e5b-081e-14ab-40bdad24b9c8@linux.intel.com>
Date: Tue, 25 Feb 2020 09:23:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225102734.GO2618@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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



On 2/25/20 4:27 AM, Vinod Koul wrote:
> On 14-01-20, 18:08, Pierre-Louis Bossart wrote:
>> The existing mainline code for SoundWire does not handle critical race
>> conditions, and does not have any support for pm_runtime suspend or
>> clock-stop modes needed for e.g. jack detection or external VAD.
>>
>> As suggested by Vinod, these patches for the bus are shared first -
>> with the risk that they are separated from their actual use in Intel
>> drivers, so reviewers might wonder why they are needed in the first
>> place.
>>
>> For reference, the complete set of 90+ patches required for SoundWire
>> on Intel platforms is available here:
>>
>> https://github.com/thesofproject/linux/pull/1692
>>
>> These patches are not Intel-specific and are likely required for
>> e.g. Qualcomm-based implementations.
>>
>> All the patches in this series were generated during the joint
>> Intel-Realtek validation effort on Intel reference designs and
>> form-factor devices. The support for the initialization_complete
>> signaling is already available in the Realtek codecs drivers merged in
>> the ASoC tree (rt700, rt711, rt1308, rt715)
> 
> Applied all, thanks

Thanks Vinod, I'll now prepare the update for the transition away from 
platform devices (minor update needed on the RFC already reviewed by Greg).
