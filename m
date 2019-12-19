Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ABD12678E
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 18:01:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A982D1668;
	Thu, 19 Dec 2019 18:00:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A982D1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576774883;
	bh=dih+y1GEtyftJA8uPMYcdvvyTkd0g5h9yfqG44gmCPA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hqwJFagu6kIcBtJ3sDVcNk14uW7S+LcWRdjqNlwBnAMVZZk6/1+xGY1SzDLwCBewF
	 5//w2Buzmn33HHVM7qgqUG5lgmYdRy5oDc7nPkcBTgBVzgx3B3/IrtgIV+CbPctirv
	 0jJnaUJ+hGRkAx4xNxVhYC/UYH+NgJBgbirsfTKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7231BF80273;
	Thu, 19 Dec 2019 17:58:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D74DF80234; Thu, 19 Dec 2019 17:58:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=PRX_BODY_21,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31EABF8014F
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 17:58:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31EABF8014F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 08:58:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,332,1571727600"; d="scan'208";a="228308843"
Received: from dpshah-mobl1.amr.corp.intel.com (HELO [10.254.191.243])
 ([10.254.191.243])
 by orsmga002.jf.intel.com with ESMTP; 19 Dec 2019 08:58:42 -0800
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org, 
 lee.jones@linaro.org, linus.walleij@linaro.org
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
 <20191219103153.14875-3-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <af48cd71-fa1a-dbc5-0e88-e315ea13c28c@linux.intel.com>
Date: Thu, 19 Dec 2019 10:36:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191219103153.14875-3-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 vinod.koul@linaro.org, devicetree@vger.kernel.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v6 02/11] mfd: wcd934x: add support to
 wcd9340/wcd9341 codec
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> +static int wcd934x_slim_status(struct slim_device *sdev,
> +			       enum slim_device_status status)
> +{
> +	switch (status) {
> +	case SLIM_DEVICE_STATUS_UP:
> +		return wcd934x_slim_status_up(sdev);
> +	case SLIM_DEVICE_STATUS_DOWN:
> +		mfd_remove_devices(&sdev->dev);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +

this is interesting/surprising - I just noticed what looks like a 
significant change in how probe/initialization are handled.

It was my understanding that in SLIMbus the Linux devices are created at 
probe time, and when the device reports present this 'device_status' 
callback is used to notify the codec driver of a change. The rationale 
for this was that the codec driver may control power switches/gpios that 
are necessary for the device to appear on the bus.

This argument was used to require an change in the SoundWire 
implementation, so we followed this model of creating devices at probe 
time based on information reported by ACPI/DT, and used the 
'update_status' callback when the device is present on the bus (which 
may happen after a delay or controlled by an external power switch). 
This approach can lead to 'ghost devices' described in firmware but not 
populated in hardware, and power management opens on how long a bus 
needs to remain active if no devices report present.

What I understand from the code above is that the devices are actually 
created when the SLIMbus device reports PRESENT, which seems a 180 
degree change in directions?

I actually prefer it this way, and all current discussions in MIPI 
circles point to the fact that when the bus starts all devices on that 
bus should already be powered and have the ability to report present 
immediately (if the bus starts in a 'safe' mode and then later programs 
different PHY parameters, a device can no longer join the bus)

I would however not remove the devices when the status is down but only 
on an explicit .remove.

Feedback welcome.
-Pierre

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
