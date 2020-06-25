Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABAE20A1A6
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 17:15:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3CA118F5;
	Thu, 25 Jun 2020 17:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3CA118F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593098152;
	bh=g3wEtXcTWw4jtIMW/CFZL6hYhOPK2eRx2ZuID/7rWuA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tmiCeU7kiBgD8rlp6ZUP1B/ZWBW1ZUIXf5vmnE/HKXggEnLccFrWizn6KD4b7hfpG
	 BWVR/ELnZU7Ik49TMJVDJSAvbLD7G2/s42O63AviCy5ZXwpOCTKzuQe0tSXn0+xwXw
	 gEJSevpkoPwjJtTI9wuwiYl4JL6NHmHAo+F23D+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EED8FF80259;
	Thu, 25 Jun 2020 17:13:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CF15F80249; Thu, 25 Jun 2020 17:13:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1839F80158
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 17:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1839F80158
IronPort-SDR: f+ciV5+QTRPRiwBNpuyysfV8V3AEwVdXWxa0J8o3EvS+GYMm0l3FDvjZJdVNnuarE+uBuVT9oT
 JmQK0XcpNMqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="163016151"
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="163016151"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 08:13:10 -0700
IronPort-SDR: 4hBdhkJHIrKKNnInzMfHsnDfzUHF/y/UmbYDGaA4quMRGJHkGg0lZBrTtjorZMRTJVU6eRkVA/
 ZIUAeX9k79fA==
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="279835691"
Received: from jmgutiex-mobl.amr.corp.intel.com (HELO [10.251.16.15])
 ([10.251.16.15])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 08:13:09 -0700
Subject: Re: [PATCH alsa-lib 2/8] topology: decode: Fix adding texts field to
 enum control
To: Piotr Maziarz <piotrx.maziarz@linux.intel.com>, alsa-devel@alsa-project.org
References: <1593083026-7501-1-git-send-email-piotrx.maziarz@linux.intel.com>
 <1593083026-7501-2-git-send-email-piotrx.maziarz@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f57d945d-909d-3e86-eeeb-44bbfaaa2cab@linux.intel.com>
Date: Thu, 25 Jun 2020 09:24:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1593083026-7501-2-git-send-email-piotrx.maziarz@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, amadeuszx.slawinski@intel.com
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



On 6/25/20 6:03 AM, Piotr Maziarz wrote:
> Iterating over texts in tplg_decode_control_enum1 was an infinite loop,

that should probably be a separate fix?

> it needed to be fixed. Parsing values was removed since they are not added
> to the UML file.

What does this mean? first time I hear about UML for topology.

> Also texts are separate section and therefore it needs to be added as
> separate element.

separate patch?

> Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
> ---
>   src/topology/ctl.c | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/src/topology/ctl.c b/src/topology/ctl.c
> index c8c7e94..24eadc8 100644
> --- a/src/topology/ctl.c
> +++ b/src/topology/ctl.c
> @@ -1088,11 +1088,19 @@ int tplg_add_enum(snd_tplg_t *tplg, struct snd_tplg_enum_template *enum_ctl,
>   	}
>   
>   	if (enum_ctl->texts != NULL) {
> +		struct tplg_elem *texts = tplg_elem_new_common(tplg, NULL,
> +						enum_ctl->hdr.name, SND_TPLG_TYPE_TEXT);
> +
> +		texts->texts->num_items = num_items;
>   		for (i = 0; i < num_items; i++) {
> -			if (enum_ctl->texts[i] != NULL)
> -				snd_strlcpy(ec->texts[i], enum_ctl->texts[i],
> -					    SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
> +			if (!enum_ctl->texts[i])
> +				continue;
> +			snd_strlcpy(ec->texts[i], enum_ctl->texts[i],
> +				    SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
> +			snd_strlcpy(texts->texts->items[i], enum_ctl->texts[i],
> +				    SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
>   		}
> +		tplg_ref_add(elem, SND_TPLG_TYPE_TEXT, enum_ctl->hdr.name);
>   	}
>   
>   	if (enum_ctl->values != NULL) {
> @@ -1367,11 +1375,8 @@ int tplg_decode_control_enum1(snd_tplg_t *tplg,
>   		et->texts = tplg_calloc(heap, sizeof(char *) * ec->items);
>   		if (!et->texts)
>   			return -ENOMEM;
> -		for (i = 0; ec->items; i++) {
> -			unsigned int j = i * sizeof(int) * ENUM_VAL_SIZE;
> +		for (i = 0; i < ec->items; i++)

This is the infinite loop, this should not be buried in unrelated changes.

>   			et->texts[i] = ec->texts[i];
> -			et->values[i] = (int *)&ec->values[j];
> -		}
>   	}
>   
>   	et->map = tplg_calloc(heap, sizeof(struct snd_tplg_channel_map_template));
> 
