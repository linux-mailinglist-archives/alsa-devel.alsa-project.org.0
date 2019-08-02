Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 125E07FF1B
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 19:03:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BBB216D8;
	Fri,  2 Aug 2019 19:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BBB216D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564765379;
	bh=2BNnzqfYkyZuZleITGOZtBBXCiJv2BxHTe/Np4c4u2g=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F4Z6H7lglJMdcTXZjE5OdRJwxs14Gg+mDFXJONXZXNoU6nNDwgBJmbnYFP4YMs4FF
	 To88YK3Rsbbt77g6m6q6/f71qtWjtocNlZT0bGBiJSTHssDNeeDXhU77GWg9zTHOP0
	 AInl/LGqjd32KJ0TawzoCQGWJugnfSbSsNGs54pQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED7A7F804CB;
	Fri,  2 Aug 2019 19:01:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 844E0F804CB; Fri,  2 Aug 2019 19:01:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17E84F800F3
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 19:01:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17E84F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WgSvT5mN"
Received: from localhost (unknown [106.51.106.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 758C820644;
 Fri,  2 Aug 2019 17:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564765314;
 bh=81WIba1X7p3pWbUBeQ1GQSo1cKlMvDKYNfZuSJQlpfU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WgSvT5mNd6IHS7jOiMG5utKDfZk/BcTKuetFrApytW53h/bN2xtDct6YokliMjY4M
 5CG8yKquC83P0NGz6vnOCtIX4GkyuZIcLrpgFhFuPbbIGE5BET7lIEeABb0I2jb9rp
 vvYZndGqOEeL8uENEdWhJOXwJomTeZUoEnTf1RT0=
Date: Fri, 2 Aug 2019 22:30:41 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190802170041.GW12733@vkoul-mobl.Dlink>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-20-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-20-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 19/40] soundwire: bus: improve dynamic
 debug comments for enumeration
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 25-07-19, 18:40, Pierre-Louis Bossart wrote:
> update comments to provide better understanding of enumeration flows.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/bus.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index bca378806d00..2354675ef104 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -483,7 +483,8 @@ static int sdw_assign_device_num(struct sdw_slave *slave)
>  
>  	ret = sdw_write(slave, SDW_SCP_DEVNUMBER, dev_num);
>  	if (ret < 0) {
> -		dev_err(&slave->dev, "Program device_num failed: %d\n", ret);
> +		dev_err(&slave->dev, "Program device_num %d failed: %d\n",
> +			dev_num, ret);
>  		return ret;
>  	}
>  
> @@ -540,6 +541,7 @@ static int sdw_program_device_num(struct sdw_bus *bus)
>  	do {
>  		ret = sdw_transfer(bus, &msg);
>  		if (ret == -ENODATA) { /* end of device id reads */
> +			dev_dbg(bus->dev, "No more devices to enumerate\n");
>  			ret = 0;
>  			break;
>  		}
> @@ -982,6 +984,7 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
>  	int i, ret = 0;
>  
>  	if (status[0] == SDW_SLAVE_ATTACHED) {
> +		dev_err(bus->dev, "Slave attached, programming device number\n");

This should be debug level

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
