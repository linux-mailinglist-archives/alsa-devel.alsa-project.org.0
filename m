Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C8F7650C7
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 12:19:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07BB783B;
	Thu, 27 Jul 2023 12:18:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07BB783B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690453143;
	bh=i40kkbTsdb38qiGVDasibks/QH/gJb3cMVszKUDLJ+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KBdnCdfFc9z8tn8on5OxuyABI2XApPu1SFsF4OJoAs2wYJkhjLBoCQ+1niC6Hfl4r
	 m90G/lj1WQEo6N5GpWKUS/aiRgnGdN3uBtw0eXHR+AKaTRaDFML0RswZTcs3ilP0OS
	 NUStKU3I5i6c7oQ46mfkaDiCgprvH/GPgqNUSgMk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99767F802E8; Thu, 27 Jul 2023 12:18:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE3A7F80163;
	Thu, 27 Jul 2023 12:18:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15970F8019B; Thu, 27 Jul 2023 12:18:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83D37F800D2
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 12:17:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83D37F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SY8PYkcl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690453082; x=1721989082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i40kkbTsdb38qiGVDasibks/QH/gJb3cMVszKUDLJ+Q=;
  b=SY8PYkcl1eiNc9NWgzVztIfbKo906Qi+QNUjzRNorLWc25+M3YCRpDqX
   4Nx6Q4ERJrRkFYSJxq4pHV0eAhHGgQ78ylAF+E2MbloB4tHLmsgCFkz8I
   +oINLBovY/2aqWVdqAl8oZw86MpQqjsORmafqcwhLzM8OcuiLY/1hhEHv
   q6on5e9iNzm8Y1Gy3Psc3gysU+8EzFpyPt6wMO2TcA7qUvP2o6I+K4hR8
   JQcOmNywYOWD7TBwGdjVI0iS0wxbedy2V9H0GwXID6QlLtGN1Fh5b8fEk
   ecjeBz4mx/AlHQHN9KgrmGmJv6Eugo8IhOQgO5O4Ww/K/QdQqT3qoRrHd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371879752"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200";
   d="scan'208";a="371879752"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 03:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="677102021"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200";
   d="scan'208";a="677102021"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 27 Jul 2023 03:17:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qOy40-00Gse5-1y;
	Thu, 27 Jul 2023 13:17:44 +0300
Date: Thu, 27 Jul 2023 13:17:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Brent Lu <brent.lu@intel.com>
Cc: alsa-devel@alsa-project.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	Yong Zhi <yong.zhi@intel.com>, Terry Cheong <htcheong@chromium.org>,
	Uday M Bhat <uday.m.bhat@intel.com>,
	Mac Chiang <mac.chiang@intel.com>,
	"Dharageswari . R" <dharageswari.r@intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	ye xingchen <ye.xingchen@zte.com.cn>
Subject: Re: [PATCH v3 1/2] ASoC: Intel: maxim-common: get codec number from
 ACPI
Message-ID: <ZMJESOsmm/0ta+Nc@smile.fi.intel.com>
References: <20230727104354.2344418-1-brent.lu@intel.com>
 <20230727104354.2344418-2-brent.lu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727104354.2344418-2-brent.lu@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: C6U7SJNMMU6GD6KJDWL7SVKOSGPBDUAY
X-Message-ID-Hash: C6U7SJNMMU6GD6KJDWL7SVKOSGPBDUAY
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C6U7SJNMMU6GD6KJDWL7SVKOSGPBDUAY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 27, 2023 at 06:43:53PM +0800, Brent Lu wrote:
> Implement a helper function to get number of codecs from ACPI
> subsystem to remove the need of quirk flag in machine driver.

...

>  static int max_98390_hw_params(struct snd_pcm_substream *substream,
>  			       struct snd_pcm_hw_params *params)
>  {
>  	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
>  	struct snd_soc_dai *codec_dai;
> +	int i, ret = 0;

Redundant assignment.

>  	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> +		if (i >= ARRAY_SIZE(max_98390_tdm_mask)) {
>  			dev_err(codec_dai->dev, "invalid codec index %d\n", i);
>  			return -ENODEV;
>  		}
>  
> +		ret = snd_soc_dai_set_tdm_slot(codec_dai, max_98390_tdm_mask[i].tx,
> +					       max_98390_tdm_mask[i].rx, 4,
> +					       params_width(params));
> +		if (ret < 0) {
> +			dev_err(codec_dai->dev, "fail to set tdm slot, ret %d\n",
> +				ret);
> +			return ret;
>  		}
>  	}
>  	return 0;
>  }

...

> +	case 2:
> +		/* add regular speakers dapm route */
> +		ret = snd_soc_dapm_add_routes(&card->dapm, max_98390_dapm_routes,
> +					      ARRAY_SIZE(max_98390_dapm_routes));
> +		if (ret) {
> +			dev_err(rtd->dev, "unable to add dapm routes, ret %d\n",
> +				ret);
> +			return ret;
> +		}
> +		break;
> +	default:
> +		dev_err(rtd->dev, "invalid codec number %d\n", num_codecs);

> +		ret = -EINVAL;
> +		break;

You can

		return -EINVAL;

>  	}
> +
>  	return ret;

...

> +#define MAX_98390_ACPI_HID	"MX98390"

> +#define MAX_98390_DEV0_NAME	"i2c-MX98390:00"
> +#define MAX_98390_DEV1_NAME	"i2c-MX98390:01"
> +#define MAX_98390_DEV2_NAME	"i2c-MX98390:02"
> +#define MAX_98390_DEV3_NAME	"i2c-MX98390:03"

Maybe (maybe, don't know subsystem preferences)

#define MAX_98390_DEV0_NAME	"i2c-" MAX_98390_ACPI_HID ":00"
#define MAX_98390_DEV1_NAME	"i2c-" MAX_98390_ACPI_HID ":01"
#define MAX_98390_DEV2_NAME	"i2c-" MAX_98390_ACPI_HID ":02"
#define MAX_98390_DEV3_NAME	"i2c-" MAX_98390_ACPI_HID ":03"

-- 
With Best Regards,
Andy Shevchenko


