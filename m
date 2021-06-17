Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADCA3AB5E4
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 16:25:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECFD21696;
	Thu, 17 Jun 2021 16:24:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECFD21696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623939925;
	bh=G2UFbbrtx2A0NRIpUN+M+blVtgnKYVgKAo93NAqdrVk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vHhQTYI54aecoE10SiREiPstu0774dI6Vz8l4RT2NQ+vYJ8yP/DP8mHm4GvQOnbiP
	 L2Qs1MBkgiZpOXT6lfhFd+SQImBwJWI6grRLsPXtvAbsLyNyXX8xmRB5ksnaFJL9Hp
	 mlTQesYYkvEVPQhQttRRXi6C/I9KnRg7mIG3P5ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7500DF8025E;
	Thu, 17 Jun 2021 16:23:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DAE8F8025A; Thu, 17 Jun 2021 16:23:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57242F80148
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 16:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57242F80148
IronPort-SDR: wBtX8eALG64g+kL3tTsojnTjiU+RQIDiplBxNmx2ODekXfSKMYyDYchcmN9AqUaBdQ6RCQ+qwe
 CQF6dvUh5c3A==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="186070560"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; d="scan'208";a="186070560"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 07:23:42 -0700
IronPort-SDR: JcoSIh2heyhrkpOxvw6NjAw5/F4wXqaDFoQ/639ucTvXKoeogF3EsPQJrfHc+vAELLjVqcE19t
 dkfvKmSve0fQ==
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; d="scan'208";a="485309513"
Received: from changwh-mobl1.amr.corp.intel.com (HELO [10.212.5.22])
 ([10.212.5.22])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 07:23:40 -0700
Subject: Re: [PATCH 1/2] ASoC: rt711: remap buttons
To: Mark Brown <broonie@kernel.org>, =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
 <shumingf@realtek.com>
References: <20210617090809.16901-1-shumingf@realtek.com>
 <20210617123914.GD5067@sirena.org.uk>
 <d6374c5158c844d69b4f546fd741f07f@realtek.com>
 <20210617132716.GE5067@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <638be5ea-a310-3711-df08-798f7bee5804@linux.intel.com>
Date: Thu, 17 Jun 2021 09:23:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617132716.GE5067@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "jairaj.arava@intel.com" <jairaj.arava@intel.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 Curtis Malainey <cujomalainey@chromium.org>, "Lu, Brent" <brent.lu@intel.com>,
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



On 6/17/21 8:27 AM, Mark Brown wrote:
> On Thu, Jun 17, 2021 at 01:19:05PM +0000, Shuming [范書銘] wrote:
> 
>>>> This patch uses the same mapping as the machine driver:
>>>> BTN_0 : KEY_PLAYPAUSE
>>>> BTN_1 : KEY_VOICECOMMAND
>>>> BTN_2 : KEY_VOLUMEUP
>>>> BTN_3 : KEY_VOLUMEDOWN
> 
>>> Which machine driver?  Can't there be multiple machine drivers, and if
>>> they're already overriding things why do this?
> 
>> The rt711 codec is designed in the Intel platform only for now.
> 
> I'm sure your sales team would be happy to change that!
> 
>> The machine driver is 'sof_sdw.c' that resides under sound/soc/intel/boards.
>> It seems Intel uses the same mapping in all other Intel machine drivers.
>> Please check the commit as below.
>> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=1f64a08bd5a9a218deb37c03c1e98e9567379698
> 
> Sure, but if the machine drivers for these platforms already do the
> right thing why change the CODEC driver?
> 
>> Hi Sathya,
>> Do you know why the m/c driver uses this mapping?
> 
> I'd guess it's just because that's the standard set of headphone buttons
> that Intel uses for their platforms.

Intel has no specific requirement, we just follow what the Google 4-button description says [1]

That said, I can't recall why half of the machine drivers follow one pattern and the other half a different one.

Same as spec:
sof_da7219_max98373.c:  snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
sof_da7219_max98373.c-  snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
sof_da7219_max98373.c-  snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
sof_da7219_max98373.c-  snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);

sof_cs42l42.c:  snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
sof_cs42l42.c-  snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
sof_cs42l42.c-  snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
sof_cs42l42.c-  snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);

swap wrt. spec:
sof_sdw_rt711.c:        snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
sof_sdw_rt711.c-        snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
sof_sdw_rt711.c-        snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
sof_sdw_rt711.c-        snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);

kbl_rt5663_max98927.c:  snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
kbl_rt5663_max98927.c-  snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
kbl_rt5663_max98927.c-  snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
kbl_rt5663_max98927.c-  snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);

Brent, Curtis, Jimmy, can you comment on the order?


[1] https://source.android.com/devices/accessories/headset/plug-headset-spec#control-function_mapping




 
