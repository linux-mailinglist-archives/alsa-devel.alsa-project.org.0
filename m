Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8AC36B925
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 20:41:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E912716FB;
	Mon, 26 Apr 2021 20:40:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E912716FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619462485;
	bh=WB6Yd3u09nxS0uHxHenraJ4f5hM5g1DUzHeT7uxQ/2Y=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fFL3tDtOwHskjRk3wnX7Z3Ilb1YCaCPsIq6q6L/ZSkzr0120r32xuVLMC6ZLXxgSf
	 cNnFJPp3C2uDGiO15l/2ZktwtNiZlWNoykFp6mRtDZ7P3KPTStuzyF8taoXsQYjw1F
	 NUyqvap+VoievmpH0T0FbEFnQpXd1nXeaGaOLJ8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39BB9F80171;
	Mon, 26 Apr 2021 20:39:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0521EF8016C; Mon, 26 Apr 2021 20:39:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F5BCF8012A
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 20:39:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F5BCF8012A
IronPort-SDR: rm7vsEt65GjJ455P4LACrdWLH/NCiuBG1Wk1zn7rB2Bj6itWO2wcCajIX/zVuSuE0azrb+dr0+
 AxUk1ll+kk5A==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="194269423"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="194269423"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 11:39:37 -0700
IronPort-SDR: 1DSOqko7Kr00REDrsDtAuK+wvLdAQdx/HRbZeFFrvRk92kP1HxjahktUTmdyV4WbdINXQM8whJ
 3xZ1c4SBtBtA==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="403015418"
Received: from fdubuc-mobl1.amr.corp.intel.com (HELO [10.212.41.8])
 ([10.212.41.8])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 11:39:37 -0700
Subject: Re: [PATCH v2 5/5] ASoC: da7219: properly get clk from the provider
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>
References: <20210421120512.413057-1-jbrunet@baylibre.com>
 <20210421120512.413057-6-jbrunet@baylibre.com>
 <69eaa840-ed77-fc01-2925-7e5e9998e80f@linux.intel.com>
Message-ID: <883fda5c-0ef5-8b9c-80fa-4348b4368f5c@linux.intel.com>
Date: Mon, 26 Apr 2021 13:39:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <69eaa840-ed77-fc01-2925-7e5e9998e80f@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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


> On 4/21/21 7:05 AM, Jerome Brunet wrote:
>> Instead of using the clk embedded in the clk_hw (which is meant to go
>> away), a clock provider which need to interact with its own clock should
>> request clk reference through the clock provider API.
>>
>> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> 
> This patch seems to introduce a regression in our modprobe/rmmod tests
> 
> https://github.com/thesofproject/linux/pull/2870
> 
> RMMOD    snd_soc_da7219
> rmmod: ERROR: Module snd_soc_da7219 is in use
> 
> Reverting this patch restores the ability to remove the module.
> 
> Wondering if devm_ increases a module/device refcount somehow?

the following diff fixes the issue for me

There is an explicit try_module_get() in clk_hw_create_clk, so you 
end-up increasing the refcount of your own module.

devm_ doesn't seem like a good idea here, I think we have to release the 
clk and its implicit module reference when the component is freed, no?

I can send a proper fix if there is consensus.


diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index bd3c523a8617..8696ac749af3 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -2182,7 +2182,7 @@ static int da7219_register_dai_clks(struct 
snd_soc_component *component)
                         goto err;
                 }

-               da7219->dai_clks[i] = devm_clk_hw_get_clk(dev, 
dai_clk_hw, NULL);
+               da7219->dai_clks[i] = clk_hw_get_clk(dai_clk_hw, NULL);
                 if (IS_ERR(da7219->dai_clks[i]))
                         return PTR_ERR(da7219->dai_clks[i]);

@@ -2218,6 +2218,8 @@ static int da7219_register_dai_clks(struct 
snd_soc_component *component)
                 if (da7219->dai_clks_lookup[i])
                         clkdev_drop(da7219->dai_clks_lookup[i]);

+               clk_put(da7219->dai_clks[i]);
+
                 clk_hw_unregister(&da7219->dai_clks_hw[i]);
         } while (i-- > 0);

@@ -2240,6 +2242,8 @@ static void da7219_free_dai_clks(struct 
snd_soc_component *component)
                 if (da7219->dai_clks_lookup[i])
                         clkdev_drop(da7219->dai_clks_lookup[i]);

+               clk_put(da7219->dai_clks[i]);
+
                 clk_hw_unregister(&da7219->dai_clks_hw[i]);
         }



