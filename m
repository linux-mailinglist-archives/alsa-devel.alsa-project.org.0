Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0A960EA79
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 22:44:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B508538A4;
	Wed, 26 Oct 2022 22:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B508538A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666817048;
	bh=Xeuc8kocyPNzVa+dllrDgz0yAMqfPDA2pAu02G6CzG0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dHyRFUE0Ao9/Vc2/Sr3ZO1wPA18pSWUs1LDKm8R9QLSi29GK6qC/09HM5BP9h7ujq
	 16eY0gIFvZJ2ECj9WrITVmc5LbbDESpY/U4arXEjaSmfAztCBKhELQ3p99XCgmwHCk
	 E/5cJ4essRdQVKounkMWRJB1NOl99kw0kK0ot9x8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B5EAF80564;
	Wed, 26 Oct 2022 22:42:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29E83F80557; Wed, 26 Oct 2022 22:42:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01785F80271
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 22:42:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01785F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="X8Ki7Eys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666816937; x=1698352937;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Xeuc8kocyPNzVa+dllrDgz0yAMqfPDA2pAu02G6CzG0=;
 b=X8Ki7Eys9ECXtWCsLSdHtkrAMmQJFy9yn1dpGecfWD6KgHwjEVqdrlho
 gcxxdDw/BEDqIiGCbOpz1bPzyl2QyKw7jz25Hrb5JizPPbC/L24KdDZkX
 XESOpOuwC9KAsU0fnV1D4z9JlKpZcd1lfW2NbpvTFfKyc0xYQfYb95nSR
 JrvgtaxJJHVTV+Dgaksn8E0nKNHl+Y++0TdxKqiJxKcB9mJTs4LobbjrZ
 fnyHHa2tM8FbWtofpztR6j/bJNdtvWERNxzHRgjWfME6pZ1zc5Lw+dorz
 s7ej3HuQnjpYP6Xsn+AIor08Z27WOdBDYdNW78yFCDzdmEo0fszTJFWzg Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="308048954"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="308048954"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 13:42:04 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="610103334"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="610103334"
Received: from bcoan-mobl2.amr.corp.intel.com (HELO [10.209.189.197])
 ([10.209.189.197])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 13:42:03 -0700
Message-ID: <37b7c58c-a82d-257f-27d8-a4d61bc3677a@linux.intel.com>
Date: Wed, 26 Oct 2022 15:38:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/9] ASoC: qdsp6: audioreach: topology use idr_alloc_u32
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20221021165207.13220-1-srinivas.kandagatla@linaro.org>
 <20221021165207.13220-2-srinivas.kandagatla@linaro.org>
 <35f55696-c4c5-1f00-dc7e-b5c7dcf0a091@linux.intel.com>
 <4d2fcabe-291a-9f8d-ca48-eaf52e00695e@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <4d2fcabe-291a-9f8d-ca48-eaf52e00695e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, bgoswami@quicinc.com, linux-kernel@vger.kernel.org
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



On 10/26/22 04:19, Srinivas Kandagatla wrote:
> Thanks Pierre,
> 
> On 21/10/2022 18:09, Pierre-Louis Bossart wrote:
>>
>>
>> On 10/21/22 11:51, Srinivas Kandagatla wrote:
>>> SubGraph and Module Instance ids take 32 bits, so use idr_alloc_u32
>>> instead of idr_alloc to able to accomdate valid ranges.
>>
>> typo: accommodate.
>>
> will fix it in next version
> 
>> Also worth checking
>> https://www.kernel.org/doc/html/latest/core-api/idr.html
>> "The IDR interface is deprecated; please use the XArray instead."
> Thanks for this hit, this looks really good and specially lookups
> without Locking, this could cleanup the code a bit.
> 
> Having said that I would still like this patch go as it is with idr for
> now, and I can plan to rework on converting idr to xa later, as there
> are few more Qcom Audio drivers that have usage of idr.

sounds good.
