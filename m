Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A7D1C96A9
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 18:36:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91D771836;
	Thu,  7 May 2020 18:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91D771836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588869411;
	bh=EmFlHBXO4V7YYfSqpM+VGOlfRQLvV4547aKhY9KbRJ4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LPyVvtzLTKoas0ElFYslGM4UQYKfJiW8r0IkDMd0qH5sR6rH38lIAspvRuGfkvUvh
	 6Ox4R1kxO7Vp/20yGiQ9nkGICI14QTw07gPkOTYqB6x0bTMP7qWPik6bwAcikLo5u0
	 zJdSEP2q9jCHudgLzJwuqhZOwwa5cBjTMlSqhGOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5DFBF80162;
	Thu,  7 May 2020 18:35:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E344F8015F; Thu,  7 May 2020 18:35:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCB22F800F6
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 18:35:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCB22F800F6
IronPort-SDR: I0NKAczEm0pz0LcuCqW+yxBlNvGnPqxrsQY289SbW/9MDxdoHIBJcEWhd1/EEVXvXoZDHl0VRp
 z30kpPi73gHg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 09:35:01 -0700
IronPort-SDR: TBHS0JwCq65yCa/XiPaqpD3JjKSpXhMxUZZwCK5IQisDftfGgGC/UO6TtUFbXd9Dt718mz2rbC
 ooJ+A6HsHSaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; d="scan'208";a="250137145"
Received: from kawilli2-mobl.amr.corp.intel.com (HELO [10.251.4.116])
 ([10.251.4.116])
 by fmsmga007.fm.intel.com with ESMTP; 07 May 2020 09:35:00 -0700
Subject: Re: Keeping the codec running at all times
To: Ricard Wanderlof <ricardw@axis.com>
References: <alpine.DEB.2.20.2005061709110.12526@lnxricardw1.se.axis.com>
 <7a54134e-ce30-d7d5-bcf3-31269f1103f1@perex.cz>
 <73594637-b978-aca8-e81e-be72a5075ae8@linux.intel.com>
 <alpine.DEB.2.20.2005071002590.25559@lnxricardw1.se.axis.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7e737532-4158-8242-90c5-56f0ec0094b2@linux.intel.com>
Date: Thu, 7 May 2020 11:35:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.2005071002590.25559@lnxricardw1.se.axis.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel <alsa-devel@alsa-project.org>
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


>> If your codec exposes a clock object then you could have e.g. a board or
>> machine driver configure the clock
>> (clk_get/clk_set_rate/clk_prepare_enable) and leave it on regardless of
>> the streaming usages. You would still need to make sure that the clock
>> rates are compatible with the hw_params when streaming does happen.
>> that's what e.g. was done for Intel to make sure the MCLK, BCLK and
>> FSYNC could be enabled even when the DSP was idle.
> 
> Which driver is that?

sound/soc/intel/skylake/skl-ssp-clk.c

and its users in

sound/soc/intel/boards/

kbl_rt5663_rt5514_max98927.c
kbl_rt5663_max98927.c

these examples are more to turn the clock on to meet codec requirements, 
but there were other cases that weren't upstreamed where the clocks were 
turned on at boot time as you described it.

The code is probably rather obscure but the idea itself holds water. As 
long as the clock is used the provider remains active - even if no 
streaming takes place.

Hope this helps
-Pierre


