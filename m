Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA835409F13
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 23:25:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 289591799;
	Mon, 13 Sep 2021 23:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 289591799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631568309;
	bh=ovD+6SvfTJlvwV9t85/63a+zM6oWq6+/XKwqEtpvvtY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vFJeS1i1qGwxh0ZjSgXxhIjn0tLGOjoSMJnLZmpHtE6oiZhJEY01mGMTmTtzpG26S
	 C6NCC00AKtFxaW2+WLTXGUYoqtmUsoQXFfjbxAh1ELuJg5ZU5ASPShsix8VJuaNn+3
	 J3LlTb7M9XU+vz8e2qJDKuFHGtKM9WWjSresOCFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B08AF802E8;
	Mon, 13 Sep 2021 23:23:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45090F8027C; Mon, 13 Sep 2021 23:23:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from neo-zeon.de (neo-zeon.de [70.229.12.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26505F80169
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 23:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26505F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=neo-zeon.de header.i=@neo-zeon.de
 header.b="c684fhPq"
Received: from neo-zeon.de (localhost [127.0.0.1])
 by neo-zeon.de (OpenSMTPD) with ESMTP id c880dfd6;
 Mon, 13 Sep 2021 14:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=neo-zeon.de; h=subject:to
 :cc:references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=1; bh=beGOWorYaqXehgS
 5qYxLxir5s0w=; b=c684fhPqRz4LVNTLY+Rw2Ii9aR4uUgB5t1cvGLMBVhhS65J
 8v8OIQTAOc+bxMlblWjtybskkBlcz8VaQGec9X1t3P8sy5ELi4xTUi2l+02ch7zK
 5q0Y6GexRYMGA+/88O1osuaUweNlpOlc1iI0xPgqxVtUdgHYncoDk4cbFiyY=
Received: by neo-zeon.de (OpenSMTPD) with ESMTPSA id 820bce49
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 13 Sep 2021 14:23:38 -0700 (PDT)
Subject: Re: [PATCH] ALSA: hda/realtek: Quirks to enable speaker output for
 Lenovo Legion 7i 15IMHG05, Yoga 7i 14ITL5/15ITL5, and 13s Gen2 laptops.
To: Takashi Iwai <tiwai@suse.de>
References: <20210912230715.156221-1-cam@neo-zeon.de>
 <s5hy281jb7l.wl-tiwai@suse.de>
 <e1c633dc-570f-d06a-51cb-bdfd0c1a2549@neo-zeon.de>
 <s5hzgsgirt2.wl-tiwai@suse.de>
From: Cameron Berkenpas <cam@neo-zeon.de>
Message-ID: <e6f98910-777c-6c9b-e621-06a4dd85be63@neo-zeon.de>
Date: Mon, 13 Sep 2021 14:23:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <s5hzgsgirt2.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

I figured out the problem. We need to this for HDA_FIXUP_ACT_PRE_PROBE 
rather than HDA_FIXUP_ACT_INIT.

v2 patching coming in soon. I've added a thanks section as a number of 
people helped to test and/or fix up the verbs. I may want to update the 
thank-you list if anyone requests to be added (since I don't remember 
everyone who assisted).

-Cameron


On 9/13/21 5:27 AM, Takashi Iwai wrote:
> On Mon, 13 Sep 2021 13:59:08 +0200,
> Cameron Berkenpas wrote:
>>
>> I'll test this  and re-submit today or tomorrow. Should I re-submit
>> the patch entirely? Ie, a new email thread with a [PATCH v2] subject?
> Yes, a resubmission of a v2 patch would be appreciated.
>
>> Thanks for the fast response! It actually made it to my inbox this time.
> Heh :)
>
>
> thanks,
>
> Takashi
>
>> -Cameron
>>
>> On 9/12/21 10:28 PM, Takashi Iwai wrote:
>>> On Mon, 13 Sep 2021 01:07:16 +0200,
>>> Cameron Berkenpas wrote:
>>>> This patch initializes and enables speaker output on the Lenovo Legion 7i
>>>> 15IMHG05, Yoga 7i 14ITL5/15ITL5, and 13s Gen2 series of laptops using the
>>>> HDA verb sequence specific to each model.
>>>>
>>>> Speaker automute is disabled for the Lenovo Legion 7i 15IMHG05 to avoid
>>>> breaking speaker output on resume and when devices are unplugged from its
>>>> headphone jack.
>>>>
>>>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=208555
>>>> Signed-off-by: Cameron Berkenpas <cam@neo-zeon.de>
>>> Thanks for the patch.  This version looks almost good, but just one
>>> thing:
>>>
>>>> +/* Fixup for Lenovo Legion 15IMHg05 speaker output on headset removal. */
>>>> +static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec *codec,
>>>> +						  const struct hda_fixup *fix,
>>>> +						  int action)
>>>> +{
>>>> +	struct alc_spec *spec = codec->spec;
>>>> +
>>>> +	switch (action) {
>>>> +	case HDA_FIXUP_ACT_INIT:
>>>> +		spec->gen.automute_speaker = 0;
>>> This flag is effective only until "Auto-Mute Mode" mixer control is
>>> changed, so it's not persistent.  If you'd need to disable the
>>> auto-mute feature, set spec->gen.suppress_auto_mute=1 instead.
>>>
>>>
>>> thanks,
>>>
>>> Takashi

