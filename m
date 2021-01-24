Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E27A301A9F
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Jan 2021 09:31:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03F6F1905;
	Sun, 24 Jan 2021 09:30:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03F6F1905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611477106;
	bh=t8naVe6Qi+rZyDRaan0+UYv5Ek5CpqfW5VxueR5ChR8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A3fpUKZzef/2xSxMYvfiJ1Gw1vl3ez6J+SFT/AI+3hDHxWaUv6fCjPXYH+8cwMvc2
	 vA89G9NoAXlr6UCvDtlrZ5/hZw+wU/Oy91meQlYnQL+5epbNNPDMnUPgFRYovwVa8O
	 mgQg/XnpzhevHqWcMmTIGU3n9QjPt5qtMCsF2KSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 132EFF8014E;
	Sun, 24 Jan 2021 09:30:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACC1CF8015B; Sun, 24 Jan 2021 09:29:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D87FBF80114
 for <alsa-devel@alsa-project.org>; Sun, 24 Jan 2021 09:29:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D87FBF80114
Received: from [123.112.70.0] (helo=[192.168.0.106])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1l3al4-0003a1-Fx; Sun, 24 Jan 2021 08:28:41 +0000
Subject: Re: [RFC][PATCH v6 1/1] alsa: jack: implement software jack injection
 via debugfs
To: Takashi Iwai <tiwai@suse.de>
References: <20210122141456.12460-1-hui.wang@canonical.com>
 <20210122141456.12460-2-hui.wang@canonical.com>
 <s5hv9bp6m3t.wl-tiwai@suse.de>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <2b8088cb-37e3-c8c3-7371-1d320eabddf1@canonical.com>
Date: Sun, 24 Jan 2021 16:27:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <s5hv9bp6m3t.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com
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


On 1/22/21 11:13 PM, Takashi Iwai wrote:
> On Fri, 22 Jan 2021 15:14:56 +0100,
> Hui Wang wrote:
>> --- /dev/null
>> +++ b/Documentation/sound/designs/jack-injection.rst
<snip>
>> +   sound/card1/Headphone_Jack# echo 1 > jackin_inject
>> +   to inject plugout:
>> +   sound/card1/Headphone_Jack# echo 0 > jackin_inject
> The lists could be better in a normal format, while only the examples
> with cat and echo should be in verbose format.
Will fix it in v7.
>> diff --git a/sound/core/Kconfig b/sound/core/Kconfig
>> index d4554f376160..a9189f58dc56 100644
>> --- a/sound/core/Kconfig
>> +++ b/sound/core/Kconfig
>> @@ -38,6 +38,15 @@ config SND_JACK_INPUT_DEV
>>   	depends on SND_JACK
>>   	default y if INPUT=y || INPUT=SND
>>   
>> +config SND_JACK_INJECTION_DEBUG
>> +	bool "Sound jack injection interface via debugfs"
>> +	depends on SND_JACK && DEBUG_FS
> Also, could depend on SND_DEBUG for consistency.
OK, will add this dependence.
>
>> diff --git a/sound/core/init.c b/sound/core/init.c
>> index 75aec71c48a8..e7f7cfe1143b 100644
>> --- a/sound/core/init.c
>> +++ b/sound/core/init.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/time.h>
>>   #include <linux/ctype.h>
>>   #include <linux/pm.h>
>> +#include <linux/debugfs.h>
>>   #include <linux/completion.h>
>>   
>>   #include <sound/core.h>
>> @@ -161,6 +162,7 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
>>   {
>>   	struct snd_card *card;
>>   	int err;
>> +	char name[8];
>>   
>>   	if (snd_BUG_ON(!card_ret))
>>   		return -EINVAL;
>> @@ -244,6 +246,10 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
>>   		dev_err(parent, "unable to create card info\n");
>>   		goto __error_ctl;
>>   	}
>> +
>> +	sprintf(name, "card%d", idx);
>> +	card->debugfs_root = debugfs_create_dir(name, sound_debugfs_root);
> It's still an open question whether we want to create the debugfs
> always.  But I guess it's OK, we might want to add more stuff to
> debugfs later.  Or, it makes sense to create only if
> CONFIG_SND_DEBUG=y.
Will add "#ifdef CONFIG_SND_DEBUG" to conditionally create 
debugfs_mount_dir/sound and debugfs_mount_dir/sound/cardN
>
>> +static ssize_t sw_inject_enable_write(struct file *file,
>> +				      const char __user *from, size_t count, loff_t *ppos)
>> +{
>> +	struct snd_jack_kctl *jack_kctl = file->private_data;
>> +	int ret, err;
>> +	unsigned long enable;
>> +	char buf[8] = { 0 };
>> +
>> +	if (count >= 8)
>> +		return -EINVAL;
>> +
>> +	ret = simple_write_to_buffer(buf, count, ppos, from, count);
> The simple_write_to_buffer() doesn't terminate the string by itself,
> hence you need to make sure the string termination before kstrtoul()
> call. e.g.  buf[sizeof(buf)-1] = 0;
>
> And maybe it's easier to make a helper function to that, since it's
> called in multiple places.
>

OK, I will change it as below:

char buf[8] = { 0 };

ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, from, count);

>> +static int parse_mask_bits(unsigned int mask_bits, char *s)
>> +{
>> +	char buf[256];
>> +	int len, i;
>> +
>> +	len = scnprintf(buf, sizeof(buf), "0x%04x", mask_bits);
>> +
>> +	for (i = 0; i < 16; i++)
>> +		if (mask_bits & (1 << i))
>> +			len += scnprintf(buf + strlen(buf), sizeof(buf) - strlen(buf),
>> +					 " %s", jack_events_name[i]);
>> +
>> +	len += scnprintf(buf + strlen(buf), sizeof(buf) - strlen(buf), "\n");
>> +
>> +	strcpy(s, buf);
> You need to intermediate buffer if you do a full copy here...
> Just perform the string ops on s with a certain limit.
> Also, you can use strncat() or strlcat() for simplicity.

I will drop intermediate buffer and don't use strcpy() here, and use 
strlcat to replace scnprintf(), the changes like below:

/* the recommended the buffer size is 256 */
static int parse_mask_bits(unsigned int mask_bits, char *buf, size_t 
buf_size)
{
     int i;

     scnprintf(buf, buf_size, "0x%04x", mask_bits);

     for (i = 0; i < 16; i++)
         if (mask_bits & (1 << i)) {
             strlcat(buf, " ", buf_size);
             strlcat(buf, jack_events_name[i], buf_size);
         }
     strlcat(buf, "\n", buf_size);

     return strlen(buf);
}

Thanks,

Hui.

>
> thanks,
>
> Takashi
