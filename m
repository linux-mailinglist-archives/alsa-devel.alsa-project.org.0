Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6743E19CB3D
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Apr 2020 22:33:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1ABF1677;
	Thu,  2 Apr 2020 22:32:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1ABF1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585859604;
	bh=ZQu1QiC5d9TXORHqfYfzjYnJXgtEGE8BVGujGIahxC0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FwSrASNDZY1q0GgeGGODD1FVvz3/YxgV/QB5lN6OC1BCZgZrRWhIhbGNcLO5YARws
	 0nZx4ZT1yveLvYK81kqrfVUo1k50X7nB4N/y3sA82DIa972anv5N5F7EDEnkl52WTI
	 vtkEx8xPmNabbWhvvGs5jxOjUGdVNH+YkXS9SfXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4BEBF80088;
	Thu,  2 Apr 2020 22:31:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77BF5F80148; Thu,  2 Apr 2020 22:31:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0AC5F80141
 for <alsa-devel@alsa-project.org>; Thu,  2 Apr 2020 22:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0AC5F80141
IronPort-SDR: S4N4N57ctEzZQuezsQCAYZe8u6DugjB4WQpozsTFy5ih3nd5hkpAP0ncbMfVceYTmkzdCL2qn8
 ygF6u+Xnq8sA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 13:31:30 -0700
IronPort-SDR: Hw5/QWIvevi9xvDX7fIP2rZj/mHkV/9PygX5vggfTFpc3YUF0udJXsvJhf1E9YgbbMVPkxB+va
 UyAjN3xGLnPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,336,1580803200"; d="scan'208";a="273699353"
Received: from lmbraun-mobl.amr.corp.intel.com (HELO [10.212.35.219])
 ([10.212.35.219])
 by fmsmga004.fm.intel.com with ESMTP; 02 Apr 2020 13:31:29 -0700
Subject: Re: [PATCH 1/3] ASoC: Intel: atom: Take the drv->lock mutex before
 calling sst_send_slot_map()
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 flove@realtek.com, shumingf@realtek.com, Oder Chiou <oder_chiou@realtek.com>
References: <20200402185359.3424-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6e3cd412-cfbb-3ad7-46ed-225c2781cef2@linux.intel.com>
Date: Thu, 2 Apr 2020 14:25:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200402185359.3424-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
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



On 4/2/20 1:53 PM, Hans de Goede wrote:
> sst_send_slot_map() uses sst_fill_and_send_cmd_unlocked() because in some
> places it is called with the drv->lock mutex already held.
> 
> So it must always be called with the mutex locked. This commit adds missing
> locking in the sst_set_be_modules() code-path.
> 
> Fixes: 24c8d14192cc ("ASoC: Intel: mrfld: add DSP core controls")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

2014 bug, nice!

for the series:

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/intel/atom/sst-atom-controls.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
> index baef461a99f1..2c3798034b1d 100644
> --- a/sound/soc/intel/atom/sst-atom-controls.c
> +++ b/sound/soc/intel/atom/sst-atom-controls.c
> @@ -966,7 +966,9 @@ static int sst_set_be_modules(struct snd_soc_dapm_widget *w,
>   	dev_dbg(c->dev, "Enter: widget=%s\n", w->name);
>   
>   	if (SND_SOC_DAPM_EVENT_ON(event)) {
> +		mutex_lock(&drv->lock);
>   		ret = sst_send_slot_map(drv);
> +		mutex_unlock(&drv->lock);
>   		if (ret)
>   			return ret;
>   		ret = sst_send_pipe_module_params(w, k);
> 
