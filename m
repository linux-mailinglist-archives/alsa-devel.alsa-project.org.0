Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 354922DEEA0
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Dec 2020 13:09:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83AE717BB;
	Sat, 19 Dec 2020 13:08:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83AE717BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608379740;
	bh=MzVDXIiNeTrgXbOBBatBUnR3PVcG1ZF+vc6n5tlqdxg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d+CN4mOd4CF2qU1tTBv30ngcAPpoOZgRbslMRuwepOgIJj4AMkUJgvX8JdBiWRR35
	 7bOC6N7pv3yg5eZ4pw07tz6mGxI8ZOtvbysrmWTGvuxSXULGqdL9GYHROw3iOyw8yf
	 Oe8Pgku5/PyR9hhL15QvPt886Sp7mfB+cc9xv4VM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2D91F80269;
	Sat, 19 Dec 2020 13:07:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0E41F80260; Sat, 19 Dec 2020 13:07:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B85FF80103
 for <alsa-devel@alsa-project.org>; Sat, 19 Dec 2020 13:07:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B85FF80103
Received: from [114.253.250.41] (helo=[192.168.0.106])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1kqb13-0002OZ-2Z; Sat, 19 Dec 2020 12:07:17 +0000
Subject: Re: [RFC][PATCH v2 1/1] alsa: jack: implement software jack injection
 via debugfs
To: Takashi Iwai <tiwai@suse.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20201216114628.35739-1-hui.wang@canonical.com>
 <20201216114628.35739-2-hui.wang@canonical.com>
 <alpine.DEB.2.22.394.2012171749580.864696@eliteleevi.tm.intel.com>
 <s5hczz7i1nx.wl-tiwai@suse.de>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <26185b99-1c84-e8f7-e156-558c1b5c4535@canonical.com>
Date: Sat, 19 Dec 2020 20:07:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hczz7i1nx.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
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


On 12/18/20 11:17 PM, Takashi Iwai wrote:
> On Thu, 17 Dec 2020 17:45:05 +0100,
> Kai Vehmanen wrote:
>> Hey,
>>
>> I gave a quick test spin and features seems to work as advertized. A few
>> minor comments on the code. If Jaroslav you think this would be ok as an
>> approach, I can give a more extensive test run on this.
> The tree representation looks better than the previous one, IMO.
> The exact contents would need more brush up, though; e.g. the content
> of each jack could be shown in a debugfs node as well as the
> injection.  Or the type and the mask-to-be-injected can be shown
> there, too.
OK, got it, will add more nodes for a jack, the nodes will bring more 
info of the jack to the userspace.
>
>>> +static void _snd_jack_report(struct snd_jack *jack, int status, bool from_inject)
>>> +{
>>> +	struct snd_jack_kctl *jack_kctl;
>>> +	unsigned int mask_bits = 0;
>>> +#ifdef CONFIG_SND_JACK_INPUT_DEV
>>> +	int i;
>>> +#endif
>>> +	list_for_each_entry(jack_kctl, &jack->kctl_list, list) {
>>> +		if (jack_kctl->sw_inject_enable == from_inject)
>>> +			snd_kctl_jack_report(jack->card, jack_kctl->kctl,
>>> +					     status & jack_kctl->mask_bits);
>>> +		else if (jack_kctl->sw_inject_enable)
>>> +			mask_bits |= jack_kctl->mask_bits;
>>> +	}
>> I'm wondering if it would be worth the code duplication to have the
>> inject-variant of this code in a separate function. I find the above code
>> to set up "mask_bits" a bit hard to read and this adds a layer of
>> complexity to anyone just wanting to look at the regular jack report code
>> path.
> Yes, that's my impression, too.  The logic is hard to follow.

I think it is really complicated,  That is my design:

  - If a jack_ctrl's sw_inject is enabled,  the jack_report will only 
report status from injection (block hw events), if it is disabled,  the 
jack_report will only report status from hw events (block injection). 
That is why I have to add a parameter from_inject

  - A snd_jack could contain multi jack_ctrls, the 
snd_jack_report(status) is based on snd_jack instead of jack_ctrls, but 
sw_inject_enable is based on jack_ctrls instead of snd_jack. Suppose a 
snd_jack has 2 jack_ctrls A and B, A's sw_inject is enabled. Suppose 
Jack of A triggers a hw events and snd_jack_report() is called, the 
status should be blocked since A's sw_inject is enabled,  also the 
input_dev's event of this jack_ctrl should be blocked too, I added 
mask_bits |= jack_kctl->mask_bits just for blocking the input-dev's report.

So far, I could not design a cleaner and simpler function to implement 
the idea above.


>
>
>>> +static ssize_t sw_inject_enable_write(struct file *file,
>>> +				      const char __user *from, size_t count, loff_t *ppos)
>>> +{
>>> +	struct snd_jack_kctl *jack_kctl = file->private_data;
>>> +	char *buf;
>>> +	int ret, err;
>>> +	unsigned long enable;
>>> +
>>> +	buf = kzalloc(count, GFP_KERNEL);
>>> +	if (!buf)
>>> +		return -ENOMEM;
>>> +
>>> +	ret = simple_write_to_buffer(buf, count, ppos, from, count);
>>> +	err = kstrtoul(buf, 0, &enable);
>>> +	if (err) {
>>> +		ret = err;
>>> +		goto exit;
>>> +	}
>>> +
>>> +	jack_kctl->sw_inject_enable = !!enable;
>> Here it's a bit annoying that after you disable sw_inject, the kcontrol
>> values are not restored to reflrect actual hw state (until there are
>> new jack events from hw). User-space cannot completely handle the
>> save'n'restore as it cannot detect if real hw jack status changed
>> during the sw-inject test. OTOH, this would require caching the most
>> recent value and maybe not worth the effort.
> Right, but I guess this can be ignored.
>
> Or, as I mentioned in the above, we may expose the current value in
> each node instead, and writing a value to this node is treated as
> injection.  Then the rest requirement is rather masking from the
> hardware update.

Also, I could add a hw_status_cache in the snd_jack_kctl{}, and use it 
to implement save-and-restore for the jack's state.

Thanks.

>
>
> thanks,
>
> Takashi
