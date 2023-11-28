Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 519E77FC0C5
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 18:55:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEBC9E0E;
	Tue, 28 Nov 2023 18:55:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEBC9E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701194154;
	bh=U7SHRv8kT+n7b9v0GPnWjN8fPXLgdna0HJB40XzjEaE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U6S8ht+Yob+ZlZ9Wv8TAwPV1nyk4l3R73pnYhPDkVMhSE1vftTb6UnV3T9+a1Xelx
	 Vhk1rp+aSqpnpx/3xGmGw3vDkMm/888RQbNE6vuVYDnFSBZtb6Icir9TOs9o4R5nii
	 Bn+NJGO4D3NQMmj/f0bdjwkQ+F4dfyaJcZmp5n9Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0345FF80641; Tue, 28 Nov 2023 18:54:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E991F80674;
	Tue, 28 Nov 2023 18:54:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC01EF805E8; Tue, 28 Nov 2023 18:54:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E199F8055A
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 18:54:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E199F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SAqv+X7G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701194045; x=1732730045;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=U7SHRv8kT+n7b9v0GPnWjN8fPXLgdna0HJB40XzjEaE=;
  b=SAqv+X7GBx2XnW5xdSbqMcygkxj1Sq+s+0aqH9mmeRHLhveeBjSW54JT
   Pqh3ddNRwWiUNM/LBN5lDJt5d/YjocFxL7lBWoKvjI6pLBaGBCuT35V5l
   aSwFHV+dW/ahr92ooIxLcA0mDSfDHNHveKZWLR3TxUHiXKuHw02BnU/cr
   dDNPVAwgT/JSZHEOEVn6FxNfLF+HpKYt9HR1YwIVj4bq6XqkoJttVjgPC
   Qao/vQUcWi96swVO/sHu73Xb1cCuTyqISAZ4MLkBRMeqdFlelj8wCZmCl
   eNbsgxlVB929g4fMYnN/TKFK14jl00bKTvy+GogsQOXu5TpJq+VICGGsT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="424127123"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600";
   d="scan'208";a="424127123"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 09:54:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="834715363"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600";
   d="scan'208";a="834715363"
Received: from skumarso-mobl33.amr.corp.intel.com (HELO [10.255.231.208])
 ([10.255.231.208])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 09:54:01 -0800
Message-ID: <d3a2eb33-ea3e-43ac-a872-a7182404eee6@linux.intel.com>
Date: Tue, 28 Nov 2023 11:49:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: qcom: Move Soundwire runtime stream alloc to
 soundcards
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20231128165638.757665-1-krzysztof.kozlowski@linaro.org>
 <20231128165638.757665-2-krzysztof.kozlowski@linaro.org>
 <4317ec5d-8eb8-4a2f-aebc-cc04f2aba145@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <4317ec5d-8eb8-4a2f-aebc-cc04f2aba145@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CJR37SD7AF2M2TPZGTGLPXJZGGVAUWMI
X-Message-ID-Hash: CJR37SD7AF2M2TPZGTGLPXJZGGVAUWMI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CJR37SD7AF2M2TPZGTGLPXJZGGVAUWMI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 11/28/23 10:59, Krzysztof Kozlowski wrote:
> On 28/11/2023 17:56, Krzysztof Kozlowski wrote:
>> Currently the Qualcomm Soundwire controller in its DAI startup op
>> allocates the Soundwire stream runtime.  This works fine for existing
>> designs, but has limitations for stream runtimes with multiple
>> controllers, like upcoming Qualcomm X1E80100 SoC with four WSA8840
>> speakers on two Soundwire controllers.
>>
>> When two Soundwire controllers are added to sound card codecs, Soundwire
>> startup() is called twice, one for each Soundwire controller, and second
>> execution overwrites what was set before.  During shutdown() this causes
>> double free.
>>
>> It is expected to have only one Soundwire stream runtime, thus it should
>> be allocated from SoC soundcard context startup(), not from each
>> Soundwire startup().  Such way will properly handle both cases: one and
>> two Soundwire controllers in the stream runtime.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> This is an entirely different approach than my previous try here:
>> https://lore.kernel.org/all/20231025144601.268645-1-krzysztof.kozlowski@linaro.org/
> 
> ... and I forgot to thank you Pierre-Louis for patient explanation of
> the case in my previous try. Your review was much appreciated!

You're welcome. It's good if we have multiple platforms using the
'stream' concept in similar ways.
