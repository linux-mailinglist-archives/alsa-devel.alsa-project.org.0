Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8124750539
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 12:55:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A9717F4;
	Wed, 12 Jul 2023 12:54:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A9717F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689159339;
	bh=sgwbJuDsOwUVl2lh42e25SNssLTIeH+vnDdXIxvdlz0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KgmoPbVGKk809J+xq9t6NYAwBjZl15rI20KqHvT6/dwPETd3KWdUUSn3I8sT8oTRg
	 Lg+ziv8/01J92+kuwuwwQ4+asbXEffPtloQphZ/VMtzQHhQdcG2yAezLloLRYrNtU9
	 sPlyppEEaperm8oAPEsEsW86KGrUZl86jnGDs9g4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5F3BF8027B; Wed, 12 Jul 2023 12:54:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E907F800D2;
	Wed, 12 Jul 2023 12:54:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB5A8F80249; Wed, 12 Jul 2023 12:54:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4A0CF800D2
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 12:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4A0CF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kGb3J/kM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689159281; x=1720695281;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sgwbJuDsOwUVl2lh42e25SNssLTIeH+vnDdXIxvdlz0=;
  b=kGb3J/kMy3WAJmvBv0x+ta57n60/GZCeq2ABm8DK7A/Xetjku4cfRYyD
   JDjrRqMyziavKYcstSOW7+VW2GpOfTxbinzTwzOpSzcSNj8SQhDeA7Fio
   5foNLvV+YPA/SwoyKHTUhfJhkzZWrxwk2ssYXE0w3eu8gqvay57Ok9rwg
   e4F8+IxpI87SfRjEYm0koubr/wLMoo8d8ptug1jLW4ryeMkp4jYbrtYPw
   xI7euVP3pbTmenD5rbDj+picZXHGnyRW2WBrlIStEUi3cPIaoyYhtNTV1
   wVD9OMoJFCbc4xRpeYOsMs7tJbn/Zud+BZwmoa7KdN3+wRm1d5lj9Ccxg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="362325004"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200";
   d="scan'208";a="362325004"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 03:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="698829108"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200";
   d="scan'208";a="698829108"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 03:54:32 -0700
Message-ID: <5780dc05-c8cb-7c2c-6e61-6e643e17ea2a@linux.intel.com>
Date: Wed, 12 Jul 2023 12:54:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 03/13] ALSA: hda: Add controller matching macros
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
 <20230711125726.3509391-4-amadeuszx.slawinski@linux.intel.com>
 <ZK1ayXcoTfIrr18V@smile.fi.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <ZK1ayXcoTfIrr18V@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7ONRFNQDINOCR5ANR2ZYAN5563D35CTX
X-Message-ID-Hash: 7ONRFNQDINOCR5ANR2ZYAN5563D35CTX
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ONRFNQDINOCR5ANR2ZYAN5563D35CTX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/11/2023 3:36 PM, Andy Shevchenko wrote:
>> +#define HDA_CONTROLLER_IN_GPU(pci) (HDA_CONTROLLER_IS_HSW(pci) || \
>> +		pci_match_id((struct pci_device_id []){ \
> I think if you start with pci_match_id() and move HDA_CONTROLLER_IS_HSW() at
> the end it will make this macro aligned with the rest, so easier to get them
> all at once.
> 

Ack.
