Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC83C75659D
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 15:57:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18020AE9;
	Mon, 17 Jul 2023 15:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18020AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689602278;
	bh=pdA/qAf4rNsoNPcNDK7jVMmv1VVjib0VXxBO+XA3soA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E+aBaYhFLLHcBNjZxGHPPxxhaWzoeQ+CYGh9Truf8qR9vYFTKhCA6/8ZsgeinteQn
	 Hf8z9tW7Ds8GdY7l1qUBE5+UdvNjpRmYJy8BZG2XgxT7RGM0VaaQKmEfIqKnmYkAF7
	 E9psJLxyYobatpG3J7eaH33teSgpIskM87zn5xsE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1B0DF8053B; Mon, 17 Jul 2023 15:56:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A4BDF8032D;
	Mon, 17 Jul 2023 15:56:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2336EF8047D; Mon, 17 Jul 2023 15:56:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3024F800D2
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 15:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3024F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=B5N6q1kB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689602195; x=1721138195;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pdA/qAf4rNsoNPcNDK7jVMmv1VVjib0VXxBO+XA3soA=;
  b=B5N6q1kBXk4im4q9aWS9xMOrBYJHUwhFFrJR7B6q97J+pRztqRJkJvXg
   UnIs5et342htixntIsgdnNjCuHc1Io0AugmczB4OajIvwIkzckABJ28KN
   pGVL804w05UqGz9fJ6kCCclnHCHawreo7N9AaDKOo+fj1RZk/Bm+YtV8C
   BfvEN91MEHFWE6xJe1jDwFeGdAwwcBwNnmxOBo9XuumIC9Hq2lG80riGi
   SpKjfeuJ+iy3X1enghyR1CH0DeVYpw+smjrSCc8EQx0POxdyWN4eOM9rx
   BvK9Z9dcO7HTwWRk47DJ046mxPT4TIWW9w+Xj6sK+W0FbMmCl1rstAwuk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="345526075"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="345526075"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 06:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="752903787"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="752903787"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 06:56:28 -0700
Message-ID: <c1f766c1-94eb-7339-f4c1-537f6d2e502e@linux.intel.com>
Date: Mon, 17 Jul 2023 15:56:13 +0200
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
 <ZLVIGlpoNsr0RRGE@smile.fi.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <ZLVIGlpoNsr0RRGE@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D2F7FJM4SPQAN3BCYTBP4PLKPAMTDNP3
X-Message-ID-Hash: D2F7FJM4SPQAN3BCYTBP4PLKPAMTDNP3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D2F7FJM4SPQAN3BCYTBP4PLKPAMTDNP3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/17/2023 3:54 PM, Andy Shevchenko wrote:
> On Mon, Jul 17, 2023 at 01:44:57PM +0200, Amadeusz Sławiński wrote:
>> Some of the PCI IDs are not sorted correctly, reorder them by growing ID
>> number.
> 
> Hmm... I don't see a cover letter...
> 

It's out there...

https://lore.kernel.org/alsa-devel/20230717114511.484999-1-amadeuszx.slawinski@linux.intel.com/T/#t
