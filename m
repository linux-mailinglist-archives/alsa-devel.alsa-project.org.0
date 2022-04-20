Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F698508EFD
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 20:01:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2059E1B21;
	Wed, 20 Apr 2022 20:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2059E1B21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650477686;
	bh=ZPYh6ii3d6sit1IsGVPNN+fvydkX/ToCt0Ocqq0aUxE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GIsnZHnJNhPEDxZxW02NyvsZ6VoXqjQIZLRFP0Ksg1wEMTP8Xge7Hpm47TQrgvtuy
	 SpCz+HChKl0xfuNo1LjGYXVRqt2/LquuMNOKnPWf8/9T4QVhuXLAH4JR20GDXTTWSW
	 AgyL8NXWrr5cUFStBQPKBNFbEdm80mH+QyUvDuy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB0E5F804FE;
	Wed, 20 Apr 2022 20:00:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE286F80125; Wed, 20 Apr 2022 19:59:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5219EF800F8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 19:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5219EF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XD5oBf0x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650477595; x=1682013595;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZPYh6ii3d6sit1IsGVPNN+fvydkX/ToCt0Ocqq0aUxE=;
 b=XD5oBf0xZ9XXmOCU9nP9jXb1axyt/Vk/o/1pEKFS4kOQfthsitejE4EM
 MhkahgoZlJCwGhjQHG9SfqqrKI+dYWiau8FwbgA7vfGAidC8Wr3BlzY1X
 pyHbp/JByNzgUKOqfysaViqf+SklWeHvj67NFDB5VHlB+9uAb69zrbgbs
 P8EP3t1rhe34fHV74HiyHUJMUiibfjrdTyNJbYWOgbLCZCiML6lv/0IkX
 xnhFAhHvy9UzYF7FEthDmcT4r3QT9jG4bKQwTcsAu9VB2TpD9DXXHGIgJ
 zxZJ14JLBFmOtbrGXL9BGjvFF74KtJ3UI657g9SvO9F5IOo7yqJ+K0ZBf w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="263875246"
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="263875246"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 10:59:47 -0700
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="576721826"
Received: from sbidasar-mobl.amr.corp.intel.com (HELO [10.209.100.171])
 ([10.209.100.171])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 10:59:46 -0700
Message-ID: <b1b0a8b9-5fc2-bfe1-dfde-692a0a7ac34a@linux.intel.com>
Date: Wed, 20 Apr 2022 12:59:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v4] ASoC: codecs: wsa881x: add runtime pm support
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20220228144235.24208-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220228144235.24208-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 quic_srivasam@quicinc.com, linux-kernel@vger.kernel.org
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

Hi Srini,

> +static int __maybe_unused wsa881x_runtime_resume(struct device *dev)
> +{
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct regmap *regmap = dev_get_regmap(dev, NULL);
> +	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
> +
> +	gpiod_direction_output(wsa881x->sd_n, 1);
> +
> +	wait_for_completion_timeout(&slave->initialization_complete,
> +				    msecs_to_jiffies(WSA881X_PROBE_TIMEOUT));

while I was revisiting pm_runtime support, I also saw that this codec driver is the only one that doesn't check for errors

max98373-sdw.c: time = wait_for_completion_timeout(&slave->initialization_complete,

rt1308-sdw.c:   time = wait_for_completion_timeout(&slave->initialization_complete,

rt1316-sdw.c:   time = wait_for_completion_timeout(&slave->initialization_complete,

rt5682-sdw.c:   time = wait_for_completion_timeout(&slave->initialization_complete,

rt5682.c:                       &slave->initialization_complete,

rt700-sdw.c:    time = wait_for_completion_timeout(&slave->initialization_complete,

rt711-sdca-sdw.c:       time = wait_for_completion_timeout(&slave->initialization_complete,

rt711-sdw.c:    time = wait_for_completion_timeout(&slave->initialization_complete,

rt715-sdw.c:    time = wait_for_completion_timeout(&slave->initialization_complete,

wsa881x.c:      wait_for_completion_timeout(&slave->initialization_complete,


If the attachment fails for some reason, you probably want to avoid starting regmap syncs that will fail by construction, no?

> +
> +	regcache_cache_only(regmap, false);
> +	regcache_sync(regmap);
> +
> +	return 0;
> +}
