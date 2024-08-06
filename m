Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F05949404
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 16:58:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D9A33CE6;
	Tue,  6 Aug 2024 16:57:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D9A33CE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722956276;
	bh=ulhVGtEPKBdoyHz0l9ezBsABeAF4IDtYxjCyDs4xjzE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JS+5NvKBQ+Kq3eYVMe9GWWZRnKop/TKYI1IooIe7fsVBIubUIlcpbWd6pCshtCyb3
	 Zp9k6+hmR5i9xCHkt/WAIHrX7cqyc1KpwauFi9DtBK5Pd6hDfAIFT1lKjvp3IJNdr2
	 hzNApipq8DZX5+9/JLt+nTEM7lxdklyr0dWNB6oA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 246AFF805C5; Tue,  6 Aug 2024 16:57:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06826F805D3;
	Tue,  6 Aug 2024 16:57:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C42FF80448; Tue,  6 Aug 2024 16:52:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3605F802DB
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 16:52:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3605F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GgpKBbWZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722955932; x=1754491932;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ulhVGtEPKBdoyHz0l9ezBsABeAF4IDtYxjCyDs4xjzE=;
  b=GgpKBbWZAz+itR/acbMgt/uRXWhk8Gt3RY47vse4JMQvXmOPPu6Zea7c
   o8cHQeS70o9iSTUI1WmokqA0iC1UBbizDffJXXFQdVjgUNb8sT6FGl333
   T84wwgOyqxWWoHTFykew0iGoT7tPiDE/61B8n/2vylX94bcxdgDxTIVAD
   xjOHAQtXMd5dE96E09q7NhBEWo6qyfWcHV+0/H9Xje+8bxDrX1dnyoZT/
   +JW2BRp0T99FCGn7oKSBar4ZUv0a04G4daup5/2zzGuqH2V5b3QTpQpvh
   SEmIx+AuN0BIRiE5GscaKpqkU3Sci29GeAet5hFFvSyyR23ra2xiuVjVk
   g==;
X-CSE-ConnectionGUID: Ic+7ieVBS/afAt9t9/umQw==
X-CSE-MsgGUID: KqFAwrAPQMOXjnA4y7m/0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21102051"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800";
   d="scan'208";a="21102051"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:52:03 -0700
X-CSE-ConnectionGUID: cJPN9FP4TuWrzG0YHOubYw==
X-CSE-MsgGUID: Y9MkFWawRqaVopuvdK1S7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800";
   d="scan'208";a="87476718"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:51:57 -0700
Message-ID: <186ae30f-678c-423a-a56f-74510a184f99@linux.intel.com>
Date: Tue, 6 Aug 2024 16:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 23/34] ALSA: usb-audio: Prevent starting of audio
 stream if in use
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-24-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240801011730.4797-24-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 247X3YC5FNN3RP32ST62SJD7ZH6G25GM
X-Message-ID-Hash: 247X3YC5FNN3RP32ST62SJD7ZH6G25GM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/247X3YC5FNN3RP32ST62SJD7ZH6G25GM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/1/2024 3:17 AM, Wesley Cheng wrote:
> With USB audio offloading, an audio session is started from the ASoC
> platform sound card and PCM devices.  Likewise, the USB SND path is still
> readily available for use, in case the non-offload path is desired.  In
> order to prevent the two entities from attempting to use the USB bus,
> introduce a flag that determines when either paths are in use.
> 

How can this happen? Can you provide some example with list of devices 
and which one should block the other? If I recall correctly devices are 
already exclusive unless you support substreams which ASoC does not at 
the moment.

