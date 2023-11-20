Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C85C37F1C23
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 19:18:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC2BBDED;
	Mon, 20 Nov 2023 19:18:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC2BBDED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700504325;
	bh=Uy/JOOl2F0hOLE08z0LK0OspugTXHtlXgW1jln1Dmjo=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=e1NqUlRQcYVLiZhaPjhM4V5wBogDih1Z1PIAorsKVGkuchcbYV+zIwGBemUuHju3G
	 HN5+nHjq7Q+bmUCqbvnPPPDrcb71qjH4L5LnYqrXGFNNiFZNv6Vl3qvZIrnoJX4EEG
	 1oGxVzq7Evu/L7aOOZ4QECjZhaP3yfEA3Ywwz7bE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C539F80579; Mon, 20 Nov 2023 19:18:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85F48F8055C;
	Mon, 20 Nov 2023 19:18:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34AC0F802E8; Mon, 20 Nov 2023 19:18:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28938F80246
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 19:18:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28938F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VFL2STt4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700504284; x=1732040284;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=Uy/JOOl2F0hOLE08z0LK0OspugTXHtlXgW1jln1Dmjo=;
  b=VFL2STt40vDW5M349w2xoHp/4GzPdxaTJFFiCzQq3r3bPQeCvpRkxmaO
   7A+ct6T0GahIMUv/3WNQe9WV8zLn9XADCzhvhP0vIe54VBI3iK1YsXl9P
   pOZDMyBwwSyKG4n0BeNlEX2IISsHvU6Bm9hBS72m/6YT2DiAja1oMi3nD
   vuFQqFfcEmfIKFM6YPhhrUAheE0kJpgw9Y+UDuDqmwWz5gbp07cWjO6//
   7EPIgJ373vp29L1Jyek9WeJ3KgBndE8dXei+bLbILGLyqaOF3mmOwCK5F
   4tfVu131da3EfS0gSzRnoh1fy9Jh88vpXfhDmke6ZI79HnZUVRt+0XDkC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="382060521"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600";
   d="scan'208";a="382060521"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:17:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="832360878"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600";
   d="scan'208";a="832360878"
Received: from jhahn1-mobl1.amr.corp.intel.com (HELO [10.209.22.30])
 ([10.209.22.30])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:17:39 -0800
Message-ID: <929eb682-8deb-4054-a7c1-b7b60831d7df@linux.intel.com>
Date: Mon, 20 Nov 2023 12:17:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: stream: constify sdw_port_config when adding
 devices
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20231120174720.239610-1-krzysztof.kozlowski@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231120174720.239610-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: REMIZI62DCMJOB4TXUBUJCAUSVQ4QPAS
X-Message-ID-Hash: REMIZI62DCMJOB4TXUBUJCAUSVQ4QPAS
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 11/20/23 11:47, Krzysztof Kozlowski wrote:
> sdw_stream_add_master() and sdw_stream_add_slave() do not modify
> contents of passed sdw_port_config, so it can be made const for code
> safety and as documentation of expected usage.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

