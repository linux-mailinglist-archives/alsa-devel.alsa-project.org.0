Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 335003124D7
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Feb 2021 15:51:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E7E6167D;
	Sun,  7 Feb 2021 15:50:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E7E6167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612709489;
	bh=0X8QY/P8OAOTtYptBmkNgCIlb5zrDe0VhLZQPJ2bXrk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CZT92YO2cPrLOCONw7e57n2LGfWu3L7YgaD6CQuniomtKOmNDIKAjcQ5xEyr9mgMg
	 WCb00C6rQcGgAGjOkMilIS9vFNsKSrN1/1UvVQhYpms8x/DgP1feukQOy9IY04mJ5R
	 OnaKQWKVD2tB7rD6Rdxe3FWOQUhNhyup5bJ9ssfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A8C3F8013A;
	Sun,  7 Feb 2021 15:49:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0126F801D5; Sun,  7 Feb 2021 15:49:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 157D2F80139
 for <alsa-devel@alsa-project.org>; Sun,  7 Feb 2021 15:49:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 157D2F80139
IronPort-SDR: GwtnonzU14XZz4dkxb0V1LPsUdUGk848AJYUe4CwVU3avPoyWzZRsq3WCLD1vohaZGsBLXLOrS
 5UPardsfpTsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="178104139"
X-IronPort-AV: E=Sophos;i="5.81,160,1610438400"; d="scan'208";a="178104139"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 06:49:41 -0800
IronPort-SDR: iDb1eeU77hg+FyutobY4Wi/LVrk8OtXuxmKQ6fIJ5kEEax8Z6t5076L6XLKmxOefBOgYIDa4M2
 12+I8NgjvCrg==
X-IronPort-AV: E=Sophos;i="5.81,160,1610438400"; d="scan'208";a="394782385"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.26.35])
 ([10.213.26.35])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 06:49:37 -0800
Subject: Re: [PATCH] ASoC: Intel: Skylake: Compile when any configuration is
 selected
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <20210125115441.10383-1-cezary.rojewski@intel.com>
 <CAAd53p4fycxLn6y0WpaMWvWkN8EwmT216b40DavttfshN_GMRg@mail.gmail.com>
 <324dc8a5-c4d3-6ebf-c8e9-6321d6c93dab@intel.com>
 <CAAd53p4gqyuFPWX55fnPGHORXXf58++ZRMH9WFYp+QwS1=xDJQ@mail.gmail.com>
 <181c989f-7a4d-3cdd-11be-7378dbc9502c@intel.com>
 <5e970d19-9544-50fe-f140-b66245418c6e@intel.com>
 <CAAd53p4srH6NFwcyUCBnLj=MS8-YBvA9CPjMbcryGgi5CmUUHw@mail.gmail.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <2c93bf65-4996-08c6-5be1-da4b9966e168@intel.com>
Date: Sun, 7 Feb 2021 15:49:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAAd53p4srH6NFwcyUCBnLj=MS8-YBvA9CPjMbcryGgi5CmUUHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
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


On 2021-02-02 1:41 PM, Kai-Heng Feng wrote:
> On Tue, Feb 2, 2021 at 6:56 PM Cezary Rojewski
> <cezary.rojewski@intel.com> wrote:

...

> Commit cc2d025a81a9 ("ASoC: Intel: Skylake: Update description for
> HDaudio kconfig") removed "DEPRECATED" from the
> SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC, does that mean the option is safe
> and should be enabled in downstream distros?

Skylake driver - sound/soc/intel/skylake - is your only option if you 
want to enable HDA (dsp) + DMIC configuration on SPT platforms 
(skl/kbl/kbl-r/aml/cml-s).

Several problems that had been troubling it have been address early 2020 
[1]. Later, fixes were ported to v5.4 [2] so LTS users can enjoy working 
hda+dmic configuration. Please note: topology binary is required to make 
this work, kernel patches alone won't cut it. ASoC topologies are stored 
in a separate repo (git.alsa-project.org/alsa-topology-conf). These 
topologies should end up in /lib/firmware/intel, eventually - once 
converted via alsatplg to their binary form.

Regards,
Czarek


[1]: 
https://lore.kernel.org/alsa-devel/20200305145314.32579-1-cezary.rojewski@intel.com/
[2]: https://www.spinics.net/lists/alsa-devel/msg119230.html
