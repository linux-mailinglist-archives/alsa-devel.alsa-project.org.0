Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D9F109F95
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 14:53:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C86F1724;
	Tue, 26 Nov 2019 14:52:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C86F1724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574776395;
	bh=RLvgcHuirZJr0xACk0vCZkqsX0ep8yp/PMQNyqvlksU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n/V65iC8RnwIoUeui360B2P1NCleGg6Ws5BSu40xbJ8yE2R9chH2oazFabQ088xDl
	 /rg5s+VxUbMoTF7ABpuDruAD5H2DiUiwF/Gs9Vw1IxnlTQwMah53RrbMXIlbSudGh9
	 kSnSVSfrNWOBYusjOd4GgrHdFqYjlDD5F4hWW+5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7135F800DD;
	Tue, 26 Nov 2019 14:51:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39F55F80159; Tue, 26 Nov 2019 14:51:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 467D7F80109
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 14:51:24 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4D0B1A003F;
 Tue, 26 Nov 2019 14:51:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4D0B1A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574776284; bh=EWYHSj4FcpTt7ok6JNHxgkR6Ln1keeKNzAuOhNPE16A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=COLyvxSMx47G01qSn+UyhJ1rWNXqWzvGaJcBrv21/adMYeRbamhqPoBoJx8UaU0IQ
 GqC1KtbQBmFMEL9c8oseqjSEnRBqvPM7WQv9FWvVJa8U4zbQusGdv2dh7g1+rsuC93
 dHIewBgxpyLVLAKoBseP36ObVWvwOPCIRXXWHoUw=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 26 Nov 2019 14:51:20 +0100 (CET)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191126103404.29534-1-perex@perex.cz>
 <dd238740-f154-a660-2a80-0ada80183dd2@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <32edec86-ec1c-1809-2278-fecac09ac321@perex.cz>
Date: Tue, 26 Nov 2019 14:51:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <dd238740-f154-a660-2a80-0ada80183dd2@linux.intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: intel/skl/hda - export number of
 digital microphones via control components
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 26. 11. 19 v 13:33 Pierre-Louis Bossart napsal(a):
> 
> 
> On 11/26/19 4:34 AM, Jaroslav Kysela wrote:
>> It is required for the auto-detection in the user space (for UCM).
>>
>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Cc: Mark Brown <broonie@kernel.org>
> 
> Thanks Jaroslav.
> The changes are fine, but the code changes in hda.c will conflict with
> the cleanups done by Ranjani (which I was planning to send next week).
> 
> Any objections if we take this patch into the SOF tree (without changes
> to authorship) and provide it on alsa-devel next week with the cleanups,
> so that we don't have any conflicts?

I'm fine with that, if we don't miss the 5.5 merge window. Otherwise, you may 
rebase your changes on top. Mark?

				Thank you,
					Jaroslav

> 
>> ---
>>    sound/soc/intel/boards/skl_hda_dsp_generic.c | 8 ++++++++
>>    sound/soc/sof/intel/hda.c                    | 3 ++-
>>    2 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
>> index 4e45901e3a2f..11eaee9ae41f 100644
>> --- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
>> +++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
>> @@ -100,6 +100,8 @@ static struct snd_soc_card hda_soc_card = {
>>    	.late_probe = skl_hda_card_late_probe,
>>    };
>>    
>> +static char hda_soc_components[30];
>> +
>>    #define IDISP_DAI_COUNT		3
>>    #define HDAC_DAI_COUNT		2
>>    #define DMIC_DAI_COUNT		2
>> @@ -183,6 +185,12 @@ static int skl_hda_audio_probe(struct platform_device *pdev)
>>    	hda_soc_card.dev = &pdev->dev;
>>    	snd_soc_card_set_drvdata(&hda_soc_card, ctx);
>>    
>> +	if (mach->mach_params.dmic_num > 0) {
>> +		snprintf(hda_soc_components, sizeof(hda_soc_components),
>> +				"cfg-dmics:%d", mach->mach_params.dmic_num);
>> +		hda_soc_card.components = hda_soc_components;
>> +	}
>> +
>>    	return devm_snd_soc_register_card(&pdev->dev, &hda_soc_card);
>>    }
>>    
>> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
>> index 7dc0018dc4c3..92fffca76af5 100644
>> --- a/sound/soc/sof/intel/hda.c
>> +++ b/sound/soc/sof/intel/hda.c
>> @@ -351,7 +351,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
>>    	const char *tplg_filename;
>>    	const char *idisp_str;
>>    	const char *dmic_str;
>> -	int dmic_num;
>> +	int dmic_num = 0;
>>    	int codec_num = 0;
>>    	int i;
>>    #endif
>> @@ -465,6 +465,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
>>    		mach_params->codec_mask = bus->codec_mask;
>>    		mach_params->platform = dev_name(sdev->dev);
>>    		mach_params->common_hdmi_codec_drv = hda_codec_use_common_hdmi;
>> +		mach_params->dmic_num = dmic_num;
>>    	}
>>    
>>    	/* create codec instances */
>>


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
