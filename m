Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B7F23120A
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 20:56:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9D391732;
	Tue, 28 Jul 2020 20:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9D391732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595962582;
	bh=g3qtlvypH1VdRZYEMwXLHBAIpjCy/OgZeRsBI5ww35s=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DnFHjQVm81nCMqWtDXwWwmbR2F/IfVF9PRLRet2p2nlAh9vlRBuPEO6G764kERx7L
	 L7+nj5Gs9zOX2qsJxDALVAKHUg5uNgNs9AkZ1ynSbjoDRNBJszCzahAUTCz/mDA8n7
	 AR9GTv8Sc74qcoyGA1EHZNY3rQl9jByfnxRrPP5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBD37F8021C;
	Tue, 28 Jul 2020 20:54:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11230F8021E; Tue, 28 Jul 2020 20:54:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBC57F800DE
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 20:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBC57F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="cVaqYhD0"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="jpewJeQX"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 90939A1F67630;
 Tue, 28 Jul 2020 20:54:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1595962476; bh=g3qtlvypH1VdRZYEMwXLHBAIpjCy/OgZeRsBI5ww35s=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=cVaqYhD0mvlS9AmK18hOkyVgci0omhUb/18UF3PNdmKJHaQriujNO8jLShu58Nhx/
 Dym8Vj+JC1Bra/qvsmfymWe83mRVPXMP83Pi3NmzOfrOWaFMsIeMPdhNLIFppmt9A5
 IXldYh2OW5fufoeUiLnhS69k3pzAd+bIhzvOujms=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uAqCBAfpOxAA; Tue, 28 Jul 2020 20:54:31 +0200 (CEST)
Received: from [192.168.105.119] (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id E2E64A1F65ABA;
 Tue, 28 Jul 2020 20:54:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1595962471; bh=g3qtlvypH1VdRZYEMwXLHBAIpjCy/OgZeRsBI5ww35s=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=jpewJeQXSRk6QqreHS6lqpCr/tmIdf5xbae48Q3wgRCn9+aoZSUub3J6DVJFoIHVB
 VBczurkFywmnJqcpLaJ+KAwLaea8Wv/Q3EcpUUZiQ+PNAMOh/48QVXFHPZfv91z0rI
 HxcM5U7grzjDBfEApmaKGY744B4Du4n3ZlE6NdBI=
Subject: Re: pcm_meter.c issue at s16_update
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: Takashi Iwai <tiwai@suse.de>
References: <f56d6a67-014a-e562-c253-830c0ec03717@ivitera.com>
 <9957e124-be4b-cdc9-ffad-579b631455df@ivitera.com>
 <s5hd04ffu4m.wl-tiwai@suse.de>
 <fd493c4d-797e-d76d-771d-7c7483ffdea7@ivitera.com>
Message-ID: <1cd5de43-5f67-78d3-f5e1-bbbaa8856873@ivitera.com>
Date: Tue, 28 Jul 2020 20:54:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <fd493c4d-797e-d76d-771d-7c7483ffdea7@ivitera.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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


Dne 28. 07. 20 v 20:04 Pavel Hofman napsal(a):
> Dne 28. 07. 20 v 19:04 Takashi Iwai napsal(a):
>> On Tue, 28 Jul 2020 18:46:00 +0200,
>> Pavel Hofman wrote:
>>>
>>>
>>>>
>>>> The debug around the event looks like this, suddenly meter->now drops down:
>>>>
>>>> s16_update 1: meter->now 2567498, s16->old 2566593, size 905
>>>> s16_update 1: meter->now 2568401, s16->old 2567498, size 903
>>>> s16_update 1: meter->now 20786, s16->old 20786, size 0
>>>> s16_update 1: meter->now 1065, s16->old 20786, size -19721
>>>> s16_update 1: meter->now 24839, s16->old 24838, size 1
>>>> s16_update 1: meter->now 701, s16->old 24839, size -24138
>>>> s16_update 1: meter->now 1253162, s16->old 701, size 1252461
>>>> s16_update 1: meter->now 1255148, s16->old 1253162, size 1986
>>>>
>>>> ..........
>>>>
>>>> s16_update 1: meter->now 11136, s16->old 10261, size 875
>>>> s16_update 1: meter->now 22525, s16->old 22524, size 1
>>>> s16_update 1: meter->now 963, s16->old 22525, size -21562
>>>> s16_update 1: meter->now 1270914, s16->old 963, size 1269951
>>>> s16_update 1: meter->now 1272917, s16->old 1270914, size 2003
>>>>
>>>
>>> I think the problem is that s16->old is not reset when status.appl_ptr
>>> is zeroed and starts running again. There is a call
>>>
>>> static void s16_reset(snd_pcm_scope_t *scope)
>>> {
>>> 	snd_pcm_scope_s16_t *s16 = scope->private_data;
>>> 	snd_pcm_meter_t *meter = s16->pcm->private_data;
>>> 	s16->old = meter->now;
>>> }
>>>
>>> but I do not know when this method is called and whether the meter->now
>>> is already assigned to the newly zeroed status.appl_ptr.
>>
>> Would adding atomic_add(&meter->reset, 1) in snd_pcm_meter_reset()
>> help?
>>
> Unfortunately not.
> 
> s16_reset is called correctly, setting s16->old = meter->now;  But at
> that time meter->now is still 22751, setting s16->old to the same value.
> 
> s16_update 1: meter->now 22751, s16->old 22751, size 0
> 
> However, in the next update call meter->now comes from the freshly
> started application pointer:
> 
> s16_update 1: meter->now 839, s16->old 22751, size -21912
> 
> 
> Of course this helps:
> 
> -       if (size < 0)
> -               size += spcm->boundary;
> +       if (size < 0) {
> +               size = meter->now;
> +               s16->old = 0;
> +       }
> 
> But I understand this is not a solution because:
> 
> * it will not work at reaching spcm->boundary (after thousands of hours?)
> * it will cause the same problem when the stream is rewound (which is
> the problem now too) - size will equal to large meter->now (length from
> the beginning of the stream minus the rewound = large number).
> 

IMHO there are two cases of the [application pointer + delay] drop 
compared to the previous run:

* stream start, rewinding => s16->old = meter->now; size =0, i.e. 
skipping the samples to show
* wrapping at spcm->boundary => size += spcm->boundary, i.e. showing the 
wrapped samples

Optionally the second case could be handled just like the first case by 
resetting s16->old, assuming the boundary wrap occurs very infrequently.

Pavel.
