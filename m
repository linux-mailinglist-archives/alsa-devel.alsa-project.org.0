Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 415A3151AD
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 18:34:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A202E184E;
	Mon,  6 May 2019 18:33:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A202E184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557160452;
	bh=f5+ddARKaB4WKOjjH6+5BZZ1Cv35n7OUEEnZV/5Ps8Q=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tTqI7gaAwPcEYopMUUKcpevsnx4/DFbX7OHhs4F26JQXVRq6lMGMf4A5s8BhATGQO
	 CLSl3ZeZIWagljw9OboIkFzis9T/gAVmzuIV21LmVeJ5y2zu18qZ3vzYrJp8I2I33B
	 AQ3BnPWkfmV43/MsOf76DXW3Ortj6nFM8PdWaJyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F469F896F0;
	Mon,  6 May 2019 18:32:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EF77F896F0; Mon,  6 May 2019 18:32:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D18BAF80726
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 18:32:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D18BAF80726
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XcEKdXHk"
Received: from localhost (unknown [106.200.210.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6DD9C205C9;
 Mon,  6 May 2019 16:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557159885;
 bh=uNCQttmmYYJSvud2cb586tPjuGNdF1u7yrL8bCBjHTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XcEKdXHk5NZREQ+2HaBsIwwCDKSu5pA9jHfW7LMPcR8Y5ooGtYA2jrNYIpBbBUnVE
 7/8hWIwYi0SjdUfQHoIMRUF3Y5doQVwpMKnEQ8cLek+skIXQmh742mAxnbutf1Kcv8
 znGDI90xhLKur39DLQcVCxnf/x0iKGeNXG2zSwso=
Date: Mon, 6 May 2019 21:54:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190506162439.GJ3845@vkoul-mobl.Dlink>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
 <20190504010030.29233-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190504010030.29233-4-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 3/7] ABI: testing: Add description of
 soundwire master sysfs files
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

On 03-05-19, 20:00, Pierre-Louis Bossart wrote:
> The description is directly derived from the MIPI DisCo specification.
> 
> Credits: this patch is based on an earlier internal contribution by
> Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  .../ABI/testing/sysfs-bus-soundwire-master    | 21 +++++++++++++++++++
>  drivers/soundwire/sysfs.c                     |  1 +
>  2 files changed, 22 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-soundwire-master
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-soundwire-master b/Documentation/ABI/testing/sysfs-bus-soundwire-master
> new file mode 100644
> index 000000000000..69cadf31049d
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-soundwire-master
> @@ -0,0 +1,21 @@
> +What:		/sys/bus/soundwire/devices/sdw-master-N/revision
> +		/sys/bus/soundwire/devices/sdw-master-N/clk_stop_modes
> +		/sys/bus/soundwire/devices/sdw-master-N/clk_freq
> +		/sys/bus/soundwire/devices/sdw-master-N/clk_gears
> +		/sys/bus/soundwire/devices/sdw-master-N/default_col
> +		/sys/bus/soundwire/devices/sdw-master-N/default_frame_rate
> +		/sys/bus/soundwire/devices/sdw-master-N/default_row
> +		/sys/bus/soundwire/devices/sdw-master-N/dynamic_shape
> +		/sys/bus/soundwire/devices/sdw-master-N/err_threshold
> +		/sys/bus/soundwire/devices/sdw-master-N/max_clk_freq
> +
> +Date:		May 2019
> +
> +Contact:	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

As the author of original code, it would be great if you can add me as a
contact as well.

> +
> +Description:	SoundWire Master-N DisCo properties.
> +		These properties are defined by MIPI DisCo Specification
> +		for SoundWire. They define various properties of the Master
> +		and are used by the bus to configure the Master. clk_stop_modes
> +		is a bitmask for simplifications and combines the
> +		clock-stop-mode0 and clock-stop-mode1 properties.
> diff --git a/drivers/soundwire/sysfs.c b/drivers/soundwire/sysfs.c
> index 734e2c8bc5cd..c2e5b7ad42fb 100644
> --- a/drivers/soundwire/sysfs.c
> +++ b/drivers/soundwire/sysfs.c
> @@ -31,6 +31,7 @@ struct sdw_master_sysfs {
>   *      |---- clk_gears
>   *      |---- default_row
>   *      |---- default_col
> + *      |---- default_frame_shape

This should be folded into 1st patch

>   *      |---- dynamic_shape
>   *      |---- err_threshold
>   */
> -- 
> 2.17.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
