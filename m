Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D80C02CF709
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 23:43:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A53C189F;
	Fri,  4 Dec 2020 23:43:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A53C189F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607121837;
	bh=mFmYPoBRvPgoa7mhE05am2M3T3g9NHjm2ODEOn+qynI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h5ujMK4IBTXcsUaSzgwr8c9QjVdYTCXoNN4nCCLZ/8knhnbF46v9/TyeZ2Q/9xBLl
	 u2tXOPKQdGN8+K+aOKPxvTRkXAiRy4rt3/+2vLSfU7O1GjPcRQFzQcCYBfXP3k2q9E
	 tlV4xnPevcdlsknBUYwmAJPp4UMxRZpcLXIpaSmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 654DCF8049C;
	Fri,  4 Dec 2020 23:42:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52B0EF80278; Fri,  4 Dec 2020 23:42:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2225F800E8
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 23:42:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2225F800E8
IronPort-SDR: 0ALIhGtkrD1iw28ogOhGUihU8V/nMKbRz97/rS9EJXH/kKd9O0xlTjjTB2Ou6bOUqO6SJdMz2Q
 ha7TsKrtBsmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9825"; a="152709374"
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; d="scan'208";a="152709374"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 14:42:07 -0800
IronPort-SDR: mL4T++niox9qduaXmLUaSCbZRNL3NS1sisIFB2wHMqKyTmW/BqggT+WG99xKJ0n7bbuBDmZgDJ
 k5IJOft6vNzw==
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; d="scan'208";a="366470186"
Received: from rdgreco-mobl.amr.corp.intel.com (HELO [10.209.191.178])
 ([10.209.191.178])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 14:42:07 -0800
Subject: Re: [PATCH 1/4] ASoC/SoundWire: rt1316: Add RT1316 SDCA
 vendor-specific driver
To: Mark Brown <broonie@kernel.org>, =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
 <shumingf@realtek.com>
References: <20201202143845.18697-1-yung-chuan.liao@linux.intel.com>
 <20201202143845.18697-2-yung-chuan.liao@linux.intel.com>
 <20201203123802.GD4700@sirena.org.uk>
 <8b585fdb0b624ec892c55c0139d61e75@realtek.com>
 <20201204175601.GE4558@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <333b7226-6536-94d4-001f-c96214874948@linux.intel.com>
Date: Fri, 4 Dec 2020 16:42:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201204175601.GE4558@sirena.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, "vkoul@kernel.org" <vkoul@kernel.org>,
 "Flove\(HsinFu\)" <flove@realtek.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>
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



On 12/4/20 11:56 AM, Mark Brown wrote:
> On Fri, Dec 04, 2020 at 02:42:54AM +0000, Shuming [范書銘] wrote:
> 
>>>> +/* RT1316 SDCA function topology */
>>>> +#define FUN_SMART_AMP 0x04
> 
>>> Full marks for picking this constant!
> 
>> Sorry, I don't get that point. Could you give me a hint?
> 
> The name is funny - "fun smart amp".

Indeed.

FWIW, 'fun' stands for 'function' here. The SDCA spec defines different 
types of high-level 'functions', e.g. 'smart amp, 'smart mic', 'simple 
mic', 'universal audio jack', etc., and for each provides a number of 
options.

in this series rt711 would be mapped to UAJ, rt715 to smart mic and 
rt1316 to smart amp.

