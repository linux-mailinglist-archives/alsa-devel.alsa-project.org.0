Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1186A4B56
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 20:42:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4E98828;
	Mon, 27 Feb 2023 20:41:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4E98828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677526932;
	bh=wCFnF2gzwXlFH5IRtpyapY9jGTWsCFYXSJ90EedowJo=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m/CpAvlouLKFyh+fQPMqfB7h3v5jXad2+Jy8tOEQ8RA8VqeyuM+6YTzZPEwWxC29u
	 tOxSoH9jnMh47z8bcOujW1Ct74FBUarV22+MdAhPGdzmbO+1VgFy2wUKw+waMxnqST
	 0RzhloErNBYcrMrwQmT0vWU5zciQHaabCH2TT81I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8017F802BE;
	Mon, 27 Feb 2023 20:41:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10494F8049C; Mon, 27 Feb 2023 20:41:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64DD7F800FA
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 20:41:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64DD7F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LU4Q+LxR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677526872; x=1709062872;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wCFnF2gzwXlFH5IRtpyapY9jGTWsCFYXSJ90EedowJo=;
  b=LU4Q+LxRFqK1P1gsqjBfXm7ZXofITHBIECW+K6WQjr7//LMj82Q8FDax
   gy3nPWDWqfHc/7FRZNpPN3zP9Accxsjg0+ezjsBODBHPf7rbpSSWAvFHu
   qzbkTmfCOz1l/zxpSbTELD44iC8aD8BlOJY4QUjySAtB1FgjJy04/7vA9
   sMJKo2bjT/9JHaQIaBa3ZcFN81H9AnAuNs0wUgaDKztkv09/tUUR9OSey
   uNpfuXBFoT4QV7aU3FYPX5vj03viwBGdaQcS3yX0HjJP64b4gbOV/a2r5
   E1b83SbZrbJ6ZfU33i1MsOZ0Jy89FgQa82JY9oBpedt/1o8nCn1YZNIxg
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="313622849"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400";
   d="scan'208";a="313622849"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 11:41:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="783512734"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400";
   d="scan'208";a="783512734"
Received: from jaidenno-mobl.amr.corp.intel.com (HELO [10.212.85.4])
 ([10.212.85.4])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 11:40:58 -0800
Message-ID: <3a6d02a6-0b1d-6e9e-2f14-337373edec48@linux.intel.com>
Date: Mon, 27 Feb 2023 14:40:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V4 8/8] soundwire: amd: add pm_prepare callback and pm ops
 support
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, vkoul@kernel.org
References: <20230227154801.50319-1-Vijendar.Mukunda@amd.com>
 <20230227154801.50319-9-Vijendar.Mukunda@amd.com>
 <82c7303b-131e-0633-2c08-5b4b414ad941@linux.intel.com>
 <acd3a560-1218-9f1d-06ec-19e4d3d4e2c9@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <acd3a560-1218-9f1d-06ec-19e4d3d4e2c9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QDKBP4OIKOKKC56GLVBXZJSKF4HFSJLH
X-Message-ID-Hash: QDKBP4OIKOKKC56GLVBXZJSKF4HFSJLH
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 amadeuszx.slawinski@linux.intel.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QDKBP4OIKOKKC56GLVBXZJSKF4HFSJLH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/27/23 13:42, Mukunda,Vijendar wrote:
> On 27/02/23 22:37, Pierre-Louis Bossart wrote:
>>
>> On 2/27/23 10:48, Vijendar Mukunda wrote:
>>> Add pm_prepare callback and System level pm ops support for
>>> AMD SoundWire manager driver.
>>>
>>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>>> Signed-off-by: Mastan Katragadda <Mastan.Katragadda@amd.com>
>> seems like you missed my comments in
>> https://lore.kernel.org/alsa-devel/7d32d552-6ca0-3c40-11ce-c8d727cadc05@linux.intel.com/
> you missed my mail in reply thread. That's why we couldn't
> get a chance to check your review comments.

I don't see a reply be it in my local mail client or lore?
