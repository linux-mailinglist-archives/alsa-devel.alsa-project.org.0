Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B677D107B
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 15:26:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 839371FE;
	Fri, 20 Oct 2023 15:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 839371FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697808361;
	bh=n9FPj37TUa187KHzBLooUs4gDeQupW8sJoyGo3Mm6Yw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MO5jd98vNVrfcf+teV08VlYn/d/FywDGiwa0XLlej4OMjvH/AnGLL3WdLn2O2tjOE
	 u5TqADHxrxrfqM3kSUeTiFoelhdfsQu5PwzeZVUcMHxMWR8bVUrkTZ4hO5PTdHBsB7
	 iA9mffE3tMEUQ4dEPE3qqYosdEDozrtY032E9vpQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8601F80536; Fri, 20 Oct 2023 15:24:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DEDBEF8024E;
	Fri, 20 Oct 2023 15:24:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8565F8032D; Fri, 20 Oct 2023 15:24:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17488F8024E
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 15:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17488F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dbHBKfwI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697808284; x=1729344284;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=n9FPj37TUa187KHzBLooUs4gDeQupW8sJoyGo3Mm6Yw=;
  b=dbHBKfwI9f+jRWnZ87buEfgH6DZAxtkntWJ+mPtOt9Wl627Mme72AT2L
   YygXrMkiAozTFTQVvv6iMVYaWM7lL3DJYzCVms0tRfBON8jutPgqGI5tp
   /pDjjJmB3yGL/7XWL2cw3CAtertSiAqCgZeXPzfx/eVo2J8FySMEsd+61
   GCgGZvXZdHRDzF47xeYHnhCLeRJHFPbXjCu0vwpN6PrB5FmYBuKJA+QgO
   quf7aAf2/Da7VyJIeaggrlNnExl0syhxoqNsEo8mLwz+KFdjksGDJRaJw
   vAx6Zp2QvhSLF4oLdF7/t9Tn5Cz6Zy4Wx3Sz1CZb1stlxgROsLUybZkkg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="385372631"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200";
   d="scan'208";a="385372631"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 06:24:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="881083831"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200";
   d="scan'208";a="881083831"
Received: from mtadesse-mobl.amr.corp.intel.com (HELO [10.209.140.77])
 ([10.209.140.77])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 06:24:37 -0700
Message-ID: <1840ba70-279b-499a-ad42-e7659a9a6ad1@linux.intel.com>
Date: Thu, 19 Oct 2023 15:39:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 30/34] ASoC: qcom: qdsp6: Add SND kcontrol for fetching
 offload status
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20231017200109.11407-1-quic_wcheng@quicinc.com>
 <20231017200109.11407-31-quic_wcheng@quicinc.com>
 <92971bbf-b890-4e41-8ef1-9213e15d81b2@linux.intel.com>
 <c9c5f13f-b3e7-6591-f277-cd86162152e4@quicinc.com>
 <2e300bef-3722-8b00-2bdf-e9386796f38f@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <2e300bef-3722-8b00-2bdf-e9386796f38f@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MWDRTJ6IPLNILXGHGJBYHFLKQID7NVKB
X-Message-ID-Hash: MWDRTJ6IPLNILXGHGJBYHFLKQID7NVKB
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MWDRTJ6IPLNILXGHGJBYHFLKQID7NVKB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>>> Add a kcontrol to the platform sound card to fetch the current offload
>>>> status.  This can allow for userspace to ensure/check which USB SND
>>>> resources are actually busy versus having to attempt opening the USB
>>>> SND
>>>> devices, which will result in an error if offloading is active.
>>>
>>> I think I mentioned this a while back, but why not add the status in the
>>> USB card itself? That's a generic component that all userspace agent
>>> could query. Having a QCOM-specific control doesn't make the life of
>>> userspace easier IMHO.
>>>
>>>
>>
>> Will take a look at this based on the comments you had in the other
>> kcontrol patch.  Seeing if we can move it to a more generic layer.
>>
> 
> I think it would make more sense to see if we can keep all the offload
> kcontrols under the sound card exposed by the platform.  Especially, if
> we are going to modify the components string of the card to signify that
> it supports USB offload.

A two-way relationship would be ideal, i.e.
- the USB card has an indicator that it's currently bound with another
"platform" card that offers optimized offloaded capabilities.
- the platform card has a indicator that it exposes one or more PCM
devices routed to the USB card endpoint.

Android/HAL would typically start with the latter while other more
generic solutions would start from the former.
