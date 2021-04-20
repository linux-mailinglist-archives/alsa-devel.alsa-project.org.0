Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B5036524B
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Apr 2021 08:22:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECC5385D;
	Tue, 20 Apr 2021 08:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECC5385D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618899759;
	bh=gdPtsXjBRb1QrL84JLSn9H4v6s5BfUE84ctWttmrahU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sXJTbiAHjahwOs+6Mm7fGSgjDJ2jjmI74/J42g7PU/lVmJBahiosRd+6cXLrXhs9y
	 RtVPjaED/MpBDWwKGB+Muj7pSSpbsTsaWbhSMBkiekR3sS9etLF+upkRtmrMtUWgcp
	 Y82jYFWq0QvW1PLLzfVGoQNXZzI359+bY2iddRkU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D1E5F800FE;
	Tue, 20 Apr 2021 08:21:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0ED12F80253; Tue, 20 Apr 2021 08:21:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFD40F8014D
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 08:20:59 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5B54BA003F;
 Tue, 20 Apr 2021 08:20:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5B54BA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1618899658; bh=u5QElOnkU2hyC3+ul8RsYcPriqJuxf0n3cHPsMK+wyk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=SxXKWSUZ5HLEjna+zNvADR4DVnlfaQQSGTNEC+Z7CIBPnvzKXJIocbEB8RWfBPCht
 EBCJ47+fJJ8GdYOOGL1bqJSmhJrFz+FotCPPRhYlzipPAsDQxM9ojcYgZ3knuV/eTZ
 6xDCFU0wJ4ImxhmaLtMzwgpic7UyNVwERp/LM7b0=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 20 Apr 2021 08:20:47 +0200 (CEST)
Subject: Re: [PATCH] ASoC: rt711-sdca: remove capture switch controls
To: =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "Yang, Libin" <libin.yang@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
References: <20210415091609.13695-1-shumingf@realtek.com>
 <6c5b52e2-c875-9b30-60dd-d4bec77a9215@linux.intel.com>
 <BN6PR11MB1652220DB80760FD18B8308290499@BN6PR11MB1652.namprd11.prod.outlook.com>
 <9146794c-d4a1-8dd8-4ab1-7c9c44a7703b@perex.cz>
 <MWHPR11MB1663671582DCB35BE88C5B5590499@MWHPR11MB1663.namprd11.prod.outlook.com>
 <606f8e2d-40d5-8de0-1a06-9c8da016652d@perex.cz>
 <MWHPR11MB1663B46AB115359FDBDDB29F90499@MWHPR11MB1663.namprd11.prod.outlook.com>
 <d3aa7b7c-4384-9fd8-d814-e2bcbf0da9d2@perex.cz>
 <MWHPR11MB16631ECF778944604073DD9190489@MWHPR11MB1663.namprd11.prod.outlook.com>
 <ba277a0457da4ab09f5120f30a9dc699@realtek.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <a389066d-fe65-03ad-2ea8-1878e2e4badd@perex.cz>
Date: Tue, 20 Apr 2021 08:20:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ba277a0457da4ab09f5120f30a9dc699@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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

Dne 20. 04. 21 v 3:10 Shuming [范書銘] napsal(a):
>>> I see. In this case, the auto-route settings should differ from the
>>> mixer settings. So the mute flag should be logical _OR_ from both DAPM
>>> and the mixer settings. And because the codec is able to do the hw
>>> mute, why to prevent the export of this feature?
>>>
>>> So I propose do do (pseudo code):
>>>
>>> struct rt711_sdca_priv {
>>> 	bool fu0f_dapm_mute;
>>> 	bool fu0f_mixer_mute;
>>> };
>>>
>>> /* called from both dapm event and kontrol put callback (on change) */
>>> /* the dapm event and put callback will modify only rt711_sdca_priv
>>> fields */ static void set_f0f_mute(rt711_priv) {
>>> 	int mute = rt711_priv->fu0f_dapm_mute || rt711_priv-
>>>> fu0f_mixer_mute;
>>> 	set_fu0f_mute_register(mute);
>>> }
>>>
>>> With this implementation, all is consistent to the user space.
>>
>> If so:
>> When capture, if user setting is mute, it will always mute and if user setting is
>> unmute, it will always unmute.
>>
>> When stop capture, it will always mute regardless the user setting.
>>
>> Shuming, what do you think?
> 
> I think the function could mute/unmute both. It could avoid that the setting always mutes if the user setting is unmute.
> e.g.
> static void set_fu0f_capture_ctl(rt711_priv) {
>     int mute = rt711_priv->fu0f_dapm_mute || rt711_priv->fu0f_mixer_mute;
>     if (mute)
>         set_fu0f_mute_register();
>     else
>         set_fu0f_unmute_register();
> }

Yes, I passed the mute value in the pseudo code to the
set_fu0f_mute_register() function as argument for the further evaluation, but
I meant exactly this.

					Thank you,
						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
