Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D439B62D5D4
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 10:06:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5994B16C0;
	Thu, 17 Nov 2022 10:05:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5994B16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668675970;
	bh=p6YpsqupWmMHDs3TaSsKpSsAZEWOlE0sLkaMc79YVaE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dbrz4BYTxeOUz1foekzvQsPfO0ZlIRWYj192SEeo5e+O1BTCYaZssaYfRxwCHAheJ
	 J4CHs/NgNqCxay1J3ZA1enPDC8fXICyj6UASEOu0KpO8ZA5ON+kAg/yI4huIJ+bB24
	 Gw70/qilgdF31D3RL/z9kCK3LLXlsaMgAx2ZMjro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7665F804BD;
	Thu, 17 Nov 2022 10:05:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F086F8025A; Thu, 17 Nov 2022 10:05:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66D6CF800B5;
 Thu, 17 Nov 2022 10:05:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66D6CF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="g5ZXiea3"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8068E6602A93;
 Thu, 17 Nov 2022 09:05:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668675908;
 bh=p6YpsqupWmMHDs3TaSsKpSsAZEWOlE0sLkaMc79YVaE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=g5ZXiea3ZGKBuoVs9zj0Rf5EhnQuDlkfxJIZKTGzw3IvJFcvNCC/wICgyioYV6Kt+
 CvYvfE7CmLT6Q4hvLlKz9ClEJlnqlsYxYSq8THGwPZxoB9SRTdleneqhPJonethBH8
 IKiJWY9jveo83vlK6g8cfp8pyVQD9FhqL8Y6esPLu/Hf3qt8Hvx9Bt+pTXuWUAUBr2
 9Une+RQrDAxPaGQunszWowtuP+mzN6YLYSYTPkfa2K4jky4yIqTqq3jfHLyLkmnjIM
 RFlCdbYh5fFXpqxs5nWXa7qJPf83Y+Rype0QfhY7s3QA+dezySHuh6wj9JXsDv6SYd
 KQqZbTc/s194g==
Message-ID: <b221328c-4a06-a0b7-d96f-58b9804212d6@collabora.com>
Date: Thu, 17 Nov 2022 10:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [Sound-open-firmware] [PATCH 3/4] ASoC: SOF: Adding amd HS
 functionality to the sof core
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220913144319.1055302-1-Vsujithkumar.Reddy@amd.com>
 <20220913144319.1055302-4-Vsujithkumar.Reddy@amd.com>
 <36a45c7a-820a-7675-d740-c0e83ae2c417@collabora.com>
 <a8bc9284-c0c2-79aa-fee6-40101fc34f96@linux.intel.com>
 <02c2643f-bd32-c3db-51a1-d7773b60c655@collabora.com>
 <d7b32cb5-7fec-0c2a-d2c7-6934a1eb932b@linux.intel.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <d7b32cb5-7fec-0c2a-d2c7-6934a1eb932b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Sunil-kumar.Dommati@amd.com, Vijendar.Mukunda@amd.com, ssabakar@amd.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, venkataprasad.potturu@amd.com,
 Daniel Baluta <daniel.baluta@nxp.com>, Basavaraj.Hiregoudar@amd.com,
 YC Hung <yc.hung@mediatek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
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

Il 16/11/22 17:55, Pierre-Louis Bossart ha scritto:
> 
> 
> On 11/16/22 10:33, AngeloGioacchino Del Regno wrote:
>> Il 16/11/22 16:04, Pierre-Louis Bossart ha scritto:
>>>
>>>>> diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
>>>>> index 21d98f31a9ca..83fd81c82e4c 100644
>>>>> --- a/include/sound/sof/dai.h
>>>>> +++ b/include/sound/sof/dai.h
>>>>> @@ -84,6 +84,7 @@ enum sof_ipc_dai_type {
>>>>>         SOF_DAI_AMD_BT,            /**< AMD ACP BT*/
>>>>>         SOF_DAI_AMD_SP,            /**< AMD ACP SP */
>>>>>         SOF_DAI_AMD_DMIC,        /**< AMD ACP DMIC */
>>>>> +    SOF_DAI_AMD_HS,            /**< Amd HS */
>>>>>         SOF_DAI_MEDIATEK_AFE,        /**< Mediatek AFE */
>>>>
>>>> Adding SOF_DAI_AMD_HS before SOF_DAI_MEDIATEK_AFE desynced this
>>>> enumeration
>>>> so the DAI type is now 11 and not 10 anymore, leading to a failure in
>>>> firmware
>>>> at IPC3 helper function `dai_get()`, as when `dai_find_type()` is
>>>> called, the
>>>> DAI type that the firmware expects doesn't match with the one that gets
>>>> sent
>>>> in the request message from the kernel.
>>>>
>>>> As a local test, I tried moving SOF_DAI_AMD_HS after
>>>> SOF_DAI_MEDIATEK_AFE and
>>>> this has restored full functionality on my MT8195 platform (Tomato
>>>> Chromebook).
>>>>
>>>> If SOF is supposed to guarantee backwards compatibility (and I believe
>>>> it is),
>>>> this commit breaks that.
>>>>
>>>> I would be tempted to send a commit that moves SOF_DAI_AMD_HS to the
>>>> end, but
>>>> that would break the already compiled firmware for AMD platforms, so I
>>>> am not
>>>> sure how to proceed.
>>>
>>> D'oh. Yes this breaks backwards-compatibility and this is a clear
>>> mistake. I think your suggestion to add the AMD_HS at the end is the
>>> only practical solution indeed - this would need to be done for both
>>> kernel and SOF version of dai.h.
>>>
>>
>> Okay, I will send a commit tomorrow :-)
> 
> I sent those two GitHub pull requests already:
> 
> https://github.com/thesofproject/linux/pull/4017
> https://github.com/thesofproject/sof/pull/6616
> 

Thanks for the fast action.

Regards,
Angelo
