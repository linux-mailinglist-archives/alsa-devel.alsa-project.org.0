Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 254298BFE61
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 15:17:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0A06F55;
	Wed,  8 May 2024 15:17:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0A06F55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715174257;
	bh=E0Uv0/y9SRIfHmzAsDzPPoXeAyXGIWKGuhPGfCi6mjU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gkn+yLEWql1Vjnq48F2vbucNTL2SHnqDQc1imb2LjyRzg6hF0GPlIEnarJzjcJjP3
	 pf5FI4RwVOwZ8ZNhLWtMsx7L62ebP28cps++/iC27wGVtcJzkIXjkGKvxlg7ZCXrIL
	 TZd5cekz2noyN3lvfh3zPaXkmqioBArpoICkSKOY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5928AF8060F; Wed,  8 May 2024 15:16:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBDF8F805F7;
	Wed,  8 May 2024 15:16:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1C63F8049C; Wed,  8 May 2024 15:16:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C1FDF80423
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 15:16:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C1FDF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EhYyswkM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715174175; x=1746710175;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=E0Uv0/y9SRIfHmzAsDzPPoXeAyXGIWKGuhPGfCi6mjU=;
  b=EhYyswkM9C41OjzSgEKJDi1iJ/pl0jXavaGjg7iZH7BDnD76+QDHs7Ha
   ketAaJ0ALRiJNMOdNi4PCDSxBiHFjeZ+BXfs0aUDoxztlusnrh8RdP6Ep
   wIaznkuxEsSv5DjKH5SJj/AFJIGRAa+tOF3RlTumFRmi71rd0T6FWZ8Sq
   n5SrYPmAaOl3RS2JyFBcRr/N1ilkvJZBFu+9xr7FNlzU6A/XlwZ65vS6D
   1Skwf6v+yqsJrMuRgY2n1FihpWO4qlPgjQpPKfNodubKgDbqVaAN95bS7
   Ni1td1ZUwjWtDdyAthp71Ul9DEzgLFWfDCAsecLT3rFXY9zJv+4g7FVBZ
   Q==;
X-CSE-ConnectionGUID: r18611DSRtiU9+r8EEbwRA==
X-CSE-MsgGUID: 9sYe2f2XQPu8f0Pg1BILlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36413230"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000";
   d="scan'208";a="36413230"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:16:12 -0700
X-CSE-ConnectionGUID: mCAmmzivQ0mn329nFX4BOA==
X-CSE-MsgGUID: v9h/yVhhSMS2DKmDnbBcNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000";
   d="scan'208";a="33356756"
Received: from sskolar-mobl.amr.corp.intel.com (HELO [10.212.67.115])
 ([10.212.67.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:16:10 -0700
Message-ID: <84dc55a6-22d6-4d4f-8bce-62fa4e37702b@linux.intel.com>
Date: Tue, 7 May 2024 15:39:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 11/39] ASoC: qcom: qdsp6: Add USB backend ASoC driver
 for Q6
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
 <20240507195116.9464-12-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240507195116.9464-12-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RTZKWCRWVLJW4KVYLNPUEP5SXKVIX6EW
X-Message-ID-Hash: RTZKWCRWVLJW4KVYLNPUEP5SXKVIX6EW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RTZKWCRWVLJW4KVYLNPUEP5SXKVIX6EW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +config SND_SOC_QDSP6_USB
> +    tristate "SoC ALSA USB offloading backing for QDSP6"
> +    depends on SND_SOC_USB
> +    help
> +      Adds support for USB offloading for QDSP6 ASoC
> +      based platform sound cards.  This will enable the
> +      Q6USB DPCM backend DAI link, which will interact
> +      with the SoC USB framework to initialize a session
> +      with active USB SND devices.

If this is set to 'n', don't you have a risk of the FE DAIs exposed in
patch 9 not being connected to anything?
