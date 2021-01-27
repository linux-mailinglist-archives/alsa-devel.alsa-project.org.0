Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 607F330623F
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 18:41:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6A8D17F8;
	Wed, 27 Jan 2021 18:30:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6A8D17F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611768691;
	bh=ejSVIa1337YHKZ6Qtegw2vyw8LAyhZdJiuvitgbGKMc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vvTiMvVpqBmr4jxzVIJ1Uquhbfhv5UpPuqEe9xryQMcTx0KF0F7ncaTqPSrEkwyEY
	 dZhtq9CctYkzI5YzipIOd9lfpr04nyI7saxYqvMToxDyuvMf6ipWqmZTpnw/Qn9dyE
	 AKWRdR6KTTYxZ7+TTVAz7IROXMrdAqadwrAXkrgE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30840F80218;
	Wed, 27 Jan 2021 18:29:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D88DF80259; Wed, 27 Jan 2021 18:28:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=NICE_REPLY_A,PRX_BODY_76,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A2A5F800E9
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 18:28:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A2A5F800E9
IronPort-SDR: SWn+iKInKtDeghr4j99k5cvAmSY4UHgohZAhId7KaI1w79vQOIsMFblCWwL2cIX+C/5sc32l8z
 IFEIldPJSgOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="167777438"
X-IronPort-AV: E=Sophos;i="5.79,380,1602572400"; d="scan'208";a="167777438"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 09:28:27 -0800
IronPort-SDR: hqDu3WS98TI7yoUuuPLr0IGqC4vI5OKQ7KDoEZ5zKepMYEJUbi+SCSgN8H+T+Y0GJ4Se7+wqZW
 RYnh0wazBLIA==
X-IronPort-AV: E=Sophos;i="5.79,380,1602572400"; d="scan'208";a="388402900"
Received: from susiezhx-mobl.amr.corp.intel.com (HELO [10.213.180.238])
 ([10.213.180.238])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 09:28:27 -0800
Subject: Re: Crash in acpi_ns_validate_handle triggered by soundwire on Linux
 5.10
To: =?UTF-8?Q?Marcin_=c5=9alusarz?= <marcin.slusarz@gmail.com>
References: <CA+GA0_sPC3rp5K4qwZm-u+W1C=+2Y2p-dbF4DMdHkKaTpeKKkg@mail.gmail.com>
 <CAJZ5v0iapmc8ywuySwexwTagKr89Hj7TPXkAvd_HXMhdLoyyQQ@mail.gmail.com>
 <1f0f7273-597e-cdf0-87d1-908e56c13133@linux.intel.com>
 <CA+GA0_v3JUWS3G3=R4XuQ=OW91cpwiBP1Rp=uzYOF8c9TUJ46w@mail.gmail.com>
 <CA+GA0_sCdowanpZmg==c+xVqqNxG5whLGsKHaCfSmpERBhqMzA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1dc2639a-ecbc-c554-eaf6-930256dcda96@linux.intel.com>
Date: Wed, 27 Jan 2021 11:28:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+GA0_sCdowanpZmg==c+xVqqNxG5whLGsKHaCfSmpERBhqMzA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Len Brown <lenb@kernel.org>
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




> Weird, I can't reproduce this problem with my self-compiled kernel :/
> I don't even see soundwire modules loaded in. Manually loading them of course
> doesn't do much.
> 
> Previously I could boot into the "faulty" kernel by using "recovery mode", but
> I can't do that anymore - it crashes too.
> 
> Maybe there's some kind of race and this bug depends on some specific
> ordering of events?

missing Kconfig?
You need CONFIG_SOUNDWIRE and CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE 
selected to enter this sdw_intel_acpi_scan() routine.

