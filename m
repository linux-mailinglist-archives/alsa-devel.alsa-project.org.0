Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F2A8BFE66
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 15:17:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95B85E94;
	Wed,  8 May 2024 15:17:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95B85E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715174278;
	bh=w+yqx0L73Rw5gOHQQ+B8HtBku2W//pUToQXNgXyM9nQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XfTkf2WDKQU8z4IgkwBtAg4WkUQWSSxdgXn675atGppJbnFVHhKDHnVvi3c2N9mSe
	 1v9OXy0CoYfZvj8soiGq8TFZYA4jxCFYKt7thQow8qWBhRZ4+FBbQgZq/7wWSokqo2
	 fbc4cjGNIs1tlqfYANtGtsl6Uy2GfypVqlGSzN3w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FB7DF8063D; Wed,  8 May 2024 15:16:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69875F8063E;
	Wed,  8 May 2024 15:16:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 802C5F805B1; Wed,  8 May 2024 15:16:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F328F8057A
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 15:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F328F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jvoP4SYg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715174179; x=1746710179;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=w+yqx0L73Rw5gOHQQ+B8HtBku2W//pUToQXNgXyM9nQ=;
  b=jvoP4SYgZuJKAvd4K6NqGx/8qXHll2X/0KcwgAwqd2o2WUDz527+K3uu
   ilKHqNxN7vkASsO+OBYGYf1ovno4wfjIvXQ8lnboxMjiQES5zD4dCEAkc
   w1SRqWfeNh7KeF0mIUqlxL/BWotNF39F9hF7MEI1KW5OLZRHXoWTvFIio
   TPAy5278gojD6dhf8LJ2Lh1HcDCJN5TQHbQftxjgXuwrX3umrj5G++MrT
   2UjLVxofzxMQhFQmKSnJxBMKhR3l89XD5Myz8DsAxT+4Sj/2jg90V5bmK
   id/uQ8irvW81G0Xj81BDztaXM8aS4iOiHwRTSr111EMbVrILA1ceEkX+F
   A==;
X-CSE-ConnectionGUID: ew+5iqQvSrSaLKQSoWpYzA==
X-CSE-MsgGUID: E12xHKsjQUms6xsT9RBYIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36413259"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000";
   d="scan'208";a="36413259"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:16:16 -0700
X-CSE-ConnectionGUID: qvfIbtIxQJKu8CEdUpwLzQ==
X-CSE-MsgGUID: zrr7iwQZQ9+qWMTGxnuokw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000";
   d="scan'208";a="33356785"
Received: from sskolar-mobl.amr.corp.intel.com (HELO [10.212.67.115])
 ([10.212.67.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:16:14 -0700
Message-ID: <875b643f-af2c-4a1b-87e8-80cd6f236dea@linux.intel.com>
Date: Tue, 7 May 2024 16:23:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 26/39] ASoC: qcom: qdsp6: Add support to track
 available USB PCM devices
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
 krzk+dt@kernel.org, gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
 broonie@kernel.org, bgoswami@quicinc.com, tiwai@suse.com,
 bagasdotme@gmail.com, robh@kernel.org, konrad.dybcio@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240507195116.9464-1-quic_wcheng@quicinc.com>
 <20240507195116.9464-27-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240507195116.9464-27-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BNHORLOXH6QHVND4BWVAB4GBUBBJQWDM
X-Message-ID-Hash: BNHORLOXH6QHVND4BWVAB4GBUBBJQWDM
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BNHORLOXH6QHVND4BWVAB4GBUBBJQWDM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> @@ -113,6 +120,12 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
>  	if (connected) {
>  		/* We only track the latest USB headset plugged in */
>  		data->active_usb_chip_idx = sdev->card_idx;
> +
> +		set_bit(sdev->card_idx, &data->available_card_slot);
> +		data->status[sdev->card_idx].sdev = sdev;

Not following the 'only track the latest USB headset plugged in', I
don't see anything that discard the previously latest headset...

If you plug headset1, then headset2, how is headset1 marked as not
available for USB offload?

> +	} else {
> +		clear_bit(sdev->card_idx, &data->available_card_slot);
> +		data->status[sdev->card_idx].sdev = NULL;
>  	}
>  
>  	return 0;
