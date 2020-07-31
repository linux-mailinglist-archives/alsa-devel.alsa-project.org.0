Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C380234189
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 10:51:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19B8F16A3;
	Fri, 31 Jul 2020 10:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19B8F16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596185484;
	bh=aDUPt/WcOB5WLGuGTIh8ZCGjtC+lWxWACKfk7CCybk4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=viYqkatwjc+cRMhXbC9Ka+7a076FN0Xl8Knb5keABptab1drbWtoY5/mUFx8GCsa6
	 hjF6KJM+NwiCdthA69hf+jbVrcikZ735AxrcN87TmvyjZVxi3FqqOaNt6cr2LVLyOd
	 vObZPPnv5z+VDpPejpGCoAt7azjZeZ2Od3AVCYAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 466ACF80161;
	Fri, 31 Jul 2020 10:49:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B05DF80171; Fri, 31 Jul 2020 10:49:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by alsa1.perex.cz (Postfix) with ESMTP id 7716AF80111
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 10:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7716AF80111
Received: from [10.130.0.69] (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT9772iNfkvECAA--.45S3;
 Fri, 31 Jul 2020 16:49:00 +0800 (CST)
Subject: Re: [RFC] ALSA: hda: Add workaround to adapt to Loongson 7A1000
 controller
To: Takashi Iwai <tiwai@suse.de>
References: <1596163314-21808-1-git-send-email-likaige@loongson.cn>
 <s5hlfj0b3jk.wl-tiwai@suse.de>
From: Kaige Li <likaige@loongson.cn>
Message-ID: <15648946-3b87-69db-914c-354dce1abcac@loongson.cn>
Date: Fri, 31 Jul 2020 16:48:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <s5hlfj0b3jk.wl-tiwai@suse.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxT9772iNfkvECAA--.45S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFW7Kr1DXw47JFW5CF4xCrg_yoW8XF1UpF
 n3CayUCF4Dtr1jkFsru3y5KayFg3yfGF45KryFvw1DAw1qk343X3WvvrWjkF9Y9wsY9r4Y
 kFy7ta4kGFW5ZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr4
 1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
 67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
 8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
 wI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
 AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUmYL9UUUUU=
X-CM-SenderInfo: 5olntxtjh6z05rqj20fqof0/
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Xuefeng Li <lixuefeng@loongson.cn>,
 Mohan Kumar <mkumard@nvidia.com>
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

On 07/31/2020 02:29 PM, Takashi Iwai wrote:

> On Fri, 31 Jul 2020 04:41:54 +0200,
> Kaige Li wrote:
>> There's some issues that cause palyback without a sound on Loongson
>> platform (3A3000 + 7A1000) with a Realtek ALC269 codec. After lengthy
>> debugging sessions, we solved it by adding workaround.
>>
>> Signed-off-by: Kaige Li <likaige@loongson.cn>
> Thanks for the patch.  But this can't be taken as is due to the design
> problem.  Namely...
>
>> --- a/sound/hda/hdac_controller.c
>> +++ b/sound/hda/hdac_controller.c
>> @@ -9,6 +9,7 @@
>>   #include <sound/core.h>
>>   #include <sound/hdaudio.h>
>>   #include <sound/hda_register.h>
>> +#include "../pci/hda/hda_controller.h"
> ... here already suspicious, and ...
>
>>   #include "local.h"
>>   
>>   /* clear CORB read pointer properly */
>> @@ -42,6 +43,8 @@ static void azx_clear_corbrp(struct hdac_bus *bus)
>>    */
>>   void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
>>   {
>> +	struct azx *chip = bus_to_azx(bus);
> ... here you cast the hdac_bus object to its child class.  This is
> disallowed, as it's a layer violation and would break if another child
> class like ASoC driver is used with this patch.
>
> IOW, inside the code in sound/hda/*, you must not use the contents in
> sound/pci/hda/* and include/sound/hda_codec.h.
>
> If any new workaround is needed, introduce a new flag in struct
> hdac_bus.

Thank you for your reply and suggestions. I will review it, and see how 
hdac_bus works.

Thanks,
Kaige
> thanks,
>
> Takashi

