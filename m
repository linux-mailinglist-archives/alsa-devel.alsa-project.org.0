Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BB2113AAD
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 05:01:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E86C01674;
	Thu,  5 Dec 2019 05:00:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E86C01674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575518459;
	bh=EmVjIK3Omk4T3KTna4V7TXKLsN8OPvhiWMvEQKzeVN4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z24Cn4rbGYtoagzAUsIF2ZthmuDr4QzDAUb7LDMTZLaInHSds3sTJ//71mdiCzLTL
	 A2D2tTulUS5PA/fTAnIUgeH1rVziEQbZPIW4uMlRuXrelM06idi11jaXTNy0sv9OIj
	 wr8+KUcm75ve0n0Er55rQ58lueXMZ+Y+C5hg788I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2AAEF800B4;
	Thu,  5 Dec 2019 04:59:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D39EFF801F8; Thu,  5 Dec 2019 04:58:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C9E4F8010F
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 04:58:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C9E4F8010F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 19:58:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,279,1571727600"; d="scan'208";a="219097101"
Received: from bcmarin-mobl.amr.corp.intel.com (HELO [10.255.230.27])
 ([10.255.230.27])
 by fmsmga001.fm.intel.com with ESMTP; 04 Dec 2019 19:58:47 -0800
To: Curtis Malainey <cujomalainey@google.com>
References: <20191204011118.74217-1-cujomalainey@chromium.org>
 <a828597a-2faa-d672-a6a0-43fcaaa6bca1@linux.intel.com>
 <CAOReqxjqF6kPyX99i7CzLeTip2yVKezo=Laobuk-SRg6_D2n1Q@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <359b7c67-dae5-b855-ff0f-226aea1e092b@linux.intel.com>
Date: Wed, 4 Dec 2019 21:58:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAOReqxjqF6kPyX99i7CzLeTip2yVKezo=Laobuk-SRg6_D2n1Q@mail.gmail.com>
Content-Language: en-US
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Hui Wang <hui.wang@canonical.com>, Ben Zhang <benzh@chromium.org>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jenny TC <jenny.tc@intel.com>, Bard Liao <bardliao@realtek.com>,
 Sathya Prakash M R <sathya.prakash.m.r@intel.com>,
 Naveen Manohar <naveen.m@intel.com>,
 Curtis Malainey <cujomalainey@chromium.org>, Jon Flatley <jflat@chromium.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Subject: Re: [alsa-devel] [RESEND PATCH] ASoC: intel: Add Broadwell rt5650
 machine driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/4/19 4:51 PM, Curtis Malainey wrote:
>>
>>> +/* ASoC machine driver for Broadwell DSP + RT5650 */
>>> +static struct snd_soc_card bdw_rt5650_card = {
>>> +     .name = "bdw-rt5650",
>>> +     .owner = THIS_MODULE,
>>
>> is this needed?
> Left over from older conventions, any harm in keeping it? All modules
> from that era appear to have it on the card.
>>
>>> +     .dai_link = bdw_rt5650_dais,
>>> +     .num_links = ARRAY_SIZE(bdw_rt5650_dais),
>>> +     .dapm_widgets = bdw_rt5650_widgets,
>>> +     .num_dapm_widgets = ARRAY_SIZE(bdw_rt5650_widgets),
>>> +     .dapm_routes = bdw_rt5650_map,
>>> +     .num_dapm_routes = ARRAY_SIZE(bdw_rt5650_map),
> 
>>> +static struct platform_driver bdw_rt5650_audio = {
>>> +     .probe = bdw_rt5650_probe,
>>> +     .remove = bdw_rt5650_remove,
>>> +     .driver = {
>>> +             .name = "bdw-rt5650",
>>> +             .owner = THIS_MODULE,
>>
>> is this needed?
> Same as above comment

I am pretty sure Coccinelle detects this pattern and would tell you the 
core takes care of the .owner for platform drivers. I can't recall for 
snd_soc_card.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
