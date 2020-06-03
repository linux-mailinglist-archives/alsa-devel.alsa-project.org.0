Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B043D1ECDFE
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 13:08:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D0C0166E;
	Wed,  3 Jun 2020 13:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D0C0166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591182487;
	bh=qIe0b/0uQL2s5oxnVgvgB1XsbWkTwkvrwdosu+rFkPE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BGLkAlZkUqkiMjZhcctIzVCnF5Dyh59Zb+2T3VFAcZqdI6HE1xJp4tmoZinUgLtOG
	 2pVo0IkkpPRyJKBk9+tswKdxNiQqt+7XjV1TdXcWKyk08QZh4+M+XUNXECjSP7s0Nx
	 GYeWUmx22fVY854GKbR4K+rZDFpmtdii7KVWH9NA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DFAFF800BC;
	Wed,  3 Jun 2020 13:05:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 966C0F80299; Wed,  3 Jun 2020 13:05:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA59FF800BC
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 13:05:49 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 626B8A0040;
 Wed,  3 Jun 2020 13:05:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 626B8A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1591182347; bh=ndnS8SrFrl/ISW/xB0Q9vqkdX7oJ/z/qyxtKCQ0YSC0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=3Vsv3S0G/4jL2BPAAuDKGxrN8m5RDieGbp4HxOp3krA4p58N7QDIvrg1COwtTxd58
 iZQcX2/d9fBL4Qa/0x5PuWcHbjYfHy49ShUfYbQ5jr7vjsUlgfXsGI7BNSLtFnwdRm
 5xnzLUBHlsGEmcaN693Bqm4awQDJmllbqvsPRaMM=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  3 Jun 2020 13:05:43 +0200 (CEST)
Subject: Re: alsa-project alsa-ucm : Audio endpoint is not switching when
 external mic connected
To: Takashi Iwai <tiwai@suse.de>, Hui Wang <hui.wang@canonical.com>
References: <DM6PR12MB26332026A8F345F742B5E9FF978B0@DM6PR12MB2633.namprd12.prod.outlook.com>
 <d149204b-1e2d-1ee9-fbb4-c6f8874e369a@perex.cz>
 <da8b6e1e-fd29-fb99-07a7-d5fd8c7b78f9@canonical.com>
 <s5htuzsebm9.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <f75e5924-1854-d512-8171-6927ba75b229@perex.cz>
Date: Wed, 3 Jun 2020 13:05:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <s5htuzsebm9.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>
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

Dne 03. 06. 20 v 11:34 Takashi Iwai napsal(a):
> On Wed, 03 Jun 2020 02:36:25 +0200,
> Hui Wang wrote:
>>
>>
>> On 2020/6/3 上午3:39, Jaroslav Kysela wrote:
>>> Dne 02. 06. 20 v 19:57 Mukunda, Vijendar napsal(a):
>>>> We recently up streamed ACP PDM driver for Renoir APU.
>>>>
>>>> Our ACP IP has an internal PDM Decoder block where DMIC is directly
>>>> connected.
>>>> There are no KControls defined for PDM Driver.
>>>>
>>>> Our platform supports on board DMIC and South bridge Azalia (HD
>>>> Audio ) endpoint .
>>>> By default, DMIC endpoint is used as audio input device.
>>>> When Headset Mic jack connected, it's not switching to External Mic.
>>>
>>> Make sure that the Headset Mic priority port in pulseaudio is is
>>> greater than the one for DMIC.
>>>
>>>> How does audio endpoint will switch in gnome when external mic is
>>>> connected?
>>>>>  From our understanding, UCM conf file for HDA driver is also
>>>>> required for
>>>> configuring mixer controls for HD Audio capture device.
>>>> Similarly when External Mic is removed , it has to switch to
>>>> internal dmic .
>>>
>>> An configuration example for UCM (DMIC connected to DSP, HDA codec
>>> for rest):
>>>
>>> https://github.com/alsa-project/alsa-ucm-conf/tree/master/ucm2/sof-hda-dsp
>>>
>>> If you need a help to create a new configuration for your hardware,
>>> show the output from the alsa-info.sh script, please.
>>>
>>>                      Jaroslav
>>
>> This audio design is  a bit different from sof-hda-dsp, the dmic is on
>> a standalone sound card. Please see the alsa-info.txt:
>>
>> https://pastebin.ubuntu.com/p/4kprhDZYbg/
> 
> And that's an interesting case.  Can we manage multiple cards in a
> single UCM profile?

Yes, it should work, but we need to extend pulseaudio to avoid fallback to the 
legacy ALSA profile when the "slave" soundcard is enumerated. PA should skip 
this card. We need to check if the empty UCM verb is supported.

Also, UCM has ${CardId} substitution (for the master card config), but we need 
to address the slave, too. Perhaps, we should add something like 
${GetCardIdByName:STRING[:INDEX]} where STRING may be the name of the 
soundcard (it will be 'acp') in this case. The INDEX may refer to multiple 
instances (INDEX = 0 first soundcard found).

						Jaroslav

> 
> 
> Takashi
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
