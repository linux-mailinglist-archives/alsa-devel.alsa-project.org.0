Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC257EE8B3
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 20:35:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B4641721;
	Mon,  4 Nov 2019 20:34:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B4641721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572896110;
	bh=8MOpqIURg4ZGlTotmKhgFZrg/LH53gT4Ca+oajmDgI4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IaZk6cU0bAnf4nwFT+1vKL9EivoFEw85fst5axdAUWFtmYpwj4jD+1hmblWnq4/sj
	 P7J2hfHM5NXklWMOiab+xTGtS55CARSa+rQNWOImx9B44JLOH75zrDTXRUGqHnmGsK
	 3lhHN02N6KV03DGN1H84Z3Deyfc6LbJf9bkwgw6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 889B9F8019B;
	Mon,  4 Nov 2019 20:33:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EC84F803F4; Mon,  4 Nov 2019 20:33:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96A9BF8015B
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 20:33:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96A9BF8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 11:33:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,268,1569308400"; d="scan'208";a="376436010"
Received: from jleigh1-mobl.ger.corp.intel.com (HELO [10.251.83.74])
 ([10.251.83.74])
 by orsmga005.jf.intel.com with ESMTP; 04 Nov 2019 11:33:10 -0800
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20191023212823.608-1-pierre-louis.bossart@linux.intel.com>
 <20191023212823.608-7-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <71b50d6d-0000-340a-eb5d-6a63564dd2d6@intel.com>
Date: Mon, 4 Nov 2019 20:33:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023212823.608-7-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 06/14] soundwire: add support for
	sdw_slave_type
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

On 2019-10-23 23:28, Pierre-Louis Bossart wrote:
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 9a0fd3ee1014..5df095f4e12f 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -49,9 +49,16 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
>   
>   static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
>   {
> -	struct sdw_slave *slave = to_sdw_slave_device(dev);
> +	struct sdw_slave *slave;
>   	char modalias[32];
>   
> +	if (is_sdw_slave(dev)) {
> +		slave = to_sdw_slave_device(dev);
> +	} else {
> +		dev_warn(dev, "uevent for unknown Soundwire type\n");
> +		return -EINVAL;
> +	}
> +
>   	sdw_slave_modalias(slave, modalias, sizeof(modalias));
>   
>   	if (add_uevent_var(env, "MODALIAS=%s", modalias))

Positive evaluation of is_sdw_slave() check is required for function to 
continue, thus you might as well do:

if (!is_sdw_slave(dev)) {
	dev_warn();
	return -EINVAL;
}

slave = to_sdw_slave_device(dev);
(...)

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
