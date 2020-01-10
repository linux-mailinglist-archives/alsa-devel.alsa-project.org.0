Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B68B11379B6
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 23:32:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A27E16B5;
	Fri, 10 Jan 2020 23:31:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A27E16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578695545;
	bh=Aj9HvwKAwbAoQULR4sFe3fVBcRAqBTM38XxKtAdEMnA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ot1Plz3t8Czcuiky8bQMoPoqEVi7ldnMRgSylXN02aH9Ez5B6HKoR2l0SQ/k+N+aN
	 k2yWHXpFuLWAF9hc/6zga4pI8kMbl5lEjx7kpxDIP94Lpthmk/aP8Egvusb3mTTgI2
	 SQ2JEPDF66iITmzvqJ46bfkUWGoxJWGtx5FVZ4yQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B792F80161;
	Fri, 10 Jan 2020 23:31:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBB42F8011C; Fri, 10 Jan 2020 23:31:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A80C5F8010B
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 23:31:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A80C5F8010B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2020 14:31:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,418,1571727600"; d="scan'208";a="212400494"
Received: from ewronsha-mobl1.amr.corp.intel.com (HELO [10.255.66.226])
 ([10.255.66.226])
 by orsmga007.jf.intel.com with ESMTP; 10 Jan 2020 14:31:24 -0800
To: alsa-devel@alsa-project.org
References: <20200110220016.30887-1-pierre-louis.bossart@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a70c54c0-c691-d8eb-4f99-da1bb9306c2f@linux.intel.com>
Date: Fri, 10 Jan 2020 16:31:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200110220016.30887-1-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] soundwire: intel: report slave_ids for
 each link to SOF driver
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



On 1/10/20 4:00 PM, Pierre-Louis Bossart wrote:
> From: Bard Liao <yung-chuan.liao@linux.intel.com>
> 
> The existing link_mask flag is no longer sufficient to detect the
> hardware and identify which topology file and a machine driver to load.
> 
> By reporting the slave_ids exposed in ACPI tables, the parent SOF
> driver will be able to compare against a set of static configurations.
> 
> This patch only adds the interface change, the functionality is added
> in future patches.

Vinod, this patch would need to be shared as an immutable tag for Mark, 
once this is done I can share the SOF parts that make use of the 
information (cf. https://github.com/thesofproject/linux/pull/1692 for 
reference)

Sorry we missed this in the earlier interface changes, we didn't think 
we would have so many hardware variations so quickly.

Thanks!

> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   include/linux/soundwire/sdw_intel.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
> index 93b83bdf8035..979b41b5dcb4 100644
> --- a/include/linux/soundwire/sdw_intel.h
> +++ b/include/linux/soundwire/sdw_intel.h
> @@ -5,6 +5,7 @@
>   #define __SDW_INTEL_H
>   
>   #include <linux/irqreturn.h>
> +#include <linux/soundwire/sdw.h>
>   
>   /**
>    * struct sdw_intel_stream_params_data: configuration passed during
> @@ -93,6 +94,11 @@ struct sdw_intel_link_res;
>    */
>   #define SDW_INTEL_CLK_STOP_BUS_RESET		BIT(3)
>   
> +struct sdw_intel_slave_id {
> +	int link_id;
> +	struct sdw_slave_id id;
> +};
> +
>   /**
>    * struct sdw_intel_ctx - context allocated by the controller
>    * driver probe
> @@ -101,9 +107,12 @@ struct sdw_intel_link_res;
>    * hardware capabilities after all power dependencies are settled.
>    * @link_mask: bit-wise mask listing SoundWire links reported by the
>    * Controller
> + * @num_slaves: total number of devices exposed across all enabled links
>    * @handle: ACPI parent handle
>    * @links: information for each link (controller-specific and kept
>    * opaque here)
> + * @ids: array of slave_id, representing Slaves exposed across all enabled
> + * links
>    * @link_list: list to handle interrupts across all links
>    * @shim_lock: mutex to handle concurrent rmw access to shared SHIM registers.
>    */
> @@ -111,8 +120,10 @@ struct sdw_intel_ctx {
>   	int count;
>   	void __iomem *mmio_base;
>   	u32 link_mask;
> +	int num_slaves;
>   	acpi_handle handle;
>   	struct sdw_intel_link_res *links;
> +	struct sdw_intel_slave_id *ids;
>   	struct list_head link_list;
>   	struct mutex shim_lock; /* lock for access to shared SHIM registers */
>   };
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
