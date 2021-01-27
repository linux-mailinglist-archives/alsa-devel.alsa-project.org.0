Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 727AC305F76
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 16:23:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7827E1724;
	Wed, 27 Jan 2021 16:23:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7827E1724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611761035;
	bh=rRQCtxLS3p35RloIwxmToiL5jdTgvypnDqnrAAyzef0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dR1CZ1XkGiALcO9To/7b/61emCjmtFWMQ7b4L3ga1fM6ZIhaUNn/J81L9x3SAvJa+
	 PZNy7DrFz4Tkm/M/s9csXVl9bQ3GSxJzP7rnG8KIU6B7I/5E57J5Qosoy7083gApON
	 rb7wyTUYfyZ4HgVFs9nEIO8Su+JPY/RlTUsZ/0uI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6342F800E9;
	Wed, 27 Jan 2021 16:22:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C2BAF80259; Wed, 27 Jan 2021 16:22:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCE06F800F0
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 16:22:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCE06F800F0
IronPort-SDR: fnotB/hgWoe+rTkeL06+/8mPMAVXT6Fuo/5Qns91c7O2HeIdffVgB6ojsBQ3r4NvQYCbtWf0fJ
 v5cyXY170dCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="180227835"
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; d="scan'208";a="180227835"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 07:22:12 -0800
IronPort-SDR: kgjPlbuVitWjt9XnqWcoyhwRgj12MpPB+Ksc51ZdAnzxZ7zwx5k7yY+PpHem4mNyYbNf/+K+yE
 z+Jcnj91Pi6A==
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; d="scan'208";a="430131658"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.1.157])
 ([10.213.1.157])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 07:22:08 -0800
Subject: Re: [PATCH] ASoC: Intel: Skylake: Compile when any configuration is
 selected
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <20210125115441.10383-1-cezary.rojewski@intel.com>
 <CAAd53p4fycxLn6y0WpaMWvWkN8EwmT216b40DavttfshN_GMRg@mail.gmail.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <324dc8a5-c4d3-6ebf-c8e9-6321d6c93dab@intel.com>
Date: Wed, 27 Jan 2021 16:22:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAAd53p4fycxLn6y0WpaMWvWkN8EwmT216b40DavttfshN_GMRg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 2021-01-27 9:03 AM, Kai-Heng Feng wrote:
> On Mon, Jan 25, 2021 at 7:55 PM Cezary Rojewski
> <cezary.rojewski@intel.com> wrote:
>>
>> Skylake is dependent on SND_SOC_INTEL_SKYLAKE (aka "all SST platforms")
>> whereas selecting specific configuration such as KBL-only will not
>> cause driver code to compile. Switch to SND_SOC_INTEL_SKYLAKE_COMMON
>> dependency so selecting any configuration causes the driver to be built.
>>
>> Reported-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> Suggested-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> Fixes: 35bc99aaa1a3 ("ASoC: Intel: Skylake: Add more platform granularity")
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> 
> Still not working:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1902457/comments/66
> 

Hello,

Thanks for your reply Kai-Heng.
I believe you're relating to completely different issue than the one 
this very patch is targeting.

 From the logs you've provided one can see that snd_soc_skl did attempt 
to probe() so the code compiled just fine. Again, compilation issue is 
the one I've addressed here. While we're here, I'd appreciate kconfig 
being provided along dmesg file. Logs alone do not show the entire 
picture, unfortunately.

In regard to missing sound, (looks like we're talking about HDA dsp + 
DMIC configuration) kconfig mentioned above will be required. Pretty 
sure HDAudio support for skylake-driver is not enabled on your machine 
and thus driver exists probe() early without registering any sound card.

Regards,
Czarek
