Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4852A1C1945
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 17:19:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0204216B5;
	Fri,  1 May 2020 17:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0204216B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588346353;
	bh=xT08XPw8plO+r+63ijCkvoeFGEV8iywlwxKi3f8T6KE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fme0oPS4ZHIOZMSsrVsac/Vc13nwVHOJ/bRIdc16Ei4iK8GSydo2j+e9AqeIAcDyc
	 /XzIm65yvWUVzabQZbdzP1l1xae8Ts7lWpSvxUkop1WIAoHyXe1ls4wrlQnAqE0KtV
	 bw+AKQPokx/jGpPLW5wY2eOaUECC1Jv73MtqXok8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73823F800B6;
	Fri,  1 May 2020 17:18:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A63C9F80245; Fri,  1 May 2020 17:18:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FA1AF800B6
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 17:18:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FA1AF800B6
IronPort-SDR: 8giOim9vMsxOxm7D5GnVcmYWWLq5Bip87MbeyHkVsFQIEIN/5zPQB39CUiFvNayurV/daAy/0X
 UkbgzcskTOxw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2020 08:18:06 -0700
IronPort-SDR: G6sez57Sd23OlT1+5nLaWjH6hYM4GEfoJABx8Ni7dwSTLcPiHilm/Ig2OTHJzA+gmi/EzLSiQc
 c2fYaywmT6Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,339,1583222400"; d="scan'208";a="276847916"
Received: from srodrig5-mobl2.amr.corp.intel.com (HELO [10.254.111.158])
 ([10.254.111.158])
 by orsmga002.jf.intel.com with ESMTP; 01 May 2020 08:18:05 -0700
Subject: Re: [PATCH] ASoC: Intel: boards: sof-wm8804: support for Hifiberry
 Digiplus boards
To: Mark Brown <broonie@kernel.org>
References: <20200501150611.15395-1-pierre-louis.bossart@linux.intel.com>
 <20200501150949.GE5276@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ffd0e3a2-6a9b-e5aa-c133-916a3a01acee@linux.intel.com>
Date: Fri, 1 May 2020 10:18:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501150949.GE5276@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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



On 5/1/20 10:09 AM, Mark Brown wrote:
> On Fri, May 01, 2020 at 10:06:11AM -0500, Pierre-Louis Bossart wrote:
> 
>> @@ -0,0 +1,298 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) 2018-2020, Intel Corporation
>> +/*
>> + * sof-wm8804.c - ASoC machine driver for Up and Up2 board
> 
> Please make the entire comment a C++ one so things look clearer.

right, I keep forgetting about this and we mechanically use the old 
style by copy/pasting. Will make sure the new machine drivers use C++ 
comments. v2 sent.
