Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 716AD424264
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 18:16:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1387F166A;
	Wed,  6 Oct 2021 18:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1387F166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633536968;
	bh=L+9qdykkURivD+lvriRg45vB1aewuJR8IpM/7vvmYdg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jzULSaqivu8wB2y2OaXSq3xAXRx9tvC+i4edE/VJBzgfV1OF/kXtg7ND9XyM+mUq1
	 WPrg11kJdvJ6rBVTFZhCZtY6+gAWvb2TblJQgoAe9RfZmy23kwVjID+YJKAnQu0myT
	 axrqpYhckHjZ1YtqV+g5B05azYCGcc/LpJDxejAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7365F8032D;
	Wed,  6 Oct 2021 18:14:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D734F80229; Wed,  6 Oct 2021 18:14:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C28EF8010B
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 18:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C28EF8010B
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="249310190"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="249310190"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:09:02 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="439169436"
Received: from nbasa-mobl2.amr.corp.intel.com (HELO [10.213.170.135])
 ([10.213.170.135])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:09:01 -0700
Subject: Re: [PATCH v1 1/4] ASoC: Intel: bytcht_es8316: Get platform data via
 dev_get_platdata()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20211006150428.16434-1-andriy.shevchenko@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c8b85524-6b9f-8fd3-3978-1d26b92660fd@linux.intel.com>
Date: Wed, 6 Oct 2021 10:52:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006150428.16434-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>
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



On 10/6/21 10:04 AM, Andy Shevchenko wrote:
> Access to platform data via dev_get_platdata() getter to make code cleaner.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

For the series

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.com>

FWIW Marc likes a cover letter that's kept in the merge logs.

> ---
>  sound/soc/intel/boards/bytcht_es8316.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
> index 1bb9b8e7bcc7..4360519fbb0c 100644
> --- a/sound/soc/intel/boards/bytcht_es8316.c
> +++ b/sound/soc/intel/boards/bytcht_es8316.c
> @@ -456,12 +456,12 @@ static const struct dmi_system_id byt_cht_es8316_quirk_table[] = {
>  
>  static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
>  	static const char * const mic_name[] = { "in1", "in2" };
> +	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
>  	struct property_entry props[MAX_NO_PROPS] = {};
>  	struct byt_cht_es8316_private *priv;
>  	const struct dmi_system_id *dmi_id;
> -	struct device *dev = &pdev->dev;
> -	struct snd_soc_acpi_mach *mach;
>  	struct fwnode_handle *fwnode;
>  	const char *platform_name;
>  	struct acpi_device *adev;
> @@ -476,7 +476,6 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	mach = dev->platform_data;
>  	/* fix index of codec dai */
>  	for (i = 0; i < ARRAY_SIZE(byt_cht_es8316_dais); i++) {
>  		if (!strcmp(byt_cht_es8316_dais[i].codecs->name,
> 
