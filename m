Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8188B35169D
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 18:05:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16A6B16AE;
	Thu,  1 Apr 2021 18:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16A6B16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617293122;
	bh=MfZrhP1Y+78+utotX8wMFzIdsZqpXU/KCv70sKCiYV4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uqVE8hvI+ReJr4BM1WX4VJUQsVtfs3exDyUy5wG9vrQWfrW1QP9xqovqOR8FtQJWk
	 J9C9npHwjlYmuAuQCufMw676ZzhL6rMH6Qi1W4RRykAu7KyFIuRU2AFhQw9uClZOwH
	 73etz0ww8rL/AmdZHJB1dghNHsD3mdYibpTNsSBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FE01F8027D;
	Thu,  1 Apr 2021 18:03:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0C00F8013C; Thu,  1 Apr 2021 18:03:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28AF6F8013C
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 18:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28AF6F8013C
IronPort-SDR: eJ5TEfTtn1v9FYPBq2hOCJUCTTK6JGzuSDngi8sAzVzdO10izo90FfWnhX5n1VtKRp/YSxmMAK
 NjBjekvHulvg==
X-IronPort-AV: E=McAfee;i="6000,8403,9941"; a="171692978"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="171692978"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 09:03:20 -0700
IronPort-SDR: 72C3Wd8VzEv1rKIMk9QywCU1PmokvTgQL5VxGjUpjtLwURP/BE+pIcIeNiUySjKOgaFl60ueS4
 4yj/m7NdYN6Q==
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="439265752"
Received: from mooreale-mobl.amr.corp.intel.com (HELO [10.255.229.43])
 ([10.255.229.43])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 09:03:16 -0700
Subject: Re: [PATCH] soundwire: intel_init: test link->cdns
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20210331010250.14151-1-yung-chuan.liao@linux.intel.com>
 <YGV0a+ZnTh7A8DD0@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6dae2b2d-b482-4e29-4543-62126780725c@linux.intel.com>
Date: Thu, 1 Apr 2021 09:31:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YGV0a+ZnTh7A8DD0@vkoul-mobl.Dlink>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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



On 4/1/21 2:21 AM, Vinod Koul wrote:
> On 31-03-21, 09:02, Bard Liao wrote:
>> intel_link_probe() could return error and dev_get_drvdata() will return
>> null in such case. So we have to test link->cdns after
>> link->cdns = dev_get_drvdata(&ldev->auxdev.dev);
>> Otherwise, we will meet the "kernel NULL pointer dereference" error.
> 
> This fails to apply for me

probably a dependency on the auxiliary bus transition?
