Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2C988A3D
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Aug 2019 11:22:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 076861672;
	Sat, 10 Aug 2019 11:21:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 076861672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565428925;
	bh=j370SQNtaFnSvaeOI8e5epyJT02NlOuchNY+WkC09SQ=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LPhRWv1Op50fi2ww3gwRY1e61KzZGOkbNa1wQNUZgIRse/bcgydxBgd8GZhbIcfNA
	 /yIzsR4NTjI5DlUb8M6UZKnO6URRAJJI+m/1zUublJ4I9zOXrLUJIRwXSwuLhVjo5r
	 7CTmiDVG2C4NVBcIoq4kbVcOiGTghVEOOZFpN2hQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58DDBF801A4;
	Sat, 10 Aug 2019 11:20:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEEEAF80506; Sat, 10 Aug 2019 11:20:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bitmer.com (50-87-157-213.static.tentacle.fi [213.157.87.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11D19F8015B
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 11:20:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11D19F8015B
Received: from dsl-hkibng31-54fae9-19.dhcp.inet.fi ([84.250.233.19]
 helo=[192.168.1.42])
 by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <jarkko.nikula@bitmer.com>)
 id 1hwNX0-0004hI-NA; Sat, 10 Aug 2019 12:19:22 +0300
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87zhkk6wdy.wl-kuninori.morimoto.gx@renesas.com>
 <87y3046wcf.wl-kuninori.morimoto.gx@renesas.com>
 <7ee1cbe3-4d6e-d843-dc2e-75bc9b3b421c@bitmer.com>
Message-ID: <00fb2b5b-ec46-4957-15c7-f2bfe40a8f9c@bitmer.com>
Date: Sat, 10 Aug 2019 12:19:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7ee1cbe3-4d6e-d843-dc2e-75bc9b3b421c@bitmer.com>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Jie Yang <yang.jie@linux.intel.com>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Richard Fontana <"r fontana"@redhat.com>,
 Shunli Wang <shunli.wang@mediatek.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Anders Roxell <anders.roxell@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, YueHaibing <yuehaibing@huawei.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Georgii Staroselskii <georgii.staroselskii@emlid.com>,
 Danny Milosavljevic <dannym@scratchpost.org>,
 Hans de Goede <hdegoede@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Alexios Zavras <alexios.zavras@intel.com>, Sangbeom Kim <sbkim73@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [PATCH 01/15] ASoC: soc-core: support
 snd_soc_dai_link_component for aux_dev
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi

On 8/10/19 12:16 PM, Jarkko Nikula wrote:
> Hi
> 
> On 8/8/19 8:52 AM, Kuninori Morimoto wrote:
>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>
>> To find aux_dev, ASoC is using .name, codec_name, codec_of_node.
>> Here, .name is used to fallback in case of no codec.
>>
>> But, we already have this kind of component finding method by
>> snd_soc_dai_link_component and soc_find_component().
>> We shouldn't have duplicated implementation to do same things.
>> This patch adds snd_soc_dai_link_component support to finding aux_dev.
>>
>> Now, no driver is using only .name.
>> All drivers are using codec_name and/or codec_of_node.
>> This means no driver is finding component from .name so far.
>> (Actually almost all drivers are using .name as just "device name",
>>  not for finding component...)
>>
>> This patch
>> 1) add snd_soc_dai_link_component support for aux_dev. legacy style will
>>    be removed if all drivers are switched to new style.
>> 2) try to find component via snd_soc_dai_link_component.
>>    Then, it doesn't try to find via .name, because no driver is using
>>    it so far.
>>
>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> ---
>>  include/sound/soc.h  |  7 +++++++
>>  sound/soc/soc-core.c | 36 ++++++++++--------------------------
>>  2 files changed, 17 insertions(+), 26 deletions(-)
...

> Bike-shedding: maybe comment here should say legacy style binding etc? I
> know these lines are removed by patch 13/15 but here yet comment is not
> valid :-)
> 
I forgot to add

Tested-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
