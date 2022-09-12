Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E6C5B59E2
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 14:03:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94F6516C7;
	Mon, 12 Sep 2022 14:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94F6516C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662984200;
	bh=rDhJSOi7sOke4HfRxRqQumXvciKcjrJViJAbL3llhLY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZnDHXiXIjgzORRqNHppdy9bN9rH6KDg8rQh6EvEQ+69X0Dakwj0rruhav9qfMmsFk
	 aNS+8MG5DFrkxaiUmLqTz7isKCvqw6AmmpspOcsDu5ulviNSnFn5z6+vEeqszm8I1H
	 KOXmxTMppff+EXFWUX0nruD/l1AEnPNTVKufc4Xw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94A3FF80528;
	Mon, 12 Sep 2022 14:00:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB4CEF8057D; Mon, 12 Sep 2022 14:00:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6693F804AC
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 14:00:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6693F804AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aEYvez+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662984044; x=1694520044;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rDhJSOi7sOke4HfRxRqQumXvciKcjrJViJAbL3llhLY=;
 b=aEYvez+BlGnZAEWF+D+QK3V8DxpDijlTio+8ae82pxmOmqBfJB750/QR
 0KeudJhkO4oeTTiN+PIQvAYacEmOjfllWiuP4uIRrdSBgZ4GJMxqyoACs
 WLR2lSxxvXHoonEu11fVy480nAdgoSMlBvBIb5RrRyZdpBrDFaOfCoQm5
 6e39VDmloV6OJYv6jfO6CnA/v8xbwpyQTsmctci3awxvy7NJxjGySBr7s
 jgIhBg3ibKzo4I/YtA+8eTxhBPXZUCRPhpchmYRrXygqR1iEB10ONlAG4
 /SlxDWpDelaiiEeeUALFSEYULzLZ5oCIKBb+ytdXQGKlvdI4DCFQgKujp g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="359570596"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="359570596"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 05:00:38 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="705126691"
Received: from vtsymbal-mobl.ger.corp.intel.com (HELO [10.252.32.67])
 ([10.252.32.67])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 05:00:34 -0700
Message-ID: <1395a163-2e0e-2471-3932-0517a7f6797d@linux.intel.com>
Date: Mon, 12 Sep 2022 13:57:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] soundwire: bus: conditionally recheck UNATTACHED status
Content-Language: en-US
To: Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org, 
 vkoul@kernel.org, broonie@kernel.org
References: <20220830074224.2924179-1-yung-chuan.liao@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220830074224.2924179-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
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

[top posting]
I reverted this patch in the SOF tree to use Richard Fitzgerald's
series, see

https://github.com/thesofproject/linux/pull/3836

I don't think we want this patch upstream, do we?


On 8/30/22 09:42, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> In configurations with two amplifiers on the same link, the Intel CI
> reports occasional enumeration/initialization timeouts during
> suspend-resume stress tests, where one of the two amplifiers becomes
> UNATTACHED immediately after being enumerated. This problem was
> reported both with Maxim and Realtek codecs, which pointed initially
> to a problem with status handling on the Intel side.
> 
> The Cadence IP integrated on Intel platforms throws an interrupt when
> the status changes, and the information is kept with sticky bits until
> cleared. We initially added more checks to make sure the edge
> detection did not miss any transition, but that did not improve the
> results significantly.
> 
> With the recent addition of the read_ping_status() callback, we were
> able to show that the status in sticky bits is shown as UNATTACHED
> even though the PING frames show the problematic device as
> ATTACHED. That completely breaks the entire logic where we assumed
> that a peripheral would always re-attach as device0. The resume
> timeouts make sense in that in those cases, the
> enumeration/initialization never happens a second time.
> 
> One possible explanation is that this problem typically happens when a
> bus clash is reported, so it could very well be that the detection is
> fooled by a transient electrical issue or conflict between two
> peripherals.
> 
> This patch conditionally double-checks the status reported in the
> sticky bits with the actual PING frame status. If the peripheral
> reports as attached in PING frames, the early detection based on
> sticky bits is discarded.
> 
> Note that this patch only corrects issues of false positives on the
> manager side.
> 
> If the peripheral lost and regain sync, then it would report as
> attached on Device0. A peripheral that would not reset its dev_num
> would not be compliant with the MIPI specification.
> 
> BugLink: https://github.com/thesofproject/linux/issues/3638
> BugLink: https://github.com/thesofproject/linux/issues/3325
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
> Hi Vinod,
> 
> You will need the "ASoC/soundwire: log actual PING status on resume issues"
> series which is applied at ASoC tree before appling this patch.
> 
> ---
>  drivers/soundwire/bus.c       | 19 +++++++++++++++++++
>  drivers/soundwire/intel.c     |  1 +
>  include/linux/soundwire/sdw.h |  3 +++
>  3 files changed, 23 insertions(+)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 2772973eebb1..d0d486f07673 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1767,6 +1767,25 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
>  		    slave->status != SDW_SLAVE_UNATTACHED) {
>  			dev_warn(&slave->dev, "Slave %d state check1: UNATTACHED, status was %d\n",
>  				 i, slave->status);
> +
> +			if (bus->recheck_unattached && bus->ops->read_ping_status) {
> +				u32 ping_status;
> +
> +				mutex_lock(&bus->msg_lock);
> +
> +				ping_status = bus->ops->read_ping_status(bus);
> +
> +				mutex_unlock(&bus->msg_lock);
> +
> +				ping_status >>= (i * 2);
> +				ping_status &= 0x3;
> +
> +				if (ping_status != 0) {
> +					dev_warn(&slave->dev, "Slave %d state in PING frame is %d, ignoring earlier detection\n",
> +						 i, ping_status);
> +					continue;
> +				}
> +			}
>  			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
>  		}
>  	}
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 25ec9c272239..0c6e674dbf85 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1311,6 +1311,7 @@ static int intel_link_probe(struct auxiliary_device *auxdev,
>  
>  	bus->link_id = auxdev->id;
>  	bus->dev_num_ida_min = INTEL_DEV_NUM_IDA_MIN;
> +	bus->recheck_unattached = true;
>  
>  	sdw_cdns_probe(cdns);
>  
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index a2b31d25ea27..51ac71984260 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -892,6 +892,8 @@ struct sdw_master_ops {
>   * @dev_num_ida_min: if set, defines the minimum values for the IDA
>   * used to allocate system-unique device numbers. This value needs to be
>   * identical across all SoundWire bus in the system.
> + * @recheck_unattached: if set, double-check UNATTACHED status changes
> + * by reading PING frame status.
>   */
>  struct sdw_bus {
>  	struct device *dev;
> @@ -917,6 +919,7 @@ struct sdw_bus {
>  	bool multi_link;
>  	int hw_sync_min_links;
>  	int dev_num_ida_min;
> +	bool recheck_unattached;
>  };
>  
>  int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
