Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A889A3ACFE
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 04:32:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 129BE1684;
	Mon, 10 Jun 2019 04:31:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 129BE1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560133926;
	bh=jMO9G45a2NPPVhCqPWWdT89aVgAiBjF742BfKxGMuaY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xkt7M9qQitMP3XYJPo5PiHOvlXuPXJ/6qEaZyoeHQ8+rVfk5qYfHGOCw6ig3JikWN
	 qji0RrjCwBHMYA3maH528aCD2bg2OVxQ0XyoEDkcy4TZJ9iDCisGlsMB63PxHkSKou
	 SEXULB71SekzjJ6so8BewAEIN+xF3oo41XSkSbD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9EDAF896E0;
	Mon, 10 Jun 2019 04:30:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A78C4F896E0; Mon, 10 Jun 2019 04:28:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_78,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id CE7B1F8070E
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 04:27:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE7B1F8070E
Received: from NTHCCAS02.nuvoton.com (nthccas02.nuvoton.com [10.1.8.29])
 by maillog.nuvoton.com (Postfix) with ESMTP id 279611C80C84;
 Mon, 10 Jun 2019 10:27:46 +0800 (CST)
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS02.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Mon, 10 Jun 2019
 10:27:46 +0800
Received: from [10.4.60.63] (10.4.60.63) by NTHCML01A.nuvoton.com (10.1.8.176)
 with Microsoft SMTP Server (TLS) id 15.0.1130.7;
 Mon, 10 Jun 2019 10:27:45 +0800
To: Cheng-yi Chiang <cychiang@chromium.org>
References: <20190610021229.12005-1-KCHSU0@nuvoton.com>
 <CAFv8NwKNCR=vRSHQUkptdtW4+3AxfDsuoWEj6VQuVMffNh4Ryw@mail.gmail.com>
From: AS50 KCHsu0 <KCHSU0@nuvoton.com>
Organization: AS50, Nuvoton Technology Corp.
Message-ID: <3749d946-8d4a-9c72-3785-f4f43ebd60bb@nuvoton.com>
Date: Mon, 10 Jun 2019 10:27:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CAFv8NwKNCR=vRSHQUkptdtW4+3AxfDsuoWEj6VQuVMffNh4Ryw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.4.60.63]
Cc: anatol@chromium.org, "moderated list:SOUND - SOC LAYER
 / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 WTLI@nuvoton.com, Liam Girdwood <lgirdwood@gmail.com>,
 Yu-hsuan Hsu <yuhsuan@google.com>, YHCHuang@nuvoton.com,
 Mark Brown <broonie@kernel.org>, CTLIN0@nuvoton.com, mhkuo@nuvoton.com
Subject: Re: [alsa-devel] [PATCH] ASoC: nau8825: fix fake interruption when
	booting
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


On 6/10/2019 10:18 AM, Cheng-yi Chiang wrote:
> On Mon, Jun 10, 2019 at 10:13 AM John Hsu <KCHSU0@nuvoton.com> wrote:
>> There is no pull-up resistor at IRQ line where it connects from
>> the codec to SoC. When booting, the signal of IRQ pin will keep low
>> which makes the SoC invoke the ISR repeatedly because the IRQ is
>> registered trigger low. It will not stop until the codec sets up
>> the interruption and pulls the signal high. In the patch,
>> nau8825 will internally pull the signal to high at booting in case
>> the fake interrupts happen.
>>
>> The patch help to fix the issue as follows:
>> Google issue 133904101: Cave: excessive number of interrupts before Nau8825 codec is initialized
>> Reported Issue
>> Chrome OS Version  :  ChromeOS R76-12217.0.0
>> Type of hardware   :
>>
>> What steps will reproduce the problem?
>> Boot device
>> What is the expected output?
>> A lot of interrupts without any events
>> What do you see instead?
>> The fake interrupts are gone
>>
>> How frequently does this problem reproduce?
>> Always
>>
>> What is the impact to the user, and is there a workaround?
>> If so, what is it?
>>
>> BUG=b:133904101
>> TEST=Boot device, and then check the interrupts are real.
>>
>> Signed-off-by: John Hsu <KCHSU0@nuvoton.com>
> Tested-by: Cheng-Yi Chiang <cychiang@chromium.org>
>
> Thank you for the fix.
> I think you can remove the description about issue 133904101 in the
> commit messages and BUG and TEST fields.
>

OK, I will remove it later.


>
>
>> ---
>>   sound/soc/codecs/nau8825.c | 4 ++++
>>   sound/soc/codecs/nau8825.h | 2 ++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
>> index 47e65cf99879..83ec841f7865 100644
>> --- a/sound/soc/codecs/nau8825.c
>> +++ b/sound/soc/codecs/nau8825.c
>> @@ -1881,6 +1881,10 @@ static void nau8825_init_regs(struct nau8825 *nau8825)
>>                  NAU8825_JACK_EJECT_DEBOUNCE_MASK,
>>                  nau8825->jack_eject_debounce << NAU8825_JACK_EJECT_DEBOUNCE_SFT);
>>
>> +       /* Pull up IRQ pin */
>> +       regmap_update_bits(regmap, NAU8825_REG_INTERRUPT_MASK,
>> +               NAU8825_IRQ_PIN_PULLUP | NAU8825_IRQ_PIN_PULL_EN,
>> +               NAU8825_IRQ_PIN_PULLUP | NAU8825_IRQ_PIN_PULL_EN);
>>          /* Mask unneeded IRQs: 1 - disable, 0 - enable */
>>          regmap_update_bits(regmap, NAU8825_REG_INTERRUPT_MASK, 0x7ff, 0x7ff);
>>
>> diff --git a/sound/soc/codecs/nau8825.h b/sound/soc/codecs/nau8825.h
>> index f6074c618569..3f41897ed3f6 100644
>> --- a/sound/soc/codecs/nau8825.h
>> +++ b/sound/soc/codecs/nau8825.h
>> @@ -171,6 +171,8 @@
>>   #define NAU8825_JACK_POLARITY  (1 << 1) /* 0 - active low, 1 - active high */
>>
>>   /* INTERRUPT_MASK (0xf) */
>> +#define NAU8825_IRQ_PIN_PULLUP (1 << 14)
>> +#define NAU8825_IRQ_PIN_PULL_EN (1 << 13)
>>   #define NAU8825_IRQ_OUTPUT_EN (1 << 11)
>>   #define NAU8825_IRQ_HEADSET_COMPLETE_EN (1 << 10)
>>   #define NAU8825_IRQ_RMS_EN (1 << 8)
>> --
>> 2.21.0
>>


===========================================================================================
The privileged confidential information contained in this email is intended for use only by the addressees as indicated by the original sender of this email. If you are not the addressee indicated in this email or are not responsible for delivery of the email to such a person, please kindly reply to the sender indicating this fact and delete all copies of it from your computer and network server immediately. Your cooperation is highly appreciated. It is advised that any unauthorized use of confidential information of Nuvoton is strictly prohibited; and any information in this email irrelevant to the official business of Nuvoton shall be deemed as neither given nor endorsed by Nuvoton.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
