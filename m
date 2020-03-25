Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA1B1929AD
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 14:30:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDA88166E;
	Wed, 25 Mar 2020 14:29:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDA88166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585143046;
	bh=pSXN6qkZxZdbnoVdDRLYLh/c222LpXJ9mT6lTPL7MPA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PRWW/mA6MJp2gqNMXu6j/F1blylEM4TPduQzp4s5LOsbdyRncNClU8009dsg2oFeW
	 ZizXk9IfyQ4DYOkrk2shiusi75CB+qoADW0KyCgvCdHE1F+fKpd8hgjMuvyYESNp6r
	 pYd10mmCV/Gx4LJBVDwgaRLeyqMQMsNoHRtuiknE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 153EAF80095;
	Wed, 25 Mar 2020 14:29:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 840A2F80158; Wed, 25 Mar 2020 14:28:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A287F8011E
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 14:28:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A287F8011E
IronPort-SDR: VqC9tA4hHm8KL+mUxsBgHwqneCdb9HWEhi61IsSMU+y0+ordgysDT5mtlhMv27GEDGaXkz7Krg
 3tMbjjWXtNeQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 06:28:48 -0700
IronPort-SDR: cO5DtoL3UFlAHe2AL3W/QtNCozVg/zvkShu8urdBevS8TjJEBBWcvYG30op0ozZDsfKqWbX2CH
 cl9+2CoFCi2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; d="scan'208";a="293338505"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.3.125])
 ([10.213.3.125])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Mar 2020 06:28:45 -0700
Subject: Re: [PATCH 3/4] ASoC: Intel: bdw-rt5677: Remove ignore_suspend flag
 from SSP0 dai link
To: Curtis Malainey <cujomalainey@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200319204947.18963-1-cezary.rojewski@intel.com>
 <20200319204947.18963-4-cezary.rojewski@intel.com>
 <dea20cf7-f324-a933-8f8e-e70a4dffa249@linux.intel.com>
 <CAOReqxj=DBO2FyL466jWHDUG6_A4uU_o0cSyVPHbH8mjWs=JTg@mail.gmail.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <27e30f23-851e-18ad-6014-2b4d890adf62@intel.com>
Date: Wed, 25 Mar 2020 14:28:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAOReqxj=DBO2FyL466jWHDUG6_A4uU_o0cSyVPHbH8mjWs=JTg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 vkoul@kernel.org, Mark Brown <broonie@kernel.org>,
 Ben Zhang <benzh@google.com>
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

On 2020-03-19 23:43, Curtis Malainey wrote:
> On Thu, Mar 19, 2020 at 3:15 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>> On 3/19/20 3:49 PM, Cezary Rojewski wrote:
>>> As of commit:
>>> ASoC: soc-core: care .ignore_suspend for Component suspend
>>>
>>> function soc-core::snd_soc_suspend no longer ignores 'ignore_suspend'
>>> flag for dai links. While BE dai link for System Pin is
>>> supposed to follow standard suspend-resume flow, appended
>>> 'ignore_suspend' flag disturbs that flow and causes audio to break
>>> right after resume. Remove the flag to address this.
>>>
>>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>> Cc: Dominik Brodowski <linux@dominikbrodowski.net>
>>> Cc: Mark Brown <broonie@kernel.org>
>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>
>> we should ask Ben and Curtis @ Google if the changes related to suspend
>> interfere with the wake-on-voice support?
> 
> I have a samus with me so I can test it but my backlog is definitely
> growing due to WFH slowness. I will see if I can take a look tomorrow.
> 

Any update?

Maybe let's leave bdw-rt5650/ bdw-rt5677 behind so people have more time 
to test and merge just the broadwell & haswell part. Hmm?
