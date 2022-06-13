Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0565485A0
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 16:04:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28396178D;
	Mon, 13 Jun 2022 16:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28396178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655129091;
	bh=QfkOr+3csJZv8GJH+WA6DnUC6DDMS+jmtfVN1fYNtS4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VXCyKX3gWwRSNg5QABMeCS7yy7v+GUQ2tWcuk4+6n66+ChuIKr8OwHiLs5RpQVJYH
	 K52QW+pxs8kSR5ywsv92rWDed2vI68tzVEYSc9rj2fFEk5zF2dSYWEYcL4VNmikxGl
	 O+UecmyLDMpPNiRp+14/neNdgSA2NfV34Oasu4+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E475F804CC;
	Mon, 13 Jun 2022 16:03:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B021F80107; Mon, 13 Jun 2022 16:03:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 457DFF80107
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 16:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 457DFF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QPPCzsHT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655129021; x=1686665021;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QfkOr+3csJZv8GJH+WA6DnUC6DDMS+jmtfVN1fYNtS4=;
 b=QPPCzsHT/hYjHgq3JRoxu5vmZUZyNTchfU64XwoKwaLOCTQRvMOMJyQ1
 86aJZgLwuBT9tnrMdjutWZnRsLv4/l3MolY0akvhQJSPRx/OGuohgNuV3
 5YnBoaaCGpQeMVHRDHPcSIJPGkDHzCKRSBkkisnYgZUHf1RjSFhrCQYbJ
 odpPrZLRcmEgdrG41PAKehEkeD7TJI6V/DO3nM0lhsfGl7v5kcNPuE6xz
 oZW5wsRwZ9SjStB3koFxfSqpHgtioLER5GlTorbmJYC7uua3Dg9oVjavo
 QCqTvA54tpQj7oQ0RmplO1J4yDd5IG0LMCcM4HmXhYvQOlwNxLmNkYGo0 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="279011474"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="279011474"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 07:03:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="910399846"
Received: from tchuynh1-mobl1.amr.corp.intel.com (HELO [10.212.112.176])
 ([10.212.112.176])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 07:03:31 -0700
Message-ID: <47431e56-9acb-7c7d-307f-83d81956ec5c@linux.intel.com>
Date: Mon, 13 Jun 2022 08:05:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: ACPI REV override for Dell XPS 13 9343
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>,
 Mark Brown <broonie@kernel.org>
References: <29a2ca0f-bc0a-04b0-d0c9-8658359d365c@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <29a2ca0f-bc0a-04b0-d0c9-8658359d365c@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Hans de Goede <hdegoede@redhat.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 6/13/22 05:53, Cezary Rojewski wrote:
> Hello,
> 
> It's been a while since catpt-driver [1] has been introduced to provide
> full support for Broadwell (BDW) machines with Intel DSP. For BDW, audio
> devices can make use of DSP only in I2S mode. In 2015 Rafael and Dominik
> provided quirk [2] for Dell XPS 13 9343. Given the description:
> 
> _For example, based on what ACPI exports as the supported revision, Dell
> XPS 13 (2015) configures its audio device to either work in HDA mode or
> in I2S mode, where the former is supposed to be used on Linux until the
> latter is fully supported (in the kernel as well as in user space)._
> 
> It's clear that such configuration was not fully supported back then. I
> believe now it is. Perhaps it is time to let the quirk in mention go? By
> that I mean just the relevant entry, not the ACPI_REV_OVERRIDE_POSSIBLE
> functionality as a whole.

This should be a distribution or power-user decision to enable the I2S
version IMHO.

There is nothing new in terms of functionality with the I2S version, so
limited added-value that doesn't offset the added risk due to the
dependencies on mixer settings that may or may not be installed (UCM, etc).

If it ain't broke don't fix it.
