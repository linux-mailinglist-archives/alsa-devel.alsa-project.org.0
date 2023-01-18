Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A87B5672735
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 19:39:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EB24199C;
	Wed, 18 Jan 2023 19:38:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EB24199C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674067165;
	bh=OlBzbupfhV2bmyY8s2x6GJLsiZW8YnpaxbAPUhUsLXU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AkoIOT6Vvn81RAzoc+wZ/LM0WSNR7qn8faqtApW1Iel5ARiI180EZykTQdOOg49dM
	 cdWKsO9PgFuMrIFF4uAoR7BdRNqGKpfbKr60M1Dq4l4/xnq1PaQRWZyOnIisHiN9/A
	 XiIq2Tj0wWF4cS6xYb1XovC0eY7J1Dc38hk+UxV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B11A1F8024D;
	Wed, 18 Jan 2023 19:38:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A2BAF804BC; Wed, 18 Jan 2023 19:38:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7AC8F80083
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 19:38:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7AC8F80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lyOcrq99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674067099; x=1705603099;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OlBzbupfhV2bmyY8s2x6GJLsiZW8YnpaxbAPUhUsLXU=;
 b=lyOcrq99O2IV6g2B7yn4e6XZ7LugTcx/gLWNUOFEVSUWbKp8+ONemm+Y
 Wz72wZRttsWTGchOBhls7wGq+NavbJYvwjkwMiMXO8vVPT297yWlruLIY
 3N60nxndXDIfErmOJiC2kZFG7QfjPABkZ+dZjJMdDiNUdNplm1hj9FjHc
 EZw0sAPHjmYVV8/BeFZTdAtXRFcXyZDLCI+1bIaCJIJNA8GokTKHzdKOr
 joPmQq90f3ixrAk04mZzMV2NQS5W+yr5UjsCTFe6Lz9V0PzvehjRnc/UC
 2vf8yJhNc0ddP2XzSgfA441AzgRd/PJRR0OI3i58B9LZHY3uiRWd/vnEI w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327138507"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="327138507"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 10:37:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="783777243"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="783777243"
Received: from jaibarra-mobl.amr.corp.intel.com (HELO [10.209.131.1])
 ([10.209.131.1])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 10:37:54 -0800
Message-ID: <72ba99a9-3d21-b3be-4a23-6570078aaae9@linux.intel.com>
Date: Wed, 18 Jan 2023 10:37:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/8] soundwire: stream: Add specific prep/deprep
 commands to port_prep callback
Content-Language: en-US
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
References: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
 <20230118160452.2385494-2-sbinding@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230118160452.2385494-2-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/18/23 10:04, Stefan Binding wrote:
> Currently, port_prep callback only has commands for PRE_PREP, PREP,
> and POST_PREP, which doesn't directly say whether this is for a
> prepare or deprepare call. Extend the command list enum to say
> whether the call is for prepare or deprepare aswell.
> 
> Also remove SDW_OPS_PORT_PREP from sdw_port_prep_ops as this is unused,
> and update this enum to be simpler and more consistent with enum
> sdw_clk_stop_type.

yes, I don't know why this PORT_PREP was added, clearly the prepare part
is something that would be done with standard registers without the need
to inform the codec driver. The codec driver only need the pre- and
post- notifications.

Good cleanup!


> Note: Currently, the only users of SDW_OPS_PORT_POST_PREP are codec
> drivers sound/soc/codecs/wsa881x.c and sound/soc/codecs/wsa883x.c, both
> of which seem to assume that POST_PREP only occurs after a prepare,
> even though it would also have occurred after a deprepare. Since it
> doesn't make sense to mark the port prepared after a deprepare, changing
> the enum to separate PORT_DEPREP from PORT_PREP should make the check
> for PORT_PREP in those drivers be more logical.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  drivers/soundwire/stream.c    | 4 ++--
>  include/linux/soundwire/sdw.h | 8 +++++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index df3b36670df4c..1652fb5737d9d 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -469,7 +469,7 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
>  	}
>  
>  	/* Inform slave about the impending port prepare */
> -	sdw_do_port_prep(s_rt, prep_ch, SDW_OPS_PORT_PRE_PREP);
> +	sdw_do_port_prep(s_rt, prep_ch, prep ? SDW_OPS_PORT_PRE_PREP : SDW_OPS_PORT_PRE_DEPREP);
>  
>  	/* Prepare Slave port implementing CP_SM */
>  	if (!dpn_prop->simple_ch_prep_sm) {
> @@ -501,7 +501,7 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
>  	}
>  
>  	/* Inform slaves about ports prepared */
> -	sdw_do_port_prep(s_rt, prep_ch, SDW_OPS_PORT_POST_PREP);
> +	sdw_do_port_prep(s_rt, prep_ch, prep ? SDW_OPS_PORT_POST_PREP : SDW_OPS_PORT_POST_DEPREP);
>  
>  	/* Disable interrupt after Port de-prepare */
>  	if (!prep && intr)
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 3cd2a761911ff..547fc1b30a51a 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -569,13 +569,15 @@ struct sdw_prepare_ch {
>   * enum sdw_port_prep_ops: Prepare operations for Data Port
>   *
>   * @SDW_OPS_PORT_PRE_PREP: Pre prepare operation for the Port
> - * @SDW_OPS_PORT_PREP: Prepare operation for the Port
> + * @SDW_OPS_PORT_PRE_DEPREP: Pre deprepare operation for the Port
>   * @SDW_OPS_PORT_POST_PREP: Post prepare operation for the Port
> + * @SDW_OPS_PORT_POST_DEPREP: Post deprepare operation for the Port
>   */
>  enum sdw_port_prep_ops {
>  	SDW_OPS_PORT_PRE_PREP = 0,
> -	SDW_OPS_PORT_PREP = 1,
> -	SDW_OPS_PORT_POST_PREP = 2,
> +	SDW_OPS_PORT_PRE_DEPREP,
> +	SDW_OPS_PORT_POST_PREP,
> +	SDW_OPS_PORT_POST_DEPREP,
>  };
>  
>  /**
