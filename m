Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0F39055BD
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 16:50:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A65DDEC;
	Wed, 12 Jun 2024 16:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A65DDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718203852;
	bh=A3ALZuSC7JFA7FKUWJ7dtEFKaiBbbWF3EU24yn8PEOM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UdfRm1haQKyCXpB+INX0ZXMY64PZnOwi/Yxfvs7209V26hEV9ATQ+EU2F8tb4k7J1
	 mty6gzZojQvKBrWrJAz83fRh91rQS/evxEUVluNobshxw+R/TyvJLvHVcP9SCgAHyT
	 Kze1aiaaokh0KudhndYHwLf8pc3WK1VmtCLRh0W0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBB05F805A1; Wed, 12 Jun 2024 16:50:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52815F8059F;
	Wed, 12 Jun 2024 16:50:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E0A4F8057A; Wed, 12 Jun 2024 16:50:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A48ECF80578
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 16:50:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A48ECF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FQWYqBm/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718203813; x=1749739813;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=A3ALZuSC7JFA7FKUWJ7dtEFKaiBbbWF3EU24yn8PEOM=;
  b=FQWYqBm/HM+UDNhf6rN56zj/H2Kch/OkGquhahTVOuk4YXHvtjcyBANw
   trT0oxMk+mFfWZBjO3ktJI8fenkLGhcbSoKBs2buWvxFaiBOkuoCg/kKK
   RGuUVDRMY3pQRwpXvruc3k7L0AXqY0nAODBc92fMwuIuE3UtQaWBKufRu
   4ZTmY/oce0DlvGH0XnFCPv6KFL3anwY77vxvJpVE0VDgcUoTxUjqwKbOP
   ER1rWpuTXI/QGa/pbvNxHl44L+iU1NkrRrGNbXrErQLwIvcNriTAmvuMQ
   dIhO5JVf4wNlB3RQpKF5XQBi2C2gLCdRZRx0VtFYUU4RyR6d4JBif1Fn3
   w==;
X-CSE-ConnectionGUID: V4VY/JCgTnCYe7mw5Q8EMw==
X-CSE-MsgGUID: 7KJwyh0mSa2Rmtz5m0TJGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25603912"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000";
   d="scan'208";a="25603912"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 07:50:09 -0700
X-CSE-ConnectionGUID: sIB8IIaFR/u7dDoKj/j2Iw==
X-CSE-MsgGUID: V8mahd+5QBSIdsk5KEyVLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000";
   d="scan'208";a="39925635"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 07:50:04 -0700
Message-ID: <80fefd6b-0f3a-4f6a-869e-fd2225315801@linux.intel.com>
Date: Wed, 12 Jun 2024 16:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 00/32] Introduce QC USB SND audio offloading support
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240610235808.22173-1-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NFJDPBTAZCC36QH4HJVYOMVZMCXFIGHW
X-Message-ID-Hash: NFJDPBTAZCC36QH4HJVYOMVZMCXFIGHW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NFJDPBTAZCC36QH4HJVYOMVZMCXFIGHW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6/11/2024 1:57 AM, Wesley Cheng wrote:

> Wesley Cheng (32):
>    ASoC: Add SOC USB APIs for adding an USB backend
>    ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add USB_RX port
>    ASoC: qcom: qdsp6: Introduce USB AFE port to q6dsp
>    ASoC: qdsp6: q6afe: Increase APR timeout
>    ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6
>    ALSA: usb-audio: Introduce USB SND platform op callbacks
>    ALSA: usb-audio: Export USB SND APIs for modules
>    ALSA: usb-audio: Save UAC sample size information
>    usb: dwc3: Specify maximum number of XHCI interrupters
>    usb: host: xhci-plat: Set XHCI max interrupters if property is present
>    ALSA: usb-audio: qcom: Add USB QMI definitions
>    ALSA: usb-audio: qcom: Introduce QC USB SND offloading support
>    ALSA: usb-audio: Check for support for requested audio format
>    ASoC: usb: Add PCM format check API for USB backend
>    ASoC: qcom: qdsp6: Ensure PCM format is supported by USB audio device
>    ALSA: usb-audio: Prevent starting of audio stream if in use
>    ALSA: usb-audio: Do not allow USB offload path if PCM device is in use
>    ASoC: dt-bindings: Update example for enabling USB offload on SM8250
>    ALSA: usb-audio: qcom: Populate PCM and USB chip information
>    ASoC: qcom: qdsp6: Add support to track available USB PCM devices
>    ASoC: Introduce SND kcontrols to select sound card and PCM device
>    ASoC: qcom: qdsp6: Add SOC USB offload select get/put callbacks
>    ASoC: Introduce SND kcontrols to track USB offloading state
>    ASoC: qcom: qdsp6: Add PCM ops to track current state
>    ASoC: usb: Create SOC USB SND jack kcontrol
>    ASoC: qcom: qdsp6: Add headphone jack for offload connection status
>    ASoC: usb: Fetch ASoC sound card information
>    ALSA: usb-audio: Add USB offloading capable kcontrol
>    ALSA: usb-audio: Allow for rediscovery of connected USB SND devices
>    ALSA: usb-audio: qcom: Use card and PCM index from QMI request
>    ASoC: usb: Rediscover USB SND devices on USB port add
>    ASoC: doc: Add documentation for SOC USB

I'm not sure how other reviewers feel about this, but is there any 
chance to group patches in some logical order? It is bit hard to review 
when I need to jump from generic ALSA to ASoC then QCOM code and then 
there are dt-bindings mixed in between and back again.
