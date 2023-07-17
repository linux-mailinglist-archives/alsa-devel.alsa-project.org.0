Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4E97565BB
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 16:04:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E15D4DED;
	Mon, 17 Jul 2023 16:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E15D4DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689602696;
	bh=eak0Awh/jpPpCIghRwyoQAOusxOLZVy8MBwHFNwXJ0A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YsGvd442LEJrRS8XIGn7hLhcFLBBqBaa9kEYVgGSwyB9CK3HYyLLLLqWbcaVXSd0S
	 15vSnj0jtCPX3kD4O6xCy67K14BWzw9pjAi3HAnOwkQGY7qHLaahwXJrlN4lEqC7E+
	 ixW08su6FOWwMYi7dBycsYhG1pI6v6E14UdPOmwc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4508EF80535; Mon, 17 Jul 2023 16:03:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C700CF8032D;
	Mon, 17 Jul 2023 16:03:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D5FFF80494; Mon, 17 Jul 2023 16:03:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A833F8032D
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 16:03:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A833F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=naMd2z3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689602615; x=1721138615;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eak0Awh/jpPpCIghRwyoQAOusxOLZVy8MBwHFNwXJ0A=;
  b=naMd2z3E+LTpA0EzMdm7TSa/wd38a8wqwhw7eAKHj8acr5RboE1xfPzs
   2ykScNKM6A8YwMliIeBXtENP5ohIQHGjaggyFOYRJJETHcP6CeFkIw2ue
   xRkVjQQb/aAHoZ4BoLgcVqBXVYxpkuWJ4Y/Mxq2IkyTXMtUYOv4SYFUt+
   UOPdIR7hfFshaQjKmpShALWUBSlqvfkuHhd1ia1cBx8sS/A7rv90nF829
   TbTYeo5L9B48z4OmNID50OBQQmrnCUgpZqZvEsbe1a7ttWHhA/xhdKLRP
   f+5DMk+mDGeshnwvUZStu8YVqK0za28FVz5DLHBI7ncBct7yhUJmd5Txy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="396765750"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="396765750"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 07:03:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="726555400"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="726555400"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 07:02:57 -0700
Message-ID: <78f7ff79-cb32-1e08-f87a-9186c9114056@linux.intel.com>
Date: Mon, 17 Jul 2023 16:02:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 01/15] PCI: Sort Intel PCI IDs by number
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
References: <20230717114511.484999-1-amadeuszx.slawinski@linux.intel.com>
 <20230717114511.484999-2-amadeuszx.slawinski@linux.intel.com>
 <ZLVIGlpoNsr0RRGE@smile.fi.intel.com> <ZLVI8NuiIZZrhjRg@smile.fi.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <ZLVI8NuiIZZrhjRg@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UPLNW2CI654ZQELZXKQT244MUVDJVIEH
X-Message-ID-Hash: UPLNW2CI654ZQELZXKQT244MUVDJVIEH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UPLNW2CI654ZQELZXKQT244MUVDJVIEH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/17/2023 3:58 PM, Andy Shevchenko wrote:
> On Mon, Jul 17, 2023 at 04:54:34PM +0300, Andy Shevchenko wrote:
>> On Mon, Jul 17, 2023 at 01:44:57PM +0200, Amadeusz Sławiński wrote:
>>> Some of the PCI IDs are not sorted correctly, reorder them by growing ID
>>> number.
>>
>> Hmm... I don't see a cover letter...
> 
> Okay, `b4` fetches it. It seems I asked you (or my memory is doing a trick?)
> to avoid using my @intel.com for LKML archives...
> 

It was on NHLT patchset review with Cezary, but I will also try to 
remember it for future patches.
