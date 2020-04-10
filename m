Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF91F1A6559
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 12:48:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E58216F6;
	Mon, 13 Apr 2020 12:47:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E58216F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586774918;
	bh=HFv3npqpwz9Tt4Y095hbg8K2t5ZGYRzWhucOEN1aVXQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MNq/7Xa7IjG57bJaC0NS9evhm5R3XQNuWXpi88izkPZsZuMwVEEYW7qKXFdLGvpAe
	 SpzV79llfip6jLblGu+twuB/hcL8qdAJJlzr3UayUlVZJV2NMbh+n0n/wiGUsr+IKK
	 b1CrC8Oo3iUlPJwvyZfLqSsYnMIy92vVt3oM4uyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7447DF80229;
	Mon, 13 Apr 2020 12:46:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AFE2F80115; Mon, 13 Apr 2020 12:46:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=PRX_BODYSUB_5,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EF6AF80115
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 12:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EF6AF80115
IronPort-SDR: Z/Bflee4gYmAmfF6w+WLN5ANsIaysm0cmETLIeAkkrJjItDn2E83ZPriGGya9orlz1UdVmqh7u
 dfhu9eCpf5Kw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2020 03:46:47 -0700
IronPort-SDR: YhG4SpOJAtuDhIzfdEXl0XuA2uTQR1KtNec9MqjZLOMdU/k+LJkJqjARAneI13RPWqNDWPO4/p
 60GiSpmBpcPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; d="scan'208";a="243507814"
Received: from ftehrig-mobl.amr.corp.intel.com (HELO [10.209.82.92])
 ([10.209.82.92])
 by fmsmga007.fm.intel.com with ESMTP; 13 Apr 2020 03:46:45 -0700
Subject: Re: [PATCH -next] soundwire: intel: Make sdw_intel_init static
To: YueHaibing <yuehaibing@huawei.com>, vkoul@kernel.org,
 sanyog.r.kale@intel.com
References: <20200410115708.27708-1-yuehaibing@huawei.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e58ff419-588b-da7b-2e36-6cf568315c57@linux.intel.com>
Date: Fri, 10 Apr 2020 10:25:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200410115708.27708-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 4/10/20 6:57 AM, YueHaibing wrote:
> Fix sparse warning:
> 
> drivers/soundwire/intel_init.c:193:6: warning:
>   symbol 'sdw_intel_init' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/soundwire/intel_init.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
> index 4b769409f6f8..ad7053463889 100644
> --- a/drivers/soundwire/intel_init.c
> +++ b/drivers/soundwire/intel_init.c
> @@ -190,7 +190,8 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
>    * This scans the namespace and creates SoundWire link controller devices
>    * based on the info queried.
>    */
> -void *sdw_intel_init(acpi_handle *parent_handle, struct sdw_intel_res *res)
> +static void *sdw_intel_init(acpi_handle *parent_handle,
> +			    struct sdw_intel_res *res)

This declaration has been this way since 2017, there are no users and it 
will be removed with the Intel patchsets, so fixing this warning doesn't 
really add much value. No sustained objection though.

>   {
>   	acpi_status status;
>   
> 
