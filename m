Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0763F5450BA
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 17:25:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 819361ABA;
	Thu,  9 Jun 2022 17:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 819361ABA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654788309;
	bh=SOwvpVCZjkxg8KZs0RVxDzu9voSyzOt3EM4EtxcOcNc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a6plUKb+X2AIOoiRjJi0j2y1UOn0dQQP0/2PFh2VZyALxkicdCFwzqB/xYIGBH5Ej
	 uEJ7NIBTf6JTdW2kiKmthW3uvePE5a6ECty2sBDIXoJJf4vZMRC1C4nc0K4KA55WHt
	 +50PHuIz0ij710soSZaUyMsFE9G/v4p7PdI6CC6w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92A59F80526;
	Thu,  9 Jun 2022 17:23:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1615F804BD; Thu,  9 Jun 2022 17:23:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01C40F8012F
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 17:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01C40F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FAjg+ql4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654788217; x=1686324217;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SOwvpVCZjkxg8KZs0RVxDzu9voSyzOt3EM4EtxcOcNc=;
 b=FAjg+ql4S1MBPgg8kyXhWK6FwQD5qYO8h/ed97O3frkpsjfHFE27Oq0P
 ddKoDUE0S4RJTYcyw75fFgTP+9NMyGjojudzlFpgWZBuFIov19s1G/PTn
 qnU231cAJH3EnyuDnSP9+UcqLbUwQB41FUX2HHqoBpH0WHLre6dFb/08c
 9fMpXmcnNXyHpqBuR2BdpSYhHcJoeQEMk4TF73xuKNimbYFifoYh0E3cK
 YNQ6EqtgqldHag9J0VPhRsMEMJI6430eFN7bJkukfZWxSSaQznC4DA/ZW
 Zb+5noaR3jQv3aIycs1DthxfW79gbLkrlCOkI92/GR+tV85gYO18Vbue1 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="339077571"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="339077571"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 08:23:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585630730"
Received: from jeremywe-mobl3.amr.corp.intel.com (HELO [10.209.173.145])
 ([10.209.173.145])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 08:23:28 -0700
Message-ID: <63d7f3ed-b5a9-c869-5d25-a33a1d4e63c8@linux.intel.com>
Date: Thu, 9 Jun 2022 10:22:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v1 14/16] soundwire: Use acpi_dev_for_each_child()
Content-Language: en-US
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux ACPI <linux-acpi@vger.kernel.org>
References: <1843211.tdWV9SEqCh@kreacher> <5296779.Sb9uPGUboI@kreacher>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <5296779.Sb9uPGUboI@kreacher>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Linux PM <linux-pm@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Thanks Rafael. This looks mostly good but I have a doubt on the error
handling, see below.

