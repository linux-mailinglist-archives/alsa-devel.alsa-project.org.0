Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 339328AF77
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 08:13:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 982A61654;
	Tue, 13 Aug 2019 08:12:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 982A61654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565676799;
	bh=GwNTKcWKAP7SCXIy5VQIKTg3SwnnDmkDCn884LuBo8k=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ATbk5Y6Cm3ekWLx3ScEPQybrU16l3hwyl9yPJWUSDkh2iSgwgbRRPojxxzo7Ovr/Y
	 +Kd71BQArErIepcGgLA0SCeF/24a/W2UuUgRDmhBm6dN6VYak1CPN8kkeeLjpuHHbT
	 N+F8BbVHCgspuh2S4L1QGmEFHNg4i+ugUSf8JsdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33BCDF80290;
	Tue, 13 Aug 2019 08:11:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09F05F80290; Tue, 13 Aug 2019 08:11:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 432DDF8015A
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 08:11:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 432DDF8015A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Aug 2019 23:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,380,1559545200"; d="scan'208";a="351443701"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.1.116])
 ([10.252.1.116])
 by orsmga005.jf.intel.com with ESMTP; 12 Aug 2019 23:11:45 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20190812140305.17570-1-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <a90318b5-3074-ecbf-f06e-872242610e2d@intel.com>
Date: Tue, 13 Aug 2019 08:11:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812140305.17570-1-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 kbuild test robot <lkp@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: hsw: remove i386 build
 warning w/ size_t argument
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

On 2019-08-12 16:03, Pierre-Louis Bossart wrote:
> Recent changes in the common IPC code introduced a build warning with
> size_t fields, use the correct %zu format.
> 
> include/linux/dynamic_debug.h:82:16: warning: format '%lu' expects
> argument of type 'long unsigned int', but argument 4 has type 'size_t'
> [-Wformat=]
> 
> Fixes: abf31feea26c0 ('ASoC: Intel: Update request-reply IPC model')
> Reported-by: kbuild test robot <lkp@intel.com>
> Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   sound/soc/intel/haswell/sst-haswell-ipc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/haswell/sst-haswell-ipc.c b/sound/soc/intel/haswell/sst-haswell-ipc.c
> index 5c73b11375e3..0ff89ea96ccf 100644
> --- a/sound/soc/intel/haswell/sst-haswell-ipc.c
> +++ b/sound/soc/intel/haswell/sst-haswell-ipc.c
> @@ -2015,11 +2015,11 @@ int sst_hsw_module_set_param(struct sst_hsw *hsw,
>   
>   	if (payload_size <= SST_HSW_IPC_MAX_SHORT_PARAMETER_SIZE) {
>   		/* short parameter, mailbox can contain data */
> -		dev_dbg(dev, "transfer parameter size : %lu\n",
> +		dev_dbg(dev, "transfer parameter size : %zu\n",
>   			request.size);
>   
>   		request.size = ALIGN(payload_size, 4);
> -		dev_dbg(dev, "transfer parameter aligned size : %lu\n",
> +		dev_dbg(dev, "transfer parameter aligned size : %zu\n",
>   			request.size);
>   
>   		parameter = kzalloc(request.size, GFP_KERNEL);
> 

Acked-By: Cezary Rojewski <cezary.rojewski@intel.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
