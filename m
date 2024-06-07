Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F43900D07
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2024 22:34:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F89C7F4;
	Fri,  7 Jun 2024 22:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F89C7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717792493;
	bh=Fnt6K3uNOuwdkEaQGPZrVRbO15Hft9pX9EtzPGoc/w4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h52nFoW2395m/Z0D1KrPMLF7WcJylhgHFPJ05r3OgrSeoU+WCurgNe3QY/s6qK9H9
	 MxzKAT0Cc02A22bPZPHWgmp8Os0UQk0zgNDGApxxG2P1g/7wvHrNYdyTJCTBPV1Uc0
	 l/HjfTazYtbsgHb6dPqfH5zWrLGi0ORIhYqSppb8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E54AF805B2; Fri,  7 Jun 2024 22:34:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 260B7F80588;
	Fri,  7 Jun 2024 22:34:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A972F804B2; Fri,  7 Jun 2024 22:33:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6B36F8010C
	for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2024 22:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6B36F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=a7D6oOaA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717792392; x=1749328392;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Fnt6K3uNOuwdkEaQGPZrVRbO15Hft9pX9EtzPGoc/w4=;
  b=a7D6oOaAPboApGYZsI1UQWYH6rdLm40Bwce3vENps8EUphgBtzKfUSR5
   C4D89l5u0AlKCZsEjfNwZANBMSh0XLNdnFX52RI6nO1v61CmsxXVWYiqw
   x46awI9CU6/Vn1gPdUvD7O8Z27TuEBh8/8EuzvWWghlQAeRFOLpXEHkSm
   cqs+4dW/8aL3rLYABcF9x8wRn/Y5mR96swvG24E3dT6JOP4HOnsVcCoBO
   prWUD7SjIEgWNSrKrCoERVOBRmDNG1RwkQzG1/qw913K9R8WYREqJcksP
   4Zx48YQ1rqlFVSQAHqlVwto7LL9e4mUjd0f5h41DSx6VkpMh7WT7lmeDw
   g==;
X-CSE-ConnectionGUID: W8ak/rm2TfS/lRS50PFQ7w==
X-CSE-MsgGUID: aVDv2egTRMK/NnwvKZsVXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14330792"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000";
   d="scan'208";a="14330792"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:33:06 -0700
X-CSE-ConnectionGUID: k8Y8d7iASWKQGzFmPu82mA==
X-CSE-MsgGUID: GfukGivKSW+dJV/+ru+DeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000";
   d="scan'208";a="42990284"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.246.75])
 ([10.245.246.75])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:33:02 -0700
Message-ID: <998d53cf-c22b-4706-93af-ab38802dc531@linux.intel.com>
Date: Fri, 7 Jun 2024 22:33:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ACPI: utils: introduce acpi_get_local_u64_address()
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 broonie@kernel.org, vkoul@kernel.org, andriy.shevchenko@linux.intel.com,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Len Brown <lenb@kernel.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
 <20240528192936.16180-2-pierre-louis.bossart@linux.intel.com>
 <CAJZ5v0g8aW5FBbceYJDvDrMHRxT6i71O_LTWKALb=qr+m1BJ7w@mail.gmail.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CAJZ5v0g8aW5FBbceYJDvDrMHRxT6i71O_LTWKALb=qr+m1BJ7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4PEQJ3W3DVMLO2HFFAZWPUL5V2WSRFAX
X-Message-ID-Hash: 4PEQJ3W3DVMLO2HFFAZWPUL5V2WSRFAX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4PEQJ3W3DVMLO2HFFAZWPUL5V2WSRFAX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/7/24 20:51, Rafael J. Wysocki wrote:
> On Tue, May 28, 2024 at 9:29 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>> The ACPI _ADR is a 64-bit value. We changed the definitions in commit
>> ca6f998cf9a2 ("ACPI: bus: change _ADR representation to 64 bits") but
>> some helpers still assume the value is a 32-bit value.
>>
>> This patch adds a new helper to extract the full 64-bits. The existing
>> 32-bit helper is kept for backwards-compatibility and cases where the
>> _ADR is known to fit in a 32-bit value.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> 
> Do you want me to apply this or do you want me to route it along with
> the rest of the series?
> 
> In the latter case feel free to add
> 
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Thanks Rafael. I think it's easier if Mark Brown takes the series in
ASoC, I have additional ASoC patches that use the u64 helper.

Mark?


>>
>> +int acpi_get_local_u64_address(acpi_handle handle, u64 *addr)
>> +{
>> +       acpi_status status;
>> +
>> +       status = acpi_evaluate_integer(handle, METHOD_NAME__ADR, NULL, addr);
>> +       if (ACPI_FAILURE(status))
>> +               return -ENODATA;
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL(acpi_get_local_u64_address);
> 
> I'd prefer EXPORT_SYMBOL_GPL() here unless you absolutely cannot live with it.

I don't mind, but the existing helper was using EXPORT_SYMBOL so I just
copied. It'd be odd to have two helpers that only differ by the argument
size use a different EXPORT_ macro, no? Not to mention that the
get_local address uses EXPORT_SYMBOL but would become a wrapper for an
EXPORT_SYMBOL_GPL. That gives me a headache...


This was the original code:

int acpi_get_local_address(acpi_handle handle, u32 *addr)
{
	unsigned long long adr;
	acpi_status status;

	status = acpi_evaluate_integer(handle, METHOD_NAME__ADR, NULL, &adr);
	if (ACPI_FAILURE(status))
		return -ENODATA;

	*addr = (u32)adr;
	return 0;
}
EXPORT_SYMBOL(acpi_get_local_address);

