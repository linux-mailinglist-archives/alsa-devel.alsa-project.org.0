Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8911B60FD
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 18:32:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8284B16A4;
	Thu, 23 Apr 2020 18:31:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8284B16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587659561;
	bh=gCFTW3c9HRk5DgY0KUJIKGjVJ7efRmARh3nAj/vc9hY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V4uucvdWyPtrj9+LciI156tqFo0WiAuU5pRefoLR6pwEwY7TRrAKssz5iAoLySEzJ
	 fsi0GO8ADKG45F3VL5517SjDT3g8uieao+DfESJUGpDgXEShhxJhaTZaiXNkjtTFpR
	 eujOrjXRKU8u9RwxhiqpXCpYTPeCcUZqeHKGD4bk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 999A9F8028B;
	Thu, 23 Apr 2020 18:30:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 406A2F801ED; Thu, 23 Apr 2020 18:30:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CA60F800F2
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 18:30:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CA60F800F2
IronPort-SDR: sgJvIe0qqU484fzaJatnUHt4CcHoVpGgA4EMqoiu7CE204Fqx4jllu1Ov8pguMUSRe72SwNdy5
 9p/3YQo/l63w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 09:30:06 -0700
IronPort-SDR: t6eNuzXADWSkWXujuF4qJtxrE8xQ8kQWtALD7r3L2Zg/x8zY69+nV7SkUqjSSAXU+XXNL4sY6W
 bqImTkgh/wfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; d="scan'208";a="256040289"
Received: from lsatpatx-mobl.gar.corp.intel.com (HELO [10.251.150.156])
 ([10.251.150.156])
 by orsmga003.jf.intel.com with ESMTP; 23 Apr 2020 09:30:06 -0700
Subject: Re: [PATCH v3 3/3] ASoC: Intel: Skylake: Automatic DMIC format
 configuration according to information from NHLT
To: Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200423111148.6977-1-mateusz.gorski@linux.intel.com>
 <20200423111148.6977-4-mateusz.gorski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <553f82d4-625d-b4d7-6663-2e01fd300eaa@linux.intel.com>
Date: Thu, 23 Apr 2020 10:53:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423111148.6977-4-mateusz.gorski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, broonie@kernel.org, tiwai@suse.com
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


> @@ -3124,12 +3141,15 @@ static int skl_tplg_control_load(struct snd_soc_component *cmpnt,
>   	case SND_SOC_TPLG_CTL_ENUM:
>   		tplg_ec = container_of(hdr,
>   				struct snd_soc_tplg_enum_control, hdr);
> -		if (kctl->access & SNDRV_CTL_ELEM_ACCESS_READWRITE) {
> +		if (kctl->access & SNDRV_CTL_ELEM_ACCESS_READ) {
>   			se = (struct soc_enum *)kctl->private_value;
>   			if (tplg_ec->priv.size)
> -				return skl_init_enum_data(bus->dev, se,
> -						tplg_ec);
> +				skl_init_enum_data(bus->dev, se, tplg_ec);
>   		}

I finally got the explanations and it wouldn't hurt to have a comment here:

/*
  * now that the initializations are done, remove write permissions for
  *  the DMIC to avoid conflicts between NHLT settings and user
  * interaction
  */

> +		if (hdr->ops.get == SKL_CONTROL_TYPE_MULTI_IO_SELECT_DMIC)
> +			kctl->access = SNDRV_CTL_ELEM_ACCESS_READ;
> +

