Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E03905611
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 17:00:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07BCEE7D;
	Wed, 12 Jun 2024 17:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07BCEE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718204436;
	bh=ClXfKtrObNYFGJH3nO4MkQnRpdoJTRqan1XfI/UCRmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YjBhpvOEiqduVmXeX2SWAF0LQjpxJYZ1wspPsjtyC0ZBPzZqA+QaBX8p651KNtJVU
	 zpXuQarAyx0im/HF7EcEJ9Zi16/ibWJdOdYtmp48ECQRhRFOXFOurFl77PH9T5/9PG
	 YDdhextZ8/ZIg7r3yMgjn4b6/uP168vsKvarsvm8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00C1EF805BF; Wed, 12 Jun 2024 17:00:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AED42F805A8;
	Wed, 12 Jun 2024 17:00:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF2A5F8057A; Wed, 12 Jun 2024 16:59:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1E68F80448
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 16:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1E68F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mNO3RoXz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718204397; x=1749740397;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ClXfKtrObNYFGJH3nO4MkQnRpdoJTRqan1XfI/UCRmQ=;
  b=mNO3RoXzLMy5GhQFDe0uVJ7NvLhmvUvRJdcT1IPoRytxBVZ2ImSqicwn
   wApGn7PcX7rb7ReX83yN+PKB/ZkL99wcp4ynOcvaUdUAuFOJu9t33Q4Hm
   3TkW44dqNdIZSCryIkQBPQIU9bYasuW+tBxBYvabhiqZynrGgszm0/9Uv
   /MY2aJ9vOZBBdFIzl81GqL8iMcn1BkRA5LHIEYGA2aFA+y/FDxE8fhmFS
   35LwgL8L5+HxQUL5gX7ARG162bx21s1fJygCyXqDWPk+eLpWXC05tx27S
   kPsGMsdtR0o6ih9npas8m3Y+PiZtHVbWl44xK5DPbdQ2CTYvBLGll3JKI
   Q==;
X-CSE-ConnectionGUID: S39qSTQaSE6hGAVs6v/M9g==
X-CSE-MsgGUID: 2dw3ijLFT3GMQKhO55ELaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25551552"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000";
   d="scan'208";a="25551552"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 07:59:54 -0700
X-CSE-ConnectionGUID: 841aPa7dSOKPs3kKUGyVwg==
X-CSE-MsgGUID: +1nNoP70T1e7w8bmaCZ8AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000";
   d="scan'208";a="44938104"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO [10.245.246.56])
 ([10.245.246.56])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 07:59:48 -0700
Message-ID: <fabc7ac8-6c44-4395-bd16-59257a949e9b@linux.intel.com>
Date: Wed, 12 Jun 2024 16:59:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 00/32] Introduce QC USB SND audio offloading support
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Wesley Cheng
 <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
 <80fefd6b-0f3a-4f6a-869e-fd2225315801@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <80fefd6b-0f3a-4f6a-869e-fd2225315801@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XD4JPAKZXJGXJCTQNALZ24WAZB2OWEFA
X-Message-ID-Hash: XD4JPAKZXJGXJCTQNALZ24WAZB2OWEFA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XD4JPAKZXJGXJCTQNALZ24WAZB2OWEFA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/12/24 16:50, Amadeusz Sławiński wrote:
> On 6/11/2024 1:57 AM, Wesley Cheng wrote:
> 
>> Wesley Cheng (32):
>>    ASoC: Add SOC USB APIs for adding an USB backend
>>    ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add USB_RX port
>>    ASoC: qcom: qdsp6: Introduce USB AFE port to q6dsp
>>    ASoC: qdsp6: q6afe: Increase APR timeout
>>    ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6
>>    ALSA: usb-audio: Introduce USB SND platform op callbacks
>>    ALSA: usb-audio: Export USB SND APIs for modules
>>    ALSA: usb-audio: Save UAC sample size information
>>    usb: dwc3: Specify maximum number of XHCI interrupters
>>    usb: host: xhci-plat: Set XHCI max interrupters if property is present
>>    ALSA: usb-audio: qcom: Add USB QMI definitions
>>    ALSA: usb-audio: qcom: Introduce QC USB SND offloading support
>>    ALSA: usb-audio: Check for support for requested audio format
>>    ASoC: usb: Add PCM format check API for USB backend
>>    ASoC: qcom: qdsp6: Ensure PCM format is supported by USB audio device
>>    ALSA: usb-audio: Prevent starting of audio stream if in use
>>    ALSA: usb-audio: Do not allow USB offload path if PCM device is in use
>>    ASoC: dt-bindings: Update example for enabling USB offload on SM8250
>>    ALSA: usb-audio: qcom: Populate PCM and USB chip information
>>    ASoC: qcom: qdsp6: Add support to track available USB PCM devices
>>    ASoC: Introduce SND kcontrols to select sound card and PCM device
>>    ASoC: qcom: qdsp6: Add SOC USB offload select get/put callbacks
>>    ASoC: Introduce SND kcontrols to track USB offloading state
>>    ASoC: qcom: qdsp6: Add PCM ops to track current state
>>    ASoC: usb: Create SOC USB SND jack kcontrol
>>    ASoC: qcom: qdsp6: Add headphone jack for offload connection status
>>    ASoC: usb: Fetch ASoC sound card information
>>    ALSA: usb-audio: Add USB offloading capable kcontrol
>>    ALSA: usb-audio: Allow for rediscovery of connected USB SND devices
>>    ALSA: usb-audio: qcom: Use card and PCM index from QMI request
>>    ASoC: usb: Rediscover USB SND devices on USB port add
>>    ASoC: doc: Add documentation for SOC USB
> 
> I'm not sure how other reviewers feel about this, but is there any
> chance to group patches in some logical order? It is bit hard to review
> when I need to jump from generic ALSA to ASoC then QCOM code and then
> there are dt-bindings mixed in between and back again.

Completely agree. And splitting the 32 patches in smaller sets would
help as well, every time I want to review I just don't have the time to
go through 32 heavy-duty patches across USB/ALSA/ASoC.
