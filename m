Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 911975BC4CB
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 10:53:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29DB315DC;
	Mon, 19 Sep 2022 10:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29DB315DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663577626;
	bh=Qm1u/FNMmy6waA/y8h4KJo7zAZIlEM/L7gSWwpBW5Yo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VUkCaOpZmoYBG3y6+gy12gUD7THwiBwDk9pCNXmhm/LBz4hQlwmeou2R03jrAUnnA
	 cWwaKl0fTpHf6UH8OZkKcZs+Kx+yZAfPuHW8NNotQiIPLGF/N1Px1XlpzNRUv6tJ0F
	 fMs9QXb3RTkBuipPxjI1swt5DPD1bFC1iAqZfI6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9118DF8016D;
	Mon, 19 Sep 2022 10:52:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E347FF804B4; Mon, 19 Sep 2022 10:52:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BAA7F8016D
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 10:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BAA7F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DDkzB07g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663577537; x=1695113537;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Qm1u/FNMmy6waA/y8h4KJo7zAZIlEM/L7gSWwpBW5Yo=;
 b=DDkzB07gQf2NktoyzHXy9DRKKmD0f49NFAOU+8ZXZIAhv3JTLA8ueFgW
 7usdpzrCA4MY4bQ11DyNRzAb7wvU3a7Ck8PzIVtXSudklKhb7oeUkAUKW
 RmTyxfyc17rn23ZcBoW6dvIUliMtL9Mbvdr9O6TQh59eXIoEMHLci1kGO
 4mu5D87Fyf4GZjeWFxkvoKJH5Eh9fFVNX8zyErkYHs0YwxLI9Z1s7Tc6j
 a+vRQ7w9wrMcZf9Z7d6i8atj/YMBZu4ggSrBnhPlR0vHcceu95DC4xkx3
 FpIgZOf2PqTXQe2AkwH8Ym18qgj8F8JzTHfk13dbLu+LnZn2aDReVSu/k Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="296937541"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="296937541"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 01:52:09 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="707485736"
Received: from ilick-mobl1.ger.corp.intel.com (HELO [10.252.59.91])
 ([10.252.59.91])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 01:52:08 -0700
Message-ID: <9edb1178-7454-eb3f-60a5-d3f73d01c9d6@linux.intel.com>
Date: Mon, 19 Sep 2022 10:44:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] soundwire: bus: Fix wrong port number in
 sdw_handle_slave_alerts()
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
References: <20220917140256.689678-1-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220917140256.689678-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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



On 9/17/22 16:02, Richard Fitzgerald wrote:
> for_each_set_bit() gives the bit-number counting from 0 (LSbit==0).
> When processing INTSTAT2, bit 0 is DP4 so the port number is (bit + 4).
> Likewise for INTSTAT3 bit 0 is DP11 so port number is (bit + 11).
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Another thing that never worked, but no one has used port interrupts so
far. I only used it for PRBS tests in early enabling some 3 years ago,
and it was for port 2 IIRC.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  drivers/soundwire/bus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 8eded1a55227..df0ae869ee51 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1622,7 +1622,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
>  			port = buf2[0] & SDW_SCP_INTSTAT2_PORT4_10;
>  			for_each_set_bit(bit, &port, 8) {
>  				/* scp2 ports start from 4 */
> -				port_num = bit + 3;
> +				port_num = bit + 4;
>  				sdw_handle_port_interrupt(slave,
>  						port_num,
>  						&port_status[port_num]);
> @@ -1634,7 +1634,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
>  			port = buf2[1] & SDW_SCP_INTSTAT3_PORT11_14;
>  			for_each_set_bit(bit, &port, 8) {
>  				/* scp3 ports start from 11 */
> -				port_num = bit + 10;
> +				port_num = bit + 11;
>  				sdw_handle_port_interrupt(slave,
>  						port_num,
>  						&port_status[port_num]);
