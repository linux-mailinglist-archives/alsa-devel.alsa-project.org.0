Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA44D26DCC2
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 15:26:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 338431663;
	Thu, 17 Sep 2020 15:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 338431663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600349219;
	bh=8XznQs2AT0aGqOZ5/qvTHiZzTK46crpdDCV3nC/DmMM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XQ08z1AG3D7o1yW6OWIlTA4RpzdlrgyTDaF9brUz7b24g9dHeEtlNR+aOBpWChW5+
	 +008gHa0tUHdkdLgwdOkALdXZ9JakTDBfpZCoq2AH/dxKqSY7TP6EADamwHZxEhdyT
	 jSSgcXHuXgRBFeKzTr5vUUi95ZhbDfDa02RWrAfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 304D9F8025E;
	Thu, 17 Sep 2020 15:25:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2681F80212; Thu, 17 Sep 2020 15:25:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42B29F800E8
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 15:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42B29F800E8
IronPort-SDR: ISMU0qW2V50HjEmOMppJ+ZkRm92YeNW4zMs+boI0nt+A73rFPXv2BFGDG1f6bsRWw2f6tXBVIZ
 VQ2KiTA4QG1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="160618246"
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; d="scan'208";a="160618246"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 06:24:57 -0700
IronPort-SDR: MdEsukergzsDZVOVHiEPcRm8K4oZADB5qgMTkHG2qSf9I7fcffOkc/FUSxHvMPnyFoFd6Ei5OW
 oicVp3MrxI5w==
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; d="scan'208";a="483744487"
Received: from apauly-mobl.amr.corp.intel.com (HELO [10.254.96.60])
 ([10.254.96.60])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 06:24:54 -0700
Subject: Re: [PATCH] ASoC: rt715: Add module parameter to fix dmic pop sound
 issue.
To: Mark Brown <broonie@kernel.org>
References: <20200916204758.53651-1-pierre-louis.bossart@linux.intel.com>
 <20200917112547.GC4755@sirena.org.uk>
 <9cbc7629-f28e-461c-1787-da5280269f99@linux.intel.com>
 <20200917130638.GE4755@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7811497f-c1fd-2c09-6f42-ac70c60f531f@linux.intel.com>
Date: Thu, 17 Sep 2020 08:24:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917130638.GE4755@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, Jack Yu <jack.yu@realtek.com>, alsa-devel@alsa-project.org,
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



On 9/17/20 8:06 AM, Mark Brown wrote:
> On Thu, Sep 17, 2020 at 08:00:39AM -0500, Pierre-Louis Bossart wrote:
>> On 9/17/20 6:25 AM, Mark Brown wrote:
> 
>>> Normally we would just add a delay in the driver unconditionally, why
>>> make this a module paramter?  If there are board variations then we
>>> should be getting them from board data, not forcing individual users to
>>> bodge things with a module parameter.
> 
>> that wasn't the intent. 400ms is the recommended value, but the parameter
>> provides a way to experiment without having to recompile during
>> integration/debug stages.
> 
>> It was my recommendation to add this parameter, I don't mind removing it if
>> you prefer it that way. Or I can respin the commit message and comments to
>> make it clearer what the intended use was.
> 
> It'd be better to just remove it.  If you want a facility to experiment
> for testing debugfs is a better fit I think, unless this is a delay that
> only gets done once during probe of course in which case that wouldn't
> work.

ok, I'll send a v2.
