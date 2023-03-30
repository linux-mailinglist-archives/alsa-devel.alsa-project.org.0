Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC906D0D9C
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 20:18:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0878C1EF;
	Thu, 30 Mar 2023 20:17:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0878C1EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680200298;
	bh=DDlJD1yl51bcJxZV5Y30drIZ7TqazWKau23GoVQ14dk=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qvPbjHlOn9kC/McJdMY9+aDAjyyDs1OE1SBqfXJa4+4oonGJOvK/WIchjJFVy9Z4K
	 CgLXlXDFydLNAxd0Bgsq/XJu7mFuz8OI/rPtsiie1sV3/pe9PghYPgTtJ5c559rcSs
	 GeMjYe8Aid3r2CzjiwBKBTo2y/E04SFk/MI+Kn3w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75B00F8024E;
	Thu, 30 Mar 2023 20:17:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1665F80272; Thu, 30 Mar 2023 20:17:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.0 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr
 [80.12.242.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37AAEF8021D
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 20:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37AAEF8021D
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id hwphptLXW6OWihwphpVejs; Thu, 30 Mar 2023 20:17:16 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 30 Mar 2023 20:17:16 +0200
X-ME-IP: 86.243.2.178
Message-ID: <d14d668b-f351-f6d3-fe85-aac0fcbfb11b@wanadoo.fr>
Date: Thu, 30 Mar 2023 20:17:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10] ASoC: tas2781: Add tas2781 driver
Content-Language: fr
To: Shenghao Ding <13916275206@139.com>, broonie@kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, pierre-louis.bossart@linux.intel.com
References: <20230329100107.8181-1-13916275206@139.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230329100107.8181-1-13916275206@139.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WIPSVG3MK2YZ2R7GS3S7MAYA4I2ZVPBX
X-Message-ID-Hash: WIPSVG3MK2YZ2R7GS3S7MAYA4I2ZVPBX
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: kevin-lu@ti.com, shenghao-ding@ti.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com, navada@ti.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WIPSVG3MK2YZ2R7GS3S7MAYA4I2ZVPBX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 29/03/2023 à 12:01, Shenghao Ding a écrit :
> Create tas2781 driver.
> 
> Signed-off-by: Shenghao Ding <13916275206@139.com>
> 
> ---
> Changes in v10:

[...]

Hi,

> +static void tasdevice_select_cfg_blk(void *pContext, int conf_no,
> +	unsigned char block_type)
> +{
> +	struct tasdevice_priv *tas_dev = (struct tasdevice_priv *) pContext;
> +	struct tasdevice_rca *rca = &(tas_dev->rcabin);
> +	struct tasdevice_config_info **cfg_info = rca->cfg_info;
> +	struct tasdev_blk_data **blk_data;
> +	int j, k, chn, chnend;
> +
> +	if (conf_no >= rca->ncfgs || conf_no < 0 || !cfg_info) {
> +		dev_err(tas_dev->dev, "conf_no should be not more than %u\n",
> +			rca->ncfgs);
> +		return;
> +	}
> +	blk_data =  cfg_info[conf_no]->blk_data;
> +
> +	for (j = 0; j < (int)cfg_info[conf_no]->real_nblocks; j++) {
> +		unsigned int length = 0, rc = 0;
> +
> +		if (block_type > 5 || block_type < 2) {
> +			dev_err(tas_dev->dev,
> +				"block_type should be in range from 2 to 5\n");
> +			break;
> +		}
> +		if (block_type != blk_data[j]->block_type)
> +			continue;
> +
> +		for (k = 0; k < (int)blk_data[j]->n_subblks; k++) {
> +			if (cfg_info[conf_no]->blk_data[j]->dev_idx) {

Just use "blk_data[j]->dev_idx"?

> +				chn = blk_data[j]->dev_idx - 1;
> +				chnend = blk_data[j]->dev_idx;
> +			} else {
> +				chn = 0;
> +				chnend = tas_dev->ndev;
> +			}

[...]

> +	/* Several kinds of dsp/algorithm firmwares can run on tas2781,
> +	 * the number and size of blk are not fixed and different among
> +	 * thest firmwares.

these?

CJ
