Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 442183DB9A2
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 15:52:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7F991932;
	Fri, 30 Jul 2021 15:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7F991932
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627653158;
	bh=uEeo9Hm87DQ4z914oqwyexAxZE0drsDJYWkC6WdR18M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uZ6t2/7fNJcP2iWSlun3y3/yf5hQodyVIMWry4KBQ4z9iEtn/vHBn7av4FFn7JOHs
	 cSDSRNR/FtyxxvQgd1lX0JO+eXd329C7a7HFktZ6tGVfCEy9suqgv9gnLIGMnNPPdf
	 2GbXPgvop3BLBspA2EvxvwrcdOUGW02GbeglBAgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5775F800ED;
	Fri, 30 Jul 2021 15:51:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72F9FF800ED; Fri, 30 Jul 2021 15:51:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A82D0F800ED
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 15:50:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A82D0F800ED
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="209986675"
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="209986675"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 06:50:53 -0700
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="508128490"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.24.117])
 ([10.213.24.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 06:50:51 -0700
Subject: Re: [PATCH v1] ASoC: Intel: kbl_da7219_max98357a: fix drv_name
To: Lukasz Majczak <lma@semihalf.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20210730115906.144300-1-lma@semihalf.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <bd223956-93c8-1fb6-325d-0afb34ad2f23@intel.com>
Date: Fri, 30 Jul 2021 15:50:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210730115906.144300-1-lma@semihalf.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On 2021-07-30 1:59 PM, Lukasz Majczak wrote:
> platform_id for kbl_da7219_max98357a was shrunk for kbl_da7219_mx98357a,
> but the drv_name was changed for kbl_da7219_max98373. Tested on a
> Pixelbook (Atlas).

Reasoning behind Pierre's initial commit is valid and I believe 
kbl_da7219_max98373 name change was simply unintended. To make the 
situation clearer, please be more elaborate in commit's message.

> Fixes: 94efd726b947 ("ASoC: Intel: kbl_da7219_max98357a: shrink platform_id below 20 characters")
> Cc: <stable@vger.kernel.org> # 5.4+
> Reported-by: Cezary Rojewski <cezary.rojewski@intel.com>

Please reword to: Suggested-by. I certainly wasn't the one who found the 
problem first, but I did provide the initial fix.

I don't see any problem is the code, so besides formalities:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>


Thanks,
Czarek
