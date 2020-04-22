Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E18181B42DD
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 13:11:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D7AE16BD;
	Wed, 22 Apr 2020 13:10:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D7AE16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587553894;
	bh=cXQIrcxk7DwRNMc7uf7/IchJwrBTPbpiVuu4mc7xxS0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CE8bBWGSjEqyqx6eOPdQ1TpH0LOHzftRtNQcpaxQX4XOEybmfmahjDbbCIfeBQfBi
	 HfoyM0pbbTg4l+JUSeowkfR/z+2/SvDls0blTSnd8Vo3B3TPzg24wHJgZiAKA77PpQ
	 bgbZG95y1iabRyfRp4/5613UEgiyEyjov1i8Lygc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A015F8021C;
	Wed, 22 Apr 2020 13:09:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A25DF800F2; Wed, 22 Apr 2020 13:09:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A347F800F2
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 13:09:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A347F800F2
IronPort-SDR: xIeZdoYkaUhHzju1wDh2ty86eMt4sJzrLCXrbShaj1ln8l2tzni5HSI231O1rl8IFMpT53WG84
 SvCW81zqpCKQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 04:09:37 -0700
IronPort-SDR: C8gBEMh74DJeDpXbU7qrvhRVlQBYlnTsVVaUFYIoZGnnyDwZ/+ZG2r1FEdHQ7lc4xpWXXlpWMu
 NJKRArDDUW6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; d="scan'208";a="457108260"
Received: from ajavier-mobl1.amr.corp.intel.com (HELO [10.255.68.153])
 ([10.255.68.153])
 by fmsmga006.fm.intel.com with ESMTP; 22 Apr 2020 04:09:36 -0700
Subject: Re: [RFC PATCH 13/16] clk: hifiberry-dacpro: add "sclk" lookup
To: Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-14-pierre-louis.bossart@linux.intel.com>
 <158754810745.132238.7647643247125302962@swboyd.mtv.corp.google.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c52e0f7d-1eaf-a89b-ff5d-b2a02ad56021@linux.intel.com>
Date: Wed, 22 Apr 2020 04:51:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <158754810745.132238.7647643247125302962@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>,
 Daniel Matuschek <daniel@hifiberry.com>, Hui Wang <hui.wang@canonical.com>,
 Matthias Reichl <hias@horus.com>, broonie@kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
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



>> +       proclk->sclk_lookup = clkdev_hw_create(&proclk->hw, "sclk", NULL);
>> +       if (!proclk->sclk_lookup) {
>> +#ifndef CONFIG_ACPI
> 
> Is it to save code space? Otherwise the ifdefs are pretty ugly and I'd
> prefer we just call of_clk APIs and rely on the inline stubs when
> CONFIG_OF isn't enabled to be optimized out.

CONFIG_OF was added as a dependency (see patch 10/16) so that we can use 
the 'compatible' string to probe w/ the PRP0001 device.

I must admit I don't know what these functions do so I just filtered 
them out in the ACPI case.

>> +               of_clk_del_provider(dev->of_node);
>> +#endif
>> +               return -ENOMEM;
>> +       }
>> +
