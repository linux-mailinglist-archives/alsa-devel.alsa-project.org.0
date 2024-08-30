Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF27D965E38
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 12:14:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D7B8832;
	Fri, 30 Aug 2024 12:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D7B8832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725012873;
	bh=pc1q714dbUikwMjGYuDlSj2kVYqhqeoRjzc/gcNeW2o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e+ZoZ8JR0J+SGfQ+82tsGqIxPymhY48OEbtUWPArBxA+IxpwjYC/jqS2NhDcA4ULF
	 ghJ3zWv143zueIEPFznWzm/RqRpttIrzfTcdh2ibbapxzs16rLilRXt3a24kur4ups
	 IqLRmrhxmQRc/x+hOuUuOXXj8wx6mt80GV0hlotU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1521AF806C9; Fri, 30 Aug 2024 12:12:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49ED8F806BD;
	Fri, 30 Aug 2024 12:12:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEF24F805D4; Fri, 30 Aug 2024 12:12:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CAF5CF805CA
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 12:12:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAF5CF805CA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XqhjvCOs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012744; x=1756548744;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pc1q714dbUikwMjGYuDlSj2kVYqhqeoRjzc/gcNeW2o=;
  b=XqhjvCOsxF7rpy38ZUU1lmIeu+rvXZQ5vOwjrx/SLQ4+jiBwnb8WVxDN
   +2lyH4GySr8HKV2o4UmOOULEgkhJEVYvy9qT3VkojytmX8c91+Y3fuJfm
   gVGtT4XeTnTdKpPVWhfVLVv1uhSDYm7INjQ77EBtbIpYz2hGdprsD51KO
   L3m+RxMLvPJ3ZS7I2kmjCLcwvKo95GXuQ42zmrQxytF8InoNslIiCYPlD
   EpqtzWC4uc8aF4wSXTSsVo4rIiCnKkeCFbcrET6wWVATA4LzBf3moTnTw
   9C2TGmEeggecdPfR+2RbdU9G6rVR6nW2t30cTbUalxKAsMevo/bcHatVV
   g==;
X-CSE-ConnectionGUID: jeptiyCFQHq+qBSihyxKLg==
X-CSE-MsgGUID: s+q5V9oLQMe+8Hh6CYUrgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218860"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="34218860"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:12:22 -0700
X-CSE-ConnectionGUID: Oq/VD6neQaOi23JKF17flA==
X-CSE-MsgGUID: toAB1mXCROuwmz0s55/uLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="63481679"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101])
 ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:12:16 -0700
Message-ID: <edf2eb3b-e573-465c-b6d0-58bcca5079db@linux.intel.com>
Date: Fri, 30 Aug 2024 11:13:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 20/33] ASoC: qcom: qdsp6: q6afe: Increase APR timeout
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
 <20240829194105.1504814-21-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-21-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: G3OZI6PPLBWVYX7NHO5FZXQH5LHRQSHB
X-Message-ID-Hash: G3OZI6PPLBWVYX7NHO5FZXQH5LHRQSHB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G3OZI6PPLBWVYX7NHO5FZXQH5LHRQSHB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/29/24 21:40, Wesley Cheng wrote:
> For USB offloading situations, the AFE port start command will result in a
> QMI handshake between the Q6DSP and the main processor.  Depending on if
> the USB bus is suspended, this routine would require more time to complete,
> as resuming the USB bus has some overhead associated with it.  Increase the
> timeout to 3s to allow for sufficient time for the USB QMI stream enable
> handshake to complete.
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/qcom/qdsp6/q6afe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index 3ee6ff8a6bc3..b5b2af2ce50c 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -366,7 +366,7 @@
>  #define AFE_API_VERSION_SLOT_MAPPING_CONFIG	1
>  #define AFE_API_VERSION_CODEC_DMA_CONFIG	1
>  
> -#define TIMEOUT_MS 1000
> +#define TIMEOUT_MS 3000
>  #define AFE_CMD_RESP_AVAIL	0
>  #define AFE_CMD_RESP_NONE	1
>  #define AFE_CLK_TOKEN		1024

