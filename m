Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EB85106DA
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 20:27:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D1E21775;
	Tue, 26 Apr 2022 20:26:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D1E21775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650997630;
	bh=ZuPnvFZNswVO1fl4nhr2mqdjBJnDGRZrnC3EGIp5014=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pJRxecJ890lejuXW+2Hdkf3AsQ8FcrHR6tqLswMso4N5Gf5QzYwQE/ru9phHqAYaA
	 3SHFCvEZMNbPf0riUrmipchmN3JXvCsOB28BRGcUqJTAlg8SjLC070o/76j0xJCEGu
	 WjHtjYk2sqw1n99JBtGivJpTyriMr8XSHg7eF0J0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDCF2F800FA;
	Tue, 26 Apr 2022 20:26:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A627F800FA; Tue, 26 Apr 2022 20:26:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 294EFF800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 20:26:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 294EFF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jgi5B8ju"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650997576; x=1682533576;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZuPnvFZNswVO1fl4nhr2mqdjBJnDGRZrnC3EGIp5014=;
 b=jgi5B8juoPA3Cn/YrWX1Br2AQo1ZVKfCdIJUqtPiMk8b4wIs8DHG6hqz
 XDzgI3QxjrivIUwySyodTyTGn88mS4I9fgeVNsX4fwgDiQr/1mn8OeJyv
 Pj/Lp3KuaN5dHvAmxvnF2fRFgni9W4U5WQ267Og129SMTilX+zkpvaQjC
 kaVcI1bLqsha+GSiXsVDQxtLkvT5ku5riBO8HEjm0JcsH4vcQqU69brQs
 CO/qBp4qB6AlCc0b779o11J5Cf4A7UEMX000vQbMR47DOnhzI74vAQlH9
 XaS7yNDpusCyi+6UkU8hGEc+tSaPUOByYGCaTGuJCDzdUJaCwPBBxdVb7 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="326172108"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="326172108"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 11:26:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="628653524"
Received: from jzhang96-mobl.amr.corp.intel.com (HELO [10.212.151.202])
 ([10.212.151.202])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 11:26:09 -0700
Message-ID: <ba9e90de-94ad-d6c9-b6df-1fe6f802e9d6@linux.intel.com>
Date: Tue, 26 Apr 2022 13:26:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: Intel: avs: Depend on CONFIG_ACPI
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <20220426115454.685787-1-amadeuszx.slawinski@linux.intel.com>
 <eab567f0-73a4-bf23-76bf-8d576fa942f0@linux.intel.com>
 <YmgnE/HKNmI+agNs@sirena.org.uk>
 <726c58e5-241d-053f-8b4c-d56a5a228f0f@intel.com>
 <Ymg5CAbwf/UxUOff@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Ymg5CAbwf/UxUOff@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>
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



On 4/26/22 13:25, Mark Brown wrote:
> On Tue, Apr 26, 2022 at 08:07:22PM +0200, Cezary Rojewski wrote:
> 
>> Would you like the change proposed by Pierre to be part of this patch or a
>> separate one?
> 
> Either is fine.
> 
>> Also, I assume the above code does not change, just:
>> s/select SND_SOC_ACPI/select SND_SOC_ACPI if ACPI/
> 
>> is applied on top of what's already in the patch. Is my deduction correct?
> 
> AIUI the current patch and associated hard dependency on ACPI could be
> dropped but I've not checked or thought too deeply about it


my suggestion was the following:

depends on PCI
depends on COMMON_CLK
select SND_SOC_ACPI if ACPI
