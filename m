Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2131E207CEC
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 22:28:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B020418A9;
	Wed, 24 Jun 2020 22:28:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B020418A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593030535;
	bh=xGlJDuCFuiyNC/WfSI8900zxhz9B3JJuLSRKUNTjp+w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A1YpRvGU2bXGOtCmZnw1/XkNl9x2Ak8qWMG4n9QV+TpEPspfZo4Wr5lW1RXF1c03Z
	 /0IrQd97R75B06RT6tT62FMgXsiPALWiEkX+oe5f/KBI5/xqxvsdiN4w325uTjc+bU
	 K7QGo/dN+FF9X02R+JzvwcgPmIeqdiEDX7oYKODA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43B94F8012F;
	Wed, 24 Jun 2020 22:27:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC3A7F8015B; Wed, 24 Jun 2020 22:27:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B08FF80084
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 22:27:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B08FF80084
IronPort-SDR: OGPNHvo4rDYxOmZacphplvI/7tryR65v25i0ptkAX3OUYi/JtoNSOEJcDVgh/rarVBan968vvP
 ZLSsMWRgN7OA==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="124284340"
X-IronPort-AV: E=Sophos;i="5.75,276,1589266800"; d="scan'208";a="124284340"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2020 13:27:01 -0700
IronPort-SDR: siJlxza16Uy5oOAcPrd3n1wCsgLFleLrhgOnTelKLeoJai6Tzy/DXBawqPY8Ci4AuBbG5cTvgE
 H/OMsHvww47A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,276,1589266800"; d="scan'208";a="319556663"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.12.106])
 ([10.213.12.106])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2020 13:26:58 -0700
Subject: Re: [PATCH 2/5] ASoC: Intel: bdw-rt5677: fix module load/unload issues
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200622154241.29053-1-pierre-louis.bossart@linux.intel.com>
 <20200622154241.29053-3-pierre-louis.bossart@linux.intel.com>
 <031f1766-14cc-76ed-4a0f-b0436c50922a@intel.com>
 <5faf3ae1-697c-a5fa-4162-2938bb890f0f@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <df9ee755-c8fe-2203-4752-c97e53322cd4@intel.com>
Date: Wed, 24 Jun 2020 22:26:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <5faf3ae1-697c-a5fa-4162-2938bb890f0f@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 Curtis Malainey <curtis@malainey.com>, broonie@kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

On 2020-06-24 10:06 PM, Pierre-Louis Bossart wrote:
> On 6/24/20 2:14 PM, Cezary Rojewski wrote:
>> On 2020-06-22 5:42 PM, Pierre-Louis Bossart wrote:
>>> The mainline code currently prevents modules from being removed.
>>>
>>> The BE dailink .init() function calls devm_gpiod_get() using the codec
>>> component device as argument. When the machine driver is removed, the
>>> references to the gpiod are not released, and it's not possible to
>>> remove the codec driver module - which is the only entity which could
>>> free the gpiod.
>>>
>>> This conceptual deadlock can be avoided by invoking gpiod_get() in the
>>> .init() callback, and calling gpiod_put() in the exit() callback.
>>>
>>> Tested on SAMUS Chromebook with SOF driver.
>>>
>>
>> As /intel/haswell is the go-to driver for BDW platforms, please test 
>> and confirm with legacy driver first. SOF is optional and thus 
>> non-blocking.
> 
> I'll retest when you've fixed the go-to legacy driver, I am not even 
> going to try module load/unload tests when the platform code has known 
> issues requiring reverts.

??

Judging by recent comments from the revert thread, you already had build 
with patch-reverted ready. Shouldn't be a problem to retest with that one.

Power transition update is unavoidable if that's what you're asking. 
Without it, hardware *may* achieve a power state, but that's certainly 
not a D3 one.

Czarek
