Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB182243F6B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 21:45:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 456EC42;
	Thu, 13 Aug 2020 21:44:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 456EC42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597347942;
	bh=5cvaYAjEiAW7kjsx4qxWfnB47uoLujbpv9hanWvpe/Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mnk8MFvJ+p5sx+bCJhbiI6i6FnZHXl9ZazOsFVuHHC4mCmiiU0XhadFnNwiOEJPlr
	 lfdogPFNPSntdAJtio2xQUn+LuYbeFlSBWPHD3pENuYJ6bCW5xX6u2Aya7ZgoeIWqD
	 Lga+XJrQEdfkL01FNXdLyESdMwPgkqRyA+P0fj4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C3FDF8014C;
	Thu, 13 Aug 2020 21:44:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3056F8015B; Thu, 13 Aug 2020 21:43:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFA9FF800F4
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 21:43:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFA9FF800F4
IronPort-SDR: ujK/AhT23XYjS+5CSb5oGsuPTJXC/EbR0HHfFQiMGkAa9cIP//Gqagl6lwHaBraCQDq1ARiwx1
 WJd3LLyvzVZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="142160576"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="142160576"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 12:43:51 -0700
IronPort-SDR: wG0uzdr5ifgetkffdivwhNWcOIT2OB0gBfdOEeY4mU0Rj/LXZnc9J7goxNd16SmJfMaVluWb3R
 VqX/FpS+WeHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="309166955"
Received: from alam-mobl.amr.corp.intel.com ([10.212.134.20])
 by orsmga002.jf.intel.com with ESMTP; 13 Aug 2020 12:43:50 -0700
Subject: Re: [PATCH 5/5] ASoC: Intel: sof_sdw: clarify operator precedence
To: Mark Brown <broonie@kernel.org>
References: <20200813175839.59422-1-pierre-louis.bossart@linux.intel.com>
 <20200813175839.59422-6-pierre-louis.bossart@linux.intel.com>
 <20200813184541.GD5541@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0b8b306f-f9b7-bb62-2fd2-9b396b862f6f@linux.intel.com>
Date: Thu, 13 Aug 2020 14:43:50 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200813184541.GD5541@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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

On 8/13/20 1:45 PM, Mark Brown wrote:
> On Thu, Aug 13, 2020 at 12:58:39PM -0500, Pierre-Louis Bossart wrote:
> 
>> -	hdmi_num = sof_sdw_quirk & SOF_SDW_TGL_HDMI ?
>> +	hdmi_num = (sof_sdw_quirk & SOF_SDW_TGL_HDMI) ?
>>   				SOF_TGL_HDMI_COUNT : SOF_PRE_TGL_HDMI_COUNT;
> 
> Or better yet, just don't abuse the ternery operator like this and write
> normal conditional statements.

I count 795 uses of the ternary operator in sound/soc and 68776 in my 
local kernel branch.
Can you clarify in what way this is an abuse? I don't mind changing 
this, I wasn't aware this is frowned upon.

