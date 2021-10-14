Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A68C842DF32
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 18:32:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41E7B166F;
	Thu, 14 Oct 2021 18:32:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41E7B166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634229179;
	bh=Jodyu61Gk7GHzcGZ5s/BudrZVfrP7qQwQrGeIP6i86w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uA4n0HSxLK5pW/G7gWofzglFo3b7Y0IYyuoIPTOBYoNc5K4Hj/MCuN0xcHsU+JpRI
	 kO4aGGl9drvn5AFTiOpiqJCupUm92jAJaer9ubB8ecm6Ipy6XK5rIUUUEkCLlTPO4x
	 24pdA3aHnE6AyueEvjOZEysUo239lW/9RbPX8z/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92946F801F7;
	Thu, 14 Oct 2021 18:31:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84551F80212; Thu, 14 Oct 2021 18:31:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4593CF801D5
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 18:31:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4593CF801D5
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="207834643"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="207834643"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 09:31:28 -0700
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="461247690"
Received: from ktrimble-mobl.amr.corp.intel.com (HELO [10.209.188.150])
 ([10.209.188.150])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 09:31:27 -0700
Subject: Re: [PATCH] ASoC: soc-component: improve error reporting for register
 access
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20211014161330.26645-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cdd5fb0f-ff3e-9da0-1ea4-1d1ae5e982bc@linux.intel.com>
Date: Thu, 14 Oct 2021 11:31:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014161330.26645-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, lgirdwood@gmail.com
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



On 10/14/21 11:13 AM, Srinivas Kandagatla wrote:
> Currently errors on register read/write/update are reported with
> an error code and the corresponding function but does not provide
> any details on the which register number did it actually fail.
> 
> register number can give better clue and it should be easy to
> locate the code and fix.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> 
> Personally I found this patch very useful while developing and debugging.
> 
> Ex: below error 
> "ASoC: error at soc_component_read_no_lock on soc@0:codec: -16"
> did not provide much info except that it failed to read,
> but after this patch error message looks like:
> "ASoC: error at soc_component_read_no_lock on soc@0:codec for register: [0x00003125] -16"
> which was easy to locate and fix.

LGTM

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

BTW while looking at the code, I started to wonder if it's intentional
that we cannot check any error code on component->driver->read(). We do
for the write and on regmap read, which suggests this API is problematic?

static unsigned int soc_component_read_no_lock(
	struct snd_soc_component *component,
	unsigned int reg)
{
	int ret;
	unsigned int val = 0;

	if (component->regmap)
		ret = regmap_read(component->regmap, reg, &val);
	else if (component->driver->read) {
		ret = 0;
		val = component->driver->read(component, reg); <<< NO ERROR CHECKS?
	}
	else
		ret = -EIO;

	if (ret < 0)
		return soc_component_ret(component, ret);

	return val;
}


> 
>  sound/soc/soc-component.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index a08a897c5230..c76ff9c59dfb 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -13,9 +13,10 @@
>  #include <sound/soc.h>
>  #include <linux/bitops.h>
>  
> -#define soc_component_ret(dai, ret) _soc_component_ret(dai, __func__, ret)
> +#define soc_component_ret(dai, ret) _soc_component_ret(dai, __func__, ret, -1)
> +#define soc_component_ret_reg_rw(dai, ret, reg) _soc_component_ret(dai, __func__, ret, reg)
>  static inline int _soc_component_ret(struct snd_soc_component *component,
> -				     const char *func, int ret)
> +				     const char *func, int ret, int reg)
>  {
>  	/* Positive/Zero values are not errors */
>  	if (ret >= 0)
> @@ -27,9 +28,14 @@ static inline int _soc_component_ret(struct snd_soc_component *component,
>  	case -ENOTSUPP:
>  		break;
>  	default:
> -		dev_err(component->dev,
> -			"ASoC: error at %s on %s: %d\n",
> -			func, component->name, ret);
> +		if (reg == -1)
> +			dev_err(component->dev,
> +				"ASoC: error at %s on %s: %d\n",
> +				func, component->name, ret);
> +		else
> +			dev_err(component->dev,
> +				"ASoC: error at %s on %s for register: [0x%08x] %d\n",
> +				func, component->name, reg, ret);
>  	}
>  
>  	return ret;
> @@ -687,7 +693,7 @@ static unsigned int soc_component_read_no_lock(
>  		ret = -EIO;
>  
>  	if (ret < 0)
> -		return soc_component_ret(component, ret);
> +		return soc_component_ret_reg_rw(component, ret, reg);
>  
>  	return val;
>  }
> @@ -723,7 +729,7 @@ static int soc_component_write_no_lock(
>  	else if (component->driver->write)
>  		ret = component->driver->write(component, reg, val);
>  
> -	return soc_component_ret(component, ret);
> +	return soc_component_ret_reg_rw(component, ret, reg);
>  }
>  
>  /**
> @@ -765,7 +771,7 @@ static int snd_soc_component_update_bits_legacy(
>  
>  	mutex_unlock(&component->io_mutex);
>  
> -	return soc_component_ret(component, ret);
> +	return soc_component_ret_reg_rw(component, ret, reg);
>  }
>  
>  /**
> @@ -793,7 +799,7 @@ int snd_soc_component_update_bits(struct snd_soc_component *component,
>  							   mask, val, &change);
>  
>  	if (ret < 0)
> -		return soc_component_ret(component, ret);
> +		return soc_component_ret_reg_rw(component, ret, reg);
>  	return change;
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_component_update_bits);
> @@ -829,7 +835,7 @@ int snd_soc_component_update_bits_async(struct snd_soc_component *component,
>  							   mask, val, &change);
>  
>  	if (ret < 0)
> -		return soc_component_ret(component, ret);
> +		return soc_component_ret_reg_rw(component, ret, reg);
>  	return change;
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_component_update_bits_async);
> 
