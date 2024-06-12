Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0739055F6
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 16:58:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 215FEE65;
	Wed, 12 Jun 2024 16:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 215FEE65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718204297;
	bh=Syu7BB0zsaZPs6cikFGcro90qjIg1ejbMOeCL8FHf6M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HpKT+LtQ/eYpd83tFX+nfi1PlvX+8plZpHE5NoukSj4hjc2KLdTtmm4yxb/B5dV8p
	 GdSKMCzlUPE76psWyTe1mrWgLiI6PWeUvj2bmoJZUUPdbR5lI7MIBC59RNUzJsvy/J
	 NgZItjpZyI0JC6x7OFohI2Qr2AxR74RuMw3kx3gs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 785BDF805C0; Wed, 12 Jun 2024 16:57:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD4A1F805AA;
	Wed, 12 Jun 2024 16:57:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76545F8057A; Wed, 12 Jun 2024 16:57:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B86F8F80448
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 16:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B86F8F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Y8F6CtMa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718204260; x=1749740260;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Syu7BB0zsaZPs6cikFGcro90qjIg1ejbMOeCL8FHf6M=;
  b=Y8F6CtMa+eohFrp7IWADTTr/976qbYbh0EQ3ThsJ+RpZVbAulQ1Jia5g
   B4FlsBcZ/FqJ9ZynNwQr0f0AmgImuYYmXyxScFExGqq6t8k7rl+S5Hio/
   q+NMO/aM1f93GknsCk7LCgYrM7GgYYy+RLb8P+LaYGuBdMLhZ02fE4e3C
   u4ans1TCrxF+dMDAEep1tyyblIHgmyhiQvFc38wX5dNsg+sHaDpuUOUos
   FixT6P/Ne/UkjjCBe6GssL9XzAi/nYg+q8+bCgKdcOl+yUMTPv/0lulP7
   hqQWR8GnXxZAUZHNdLY78ijO3h4qY9S+GNzDnWG7xuXMcHoXqbBYz2rWJ
   A==;
X-CSE-ConnectionGUID: HOGztSkXRealfGm47nannA==
X-CSE-MsgGUID: Nq4dshUSTMuxPaYtfGhDBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18798688"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000";
   d="scan'208";a="18798688"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 07:57:34 -0700
X-CSE-ConnectionGUID: ZXmtThsIQQ6tImepGZ/AOw==
X-CSE-MsgGUID: /g+wx0HGThGiYikLxyvHkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000";
   d="scan'208";a="39927202"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 07:57:29 -0700
Message-ID: <d5c6fff6-68ab-4248-814b-41b77d7105c8@linux.intel.com>
Date: Wed, 12 Jun 2024 16:57:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 17/32] ALSA: usb-audio: Do not allow USB offload path
 if PCM device is in use
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
 <20240610235808.22173-18-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240610235808.22173-18-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZPSSI3PXEOO2XBQ7HAZ3XNSDTMCYRKB5
X-Message-ID-Hash: ZPSSI3PXEOO2XBQ7HAZ3XNSDTMCYRKB5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPSSI3PXEOO2XBQ7HAZ3XNSDTMCYRKB5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6/11/2024 1:57 AM, Wesley Cheng wrote:
> Add proper checks and updates to the USB substream once receiving a USB QMI
> stream enable request.  If the substream is already in use from the non
> offload path, reject the stream enable request.  In addition, update the
> USB substream opened parameter when enabling the offload path, so the
> non offload path can be blocked.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>   sound/usb/qcom/qc_audio_offload.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)

Patch title is missing qcom part and it clearly touches QCOM code.
ALSA: usb-audio: qcom:

