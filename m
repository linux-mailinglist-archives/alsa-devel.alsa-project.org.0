Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB648C79CE
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2024 17:52:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16FE685D;
	Thu, 16 May 2024 17:52:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16FE685D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715874731;
	bh=2PlFUJ/q5/qHI3L8lR/HCWKZsXCdppu5i2kCLpM8ve0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TivOYxO2FSlPR15WI3vcE4VQuSJpj93sUjpGgFQ7EF9OhDhwNfytbf9phHE7qo3nT
	 hDsIj3cKO9H/Bs97VvhQa3bj60dZofHTIkOKs5ECsyKD/TB/F9VjUiPUmEmpgB1oNB
	 1HtTXIm/29eQVwQnLLwopn3b0P63UkmEsMYllTng=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EBF1F80563; Thu, 16 May 2024 17:51:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF5BDF805A8;
	Thu, 16 May 2024 17:51:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAF66F8025F; Thu, 16 May 2024 17:51:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B415F80072
	for <alsa-devel@alsa-project.org>; Thu, 16 May 2024 17:51:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B415F80072
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VZ8iOZho
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715874688; x=1747410688;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2PlFUJ/q5/qHI3L8lR/HCWKZsXCdppu5i2kCLpM8ve0=;
  b=VZ8iOZho4fr7+dorHlCgipDlz+3KBwRFGlww+HK1QghckCvagc/X6rrs
   1KLEOlbv1HCauMd5FHwzmdVeeet1a+/iLBK3bbzROqYXSKlevMELSlhXK
   h7dJjE4fEz1EVhlNwxdSx7S5uXuTlI/Kq6CSNnRY2nAGByLZcOdR+A3nC
   A0DNGxRfWxe1B5a0lC2iqftZGJN9fgaxFRXZl8ysqx6YNFAzoprAbOsib
   kM5UikbdI7jTDe+VQ460i9PTfAgB0v2niKQcsWH6LICTjuYBJB4XxutkV
   44qsk0p/b8jADT+CpZ4cUIoj6dLlB+w1dmICGzkmhtRxK+UOVQybu2bAM
   A==;
X-CSE-ConnectionGUID: Vy6OvhzzTpuHrdDb5KycQw==
X-CSE-MsgGUID: oIXJ2hK5SLyTDwxG7zw7nw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12151895"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000";
   d="scan'208";a="12151895"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 07:44:11 -0700
X-CSE-ConnectionGUID: ytJRvprQQFuRf6UujYhKCg==
X-CSE-MsgGUID: 7XT98QzJTGa7YPvmZqqBdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000";
   d="scan'208";a="68903909"
Received: from rrware-mobl.amr.corp.intel.com (HELO [10.125.108.123])
 ([10.125.108.123])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 07:44:10 -0700
Message-ID: <a062accf-f3f3-46b8-a110-588c4a319909@linux.intel.com>
Date: Thu, 16 May 2024 09:44:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: rt1320: Add RT1320 SDCA vendor-specific driver
To: =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
References: <20240515085939.201081-1-shumingf@realtek.com>
 <790667c8-2893-47d6-b47a-340ac12af28c@linux.intel.com>
 <489b4beca9d94cb7ba24a30279a01fa3@realtek.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <489b4beca9d94cb7ba24a30279a01fa3@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RQZYWFR4F67XVAHO3YXDWSRCF5NWIDNU
X-Message-ID-Hash: RQZYWFR4F67XVAHO3YXDWSRCF5NWIDNU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RQZYWFR4F67XVAHO3YXDWSRCF5NWIDNU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/15/24 22:22, Shuming [范書銘] wrote:
>>> +static const struct reg_sequence rt1320_blind_write[] = {
>> ...
>>> +};
>>> +
>>> +static const struct reg_sequence rt1320_patch_code_write[] = {
>> ...
>>> +};
>>
>> On GitHub we talked about using the SDCA Initialization table coming from
>> ACPI, is this still something you're interested in?
> 
> If the SDCA function is ready, the codec driver could call the API to do the blind writes.

The code I have is about ready, it just needs to be cleaned-up and
submitted.

But just to be clear, the codec driver would use the API to retrieve an
array of (address, value) pair. It would be up to the codec driver to do
the writes and/or patch their regmap.

>> Maybe I missed it but I didn't see anything that tests the version_id and does
>> something different between VER_A and VER_B. Can you add a comment on
>> why it's important to track the version?
>>
>> Also if there's a DSP, is there a need for the FDL capability to download
>> firmware, or is the speaker protection configured only via tables?
> 
> OK, will add a comment for the version_id.
> Currently, the blind writes enables the basic function, not the advanced mode (speaker protection).
> However, VER_B has the capability to enable the speaker protection.
> The codec driver could use the version_id if the customer wants to enable the speaker protection.
> Regarding DSP firmware, the ROM code stores the DSP FW inside the chip.
> The speaker protection needs other parameters to set.

If there is a speaker protection running on the codec DSP, shouldn't
there be a source port to pass an echo reference back to the host?
