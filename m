Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D014BD3F
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 17:48:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49D7A1692;
	Wed, 19 Jun 2019 17:47:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49D7A1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560959312;
	bh=t+H3O/zEeyyyZX6MzWLfDPFp+gPkEwFTKHED9shaXM0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g/jY2dUZ71iMPiVwzAarIX1yG9tX3xmbNMgwsV+nYFvSZJVR9kfsl/n8QhOGtfD+8
	 dOKKNiBEbX79UQu1faOWZBpxYqlIfBCLIbvMO7rk5fp2q/Nv/sGqxPj2nDYio/fh4Z
	 IHcDNdwUcnmLVntow69C6G5xcCs8F/HdYcKHtm1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B08EF896DA;
	Wed, 19 Jun 2019 17:46:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99081F896B8; Wed, 19 Jun 2019 17:46:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94953F80C87
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 17:46:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94953F80C87
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 08:46:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="358652767"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 19 Jun 2019 08:46:37 -0700
Received: from rkammarx-mobl3.ger.corp.intel.com (unknown [10.252.61.163])
 by linux.intel.com (Postfix) with ESMTP id B5E63580460;
 Wed, 19 Jun 2019 08:46:35 -0700 (PDT)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20190619150213.87691-1-andriy.shevchenko@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a987bd54-5364-f046-a928-44a97ed0307f@linux.intel.com>
Date: Wed, 19 Jun 2019 17:46:34 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190619150213.87691-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
Cc: Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [PATCH v1] ASoC: Intel: Skylake: Switch to modern
 UUID API
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

On 6/19/19 5:02 PM, Andy Shevchenko wrote:
> Switch the driver to use modern UUID API, i.e. guid_t type and
> accompanying functions, such as guid_equal().
> 
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks good to me - couple of nit-picks below on unrelated indentation 
changes.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> @@ -247,7 +241,6 @@ int snd_skl_parse_uuids(struct sst_dsp *ctx, const struct firmware *fw,
>   	struct adsp_fw_hdr *adsp_hdr;
>   	struct adsp_module_entry *mod_entry;
>   	int i, num_entry, size;
> -	uuid_le *uuid_bin;
>   	const char *buf;
>   	struct skl_sst *skl = ctx->thread_context;
>   	struct uuid_module *module;
> @@ -279,8 +272,7 @@ int snd_skl_parse_uuids(struct sst_dsp *ctx, const struct firmware *fw,
>   		return -EINVAL;
>   	}
>   
> -	mod_entry = (struct adsp_module_entry *)
> -		(buf + offset + adsp_hdr->len);
> +	mod_entry = (struct adsp_module_entry *)(buf + offset + adsp_hdr->len);

this really has nothing to do with the guid change, could be a separate 
patch in a perfect world.

> diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
> index 5951bbdf1f1a..13c636dece56 100644
> --- a/sound/soc/intel/skylake/skl-sst.c
> +++ b/sound/soc/intel/skylake/skl-sst.c
> @@ -420,11 +420,9 @@ static int skl_load_module(struct sst_dsp *ctx, u16 mod_id, u8 *guid)
>   	struct skl_module_table *module_entry = NULL;
>   	int ret = 0;
>   	char mod_name[64]; /* guid str = 32 chars + 4 hyphens */
> -	uuid_le *uuid_mod;
>   
> -	uuid_mod = (uuid_le *)guid;
>   	snprintf(mod_name, sizeof(mod_name), "%s%pUL%s",
> -				"intel/dsp_fw_", uuid_mod, ".bin");
> +					     "intel/dsp_fw_", guid, ".bin");

indentation looks off, not sure if this is a diff effect.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
