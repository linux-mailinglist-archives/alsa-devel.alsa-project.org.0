Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 010452FF30A
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 19:24:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 868291911;
	Thu, 21 Jan 2021 19:23:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 868291911
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611253478;
	bh=L9M5Uh/KvbyFqIhxuQEYEBpIJ9X8O9hqWbhgBgylcAM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qtO067nGu6lL64DqEKRTw35CuIMaa+A2jv/UtXLxrHNLAQk9XnijiTCx9B0C9nPLM
	 WQMviMAx+6nJUkDh48bykXZdDikLE68fitoZU190fGxM9iUZCaGwMbUvzLDz0QPT5d
	 Bs5V6gCR6yVLlWcsY5Gd0HAWVm0AaKPUgrycbSK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0163F80125;
	Thu, 21 Jan 2021 19:23:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2A65F80257; Thu, 21 Jan 2021 19:23:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41410F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 19:22:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41410F80125
IronPort-SDR: 1MNeMAx10DMsS1EUvoDaxdihjq6aKOl++LeuQ5A9MLcfdJRet5Sh23qTufBrpq0mLELgr5THgt
 ZDgA0ZNCiBNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="264133687"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="264133687"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 10:22:54 -0800
IronPort-SDR: UolsxcPDFQqUMw3ucIJXzf/7FfIYKRQJgHsxWAXoy8HTtczihnQcRCoCKIQgEIQbLRlqPCfOZj
 uwPA+2o/YDhQ==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="354860719"
Received: from swehrlex-mobl.amr.corp.intel.com (HELO [10.212.61.64])
 ([10.212.61.64])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 10:22:53 -0800
Subject: Re: [PATCH] soundwire: debugfs: use controller id instead of link_id
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
References: <20210115162559.20869-1-srinivas.kandagatla@linaro.org>
 <20210119145220.GS2771@vkoul-mobl>
 <45300dc3-00b0-497b-804e-f7f1e857f32a@linux.intel.com>
 <57d5f1bd-50fa-30ab-03c0-260460e45d61@linaro.org>
 <6d4d4a6b-f28c-81db-4e67-2b5b94116fa4@linux.intel.com>
 <1fad2388-27d0-7014-818d-1272fa70ed9b@linaro.org>
 <33fe8455-01b4-f867-4974-a3e867c930f0@linux.intel.com>
 <feee8676-33fe-7929-8b6c-6abe3a09159a@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <35ae5919-f511-bbe9-7273-2dee11795db4@linux.intel.com>
Date: Thu, 21 Jan 2021 12:22:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <feee8676-33fe-7929-8b6c-6abe3a09159a@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
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



> diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
> index b6cad0d59b7b..f22868614f09 100644
> --- a/drivers/soundwire/debugfs.c
> +++ b/drivers/soundwire/debugfs.c
> @@ -19,13 +19,14 @@ void sdw_bus_debugfs_init(struct sdw_bus *bus)
>                  return;
> 
>          /* create the debugfs master-N */
> +       bus->controller_debugfs = debugfs_create_dir(dev_name(bus->dev), 
> sdw_debugfs_root);

	bus->dev = &md->dev;

dev_name(bus->dev) does not describe a controller at all but an 
individual master.

We might as well just change the information as:

snprintf(name, sizeof(name), "master-%d-%d", bus_id, bus->link_id);

you get the system unique ID and controller-relative ID, and you can 
decide to ignore one or the other on different platform.
