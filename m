Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E455965E43
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 12:15:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3961843;
	Fri, 30 Aug 2024 12:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3961843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725012908;
	bh=cJ4zekY4nY/hrZXn6e6Oix0rkFFzk6yzaxUwLzAdoJM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VesZLdc/TQWY59T3JU0mBtDUOD/v3vaBDZujbT5vUPd+MKc7bQ7lhhMqpJleO8kV8
	 nAy0rjLtnKYnnMZzKw57KeE0WJs8DMqVv5408kyoCZswMUiRbXu6yKEl0dKLPp8qmK
	 nd06D62TSVuk0ugaAI+UvF/DDPoiV8pDyUVqB7oE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98D50F805EE; Fri, 30 Aug 2024 12:12:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84497F806E5;
	Fri, 30 Aug 2024 12:12:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA9CFF805FF; Fri, 30 Aug 2024 12:12:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BD39F805ED
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 12:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BD39F805ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DoJ+Au9a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012760; x=1756548760;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cJ4zekY4nY/hrZXn6e6Oix0rkFFzk6yzaxUwLzAdoJM=;
  b=DoJ+Au9aiwh34W7rrRfPsY5f3/6Ez1gwqR9LxbBqpf96TD/EaQVstjP4
   62MmPvXSZ3AEarbr27qFV3sbV891gCU/USBeM/wR+0lwSBNJIEhekBWOj
   nvMyJhkt9XbY5yKxl6aKxZYTQrHFCHR58yr684zhGu/HEvz8x+l4nWYKC
   ixr0+rwkM4Rsq+me/8Tg4VWcQXVNK+Go2O6bLn8T//4DrDRDDxAEmgk2D
   CPQrKXK1VSq9hFCCglwFH0It9HGhxBdy5qUC3X1r1AAnr5geeBnDC234s
   Gh8awfNvuRU1tEQ1uOt5XXX31dx6PAE/7GWadxHFTpgr5DCDynuEnjEAM
   g==;
X-CSE-ConnectionGUID: akf5jDhjT5GeyLfBxvBHOw==
X-CSE-MsgGUID: ZnSQl9rdSYW11d3bnHIM8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218892"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="34218892"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:12:38 -0700
X-CSE-ConnectionGUID: Cvjsu1XNRWO8wvK1K+mugw==
X-CSE-MsgGUID: gpSvdWLkRjKotyvtx6UTlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="63481752"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101])
 ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:12:32 -0700
Message-ID: <39e1e90e-116c-4f13-b223-84e6991c8a32@linux.intel.com>
Date: Fri, 30 Aug 2024 11:27:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 22/33] ASoC: qcom: qdsp6: Add headphone jack for
 offload connection status
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-23-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-23-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JCKLEVDER7IPEIPU3RQKP7KM6UMZRO3O
X-Message-ID-Hash: JCKLEVDER7IPEIPU3RQKP7KM6UMZRO3O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JCKLEVDER7IPEIPU3RQKP7KM6UMZRO3O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



>  		/* Selects the latest USB headset plugged in for offloading */
> +		if (data->hs_jack && list_empty(&data->devices))
> +			snd_jack_report(data->hs_jack->jack, SND_JACK_USB);
> +

with the list_empty check, this looks like only the first connected
headset will be handled, not the last?

>  		list_add_tail(&sdev->list, &data->devices);
>  	} else {
>  		list_del(&sdev->list);
> +
> +		if (data->hs_jack && list_empty(&data->devices))
> +			snd_jack_report(data->hs_jack->jack, 0);
>  	}
>  	mutex_unlock(&data->mutex);
>  
>  	return 0;
>  }
