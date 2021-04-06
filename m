Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5DC354C0E
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 07:20:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B83CB16D7;
	Tue,  6 Apr 2021 07:19:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B83CB16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617686447;
	bh=KZyLtt2g0BlasGo/+Mw7bDKY3sqGXwsIlWYhLOOKwhc=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oqAZBVfTd7aXJP9OjJjZ4nDa2zNa7y4j1DMMUyAg/ZB5oiSKiy0amH0ZhcmpyhKNf
	 3WExLJ3vU1oPlx/EZQzyX/3BdOoGohVS6zKU6fxhgVY7MvqCDcOZywqT5wsrPq9zBn
	 fKRGt3Grg0ravev+XOotjaJBBpMIpcD1wMjjb5RQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDD05F80259;
	Tue,  6 Apr 2021 07:19:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5622BF8020B; Tue,  6 Apr 2021 07:19:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 100C9F800E3;
 Tue,  6 Apr 2021 07:19:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 100C9F800E3
IronPort-SDR: QhbmNPT4aPs5sOzEOg2ja4chOMIlO20hWnWK4zIN1cz/AmKVk34ryEf5tMcx8tm1DG7iWfGLuc
 ob7yiVH0Gm5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="254318192"
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; d="scan'208";a="254318192"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2021 22:19:19 -0700
IronPort-SDR: G+f1NGZNiEvMpjAGPK0kAPfHgXrT3y4dyfsk65h9usLblQ6nkN4Jrox8qzJpbfdGY+yCACR0jB
 cqcQWfQVh/9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; d="scan'208";a="421041506"
Received: from yjie-mobl2.sh.intel.com (HELO [10.239.159.75]) ([10.239.159.75])
 by orsmga008.jf.intel.com with ESMTP; 05 Apr 2021 22:19:18 -0700
Subject: Re: [Sound-open-firmware] [ANNOUNCE] SOF v1.7 released
To: "Girdwood, Liam R" <liam.r.girdwood@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "sound-open-firmware@alsa-project.org" <sound-open-firmware@alsa-project.org>
References: <6edbafe2ba2b50219eed3ac0ec2c00380c28701e.camel@intel.com>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <421293a5-7811-d89c-4399-96a07179f284@linux.intel.com>
Date: Tue, 6 Apr 2021 13:19:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6edbafe2ba2b50219eed3ac0ec2c00380c28701e.camel@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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



On 2021/4/2 下午6:38, Girdwood, Liam R wrote:
> The SOF developers are pleased to announce that version 1.7 has been
> released and binaries available for Intel and NXP platforms[1].
> 
> The main focus of v1.7 was around adding support for new audio
> processing algorithms, continued Zephyr integration and general
> stabilisation.
> 
> Release notes are here.
> 
> https://github.com/thesofproject/sof/releases/tag/v1.7
> 
> Binaries are here.
> 
> https://github.com/thesofproject/sof-bin
> 
> Firmware issues can be reported here (and feature requests too).
> 
> https://github.com/thesofproject/sof/issues
> 
> and kernel issues here
> 
> https://github.com/thesofproject/linux/issues
> 
> The next version will be v1.8 due by the end of June.

Yes, we are planning to branch out for v1.8 by the middle of May, so we 
have now the merge window of about the coming 6 weeks, please plan and 
submit your new features to master in time.

Thanks,
~Keyon

> 
> Thanks
> 
> Liam
> 
> [1] Preliminary support for other platforms can be enabled by using SOF
> as a Zephyr module (for Zephyr supported architectures and platforms).
> ---------------------------------------------------------------------
> Intel Corporation (UK) Limited
> Registered No. 1134945 (England)
> Registered Office: Pipers Way, Swindon SN3 1RJ
> VAT No: 860 2173 47
> 
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
> _______________________________________________
> Sound-open-firmware mailing list
> Sound-open-firmware@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/sound-open-firmware
> 
