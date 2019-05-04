Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9332A137FD
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 08:55:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A3A7188A;
	Sat,  4 May 2019 08:54:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A3A7188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556952925;
	bh=ElijFG0VXGT2pWNvEGZ9kDV4h10OgXsvwOyatvGp1d0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZyTOKh7PF5Qhge7Ag2IKHfmaN/88y7HCOYWR3liYTbiS664MsexOExQvVofZdppza
	 mcyiulc0IZkitE2f2HSUmsvTWEtyiVjq3rjZt1wViMmE5omcuQsWvXrXoF9zeO0qYq
	 AiIW8kUh1zeJG53F52qTuOkoaFFHJBiz0SO28UUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93183F896C7;
	Sat,  4 May 2019 08:54:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48EFFF896E3; Sat,  4 May 2019 08:53:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22B0BF8075A
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 08:53:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22B0BF8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kygmXcbJ"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 09D21206BB;
 Sat,  4 May 2019 06:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556952834;
 bh=s5pBnyZieQEdTRYkD6W5/3S/hM2RuAtMJl1SGDRyOCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kygmXcbJxTqSYvxEzO+LS1S5v/HrIzKtoQL5XHszZJ43wO1/DruT8+8/kDVKZJRDl
 CIclpvbQKRkam49K0Qyld4xYxGvNpF0V4txW4d4pf+Vl1c6/I7+lpr31IUJHIbRVJ/
 zUNJw3WWk95I8dFev2jsEme+Qn/OO8ANfooqt3Eo=
Date: Sat, 4 May 2019 08:53:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190504065352.GB9770@kroah.com>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
 <20190504010030.29233-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190504010030.29233-4-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
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

On Fri, May 03, 2019 at 08:00:26PM -0500, Pierre-Louis Bossart wrote:
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
>   *      |---- dynamic_shape
>   *      |---- err_threshold
>   */

This last chunk should go in patch 1 of this series, right?

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
