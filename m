Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5109C123612
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 20:56:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6C2F852;
	Tue, 17 Dec 2019 20:55:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6C2F852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576612599;
	bh=O7y+tdvYPV3qfygBuyOCScOwF40co0D2S6mSm5PZd9Q=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PpYp8J81ZnOWYTKd9RjxlDAsVQMXEAx93oLgBl6SUOnvJGkfU6iZOD8cOMiyRW0tR
	 aEcbp7HIViwei0WaIa61GyahTiVVmVnxZLBq48Tw3NcMP9C3dYJ1ldlDlSjHZHDkU2
	 nnsHyzrpPh1fDMtNlYG0Iqy9sNvvRMM4ABJ6RH0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A422F8025A;
	Tue, 17 Dec 2019 20:54:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFC3EF8025A; Tue, 17 Dec 2019 20:54:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CEC7F80100
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 20:54:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CEC7F80100
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 11:54:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; d="scan'208";a="389942463"
Received: from vramados-mobl.amr.corp.intel.com (HELO [10.254.1.250])
 ([10.254.1.250])
 by orsmga005.jf.intel.com with ESMTP; 17 Dec 2019 11:54:02 -0800
To: Daniel Mack <daniel@zonque.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-12-daniel@zonque.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0565e5cd-9a6e-db65-0632-0bc1aa1d79db@linux.intel.com>
Date: Tue, 17 Dec 2019 13:28:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191209183511.3576038-12-daniel@zonque.org>
Content-Language: en-US
Cc: lars@metafoo.de, sboyd@kernel.org, mturquette@baylibre.com,
 robh+dt@kernel.org, broonie@kernel.org, pascal.huerst@gmail.com,
 lee.jones@linaro.org
Subject: Re: [alsa-devel] [PATCH 10/10] ASoC: Add codec component for AD242x
 nodes
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



On 12/9/19 12:35 PM, Daniel Mack wrote:
> This driver makes AD242x nodes available as DAIs in ASoC topologies.
> 
> The hardware allows multiple TDM channel modes and bitdepths, but
> as these modes have influence in the timing calculations at discovery
> time, the mode in that the will be used in needs to be configured

the mode in that the <what> will be used in?

You should probably reword this for clarity.

> statically in the devicetree.

> +	if (ad242x_node_is_master(priv->node) &&
> +	   ((format & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBS_CFS)) {
> +		dev_err(component->dev, "master node must be clock slave\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!ad242x_node_is_master(priv->node) &&
> +	   ((format & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBM_CFM)) {
> +		dev_err(component->dev, "slave node must be clock master\n");
> +		return -EINVAL;
> +	}

It was my understanding that the master node provides the clock to the 
bus, so not sure how it could be a clock slave, and conversely how a 
slave node could provide a clock to the bus?


> +	switch (params_format(params)) {
> +	case SNDRV_PCM_FORMAT_S16_LE:
> +		if (priv->node->tdm_slot_size != 16)
> +			return -EINVAL;
> +		break;
> +	case SNDRV_PCM_FORMAT_S32_LE:
> +		if (priv->node->tdm_slot_size != 32)
> +			return -EINVAL;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}

how does this work for PDM data?

is the PDM data packed into a regular TDM slot?

> +
> +	if (priv->pdm[index]) {
> +		if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
> +			return -EINVAL;
> +
> +		if (index == 0) {
> +			val = AD242X_PDMCTL_PDM0EN;
> +			mask = AD242X_PDMCTL_PDM0EN | AD242X_PDMCTL_PDM0SLOTS;
> +		} else {
> +			val = AD242X_PDMCTL_PDM1EN;
> +			mask = AD242X_PDMCTL_PDM1EN | AD242X_PDMCTL_PDM1SLOTS;
> +		}
> +
> +		switch (params_channels(params)) {
> +		case 1:
> +			break;
> +		case 2:
> +			val = mask;
> +			break;

A comment wouldn't hurt here...

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
