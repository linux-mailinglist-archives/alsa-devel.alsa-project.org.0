Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A601346727
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 19:06:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2E5211C;
	Tue, 23 Mar 2021 19:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2E5211C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616522795;
	bh=RKK5iIObOoRu0H1pEYx284u6SA8f5HkywwPq+rN/wlI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CZXBx6cQRtXqLbL3GSLYUQmA+c0ame23yzq1iRa0XkbQuYce0GonUFWOf+cyTGtBl
	 hu0DwwqZl6FTviBhewHZijItedLyDwmRVAESNZ3k2grXQNnqux2MVIlunXkokWGc/0
	 Lc1yT/QstguxTevlON+D/9WuSxMXCgDgcfm0CzCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 706A6F800EE;
	Tue, 23 Mar 2021 19:05:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A1FBF8025F; Tue, 23 Mar 2021 19:05:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6314FF800EE
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 19:05:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6314FF800EE
IronPort-SDR: r+nwpsBtL4kc08V0FsDgomQhbtzfBA24vnqD47yt5w31STp6tXYUdy1ael+WdW0OJ0iIzKj3uA
 FTF3iZki7amw==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="187218098"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="187218098"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 11:04:52 -0700
IronPort-SDR: Z2ObeTmpUlkDr6bTqCFEhX+vfuo6CwWnRk6o1YPHiFoTswLTT10oqzfpFkyrsSSbEpiU5inl6N
 +QkpMs8WdZOQ==
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="452251609"
Received: from laguitie-mobl.amr.corp.intel.com (HELO [10.252.129.185])
 ([10.252.129.185])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 11:04:50 -0700
Subject: Re: [PATCH] soundwire: intel: move to auxiliary bus
To: Greg KH <gregkh@linuxfoundation.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20210323004325.19727-1-yung-chuan.liao@linux.intel.com>
 <YFmatyAoMZmBmkuZ@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <777b4ca6-0d51-285d-549f-6ef768f2a523@linux.intel.com>
Date: Tue, 23 Mar 2021 13:04:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFmatyAoMZmBmkuZ@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com, vkoul@kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
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


>> Note that the auxiliary bus API has separate init and add steps, which
>> requires more attention in the error unwinding paths. The main loop
>> needs to deal with kfree() and auxiliary_device_uninit() for the
>> current iteration before jumping to the common label which releases
>> everything allocated in prior iterations.
> 
> The init/add steps can be moved together in the aux bus code if that
> makes this usage simpler.  Please do that instead.

IIRC the two steps were separated during the auxbus reviews to allow the 
parent to call kfree() on an init failure, and auxiliary_device_uninit() 
afterwards.

https://www.kernel.org/doc/html/latest/driver-api/auxiliary_bus.html#auxiliary-device

With a single auxbus_register(), the parent wouldn't know whether to use 
kfree() or auxiliary_device_uinit() when an error is returned, would it?

