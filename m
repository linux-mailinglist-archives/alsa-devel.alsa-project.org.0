Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA0C1A293A
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Apr 2020 21:14:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFDD41616;
	Wed,  8 Apr 2020 21:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFDD41616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586373294;
	bh=DpQLVC/Mj0JOl6khf5/0IrVGEfpEa20ZS4lttbM77n0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vFX+wLlL/3XTE3k3F7u9yntPmN2NlpNiwG2DnU0QYw2TS6tRntBdldeROksr/ieYC
	 A+n3pQTCClNGkE8sR1MkGN1ghzPhYkd9F7kIVY10T/HIlUzUJGS6iVvqCjJE8CMnY7
	 HpoRQhNTh0ayokf9yykuL9QHezSwqIbZR41bXqqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC7F6F80107;
	Wed,  8 Apr 2020 21:13:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 063D8F80143; Wed,  8 Apr 2020 21:13:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D85ABF80107
 for <alsa-devel@alsa-project.org>; Wed,  8 Apr 2020 21:13:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D85ABF80107
IronPort-SDR: zpQeHFtdcARIAz8n+VTY2Ve6SHNCqyQKQQTqJXqr9mNUzVbTWiu9jh+ApavHjuKsz1mpPSI9se
 1H1PpaMfkWKQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 12:13:01 -0700
IronPort-SDR: CkKPzE9Tf7VRoIKyHvOi4WoURCzJ6+LDNSQTWiUmjQnyfvFsPfmmWPPxbP7GbrDcwWC1/HwdHT
 uxxveu7ZPHrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,359,1580803200"; d="scan'208";a="254240576"
Received: from maguirre-mobl2.amr.corp.intel.com (HELO [10.212.247.110])
 ([10.212.247.110])
 by orsmga008.jf.intel.com with ESMTP; 08 Apr 2020 12:13:00 -0700
Subject: Re: [PATCH] ASoC: rt5682: fix building without I2C
To: Arnd Bergmann <arnd@arndb.de>, Oder Chiou <oder_chiou@realtek.com>,
 Mark Brown <broonie@kernel.org>
References: <20200408185527.308213-1-arnd@arndb.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <08b488ef-91bb-ab66-c2d8-16822f3bf152@linux.intel.com>
Date: Wed, 8 Apr 2020 14:12:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200408185527.308213-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kbuild test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Derek Fang <derek.fang@realtek.com>,
 Shuming Fan <shumingf@realtek.com>
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



On 4/8/20 1:55 PM, Arnd Bergmann wrote:
> When I2C is disabled, building rt5682 produces a compile-time error:
> 
> sound/soc/codecs/rt5682.c:3716:1: warning: data definition has no type or storage class
>   3716 | module_i2c_driver(rt5682_i2c_driver);
>        | ^~~~~~~~~~~~~~~~~
> sound/soc/codecs/rt5682.c:3716:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Werror=implicit-int]
> sound/soc/codecs/rt5682.c:3716:1: warning: parameter names (without types) in function declaration
> sound/soc/codecs/rt5682.c:3706:26: error: 'rt5682_i2c_driver' defined but not used [-Werror=unused-variable]
>   3706 | static struct i2c_driver rt5682_i2c_driver = {
>        |                          ^~~~~~~~~~~~~~~~~
> 
> Move the i2c specific entry points into an #ifdef section so
> it can actually be built standalone.
> 
> Fixes: 5549ea647997 ("ASoC: rt5682: fix unmet dependencies")

it's already fixed by [PATCH -next] ASoC: rt5682: Fix build error 
without CONFIG_I2C



