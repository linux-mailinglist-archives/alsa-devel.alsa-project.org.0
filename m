Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0EF163BE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 14:28:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F18F17B9;
	Tue,  7 May 2019 14:27:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F18F17B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557232128;
	bh=adHSvQb58Un6bE0ltjJ9+VSRkD4pngVnT9zG75wp7SE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XER5H9lh4hs2HIjIR/vgcnTKcMTAZmA4BK8ZEqd/oFT7ckY/1QNq14bMeemC0Su8n
	 FJFVL9dMUDe/zvunZ+M/+ttRBAVP/zN4SI9ZrUJl/DGRwr4euSwZKSOdJAjL4o3MWX
	 k/j3LfjywssEC6cgwk6LIlWRqv0tev/yco64p1wI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07143F89682;
	Tue,  7 May 2019 14:27:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD1F4F89674; Tue,  7 May 2019 14:27:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38D60F80726
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 14:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38D60F80726
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g9dlocE/"
Received: from localhost (unknown [106.200.210.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95ECC206A3;
 Tue,  7 May 2019 12:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557232017;
 bh=tFaw7PLFFMnBD2d8LMpuF3sAy7zQewD/xapRJv5td7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g9dlocE/TXIqwbSJEwFuisgfwTKdQL8aB0AdxYZ5EpShK/drxMcTLVpxvGRW41ZCh
 Me4N4Ha6jq/tQUjJCz/pTCTiobrLr/JD8/WR6xt57qjbq6bCSIUFOUwb2PoZwWQCqQ
 2WAM6o0z3lvbRCELOX3zgOmSunz6eXjz78eSGorQ=
Date: Tue, 7 May 2019 17:56:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190507122651.GO16052@vkoul-mobl>
References: <20190504002926.28815-1-pierre-louis.bossart@linux.intel.com>
 <20190504002926.28815-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190504002926.28815-2-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH 1/8] soundwire: intel: filter SoundWire
 controller device search
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

On 03-05-19, 19:29, Pierre-Louis Bossart wrote:
> The convention is that the SoundWire controller device is a child of
> the HDAudio controller. However there can be more than one child
> exposed in the DSDT table, and the current namespace walk returns the
> last device.
> 
> Add a filter and terminate early when a valid _ADR is provided,
> otherwise keep iterating to find the next child.

So what are the other devices in DSDT here..

> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/intel_init.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
> index d3d6b54c5791..f85db67d05f0 100644
> --- a/drivers/soundwire/intel_init.c
> +++ b/drivers/soundwire/intel_init.c
> @@ -150,6 +150,12 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
>  {
>  	struct sdw_intel_res *res = cdata;
>  	struct acpi_device *adev;
> +	acpi_status status;
> +	u64 adr;
> +
> +	status = acpi_evaluate_integer(handle, METHOD_NAME__ADR, NULL, &adr);
> +	if (ACPI_FAILURE(status))
> +		return AE_OK; /* keep going */
>  
>  	if (acpi_bus_get_device(handle, &adev)) {
>  		pr_err("%s: Couldn't find ACPI handle\n", __func__);
> @@ -157,7 +163,18 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
>  	}
>  
>  	res->handle = handle;
> -	return AE_OK;
> +
> +	/*
> +	 * On some Intel platforms, multiple children of the HDAS
> +	 * device can be found, but only one of them is the SoundWire
> +	 * controller. The SNDW device is always exposed with
> +	 * Name(_ADR, 0x40000000) so filter accordingly
> +	 */
> +	if (adr != 0x40000000)

I do not recall if 4 corresponds to the links you have or soundwire
device type, is this number documented somewhere is HDA specs?

Also it might good to create a define for this
 
> +		return AE_OK; /* keep going */
> +
> +	/* device found, stop namespace walk */
> +	return AE_CTRL_TERMINATE;
>  }
>  
>  /**
> -- 
> 2.17.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
