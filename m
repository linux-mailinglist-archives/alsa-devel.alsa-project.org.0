Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64947112A0
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 07:34:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E310F1776;
	Thu,  2 May 2019 07:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E310F1776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556775273;
	bh=pBwjaixpM64L3sDr2ZrOz0JeL+0MVMaO7MLippMWdUI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JJq5EXiDra/yqqglicGJSKiqSAu+mP0MYaBM2NxNX207pYlf/1fw75kWS+lUQx7s1
	 QM9IYdoQpXLZpZ/Q7s0kHCZmFHqeLkBt/xqlmvfG3wG38VgLiQGytEGs9XvNOii0Pf
	 1R4Xbl/Wy/wPhtnXtst/ICC76dfwXhpk4st6p70s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EAC8F896AA;
	Thu,  2 May 2019 07:32:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1434EF89693; Thu,  2 May 2019 07:32:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38FEDF8075A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 07:32:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38FEDF8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T2w1SqOq"
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B01202085A;
 Thu,  2 May 2019 05:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556775149;
 bh=iTQiL4LvMH0l1z4GfH2eWic6igDsZT3xNziA83eKMz0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T2w1SqOqXtg5zSQGVl4R9VNW1JPfDT4d8saIAFFxwkUKzvM2Z89BOZ7f/drPoAuYP
 Af/Sm7/8osejfkVf+O4mKhZe+BBdXi+ZYs3bTocRSCrvw6SYSMiBvR259c1RLPgdfN
 V7g6j8HiLPvYe7bpJlnXU3Fw1hSKD6HmDgq7jUJM=
Date: Thu, 2 May 2019 11:02:20 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190502053220.GC3845@vkoul-mobl.Dlink>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
 <20190501155745.21806-7-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501155745.21806-7-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH v4 06/22] soundwire: bus: remove useless
	parentheses
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

On 01-05-19, 10:57, Pierre-Louis Bossart wrote:
> and make the code more readable

Well patch subject and log are not meant to be read as a continuous
statement, It would nice to have a proper lines for this

> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/bus.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index efdcefc62e1a..423dc6d17999 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -415,10 +415,10 @@ static struct sdw_slave *sdw_get_slave(struct sdw_bus *bus, int i)
>  static int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id)
>  {
>  
> -	if ((slave->id.unique_id != id.unique_id) ||
> -	    (slave->id.mfg_id != id.mfg_id) ||
> -	    (slave->id.part_id != id.part_id) ||
> -	    (slave->id.class_id != id.class_id))
> +	if (slave->id.unique_id != id.unique_id ||
> +	    slave->id.mfg_id != id.mfg_id ||
> +	    slave->id.part_id != id.part_id ||
> +	    slave->id.class_id != id.class_id)
>  		return -ENODEV;
>  
>  	return 0;
> @@ -896,8 +896,8 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
>  		}
>  
>  		/* Update the Slave driver */
> -		if (slave_notify && (slave->ops) &&
> -					(slave->ops->interrupt_callback)) {
> +		if (slave_notify && slave->ops &&
> +		    slave->ops->interrupt_callback) {
>  			slave_intr.control_port = clear;
>  			memcpy(slave_intr.port, &port_status,
>  			       sizeof(slave_intr.port));
> @@ -955,7 +955,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
>  static int sdw_update_slave_status(struct sdw_slave *slave,
>  				   enum sdw_slave_status status)
>  {
> -	if ((slave->ops) && (slave->ops->update_status))
> +	if (slave->ops && slave->ops->update_status)
>  		return slave->ops->update_status(slave, status);
>  
>  	return 0;
> -- 
> 2.17.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
