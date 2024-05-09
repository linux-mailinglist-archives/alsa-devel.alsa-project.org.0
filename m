Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAED98C15BD
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 21:57:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A927D14E6;
	Thu,  9 May 2024 21:57:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A927D14E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715284653;
	bh=4Wcd+39Om11s8ru8Ou6OGHhyXSOIxsxL2t8MT1U07lI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fxX2wHfAU8MBk+Y8kWeINFL0ykdraO7r8H+ALC84MuYSt977bSO9kNkxy5RejgmPW
	 Hj3977TaVofpz8E4cAw5XQetUW35iZekLSNqOUxk2EFimhIrARd9OWQCfEQWlicaln
	 eMe9zsdHb0jUMQ7DQ3Bxc4/rmcjDXgm5KbrcCFJE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 694CAF80605; Thu,  9 May 2024 21:56:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94918F805F5;
	Thu,  9 May 2024 21:56:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91D3EF8049C; Thu,  9 May 2024 21:56:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5ECE0F8024C
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 21:56:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ECE0F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=O6pY8RNw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715284584; x=1746820584;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4Wcd+39Om11s8ru8Ou6OGHhyXSOIxsxL2t8MT1U07lI=;
  b=O6pY8RNwPpMaChryBSRjt4RTHkSZ2KaKAFaAS9OPhc95kz0Ppul053Ca
   uWWj2P3KyYd0L3yoeWxkWOmcLhUftBLFcdx4qXOJKMz2ffQajIgdcOLVC
   4lyeGd9ootVU8oTMC0OncD8/BCCjvn1/c+l613n8M5dehd0sBkFBrEw15
   5/MkgOjEPbTUhnJPplfWgZA7Ma3CLgdxAhKaAXsYvOQS0y5Ieq9emf9mD
   BHJsZCprFgasuIKy5nKWFkIi6PsbXZZrowxQKbVhXfMYqoS1uI++4nVus
   JawyxJppVpxcHYCUDr0qZHK06WoEQXBvcOKvGx9k5oaLytmnmZEULOvTe
   g==;
X-CSE-ConnectionGUID: gknLV59bTu2qxg1FkazOQg==
X-CSE-MsgGUID: D6eIWXSCR5uGqV+k0Gicyg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11454274"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="11454274"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:56:20 -0700
X-CSE-ConnectionGUID: ChKJjrjNSG29a/wMJpwFcw==
X-CSE-MsgGUID: 2HJ/8Hz+TV+tf3jMAIWI6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="34213097"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO [10.213.181.85])
 ([10.213.181.85])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:56:17 -0700
Message-ID: <76a943f7-d839-4378-aa12-7fb32e3077e6@linux.intel.com>
Date: Thu, 9 May 2024 08:02:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 26/39] ASoC: qcom: qdsp6: Add support to track
 available USB PCM devices
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
 <20240507195116.9464-27-quic_wcheng@quicinc.com>
 <875b643f-af2c-4a1b-87e8-80cd6f236dea@linux.intel.com>
 <b1f8b531-6041-ec11-5932-13bf17b69d0b@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <b1f8b531-6041-ec11-5932-13bf17b69d0b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZS4VIE3S6ALELR6K4NCR5D6RHUT54HT5
X-Message-ID-Hash: ZS4VIE3S6ALELR6K4NCR5D6RHUT54HT5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZS4VIE3S6ALELR6K4NCR5D6RHUT54HT5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/8/24 18:57, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 5/7/2024 2:23 PM, Pierre-Louis Bossart wrote:
>>
>>> @@ -113,6 +120,12 @@ static int q6usb_alsa_connection_cb(struct
>>> snd_soc_usb *usb,
>>>       if (connected) {
>>>           /* We only track the latest USB headset plugged in */
>>>           data->active_usb_chip_idx = sdev->card_idx;
>>> +
>>> +        set_bit(sdev->card_idx, &data->available_card_slot);
>>> +        data->status[sdev->card_idx].sdev = sdev;
>>
>> Not following the 'only track the latest USB headset plugged in', I
>> don't see anything that discard the previously latest headset...
>>
>> If you plug headset1, then headset2, how is headset1 marked as not
>> available for USB offload?
>>
> 
> It won't mark headset1 as not available for offload, because offload
> could happen on either depending on what is selected (from the kcontrol
> as well).

Right, so the wording 'only track the latest USB headset plugged in' is
incorrect or obsolete, isn't it?
