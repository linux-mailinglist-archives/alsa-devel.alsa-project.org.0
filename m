Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A430965E21
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 12:13:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FC17843;
	Fri, 30 Aug 2024 12:12:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FC17843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725012786;
	bh=UpTmzOP42IVxntFMr0nG3D61CjBK6fcj9WYVDT2cEZU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AXjz6WRgyCuY1NOAEjGLvsrLi7aWqJfkTQM0JOi7FnSnSaotPKFKypa5VwMpYFwPh
	 GIFPzWJrg6JMgAoctHoW1twfM3FPrLpIaPSP7Fq6sMHWQWIhD9PE2IDjZJQJHWyUek
	 hpsT1yLuudQFIqyhRFQ1dODxM2xqErN/3Rkqq7pI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 629A2F80632; Fri, 30 Aug 2024 12:11:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BE68F80633;
	Fri, 30 Aug 2024 12:11:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9FB3F8061F; Fri, 30 Aug 2024 12:11:53 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F1AAEF805EF
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 12:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1AAEF805EF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=m0hs41rA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012708; x=1756548708;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UpTmzOP42IVxntFMr0nG3D61CjBK6fcj9WYVDT2cEZU=;
  b=m0hs41rA9ShYHqSF5BQKGVayODwZHkHPL/HP+1VO/IUAUG5cHWaBgM9j
   N2HY01fofWr3a8spRr0kH57O2lS0nDIXx0RH2ix2srbQvf53sjbIVwi30
   IJKnXDjSkIKF2SAbAv6su6Y2UDMjOUbekxtZ61n9+KnhVmf9511LIWiLa
   r2DH/Fj1ALA0DmV5pwuhlKDJSj2bghYcfPX1Dy22OLu+BsxKCILghKIwQ
   GsLxQP4fsvVsJ8IOlVRtDv91RpEC3HTEqB/JITcQiuCMZIMXgADff9bBm
   8dWzZ/+a7PfnJMQ39PdNlB9Kw6njqBmgVBb5uVF8jONrh+15Am9kCzuJ3
   w==;
X-CSE-ConnectionGUID: QD1HCTCrTjiaMjnGbbbKIQ==
X-CSE-MsgGUID: EL35jTMcTXSP8kLUIRcN+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218767"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="34218767"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:11:47 -0700
X-CSE-ConnectionGUID: Ki9Eg43rQ/+PxbAGJYTdXw==
X-CSE-MsgGUID: 72Avl33yT3CwuiA4mfUsLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="63481454"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101])
 ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:11:40 -0700
Message-ID: <2b5e40bc-060c-403f-a320-a98f975c857a@linux.intel.com>
Date: Fri, 30 Aug 2024 10:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 13/33] ASoC: usb: Add PCM format check API for USB
 backend
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
 <20240829194105.1504814-14-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-14-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: K5HCKJS3QCM6O3VYFY6J6TQY6E4T6DHK
X-Message-ID-Hash: K5HCKJS3QCM6O3VYFY6J6TQY6E4T6DHK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K5HCKJS3QCM6O3VYFY6J6TQY6E4T6DHK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/29/24 21:40, Wesley Cheng wrote:
> Introduce a helper to check if a particular PCM format is supported by the
> USB audio device connected.  If the USB audio device does not have an
> audio profile which can support the requested format, then notify the USB
> backend.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

