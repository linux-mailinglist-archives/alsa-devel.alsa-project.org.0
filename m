Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 893868BAFD7
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 17:32:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5B06E7D;
	Fri,  3 May 2024 17:32:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5B06E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714750330;
	bh=ZTeqTIx6NtGxx8vrxI3M+OcWZ4Fj8MiLEDhysehAouk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SiMy2yieP0XDgeFii/yxLi+p2skasFVo6PQIoN7oEAK0sPXaTtXsgrGaSBH6JgQiA
	 NtHuKxcbT7uKw44ALBUz8zZ/3Uc3BfBu2ArjMQeJ1LRaB9UYog0NybjrcAxkvBb4Sf
	 nk87pNNVk/+ePy35jIrQGLmhv33PG4lnpbVwNfgw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E143EF80571; Fri,  3 May 2024 17:31:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1620FF804FB;
	Fri,  3 May 2024 17:31:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12052F80266; Fri,  3 May 2024 17:31:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6C88F800AE
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 17:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6C88F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Dr9O6AP+
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4436hOkY022022;
	Fri, 3 May 2024 10:31:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=pMP28VeqYfHHwml5T9dmOpi3+UZclYD9X6K1JwLGHJo=; b=
	Dr9O6AP+oXJuidoEdBkHvdZCO3Bzt0nNAUUADrXr1Y1kDQsMpNmHzFxhVc9Q1K6h
	5izS3niLeL8BO1z77Thvvj7KiaAiZrvW2lFqstbkEE5P6+HYeiU3Dtg907wworxv
	M6A0Tk2aYXJzV8roem1kCWwgWhSbtR3+a1wIxQxHiPNno+ASYDc3ovhsuLO89Lz0
	FLlaz2MKtCD6UAaUBsbnNQHBNHoefLac8xiURenWE6sOE7BMdlNKOSAyXeC8IA1h
	1LaJUoNpdeqgXa3hxwdf8y4TUGS1SyB7xQ6GDLN8Arxig5t49ueVbekrFkMy59ZF
	elrlc2ltlAjPW0x7uR7bhw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xrxry6xm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 May 2024 10:31:17 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 May 2024
 16:31:15 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9
 via Frontend Transport; Fri, 3 May 2024 16:31:15 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 55FED82026C;
	Fri,  3 May 2024 15:31:15 +0000 (UTC)
Message-ID: <d9c5b863-53a5-4255-ab15-9ac3cb10ec10@opensource.cirrus.com>
Date: Fri, 3 May 2024 16:31:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/cs_dsp_ctl: Actually remove ALSA controls
To: Takashi Iwai <tiwai@suse.de>
CC: <tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>
References: <20240503144920.61075-1-rf@opensource.cirrus.com>
 <87msp79b7o.wl-tiwai@suse.de>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <87msp79b7o.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BAPHobn_D-X9cL0eHn5O9nS7ov3uewiI
X-Proofpoint-GUID: BAPHobn_D-X9cL0eHn5O9nS7ov3uewiI
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 46MZQESY435X2PY5N34T7WC2GDGCLTTA
X-Message-ID-Hash: 46MZQESY435X2PY5N34T7WC2GDGCLTTA
X-MailFrom: prvs=2853e2c642=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/46MZQESY435X2PY5N34T7WC2GDGCLTTA/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03/05/2024 16:17, Takashi Iwai wrote:
> On Fri, 03 May 2024 16:49:20 +0200,
> Richard Fitzgerald wrote:
>>
>> hda_cs_dsp_control_remove() must remove the ALSA control when
>> deleting all the infrastructure for handling the control.
>>
>> Without this it is possible for ALSA controls to be left in
>> the Soundcard after the amp driver module has been unloaded.
>> So the get/set callbacks point to code that no longer exists.
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> Fixes: 3233b978af23 ("ALSA: hda: hda_cs_dsp_ctl: Add Library to support CS_DSP ALSA controls")
>> ---
>> Note: it would be better to use the control private_free to do the
>> cleanup, and that is my plan long-term. But that is a larger change
>> to the code.
>>
>> I like to keep bugfix patches as simple as possible so they are
>> low-risk and easy to cherry-pick into older kernels. So this patch
>> fixes the bug. Sometime I will send a patch for future kernel
>> versions that reworks the cleanup to use private_free.
> 
> I also like to keep as simple as possible :)
> 
> One slight concern is whether cs_dsp kctls can be deleted at the
> snd_card removal (disconnect) before this function gets called.
> That is, snd_card_free() of the main card may delete all associated
> kctls, and may this function be called afterwards?
> If yes, this change would lead to a UAF.
> 

That's a good question. This is is safe for the cs35l56 driver because
if the soundcard (or HDA codec driver) is removed, the HDA codec will
destroy the component binding in its HDA_FIXUP_ACT_FREE. This will cause
an unbind() call to the amp driver, which will (indirectly) call this
function to remove all the controls. So they will have been removed
before the soundcard is cleaned up.

But it turns out that the cs35l41 driver doesn't clean up the cs_dsp
instance in its unbind() call so the controls _won't_ be cleaned up
and a double-free is possible. The firmware handling in the cs35l41
driver is strange and confusing so I'm not sure whether this is a bug
or something necessary.

> The structure is so complex and I can't follow immediately,
> unfortunately...
> 

Yes, I know. When this hda_cs_dsp_ctl code was first submitted to the
kernel you suggested using private_free instead of this manual cleanup
but for some reason that wasn't implemented.

> 
> thanks,
> 
> Takashi
> 
>> ---
>>   sound/pci/hda/hda_cs_dsp_ctl.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/sound/pci/hda/hda_cs_dsp_ctl.c b/sound/pci/hda/hda_cs_dsp_ctl.c
>> index 463ca06036bf..a42653d3473d 100644
>> --- a/sound/pci/hda/hda_cs_dsp_ctl.c
>> +++ b/sound/pci/hda/hda_cs_dsp_ctl.c
>> @@ -203,6 +203,10 @@ void hda_cs_dsp_control_remove(struct cs_dsp_coeff_ctl *cs_ctl)
>>   {
>>   	struct hda_cs_dsp_coeff_ctl *ctl = cs_ctl->priv;
>>   
>> +	/* Only public firmware controls will have an associated kcontrol */
>> +	if (ctl && ctl->kctl)
>> +		snd_ctl_remove(ctl->card, ctl->kctl);
>> +
>>   	kfree(ctl);
>>   }
>>   EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_control_remove, SND_HDA_CS_DSP_CONTROLS);
>> -- 
>> 2.39.2
>>

