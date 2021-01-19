Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E82832FBBC3
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 16:58:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C6A218AF;
	Tue, 19 Jan 2021 16:57:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C6A218AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611071890;
	bh=ywQVo752nY5+Wwag1C0/DkVGCbLMyjOyZsNQNx4/4ZM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=twIa//xB3OQNCUffJm+Og9RJZL1psE+iJ47AkPlsEG0zHeL5hNJUA2YNUww82apW+
	 4FuFcA5JHgj4SRbynCnxNFxkH2HzNzFjhpHtteU0vDHiZPrq9JlzdJy/u85YaqZDdU
	 UKFh8I3l6wpntSlz1yZZ1K2lNb8XHBD5BdKsHBLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ACBBF800FE;
	Tue, 19 Jan 2021 16:56:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EC78F80257; Tue, 19 Jan 2021 16:56:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC6BDF80137
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 16:56:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC6BDF80137
IronPort-SDR: SG34bJmm9qYtKeMBuEF0XU5urYsFiYcpli0Nk9/2K403XG2gc1uIhRWUj3pouLadAg5qzp7piQ
 J5T8UNEvR7/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="166613502"
X-IronPort-AV: E=Sophos;i="5.79,359,1602572400"; d="scan'208";a="166613502"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2021 07:56:29 -0800
IronPort-SDR: +8un7h/G1TOmeEyJrzdSGbntlMjbolD6o8NwPWDZu63WBRIAxEuHQLH7wUhDjm1jSRT5phmmXI
 hyrb7Kg4D5kw==
X-IronPort-AV: E=Sophos;i="5.79,359,1602572400"; d="scan'208";a="500975811"
Received: from kxu2-mobl.amr.corp.intel.com (HELO [10.212.225.199])
 ([10.212.225.199])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2021 07:56:29 -0800
Subject: Re: [PATCH] soundwire: debugfs: use controller id instead of link_id
To: Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20210115162559.20869-1-srinivas.kandagatla@linaro.org>
 <20210119145220.GS2771@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <45300dc3-00b0-497b-804e-f7f1e857f32a@linux.intel.com>
Date: Tue, 19 Jan 2021 09:54:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210119145220.GS2771@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com
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



On 1/19/21 8:52 AM, Vinod Koul wrote:
> On 15-01-21, 16:25, Srinivas Kandagatla wrote:
>> link_id can be zero and if we have multiple controller instances
>> in a system like Qualcomm debugfs will end-up with duplicate namespace
>> resulting in incorrect debugfs entries.
>>
>> Using id should give a unique debugfs directory entry and should fix below
>> warning too.
>> "debugfs: Directory 'master-0' with parent 'soundwire' already present!"
> 
> Yeah id is guaranteed to be unique so this will work.
> 
> Applied, thanks

This patch is a no-op for Intel, but I am not convinced it's the right 
fix or the definitions are not consistent.

  * @link_id: Link id number, can be 0 to N, unique for each Master
  * @id: bus system-wide unique id

In the MIPI/DisCo definitions, a controller can have multiple masters. 
if you have multiple controllers, each of them should have their own 
debugfs directory IMHO. It's totally fine to have multiple bus/masters 
with a link_id == 0.
