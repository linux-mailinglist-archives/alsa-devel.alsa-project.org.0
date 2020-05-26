Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 100811E2594
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 17:36:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 856111753;
	Tue, 26 May 2020 17:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 856111753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590507412;
	bh=cqBGleS9HAL6/9etd6lk+f2gmFjYau37XTvsBVdn4uU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=otqgebjiZLia0XRIti+hIpv1lyqmM2MO9eZY2HZldIsnZNuxy71qBHGT55sgsprxB
	 RCsDfJ/JQhe5cAXQH+wAmmiMCkhbWVfHLIq1ttcePCImL4bmRU7jGv3+HoHpCa12tD
	 Rw1gZh+KX5yDXJyaMuvYo/s7tg3GXTWzOzR13CcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85DC1F8015D;
	Tue, 26 May 2020 17:35:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0652EF80131; Tue, 26 May 2020 17:35:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 393AFF80131
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 17:35:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 393AFF80131
IronPort-SDR: Ek2s5izYF+J5U4TBfflL1DCuq+HWU1kQsxgghOVMu9k+VeThIPylCy8ywJFBMYaLHF4L15fHzT
 P92lHrRG6lzw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 08:34:58 -0700
IronPort-SDR: TN5+3JgQvkZsl+te3qpnFMymhcJOiGLgqzwCX0HYuGRWB1PS0ilM83NsiGKythrEDG/n5LfGZi
 V63i28NHf6cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; d="scan'208";a="291234586"
Received: from unknown (HELO [10.254.102.121]) ([10.254.102.121])
 by fmsmga004.fm.intel.com with ESMTP; 26 May 2020 08:34:56 -0700
Subject: Re: [PATCH] ASoC: Intel: sst: Fix runtime PM imbalance in
 sst_power_control
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
References: <20200525070701.3888-1-dinghao.liu@zju.edu.cn>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <922ac37c-0a5a-dff7-0cd7-d3487cf9ff00@linux.intel.com>
Date: Tue, 26 May 2020 08:25:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200525070701.3888-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
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



On 5/25/20 2:06 AM, Dinghao Liu wrote:
> When sst_load_fw() returns an error code, a pairing runtime
> PM usage counter decrement is needed to keep the counter
> balanced.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>   sound/soc/intel/atom/sst/sst_drv_interface.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/intel/atom/sst/sst_drv_interface.c b/sound/soc/intel/atom/sst/sst_drv_interface.c
> index 762495385d5c..3897985b254f 100644
> --- a/sound/soc/intel/atom/sst/sst_drv_interface.c
> +++ b/sound/soc/intel/atom/sst/sst_drv_interface.c
> @@ -150,6 +150,7 @@ static int sst_power_control(struct device *dev, bool state)
>   		if ((ctx->sst_state == SST_RESET) && (usage_count == 1)) {
>   			ret = sst_load_fw(ctx);
>   			if (ret) {
> +				pm_runtime_put_sync(dev);
>   				dev_err(dev, "FW download fail %d\n", ret);
>   				sst_set_fw_state_locked(ctx, SST_RESET);
>   				ret = sst_pm_runtime_put(ctx);

this change doesn't seem quite right, if you look the code below there 
is no PM imbalance, is there?

int sst_pm_runtime_put(struct intel_sst_drv *sst_drv)
{
	int ret;

	pm_runtime_mark_last_busy(sst_drv->dev);
	ret = pm_runtime_put_autosuspend(sst_drv->dev);
	if (ret < 0)
		return ret;
	return 0;
}

