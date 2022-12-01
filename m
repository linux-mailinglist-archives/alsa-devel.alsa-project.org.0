Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2E063F945
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 21:39:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A19B17A7;
	Thu,  1 Dec 2022 21:39:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A19B17A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669927199;
	bh=zELu1XGPksGPNPCJ7usRTQUQut5ZdnmhS1HI4ZrCSWM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hlov0AO+wWl0jcfyl6Bu/uxB0yKJuOilcN+S0pfvLea+TcnTmyLNMrCxuCWGUFU5S
	 XRWRRk+woklo4Qh8mKLfcgRCgNOl2+Wuyi7EJ1dOhfsq7guldZcXeZFtOM0pXR3/IO
	 pZ6XMwC45ctOBtJX2zepo+sMd0Q+Aeu/T9fSzGrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E3C7F80118;
	Thu,  1 Dec 2022 21:38:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68F21F80116; Thu,  1 Dec 2022 21:38:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34739F80116
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 21:38:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34739F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lC6+MMTP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669927114; x=1701463114;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zELu1XGPksGPNPCJ7usRTQUQut5ZdnmhS1HI4ZrCSWM=;
 b=lC6+MMTPZOY5/DoreDp71VwusVRGCms38L+sqRzAKrgaqnR1R+Aqmt/0
 2iPwO4X/e1lYwNMzMcwPTjocMKm1fhsvdPC0iplGsDk6GA2DOAEa/1c2m
 4EtBS3Q6hidkwzYmYcEDrBF8vZUTBynmzOtDv9hCMvDRr0jZmBNxLqi4u
 iFFB/j/Ch6mzowcRT6NHw9dzqeMjUZ4C11ITZSDmnzHdoH+I/+8b7IHvB
 t6ytVBMrkhGrEB9NICmNVIHX4JcZDjhil8+SBSJhQJsvod4L6+zWmuTLF
 reh7KHJngOXPUc7ixWu2V30YydSLnirROWWVhhnC62vrmMDzgOK4d1aCd w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="314498370"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="314498370"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 12:38:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="644781654"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="644781654"
Received: from twcarol-mobl.amr.corp.intel.com (HELO [10.212.10.40])
 ([10.212.10.40])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 12:38:03 -0800
Message-ID: <ad92df90-3a5f-91ee-59d5-23116b03264a@linux.intel.com>
Date: Thu, 1 Dec 2022 11:49:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 1/3] soundwire: cadence: Don't overflow the command FIFOs
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org
References: <20221201134845.4055907-1-rf@opensource.cirrus.com>
 <20221201134845.4055907-2-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221201134845.4055907-2-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com
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



On 12/1/22 07:48, Richard Fitzgerald wrote:
> The command FIFOs are 8 entries long, so change CDNS_MCP_CMD_LEN to 8.
> 
> CDNS_MCP_CMD_LEN was originally 32, which would lead to cdns_xfer_msg()
> writing up to 32 commands into the FIFO, so any message longer than 8
> commands would fail.

The change is correct for all instances of SoundWire on Intel platforms.
That said, maybe we should capture that the Cadence IP can handle
4/8/16/32 entries - this is a hardware configuration option.

We should also mention that so far we have not sent multiple commands so
far so the code is only broken when grouping commands.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: 2f52a5177caa ("soundwire: cdns: Add cadence library")
> ---
>  drivers/soundwire/cadence_master.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index a1de363eba3f..27699f341f2c 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -127,7 +127,8 @@ MODULE_PARM_DESC(cdns_mcp_int_mask, "Cadence MCP IntMask");
>  
>  #define CDNS_MCP_CMD_BASE			0x80
>  #define CDNS_MCP_RESP_BASE			0x80
> -#define CDNS_MCP_CMD_LEN			0x20
> +/* FIFO can hold 8 commands */
> +#define CDNS_MCP_CMD_LEN			8
>  #define CDNS_MCP_CMD_WORD_LEN			0x4
>  
>  #define CDNS_MCP_CMD_SSP_TAG			BIT(31)
