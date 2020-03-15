Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 586CA185FA8
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Mar 2020 21:07:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4019187E;
	Sun, 15 Mar 2020 21:06:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4019187E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584302819;
	bh=7orrgjujETggp+OERofJStzAcTRtMFusOqWDB767FOc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vgu2pSVBWfs9iVraRy2o1zs+6PQ4KsoCHwslWB9U60ef64fsuYjG++sL4up7LXlS2
	 pC3EzcG0GOd0l5ApvHV0T/7ZW1RrW1FPa9q2zHj7fFzWaZCfTRh6UIRvHyk7dsiomW
	 F4VuFKt/fMICnKF0g7Grb5KCGWq8aTZgui3M5Fnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96949F8013D;
	Sun, 15 Mar 2020 21:05:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C61B5F8022B; Sun, 15 Mar 2020 21:05:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6881FF8013D
 for <alsa-devel@alsa-project.org>; Sun, 15 Mar 2020 21:05:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6881FF8013D
IronPort-SDR: 1bguplLPgwJJ7q/Mxz+gWA6Sy7SEYT3pq1ISd9pcyhNIb4loMuxwiAvLwF6/YvFWSQNT4BBGJJ
 0Cl/Lvqk85Rw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2020 13:05:06 -0700
IronPort-SDR: snUymknbCVk7rEjEEizyXyuG9lVkHcMmdw4Jt8Fe+TDe/LXIZ1tuS2duUT2M792RYE2DzPyhuP
 TLXuE3/GxnCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,557,1574150400"; d="scan'208";a="267346874"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.249.138.187])
 ([10.249.138.187])
 by fmsmga004.fm.intel.com with ESMTP; 15 Mar 2020 13:05:04 -0700
Subject: Re: [PATCH v2 05/10] ASoC: codecs: hdac_hdmi: (cosmetic) remove
 redundant variable initialisations
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200312194859.4051-1-pierre-louis.bossart@linux.intel.com>
 <20200312194859.4051-6-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <d4f6dd03-3580-3301-9a35-7226f893e316@intel.com>
Date: Sun, 15 Mar 2020 21:05:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312194859.4051-6-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org
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

On 2020-03-12 20:48, Pierre-Louis Bossart wrote:
> From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> 
> Remove several redundant variable initialisations.
> 
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   sound/soc/codecs/hdac_hdmi.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
> index e6558475e006..fba9b749839d 100644
> --- a/sound/soc/codecs/hdac_hdmi.c
> +++ b/sound/soc/codecs/hdac_hdmi.c
> @@ -1998,11 +1998,11 @@ static struct hdac_hdmi_drv_data intel_drv_data  = {
>   
>   static int hdac_hdmi_dev_probe(struct hdac_device *hdev)
>   {
> -	struct hdac_hdmi_priv *hdmi_priv = NULL;
> +	struct hdac_hdmi_priv *hdmi_priv;
>   	struct snd_soc_dai_driver *hdmi_dais = NULL;
> -	struct hdac_ext_link *hlink = NULL;
> +	struct hdac_ext_link *hlink;
>   	int num_dais = 0;
> -	int ret = 0;
> +	int ret;
>   	struct hdac_driver *hdrv = drv_to_hdac_driver(hdev->dev.driver);
>   	const struct hda_device_id *hdac_id = hdac_get_device_id(hdev, hdrv);
>   
> 

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
