Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA2E346666
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 18:31:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 859BF1685;
	Tue, 23 Mar 2021 18:30:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 859BF1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616520666;
	bh=+gkdT//QflthiNbXPYtxoN8uVztwAbSr7AGVbSihGVc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h8UN2h9/KrDuwD9RksfiQcvqV3hjIh7qNT/SRyCK4lpAYcz+focaXhcFsgUttogX5
	 D6vSkyP4IF5QsIQtsh6ySCSaqD2hsnGzi/5wr0T8g4Q7NiP+9zqc9PPuTcSdd1QA3l
	 LUHNPADZFZMS0SyZG+3eprqK8vI47+uAl6/1Q4J0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 105C2F80279;
	Tue, 23 Mar 2021 18:30:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E858F80279; Tue, 23 Mar 2021 18:30:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C63C3F80155
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 18:29:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C63C3F80155
IronPort-SDR: RdBMRvqS5mopejtxe3UTXmuu+wxbQpKatVtSB3PC87T5E7sIUdVAa7riz8ryrafSBlRVoOM1je
 nD7aW3rHtOGw==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="187209824"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="187209824"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 10:29:51 -0700
IronPort-SDR: WRJgxqZXlzflkb8puAOEADTdOczI+anSWdWdPzjNlpSvtCeaTxVLKBpJ8VESbf4Pp4AtC8D5UO
 WSfCxPgUecPg==
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="452236263"
Received: from laguitie-mobl.amr.corp.intel.com (HELO [10.252.129.185])
 ([10.252.129.185])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 10:29:49 -0700
Subject: Re: [PATCH] soundwire: intel: move to auxiliary bus
To: Greg KH <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>
References: <20210323004325.19727-1-yung-chuan.liao@linux.intel.com>
 <YFmPTkNkX6QPWiCa@vkoul-mobl.Dlink> <YFma1ClahDe2bZhR@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <aa9cfc49-913e-b3ba-1d92-2fab55bf4fa7@linux.intel.com>
Date: Tue, 23 Mar 2021 12:29:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFma1ClahDe2bZhR@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
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

Thanks Greg and Vinod for the reviews

>>> -static int intel_master_probe(struct platform_device *pdev)
>>> +static int intel_link_probe(struct auxiliary_device *auxdev, const struct auxiliary_device_id *id)
>>>   {
>>> -	struct device *dev = &pdev->dev;
>>> +	struct device *dev = &auxdev->dev;
>>> +	struct sdw_intel_link_dev *ldev = auxiliary_dev_to_sdw_intel_link_dev(auxdev);
>>
>> Do we need another abstractions for resources here, why not aux dev
>> creation set the resources required and we skip this step...

Not sure what resources you are referring to?

this is just a container_of() and the documented way of extending the 
auxbus (see 
https://www.kernel.org/doc/html/latest/driver-api/auxiliary_bus.html#example-usage)


struct sdw_intel_link_dev {
	struct auxiliary_device auxdev;
	struct sdw_intel_link_res link_res;
};

#define auxiliary_dev_to_sdw_intel_link_dev(auxiliary_dev) \
	container_of(auxiliary_dev, struct sdw_intel_link_dev, auxdev)

>>>   	struct sdw_intel *sdw;
>>>   	struct sdw_cdns *cdns;
>>>   	struct sdw_bus *bus;
>>> @@ -1346,14 +1347,14 @@ static int intel_master_probe(struct platform_device *pdev)
>>>   	cdns = &sdw->cdns;
>>>   	bus = &cdns->bus;
>>>   
>>> -	sdw->instance = pdev->id;
>>> -	sdw->link_res = dev_get_platdata(dev);
>>> +	sdw->instance = auxdev->id;
>>
>> so auxdev has id and still we pass id as argument :( Not sure if folks
>> can fix this now
> 
> That's odd, yeah, it should be fixed.

I think we are talking about different things?

this is defined in mod_devicetable.h:

struct auxiliary_device_id {
	char name[AUXILIARY_NAME_SIZE];
	kernel_ulong_t driver_data;
};

and used for the driver probe:

	ret = auxdrv->probe(auxdev, auxiliary_match_id(auxdrv->id_table, auxdev));

but there is a separate id:

struct auxiliary_device {
	struct device dev;
	const char *name;
	u32 id;
};

which is set during the device initialization in intel_init.c

	/* we don't use an IDA since we already have a link ID */
	auxdev->id = link_id;

In the auxiliary bus design, the parent has to take care of managing 
this id, be it with an IDA or as we do here with a physical link ID that 
is unique.

in short, I don't see how I could change the code given the differences 
in concepts?

