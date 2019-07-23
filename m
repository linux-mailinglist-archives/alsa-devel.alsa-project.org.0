Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8031D7208C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 22:11:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D03A718EE;
	Tue, 23 Jul 2019 22:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D03A718EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563912680;
	bh=FstF4WrsKv1hbnFbBT11dAE8gVatqF/Ois7hYJFpmLs=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fq1h/WT/sJjTeS21+Y667raz4CZ265KAyRTgARPGbXE9MRXh/Lan/MPVddO2/6+C2
	 LTEQ/QS05Wwr1miIPRC4B2nrIqAmkcep7IxiD8ZOk+B63cPUMTzA0WRHjsdOGHRBfb
	 17rwWa1uoPnxkZj1z00yCn3WdbRBSjWi8iNS8yYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E98B1F8044A;
	Tue, 23 Jul 2019 22:09:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8402EF80447; Tue, 23 Jul 2019 22:09:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7721EF800E8
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 22:09:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7721EF800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 13:09:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; d="scan'208";a="369025486"
Received: from jobrien1-mobl.amr.corp.intel.com (HELO [10.254.189.186])
 ([10.254.189.186])
 by fmsmga006.fm.intel.com with ESMTP; 23 Jul 2019 13:09:25 -0700
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 alsa-devel@alsa-project.org
References: <20190723194218.69168-1-andriy.shevchenko@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4fb9a23c-3875-33d6-95fd-af384e8b5360@linux.intel.com>
Date: Tue, 23 Jul 2019 15:09:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723194218.69168-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
Subject: Re: [alsa-devel] [PATCH v1] soundwire: mipi_disco: Switch to use
 fwnode_property_count_uXX()
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



On 7/23/19 2:42 PM, Andy Shevchenko wrote:
> Use use fwnode_property_count_uXX() directly, that makes code neater.

Yes indeed, thanks!

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/soundwire/mipi_disco.c | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
> index 79fee1b21ab6..844e6b22974f 100644
> --- a/drivers/soundwire/mipi_disco.c
> +++ b/drivers/soundwire/mipi_disco.c
> @@ -60,8 +60,7 @@ int sdw_master_read_prop(struct sdw_bus *bus)
>   				 "mipi-sdw-max-clock-frequency",
>   				 &prop->max_clk_freq);
>   
> -	nval = fwnode_property_read_u32_array(link,
> -			"mipi-sdw-clock-frequencies-supported", NULL, 0);
> +	nval = fwnode_property_count_u32(link, "mipi-sdw-clock-frequencies-supported");
>   	if (nval > 0) {
>   		prop->num_clk_freq = nval;
>   		prop->clk_freq = devm_kcalloc(bus->dev, prop->num_clk_freq,
> @@ -87,8 +86,7 @@ int sdw_master_read_prop(struct sdw_bus *bus)
>   		}
>   	}
>   
> -	nval = fwnode_property_read_u32_array(link,
> -			"mipi-sdw-supported-clock-gears", NULL, 0);
> +	nval = fwnode_property_count_u32(link, "mipi-sdw-supported-clock-gears");
>   	if (nval > 0) {
>   		prop->num_clk_gears = nval;
>   		prop->clk_gears = devm_kcalloc(bus->dev, prop->num_clk_gears,
> @@ -134,8 +132,7 @@ static int sdw_slave_read_dp0(struct sdw_slave *slave,
>   	fwnode_property_read_u32(port, "mipi-sdw-port-min-wordlength",
>   				 &dp0->min_word);
>   
> -	nval = fwnode_property_read_u32_array(port,
> -			"mipi-sdw-port-wordlength-configs", NULL, 0);
> +	nval = fwnode_property_count_u32(port, "mipi-sdw-port-wordlength-configs");
>   	if (nval > 0) {
>   
>   		dp0->num_words = nval;
> @@ -193,8 +190,7 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
>   		fwnode_property_read_u32(node, "mipi-sdw-port-min-wordlength",
>   					 &dpn[i].min_word);
>   
> -		nval = fwnode_property_read_u32_array(node,
> -				"mipi-sdw-port-wordlength-configs", NULL, 0);
> +		nval = fwnode_property_count_u32(node, "mipi-sdw-port-wordlength-configs");
>   		if (nval > 0) {
>   			dpn[i].num_words = nval;
>   			dpn[i].words = devm_kcalloc(&slave->dev,
> @@ -233,8 +229,7 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
>   		fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
>   					 &dpn[i].max_ch);
>   
> -		nval = fwnode_property_read_u32_array(node,
> -				"mipi-sdw-channel-number-list", NULL, 0);
> +		nval = fwnode_property_count_u32(node, "mipi-sdw-channel-number-list");
>   		if (nval > 0) {
>   			dpn[i].num_ch = nval;
>   			dpn[i].ch = devm_kcalloc(&slave->dev, dpn[i].num_ch,
> @@ -248,8 +243,7 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
>   					dpn[i].ch, dpn[i].num_ch);
>   		}
>   
> -		nval = fwnode_property_read_u32_array(node,
> -				"mipi-sdw-channel-combination-list", NULL, 0);
> +		nval = fwnode_property_count_u32(node, "mipi-sdw-channel-combination-list");
>   		if (nval > 0) {
>   			dpn[i].num_ch_combinations = nval;
>   			dpn[i].ch_combinations = devm_kcalloc(&slave->dev,
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
