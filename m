Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 490B43ADAD
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 05:42:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BB63169D;
	Mon, 10 Jun 2019 05:41:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BB63169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560138147;
	bh=+no2BTOIJzVz+E0HW05Et2+eMj6D089LPFD5sffh33E=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gDG5WpAWy2LedIgqdltNsUbaupKV7oc34YNPiloGROMZrYnGOoAdwWargDe69nN0F
	 CNond0QTIJc/jRFQYf/xAVlxjElBCXKE2w4d+5I6VowmonqyxZB+tCYUYuyYWEk5PG
	 QyGH75OdhE2YvkwyxUYigJfOl6Mmb/bFuX7OTKl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDF81F896EA;
	Mon, 10 Jun 2019 05:40:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF83BF896E0; Mon, 10 Jun 2019 05:36:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_78,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 3A7BBF896CE
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 05:34:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A7BBF896CE
Received: from NTHCCAS01.nuvoton.com (nthccas01.nuvoton.com [10.1.8.28])
 by maillog.nuvoton.com (Postfix) with ESMTP id DA3A91C80CEF;
 Mon, 10 Jun 2019 11:33:52 +0800 (CST)
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Mon, 10 Jun 2019
 11:33:52 +0800
Received: from [10.4.60.63] (10.4.60.63) by NTHCML01A.nuvoton.com (10.1.8.176)
 with Microsoft SMTP Server (TLS) id 15.0.1130.7;
 Mon, 10 Jun 2019 11:33:52 +0800
To: Cheng-yi Chiang <cychiang@chromium.org>
References: <20190610021229.12005-1-KCHSU0@nuvoton.com>
 <20190610024029.12193-1-KCHSU0@nuvoton.com>
 <CAFv8NwLHkP9zrHNbinz=8D9Gsf6Z8oTGN=CE-BX__72EhE6=Dg@mail.gmail.com>
From: AS50 KCHsu0 <KCHSU0@nuvoton.com>
Organization: AS50, Nuvoton Technology Corp.
Message-ID: <b35cc100-5faa-9eb6-6218-5046d2a0afa2@nuvoton.com>
Date: Mon, 10 Jun 2019 11:33:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CAFv8NwLHkP9zrHNbinz=8D9Gsf6Z8oTGN=CE-BX__72EhE6=Dg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.4.60.63]
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER
 MANAGEM..." <alsa-devel@alsa-project.org>, WTLI@nuvoton.com,
 Liam Girdwood <lgirdwood@gmail.com>, Yu-hsuan Hsu <yuhsuan@google.com>,
 YHCHuang@nuvoton.com, Mark Brown <broonie@kernel.org>, CTLIN0@nuvoton.com,
 mhkuo@nuvoton.com
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


On 6/10/2019 10:56 AM, Cheng-yi Chiang wrote:
> On Mon, Jun 10, 2019 at 10:40 AM John Hsu <KCHSU0@nuvoton.com> wrote:
>> There is no pull-up resistor at IRQ line where it connects from
>> the codec to SoC. When booting, the signal of IRQ pin will keep low
>> which makes the SoC invoke the ISR repeatedly because the IRQ is
>> registered trigger low. It will not stop until the codec sets up
>> the interruption and pulls the signal high. In the patch,
>> nau8825 will internally pull the signal to high at booting in case
>> the fake interrupts happen.
>>
>> What steps will reproduce the problem?
>> Boot device
>> What is the expected output?
>> A lot of interrupts without any events
>> What do you see instead?
>> The fake interrupts are gone
>> How frequently does this problem reproduce?
>> Always
>>
> I guess you don't need these descriptions.


Yes, I add it by referring to the comment of ChromeOS.

I can remove it.


>> Signed-off-by: John Hsu <KCHSU0@nuvoton.com>
> Please add my Tested-by.
> Thanks!


OK, I will add it.


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