> +static int sdw_acpi_check_duplicate(struct acpi_device *adev, void *data)
> +{
> +	struct sdw_acpi_child_walk_data *cwd = data;
> +	struct sdw_bus *bus = cwd->bus;
> +	struct sdw_slave_id id;
> +
> +	if (adev == cwd->adev)
> +		return 0;
> +
> +	if (!find_slave(bus, adev, &id))
> +		return 0;
> +
> +	if (cwd->id.sdw_version != id.sdw_version || cwd->id.mfg_id != id.mfg_id ||
> +	    cwd->id.part_id != id.part_id || cwd->id.class_id != id.class_id)
> +		return 0;
> +
> +	if (cwd->id.unique_id != id.unique_id) {
> +		dev_dbg(bus->dev,
> +			"Valid unique IDs 0x%x 0x%x for Slave mfg_id 0x%04x, part_id 0x%04x\n",
> +			cwd->id.unique_id, id.unique_id, cwd->id.mfg_id,
> +			cwd->id.part_id);
> +		cwd->ignore_unique_id = false;
> +		return 0;
> +	}
> +
> +	dev_err(bus->dev,
> +		"Invalid unique IDs 0x%x 0x%x for Slave mfg_id 0x%04x, part_id 0x%04x\n",
> +		cwd->id.unique_id, id.unique_id, cwd->id.mfg_id, cwd->id.part_id);
> +	return -ENODEV;

if this error happens, I would guess it's reported ....

> +}
> +
> +static int sdw_acpi_find_one(struct acpi_device *adev, void *data)
> +{
> +	struct sdw_bus *bus = data;
> +	struct sdw_acpi_child_walk_data cwd = {
> +		.bus = bus,
> +		.adev = adev,
> +		.ignore_unique_id = true,
> +	};
> +	int ret;
> +
> +	if (!find_slave(bus, adev, &cwd.id))
> +		return 0;
> +
> +	/* Brute-force O(N^2) search for duplicates. */
> +	ret = acpi_dev_for_each_child(ACPI_COMPANION(bus->dev),
> +				      sdw_acpi_check_duplicate, &cwd);
> +	if (ret)
> +		return ret;

... here, but I don't see this being propagated further...

> +
> +	if (cwd.ignore_unique_id)
> +		cwd.id.unique_id = SDW_IGNORED_UNIQUE_ID;
> +
> +	/* Ignore errors and continue. */
> +	sdw_slave_add(bus, &cwd.id, acpi_fwnode_handle(adev));
> +	return 0;
> +}
> +
>  /*
>   * sdw_acpi_find_slaves() - Find Slave devices in Master ACPI node
>   * @bus: SDW bus instance
> @@ -135,8 +200,7 @@ static bool find_slave(struct sdw_bus *b
>   */
>  int sdw_acpi_find_slaves(struct sdw_bus *bus)
>  {
> -	struct acpi_device *adev, *parent;
> -	struct acpi_device *adev2, *parent2;
> +	struct acpi_device *parent;
>  
>  	parent = ACPI_COMPANION(bus->dev);
>  	if (!parent) {
> @@ -144,52 +208,7 @@ int sdw_acpi_find_slaves(struct sdw_bus
>  		return -ENODEV;
>  	}
>  
> -	list_for_each_entry(adev, &parent->children, node) {
> -		struct sdw_slave_id id;
> -		struct sdw_slave_id id2;
> -		bool ignore_unique_id = true;
> -
> -		if (!find_slave(bus, adev, &id))
> -			continue;
> -
> -		/* brute-force O(N^2) search for duplicates */
> -		parent2 = parent;
> -		list_for_each_entry(adev2, &parent2->children, node) {
> -
> -			if (adev == adev2)
> -				continue;
> -
> -			if (!find_slave(bus, adev2, &id2))
> -				continue;
> -
> -			if (id.sdw_version != id2.sdw_version ||
> -			    id.mfg_id != id2.mfg_id ||
> -			    id.part_id != id2.part_id ||
> -			    id.class_id != id2.class_id)
> -				continue;
> -
> -			if (id.unique_id != id2.unique_id) {
> -				dev_dbg(bus->dev,
> -					"Valid unique IDs 0x%x 0x%x for Slave mfg_id 0x%04x, part_id 0x%04x\n",
> -					id.unique_id, id2.unique_id, id.mfg_id, id.part_id);
> -				ignore_unique_id = false;
> -			} else {
> -				dev_err(bus->dev,
> -					"Invalid unique IDs 0x%x 0x%x for Slave mfg_id 0x%04x, part_id 0x%04x\n",
> -					id.unique_id, id2.unique_id, id.mfg_id, id.part_id);
> -				return -ENODEV;
> -			}
> -		}
> -
> -		if (ignore_unique_id)
> -			id.unique_id = SDW_IGNORED_UNIQUE_ID;
> -
> -		/*
> -		 * don't error check for sdw_slave_add as we want to continue
> -		 * adding Slaves
> -		 */
> -		sdw_slave_add(bus, &id, acpi_fwnode_handle(adev));
> -	}
> +	acpi_dev_for_each_child(parent, sdw_acpi_find_one, bus);

... here?

It looks like a change in the error handling flow where
sdw_acpi_find_slaves() is now returning 0 (success) always?

Shouldn't the return of sdw_acpi_find_one() be trapped, e.g. with

return acpi_dev_for_each_child(parent, sdw_acpi_find_one, bus);

>  
>  	return 0;
>  }
> 
> 
> 
