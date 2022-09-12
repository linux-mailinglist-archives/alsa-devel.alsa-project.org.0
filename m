Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC375B59D0
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 14:01:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07D2916AF;
	Mon, 12 Sep 2022 14:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07D2916AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662984094;
	bh=wv1rqTq8BRjgtfh8asl4Ex9ddD+7awkmX+crc484eSo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y7RJYq/qKYd3RbTAe0SNAUsCBO93qlwGxaTHUsDOW9nwHySXgld7xCeAAqYoGJsTv
	 bOSl6gqCVSK2azqF8zvDpRr+GOO/nGDzAf3J8FqTwdyMxGt1YsI7OFZV0sd5Kje2eU
	 Yhg/nXgksF3N5Jwclt9P9vyo13V9SYCEkIP0F91Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B121AF80535;
	Mon, 12 Sep 2022 14:00:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9B41F80528; Mon, 12 Sep 2022 14:00:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B96EBF800EC;
 Mon, 12 Sep 2022 13:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B96EBF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AUeab3+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662984000; x=1694520000;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wv1rqTq8BRjgtfh8asl4Ex9ddD+7awkmX+crc484eSo=;
 b=AUeab3+4bLyLOFAo2RnBw4A/965Jsq/BbbkcOlXkKmOm8JTKGGY6hKwd
 41doHYDKxTk+RRcVIpAcXWBTBu6iVyUwe42U8RuXVAe57SI6qGRzQZN4/
 WdRpZD4kSEd0FGjL4SqogR6SimmkiqDp4m9hn+AQKPutCoCj4ChngWf7p
 VofqRdabrCHF3xwDQqFR+PxWS/IZdCz1kLewyTHANr3wyA1KHN9p+8Nvw
 AEoH7nnghZ24B9r5PE6ebKuXsgRkPdCgATkNYr/ZigsmmNjAI6tWqUjAm
 Bz3PF75bfKvNFEsuYZgWN8Wcqzr6Ar4RGjLhasGScluKZ9JLNNfzKN/8y A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="284866925"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="284866925"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 04:59:55 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="705126318"
Received: from vtsymbal-mobl.ger.corp.intel.com (HELO [10.252.32.67])
 ([10.252.32.67])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 04:59:49 -0700
Message-ID: <c83fb25e-ef59-63e1-4223-648dab9885ea@linux.intel.com>
Date: Mon, 12 Sep 2022 12:53:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 5/7] soundwire: intel: Don't disable interrupt until
 children are removed
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com,
 sanyog.r.kale@intel.com, broonie@kernel.org
References: <20220907101402.4685-1-rf@opensource.cirrus.com>
 <20220907101402.4685-6-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220907101402.4685-6-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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



On 9/7/22 12:14, Richard Fitzgerald wrote:
> The cadence_master code needs the interrupt to complete message transfers.
> When the bus driver is being removed child drivers are removed, and their
> remove actions might need bus transactions.
> 
> Use the sdw_master_ops.remove callback to disable the interrupt handling
> only after the child drivers have been removed.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  drivers/soundwire/intel.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 01be62fa6c83..d5e723a9c80b 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1255,6 +1255,13 @@ static int intel_prop_read(struct sdw_bus *bus)
>  	return 0;
>  }
>  
> +static void intel_bus_remove(struct sdw_bus *bus)
> +{
> +	struct sdw_cdns *cdns = bus_to_cdns(bus);
> +
> +	sdw_cdns_enable_interrupt(cdns, false);

don't you need to check for any on-going transactions on the bus?

I wonder if there could be a corner case where there are no child
devices but still a device physically attached to the bus. I am not sure
if the 'no devices left' is a good-enough indication of no activity on
the bus.

> +}
> +
>  static struct sdw_master_ops sdw_intel_ops = {
>  	.read_prop = sdw_master_read_prop,
>  	.override_adr = sdw_dmi_override_adr,
> @@ -1264,6 +1271,7 @@ static struct sdw_master_ops sdw_intel_ops = {
>  	.set_bus_conf = cdns_bus_conf,
>  	.pre_bank_switch = intel_pre_bank_switch,
>  	.post_bank_switch = intel_post_bank_switch,
> +	.remove = intel_bus_remove,
>  };
>  
>  static int intel_init(struct sdw_intel *sdw)
> @@ -1502,7 +1510,6 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
>  	 */
>  	if (!bus->prop.hw_disabled) {
>  		intel_debugfs_exit(sdw);
> -		sdw_cdns_enable_interrupt(cdns, false);
>  		snd_soc_unregister_component(dev);
>  	}
>  	sdw_bus_master_delete(bus);
