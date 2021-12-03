Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AE5468027
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 00:00:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D0AB23FE;
	Fri,  3 Dec 2021 23:59:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D0AB23FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638572419;
	bh=28SC4E/VIjLWgyBHitNAIzN+kGECqyK+JI792awt9MY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CvD9cO3by6uhuM2cH5klMfFG8vCpja7OoXjXwCDC4qmN1a5WIJcH0C9vpUrpibvxs
	 TJ093KplTlOYvJcKXtcpeRrSGSG32Bzw5tP3GclxIsJKnzH0rQmBq09vkltvBq9/uN
	 luCvtzNi8a3ymz8disC+qTev8O81qpzaa+UJTChI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFF5EF80249;
	Fri,  3 Dec 2021 23:59:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55B0FF80246; Fri,  3 Dec 2021 23:58:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1FC5F80085
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 23:58:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1FC5F80085
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="236884454"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="236884454"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 14:58:46 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="461064086"
Received: from hkagda-mobl2.amr.corp.intel.com (HELO [10.212.71.79])
 ([10.212.71.79])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 14:58:45 -0800
Subject: Re: [bug report] ASoC: Intel: mrfld - create separate module for pci
 part
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, fntoth@gmail.com
References: <20211202151322.GA21325@kili>
 <19647b98-83fd-b493-0fed-3c4e43cbeba8@linux.intel.com>
 <Yap/80NxtU0QLqo0@smile.fi.intel.com> <YaqA30mx4nUVdJoZ@smile.fi.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <27281df2-5429-c9b0-8264-b030faa6a539@linux.intel.com>
Date: Fri, 3 Dec 2021 16:58:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaqA30mx4nUVdJoZ@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Hans de Goede <hdegoede@redhat.com>, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
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



>>> I would guess that indeed a return 0; is missing, but maybe it's time to
>>> remove this PCI code completely. I can't think of any user of the PCI
>>> parts of this driver.
>>>
>>> Andy, Hans, Mark, Takashi, what do you think?
>>
>> The Edison platform and actually some more based on Intel Merrifield are still
>> alive and on the (second hand) market. But yes, I would rather focus on making
>> SOF working there, but via PCI bus (or with ACPI, ASL code for which one should
>> actually write down, currently it's a device with PCI interface only).
> 
> That said, Pierre, have you been able to setup your Edison to see anything on
> I2S with SOF?

No, I haven't touched my Edison boards since the initial integration
with you and Ferry in 2020. I see that the firmware was updated to 1.8
and the kernel is 5.10+ now, so that should be easier than last time.
We don't really need any change for the driver probe, PCI is just fine,
what's missing is an ACPI recipe to enable audio functionality over the
SSP pins.
