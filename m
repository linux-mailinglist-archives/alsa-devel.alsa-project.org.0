Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C55725A01
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 11:20:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5FCB846;
	Wed,  7 Jun 2023 11:19:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5FCB846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686129641;
	bh=MrE8OeSj3aHbiczcptHv1IeO8bF6j57DoDHs2B4iMq0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CSxKGBQ/j2AA5BCCGai5uL35k98WmYWYs9B0C2A+nF7wn9xuH37JreXDgPPY3USxY
	 hpyoa2M3y/tOA2iZCCFZB1hB20+oaPAxamgSAL00RCrzDUfhYEo4ifxe9M9u5K3hP5
	 Sq9FJWSsnlMv1MgJJXZjVbgbKB5v2YCogT+sTiPc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25581F8057F; Wed,  7 Jun 2023 11:18:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4598DF8057F;
	Wed,  7 Jun 2023 11:18:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 909F3F80199; Wed,  7 Jun 2023 06:50:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id EA249F8016C
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 06:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA249F8016C
Received: from loongson.cn (unknown [223.106.25.146])
	by gateway (Coremail) with SMTP id _____8Dx_+s3DIBkiQYAAA--.137S3;
	Wed, 07 Jun 2023 12:48:56 +0800 (CST)
Received: from [192.168.100.8] (unknown [223.106.25.146])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxFOQ2DIBkP9MDAA--.13899S3;
	Wed, 07 Jun 2023 12:48:55 +0800 (CST)
Message-ID: <7d5c7765-936e-e7be-a80b-feec61b9f9ef@loongson.cn>
Date: Wed, 7 Jun 2023 12:48:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 2/4] ALSA: hda: Using polling mode for loongson
 controller by default
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, perex@perex.cz, chenhuacai@loongson.cn,
 alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn, Yingkun Meng <mengyingkun@loongson.cn>
References: <cover.1686057365.git.siyanteng@loongson.cn>
 <521be42ac818d35a996e01cc3d591e1c87f230d9.1686057365.git.siyanteng@loongson.cn>
 <87wn0gg16g.wl-tiwai@suse.de>
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <87wn0gg16g.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxFOQ2DIBkP9MDAA--.13899S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCryfuFy5GF45CF4ruF47ZFc_yoW5Gw4UpF
	ykCa4rKFZrJr4jkFsrK3WUKr1fXa97GF13GrWj9340yrnFv3WrWw1qkr4rZFWjvr4Igrya
	qr1vqa48JayYqabCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jeQ6JUUUUU=
X-MailFrom: siyanteng@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FGUI5ZUUQDQPGHP5XVM3IR2466IKF5OP
X-Message-ID-Hash: FGUI5ZUUQDQPGHP5XVM3IR2466IKF5OP
X-Mailman-Approved-At: Wed, 07 Jun 2023 09:18:37 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FGUI5ZUUQDQPGHP5XVM3IR2466IKF5OP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


在 2023/6/6 21:39, Takashi Iwai 写道:
> On Tue, 06 Jun 2023 15:25:28 +0200,
> Yanteng Si wrote:
>> On loongson controller, RIRBSTS.RINTFL cannot be cleared,
>> azx_interrupt() is called all the time. We disable RIRB
>> interrupt, and use polling mode by default.
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
>> ---
>>   include/sound/hdaudio.h     | 1 +
>>   sound/hda/hdac_controller.c | 5 ++++-
>>   sound/pci/hda/hda_intel.c   | 4 ++++
>>   3 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
>> index 97f09acae302..a1dcc7f97d08 100644
>> --- a/include/sound/hdaudio.h
>> +++ b/include/sound/hdaudio.h
>> @@ -346,6 +346,7 @@ struct hdac_bus {
>>   	bool reverse_assign:1;		/* assign devices in reverse order */
>>   	bool corbrp_self_clear:1;	/* CORBRP clears itself after reset */
>>   	bool polling_mode:1;
>> +	bool no_intr_polling_mode:1;
> It isn't clear enough what this flag does.  It's basically prohibiting
> the RIRB IRQ (hence requiring the polling mode), right?  Write it in
> the comment.
OK!
>
>> diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
>> index 3c7af6558249..705e09cc50ac 100644
>> --- a/sound/hda/hdac_controller.c
>> +++ b/sound/hda/hdac_controller.c
>> @@ -79,7 +79,10 @@ void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
>>   	/* set N=1, get RIRB response interrupt for new entry */
>>   	snd_hdac_chip_writew(bus, RINTCNT, 1);
>>   	/* enable rirb dma and response irq */
>> -	snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN | AZX_RBCTL_IRQ_EN);
>> +	if (bus->no_intr_polling_mode)
>> +		snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN);
>> +	else
>> +		snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN | AZX_RBCTL_IRQ_EN);
>>   	/* Accept unsolicited responses */
>>   	snd_hdac_chip_updatel(bus, GCTL, AZX_GCTL_UNSOL, AZX_GCTL_UNSOL);
>>   	spin_unlock_irq(&bus->reg_lock);
>> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>> index 9c353dc7740c..1e8993836fc6 100644
>> --- a/sound/pci/hda/hda_intel.c
>> +++ b/sound/pci/hda/hda_intel.c
>> @@ -1875,6 +1875,10 @@ static int azx_first_init(struct azx *chip)
>>   	if (chip->driver_type == AZX_DRIVER_GFHDMI)
>>   		bus->polling_mode = 1;
>>   
>> +	if (chip->driver_type == AZX_DRIVER_LOONGSON) {
>> +		bus->no_intr_polling_mode = 1;
>> +	}
> Don't you need to set the bus->polling_mode?

Yes, I do.

Although it works now, some messages will print.


Thanks,

Yanteng

>
>
> thanks,
>
> Takashi

