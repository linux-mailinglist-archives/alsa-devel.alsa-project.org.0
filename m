Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7A357D047
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 17:50:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96FB317F0;
	Thu, 21 Jul 2022 17:50:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96FB317F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658418658;
	bh=AsV19N6i0PrXUfLOx4veAAHngJhcvTZ9QuGYlLff8wc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hoQBvIkPuntT/U6ZX5k/enSJAjn/B73cLIwzoDuda7ld1M2HdsaOlKo44lk8Jgjy8
	 gruV9vc6FR9yvZ8epmImyRuySPnwhUV4iv7Y79EefV2joS+vuT/TQIqo4xWAmUezok
	 x6E7+nD8c2dLHYlfHz6iiQ8tIt8eeAQQiNbMU1Nc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4C57F80256;
	Thu, 21 Jul 2022 17:49:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 315B4F8016D; Thu, 21 Jul 2022 17:49:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48B4AF800BA
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 17:49:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48B4AF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dd5tQHfj"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LBtj1r023900;
 Thu, 21 Jul 2022 10:49:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=46ySDQe4xkYQJIAAZXfQ37h3NC2XgZ7nTWd8+QKiPEQ=;
 b=dd5tQHfjGg08umInWAm0hP9jXTLKqHMG/vo1AiHHNKCKiAZsSn5HY/qoYtXrvRtd5L2G
 6cgvlpDvR06Vg3+kaYbvWpXZRIUk0aJXhlpy1y7cDUACTkbaRBxGu2uKO9GXOfjM0q5P
 JXpHjGamLCP15vJw5N8GdH+tMvnvvOCNUfVUPlRQ8cysxfeOfuzPouPoLU5AAFQTUtga
 bAhWlqh1VITvbECNJxrJwoavZ1qQmAbttGltX1DmSGr/1dt2Aj5u9q6BjwOL0A15rxv3
 pc3b6PsHUEcJrLSdpo/MNpoFFXya3axWuEz8zZfyDXEHtshMaCGCXHtnhmFoACH8+iOy 2w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hdxffarpm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 10:49:47 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Thu, 21 Jul
 2022 10:49:45 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Thu, 21 Jul 2022 10:49:45 -0500
Received: from [198.90.202.131] (unknown [198.90.202.131])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2D21F7C;
 Thu, 21 Jul 2022 15:49:45 +0000 (UTC)
Message-ID: <bf488730-b464-5f1c-4eb8-a150900eb7fd@opensource.cirrus.com>
Date: Thu, 21 Jul 2022 16:49:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ALSA: hda/realtek: Enable speaker and mute LEDs for HP
 laptops
Content-Language: en-US
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <20220719142015.244426-1-kai.heng.feng@canonical.com>
 <444a7ab6-d47e-6e0a-de0c-1efb292edb8a@opensource.cirrus.com>
 <CAAd53p45FkTMgV1_iGJfiya-EN7cuv_V1QCvOZirmy7CubxJAA@mail.gmail.com>
From: Lucas Tanure <tanureal@opensource.cirrus.com>
In-Reply-To: <CAAd53p45FkTMgV1_iGJfiya-EN7cuv_V1QCvOZirmy7CubxJAA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YqwjOAJeVXq3xV5kz6NtJh_E5TYW2kNR
X-Proofpoint-GUID: YqwjOAJeVXq3xV5kz6NtJh_E5TYW2kNR
X-Proofpoint-Spam-Reason: safe
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
 Kailang Yang <kailang@realtek.com>, alsa-devel@alsa-project.org,
 Meng Tang <tangmeng@uniontech.com>, tiwai@suse.com,
 Werner Sembach <wse@tuxedocomputers.com>, linux-kernel@vger.kernel.org,
 Tim Crawford <tcrawford@system76.com>, Andy Chi <andy.chi@canonical.com>,
 patches@opensource.cirrus.com, Cameron Berkenpas <cam@neo-zeon.de>,
 Yong Wu <yong.wu@mediatek.com>
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


On 7/20/22 03:07, Kai-Heng Feng wrote:
> On Tue, Jul 19, 2022 at 11:27 PM Lucas Tanure
> <tanureal@opensource.cirrus.com> wrote:
>>
>> On 7/19/22 15:20, Kai-Heng Feng wrote:
>>> Two more HP laptops that use cs35l41 AMP for speaker and GPIO for mute
>>> LEDs.
>>>
>>> So use the existing quirk to enable them accordingly.
>>>
>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>> ---
>>>    sound/pci/hda/patch_realtek.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
>>> index 2f55bc43bfa9c..cdbee71e83216 100644
>>> --- a/sound/pci/hda/patch_realtek.c
>>> +++ b/sound/pci/hda/patch_realtek.c
>>> @@ -9109,6 +9109,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>>>        SND_PCI_QUIRK(0x103c, 0x89c3, "Zbook Studio G9", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
>>>        SND_PCI_QUIRK(0x103c, 0x89c6, "Zbook Fury 17 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
>>>        SND_PCI_QUIRK(0x103c, 0x89ca, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
>>> +     SND_PCI_QUIRK(0x103c, 0x8ad1, "HP EliteBook 840 14 inch G9 Notebook PC", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
>>> +     SND_PCI_QUIRK(0x103c, 0x8ad2, "HP EliteBook 860 16 inch G9 Notebook PC", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
>>>        SND_PCI_QUIRK(0x103c, 0x8a78, "HP Dev One", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
>>>        SND_PCI_QUIRK(0x103c, 0x8aa0, "HP ProBook 440 G9 (MB 8A9E)", ALC236_FIXUP_HP_GPIO_LED),
>>>        SND_PCI_QUIRK(0x103c, 0x8aa3, "HP ProBook 450 G9 (MB 8AA1)", ALC236_FIXUP_HP_GPIO_LED),
>> Hi,
>>
>> Can you send us the ACPI dump (DSDT file) for review for both laptops?
> As attachment.
Your DSDT looks good, I will +1 your patch.
>
>> We want to ensure that the ACPI has the correct information so the
>> driver will work properly.
> One thing we noticed recently is that _all_ systems that are equipped
> with cs35l41 have rather weak speaker output.
> Sound is barely audible when the volume is around 50%.

Full speaker performance will be enabled with DSP support. The code for 
this has recently been merged and you may need to backport it to your 
code base.

Additionally, the appropriate firmware and tunings need to be available 
for your specific SKU.  We are in the process of pushing these to the 
linux-firmware repo now.  If there is a particular SKU you wish to 
prioritize, then please let us know.

>
> Kai-Heng
>
>> Thanks
>>
>> Lucas Tanure
>>
