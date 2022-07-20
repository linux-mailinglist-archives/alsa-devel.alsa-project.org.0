Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC20157B224
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 09:54:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3169F174B;
	Wed, 20 Jul 2022 09:53:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3169F174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658303643;
	bh=sCvhgrQlVdeokfhbWqsN6ykctmc1SY+vr3eEb/38uHg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iEypoeF/AcbVUXyCsExZbJfF+BPDPTYoD+KxPeGZci1Ka7lK67pMmCFA36g1n/LMF
	 imV2GoAz8waKD6BUtCEzYChe7dhuXgroELTxGjNeY/p1vsgSLTC2OQD1XuGHrGl6Di
	 xWlcDj0NCPtyBpuag5PO66ueBCC6MyJh+2ElIdCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A49A3F800BA;
	Wed, 20 Jul 2022 09:53:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81D50F80169; Wed, 20 Jul 2022 09:52:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73B2CF80125
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 09:52:53 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7C44BA003F;
 Wed, 20 Jul 2022 09:52:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7C44BA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1658303572; bh=QBCCW4Q0CQG3BJ2QHP8R81ix3DWBDeELsQW0yXxSMLk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hEzRLP92NLkiIRWQ5pUOaA6UneSn05B6NU//P0qsi4D8xm3ocMRnpChcWzcaEdxu1
 kEgigc45qBN1PR1QJCAel2DEEd0LvrLCwFuqQZ3jCiL17NTjxshyjOOw5bFL07FuEl
 tSuKIq/pQsugV65FCaOONXwdvBn9NVb+wwHpt92M=
Received: from [192.168.88.20] (unknown [95.168.116.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 20 Jul 2022 09:52:42 +0200 (CEST)
Message-ID: <34bddb2f-dc57-c08c-358e-26cf7824c203@perex.cz>
Date: Wed, 20 Jul 2022 09:52:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ALSA: hda: Skip creating captures in SOF context
Content-Language: en-US
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <20220719144753.252231-1-kai.heng.feng@canonical.com>
 <bd59b06a-de49-2a1a-d2a2-351957fec6d0@perex.cz>
 <CAAd53p6ru7CJ=pJ2knCL5pgU_Y+nA=yTPscKk225zTD-fv4qQg@mail.gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <CAAd53p6ru7CJ=pJ2knCL5pgU_Y+nA=yTPscKk225zTD-fv4qQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Dne 20. 07. 22 v 3:45 Kai-Heng Feng napsal(a):
> On Tue, Jul 19, 2022 at 11:41 PM Jaroslav Kysela <perex@perex.cz> wrote:
>>
>> Dne 19. 07. 22 v 16:47 Kai-Heng Feng napsal(a):
>>> On HP laptops that use SOF driver for DMIC, the micmute LED doesn't
>>> light up when mic is muted after commit 9b014266ef8a ("ASoC: SOF:
>>> topology: use new sound control LED layer").
>>>
>>> The micmute LED itself is still working via sysfs, but it doesn't follow
>>> mute anymore. That's because unlike vendors like Dell and Lenovo, HP
>>> laptops use HDA codec to control mute LEDs instead of ACPI. So on HP
>>> laptops, both SOF and HDA create captures with
>>> SNDRV_CTL_ELEM_ACCESS_MIC_LED access, snd_ctl_led_set_state() considers
>>> there are two different kcontrols and one of them is not muted.
>>
>> It does not mean that it's a wrong behavior. When both controls are muted, the
>> LED should be turned on. It just requires that all inputs are off (and it may
>> be the default - probably we can set in UCM or so). If you turn the "Capture
>> Switch" off in amixer / alsamixer, do things work as expected ?
> 
> Yes. When all captures are muted the micmute LED is on.
> 
>>
>>> So skip creating captures for HDA when it's called from SOF, the
>>> captures are already handled by SOF.
>>
>> The capture controls are for other inputs like external analog microphone. If
>> it is required to suppress the MIC LED for some hardware, just skip the
>> "spec->mic_mute_led = 1" assignment in hda_generic.c . Also, the check
>> "codec->core.type != HDA_DEV_ASOC" is not sufficient, because you don't know,
>> if the topology really sets the MIC LED flag.
> 
> AFAIK the external analog microphone on DMIC laptop is driven by SOF driver too.
> If those capture controls are indeed needed for external analog mics,
> use UCM to mute them by default won't work either.

Could you describe this ? I though that only DMIC is handled by SOF when HDA
codec is in the system. There is a separate analog codec for external analog
microphone or the HDA codec is somehow connected to SOF/DSP ? If so, how ?

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
