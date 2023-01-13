Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FFB6693FB
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 11:23:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C5AC5913;
	Fri, 13 Jan 2023 11:23:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C5AC5913
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673605431;
	bh=CDcpGc14MxwljMRrNGGaJzjMrvUpcw8OYXg9rqQznUQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=f00Ffe6/CNePwjXP+Nz6aCPTDdH7+bkAURjGGDS7bJmLMUMvpACXh4My4eWmruHlF
	 24DqPxxR0A7xXmz1oOYm5zdZdMdo9f+MJ+ZNk5Ex/ibH2hGMET86LMFv4CcvvNoXUM
	 ou80vEGYlLTA+0pweZFZD/4iLIdIvcRoWPQyerCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE986F8019B;
	Fri, 13 Jan 2023 11:22:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7353F8030F; Fri, 13 Jan 2023 11:22:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DA6EF8026D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 11:22:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DA6EF8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FkBXPFB+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673605369; x=1705141369;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CDcpGc14MxwljMRrNGGaJzjMrvUpcw8OYXg9rqQznUQ=;
 b=FkBXPFB+I8bwpy02Vzyq887AgNLI0Z49+0nZzTjSxigyqAMkotRgpXYI
 Rj/ZU1YU5EgxIgGnQkaQmKsldi84pI1S0+JtDwIpf2b7Vme0+NCAz83zn
 W9+6g9rr+H6U/CtKUPcgktjrUVGVHYS3GXf4L+Udu/u16Jr9/YXrhJB81
 +AMaY4SQ2Q3gtrbQoUcw2+57vhkwtKGSWBnIVL02Zznhm7HUbdNjtA2Nu
 e7pOnimq4U+aAQg8RMfOsK547uzdBpeWMHoQ7J1cmQsIVBi0cZWSBGVYx
 CLHgaA7kDEKoqnvIvMFZo73NbCtKvNQaeG4nNc2vhr95i7gBvmIh20o5d g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="324024195"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="324024195"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 02:22:34 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="721473464"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="721473464"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 02:22:32 -0800
Message-ID: <d2c6f43a-e166-a201-4662-ba726347f2da@linux.intel.com>
Date: Fri, 13 Jan 2023 11:22:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/5] soundwire: stream: uniquify dev_err() logs
Content-Language: en-US
To: Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org, 
 vkoul@kernel.org
References: <20230113093532.3872113-1-yung-chuan.liao@linux.intel.com>
 <20230113093532.3872113-2-yung-chuan.liao@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230113093532.3872113-2-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com, vinod.koul@linaro.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 1/13/2023 10:35 AM, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> There are a couple of duplicate logs which makes harder than needed to
> follow the error flows. Add __func__ or make the log unique.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>   drivers/soundwire/stream.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index df3b36670df4..e0eae0b98267 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1389,7 +1389,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
>   
>   	ret = do_bank_switch(stream);
>   	if (ret < 0) {
> -		dev_err(bus->dev, "Bank switch failed: %d\n", ret);
> +		dev_err(bus->dev, "do_bank_switch failed: %d\n", ret);
>   		goto restore_params;
>   	}

This one seems bit unrelated to the change and makes error message 
inconsistent with:
https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git/tree/drivers/soundwire/stream.c?h=next&id=545c365185a47672b1d5cc13c84057a1e874993c#n1498
and
https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git/tree/drivers/soundwire/stream.c?h=next&id=545c365185a47672b1d5cc13c84057a1e874993c#n1575
which actually brings me to another suggestion, can this error message 
perhaps be just moved into do_bank_switch() function itself, instead of 
being duplicated multiple times or alternatively just also prefix all of 
them with function name?

