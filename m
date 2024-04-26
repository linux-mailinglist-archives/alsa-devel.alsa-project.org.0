Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E118B3855
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 15:25:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7980CE0D;
	Fri, 26 Apr 2024 15:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7980CE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714137928;
	bh=nkZWIXOQ8v3lhU9lnkLEQcsTys4fWZBE6NJ+JN8gKlM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dDYNBef42PDrUvlYkZ/LA9iahtHDZti340zPLbHvRh1XJyeu/J/9vizerB16ofhNa
	 vIRd6M5HMx7bl4XSiLyYNAANBzZwOOKgaOQjINFWFpjgUd+ybP5YxN1EHyKL/8Om3d
	 RIvJ4pCrOrHFhaCZvPq2ZmYWmYH4bqGJqBTFdLFI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6748DF80570; Fri, 26 Apr 2024 15:24:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B11FF8059F;
	Fri, 26 Apr 2024 15:24:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A903F80423; Fri, 26 Apr 2024 15:24:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16EE9F8003C
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 15:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16EE9F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nJGt6BVm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714137885; x=1745673885;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nkZWIXOQ8v3lhU9lnkLEQcsTys4fWZBE6NJ+JN8gKlM=;
  b=nJGt6BVmYonAGl1/S8sVOD+Te/QzjN6fXanFu0m/2b2R6cF6FDl1gaQq
   kcgXAMjQedGE69UTrWrTEFE9qHd8CWb30oz4cG5pSEQOBlrmmKgcsKxPZ
   yHaHy/9GLek9JRR5zUs+2iopEN4wo4KsR2tv74W0YFjSB/dsE8eVlTk04
   C1E7Yj1dOnZB+ly9PLNRRc4wATnsdnFtbzsxksieECSKWVSD7X9PNwX/I
   HQPc5P/kalT1q1SvdI0ImharsknoZbo18eiRZw4F0CGF4yNYyPZsv5t+y
   WinZAU5JozTCcTvUCPTzOUnPukFIqtWhuElXpuGbcadaaqSH707aCObxB
   w==;
X-CSE-ConnectionGUID: JpKakrTkRQCo3H86EyAH3g==
X-CSE-MsgGUID: bGHaYHEGTRSk932ULvJYFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="27388375"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="27388375"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 06:24:41 -0700
X-CSE-ConnectionGUID: eFqTHEu4QYeZ6m+9HZqfjw==
X-CSE-MsgGUID: eAgXp2jQTXC9NQtWCSau/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="25302141"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 06:24:35 -0700
Message-ID: <60c17b0c-8069-4019-b062-3b3cb892297b@linux.intel.com>
Date: Fri, 26 Apr 2024 15:24:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 08/41] usb: host: xhci-mem: Allow for interrupter
 clients to choose specific index
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, broonie@kernel.org, bgoswami@quicinc.com,
 tiwai@suse.com, robh@kernel.org, konrad.dybcio@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240425215125.29761-1-quic_wcheng@quicinc.com>
 <20240425215125.29761-9-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240425215125.29761-9-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AHKQVZHF7EZMMVFEVVOQ4EMZJL6TRI24
X-Message-ID-Hash: AHKQVZHF7EZMMVFEVVOQ4EMZJL6TRI24
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AHKQVZHF7EZMMVFEVVOQ4EMZJL6TRI24/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/25/2024 11:50 PM, Wesley Cheng wrote:
> Some clients may operate only on a specific XHCI interrupter instance.
> Allow for the associated class driver to request for the interrupter that
> it requires.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---

(...)

> -
> -	/* Find available secondary interrupter, interrupter 0 is reserved for primary */
> +	/* Find available secondary interrupter, interrupter 0 is reserverd for primary */

You introduce a typo in here.
