Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1021686D8
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 19:41:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 581A016D1;
	Fri, 21 Feb 2020 19:40:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 581A016D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582310472;
	bh=79p7lp8RwZo0+yhcgKEGZs6hqoQQ+rlDA3W2BnRcxAM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=edgaosJZsPU82HXVVyqmiXaN8Mn1OaiY3fNEGzwJrzQZ2LzTrBxI5StHlG1eigvKs
	 6wnSfuNo0k1IZo/S4b38CYbXjBkXPAHl9ME2dZoU0JFG7JKdTrYPo6tRjzH60OxR6J
	 HF4BDYDIMHJSDTWasYqeDONvdIVS2TALEJcn/VuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C790F800C5;
	Fri, 21 Feb 2020 19:39:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A846F8025F; Fri, 21 Feb 2020 19:39:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E007F80114
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 19:39:25 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id CB0ECA003F;
 Fri, 21 Feb 2020 19:39:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz CB0ECA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1582310364; bh=zO4SYG+ZdAQOj+UPN7p/gkPEsTlej+zxpY3rK8dRb18=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ZrVKlafXZUxdEzJ0CUPNsTwV8IU4lKoNxUnQKCnPAWeWbUyjdeIueM13vGfDzdp3b
 l1c3cNlShnNvRvxtsCy1N2b15zoAAWuLUHVFnV2KnfkV3xT2NI/H/PM9AK1dcDob6p
 yMxCqCFeUGL1boNi3Ipu554BNN8AS4h0Sm0buaQU=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 21 Feb 2020 19:39:18 +0100 (CET)
Subject: Re: [PATCH] ASoC: SOF - topology - do not change the link trigger
 order for pre-1.4 firmware
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 ranjani.sridharan@linux.intel.com
References: <20200221100739.3883842-1-perex@perex.cz>
 <alpine.DEB.2.21.2002211510050.2957@eliteleevi.tm.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <3901b16e-372e-4839-0e97-929115ea130a@perex.cz>
Date: Fri, 21 Feb 2020 19:39:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2002211510050.2957@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
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

Dne 21. 02. 20 v 15:44 Kai Vehmanen napsal(a):
> Hi,
> 
> +Ranjani who did the link reorder patch
> 
> On Fri, 21 Feb 2020, Jaroslav Kysela wrote:
> 
>> This patch is for SOF v1.3 firmware. The DSP firmware will crash (DSP oops)
>> without this patch. The 1.4.1 firmare has this issue fixed.
>>
>> The ABI version is used for the comparison, because the firmware version
>> for the firmware files before 1.4.2 was not set properly (git hash was
>> used).
> 
> build fails when this is applied on broonie/for-next. You need an
> additional
> 
> --- a/sound/soc/sof/topology.c
> +++ b/sound/soc/sof/topology.c
> @@ -3108,6 +3108,7 @@ static int sof_link_load(struct snd_soc_component
> *scomp, int index,
>                           struct snd_soc_dai_link *link,
>                           struct snd_soc_tplg_link_config *cfg)
>   {
> +       struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
>          struct snd_soc_tplg_private *private = &cfg->priv;
> 
> 
>> -             /* set trigger order */
>> -             link->trigger[0] = SND_SOC_DPCM_TRIGGER_POST;
>> -             link->trigger[1] = SND_SOC_DPCM_TRIGGER_POST;
>> +             /* this causes DSP panic on firmware v1.3 */
>> +             if (v->abi_version > SOF_ABI_VER(3, 7, 0)) {
>> +                     /* set trigger order */
>> +                     link->trigger[0] = SND_SOC_DPCM_TRIGGER_POST;
>> +                     link->trigger[1] = SND_SOC_DPCM_TRIGGER_POST;
> 
> My results with older firmwares and this patch are a bit mixed. When I
> apply this patch and boot with v1.3 FW on a CFL platform (ABI 3.7.0,
> version 1:1:0-5dd9a), I get a DSP panic at stream stop with this patch,
> but _without_ it, playback is fine. :P
> 
> I tested both v1.3.1 and v1.3, and I get a DSP panic at stream stop with
> your patch (ABI 3:7:0 on both of these so trigger order is not changed).
> With v1.4 and all newer, streaming works as expected.

Ok, then I wonder how the pre-5.5 kernel worked (because it's just revert of
5eee2b3f60065a2530d13f28e771be48b989eb4c for older firmware versions which 
should be tested with the old code).

> The original problem was sensitive to timing, so apparently there is still
> some variation how this triggers on different platforms. With 1.4, 1.4.1
> and 1.4.2 now out, primary solution is just to upgrade the firmware.
> 
> If this fix helps with some real-life case to cope with an old firmware,
> we should probably still consider this. Ranjani, does the above make
> sense?

Ok, it's really weird that we cannot determine the firmware/driver combination 
which cause the DSP lock. I would propose to block the older firmware load 
<1.4 (or 1.4.2 which has the correct firmware version!) then (at least with a 
big warning or module option which is off by default) for the newer kernels.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
