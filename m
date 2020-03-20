Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BA018D65E
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 18:59:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4138683D;
	Fri, 20 Mar 2020 18:58:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4138683D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584727183;
	bh=mgdsGABw+34WOSLS+9+KFL3Fn8vFhUt5AokHKm0t94c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KInQuQyYmOEWtwgm6nSOZfxuws8b/26CBJ5lAKOYCdqVPOaSLORFpqmRjVEEmZMr4
	 Kg2bn7B+E7E5kaSSGxhcIWhig7aP0z+sD0gA384qYxUwAxLlP9siV3sQf5SsDI402X
	 eE+U5S1+xWLbNCR2HAXrV+/bDLESCKBmCIolsUN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52337F800C0;
	Fri, 20 Mar 2020 18:58:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CE4AF8015B; Fri, 20 Mar 2020 18:57:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F4CBF800C0
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 18:57:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F4CBF800C0
IronPort-SDR: au+8JKT2ArkikSH3jxPlOJ+chmv+09dikwZ4wa0gl0jjYuqzwzmzGG9d1mwOoNKHbX/k1rI9oJ
 6FMjdT5bql6Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 10:57:53 -0700
IronPort-SDR: OmDXVhyTKlU50WoWzpmVCqcLA7WUwVpCf1Ao7u1nBnBGKJ/i2veDk5SXC5PBRgALl8UdNfmn1Z
 JPTfAOqQ1bEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,285,1580803200"; d="scan'208";a="392225793"
Received: from manallet-mobl.amr.corp.intel.com (HELO [10.255.34.12])
 ([10.255.34.12])
 by orsmga004.jf.intel.com with ESMTP; 20 Mar 2020 10:57:50 -0700
Subject: Re: [PATCH 5/5] soundwire: qcom: add sdw_master_device support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org
References: <20200320162947.17663-1-pierre-louis.bossart@linux.intel.com>
 <20200320162947.17663-6-pierre-louis.bossart@linux.intel.com>
 <81e2101e-d7ce-d023-5c35-ac6b55ea7166@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <40803069-e7dc-3dd6-ec7b-bec4308f381e@linux.intel.com>
Date: Fri, 20 Mar 2020 12:57:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <81e2101e-d7ce-d023-5c35-ac6b55ea7166@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 Andy Gross <agross@kernel.org>, jank@cadence.com,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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


>> Add new device as a child of the platform device, following the
>> following hierarchy:
>>
>> platform_device
>>      sdw_master_device
>>          sdw_slave0
> 
> Why can't we just remove the platform device layer here and add 
> sdw_master_device directly?
> 
> What is it stopping doing that?

The guidance from Greg was "no platform devices, unless you really are 
on a platform bus (i.e. Device tree.)". We never discussed changing the 
way the Device Tree parts are handled.

The main idea was to leave the parent (be it platform-device or PCI 
device) alone and not add new attributes or references to it.

The scheme here is similar to I2C/SPI, you have a platform device 
handled by the Device Tree baseline, and a driver create an 
i2c_adapter/spi_controller/sdw_master_device.

