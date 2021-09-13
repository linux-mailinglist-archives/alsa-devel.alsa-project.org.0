Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AB5408ABA
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 14:07:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 567221657;
	Mon, 13 Sep 2021 14:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 567221657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631534837;
	bh=fNDdJgJ+ybHk7noJioigj3k0JJgcA+wR6btR+q83qZo=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lnkv/rdS50QZycfs3ocHt6MBg2jY8Qryr/Xzyb8YQNRAKRYbfrRsGTRdFDbiiWQYT
	 JBxiqj++RiLoHdinUop8vFQmXetgcP7SqT+FRbSusACeqKYHrKRIhCQ06aJ9ml733Y
	 Kggw9ptr8gqpY6ICVszsoibaMnBuzvROZ+Lq0CJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBBD7F802E8;
	Mon, 13 Sep 2021 14:06:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7829F8027C; Mon, 13 Sep 2021 14:05:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from neo-zeon.de (neo-zeon.de [70.229.12.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 204E2F80128
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 14:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 204E2F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=neo-zeon.de header.i=@neo-zeon.de
 header.b="ZawltRyz"
Received: from neo-zeon.de (localhost [127.0.0.1])
 by neo-zeon.de (OpenSMTPD) with ESMTP id d2676c6d;
 Mon, 13 Sep 2021 04:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=neo-zeon.de; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=1; bh=uXDuXWJRJEndqd5
 7zvLrTphIeJQ=; b=ZawltRyzGiCK0OkC9CRyUngycsWRcWwcTtw+KyWp2qSJhjl
 2/YP4Lk69bbGIDLkYb7LCmyJsbgmT0VpLMZay0/OuZiIlPcA8G/ripRaRYQ1rtAh
 VL48F+2yJ0FZZxsHP0lMGjAO/BGzI4lZcqEpIDBPKwGb5xHSdlXDz5i8K7wM=
Received: by neo-zeon.de (OpenSMTPD) with ESMTPSA id e709305f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 13 Sep 2021 04:59:08 -0700 (PDT)
Subject: Re: [PATCH] ALSA: hda/realtek: Quirks to enable speaker output for
 Lenovo Legion 7i 15IMHG05, Yoga 7i 14ITL5/15ITL5, and 13s Gen2 laptops.
To: Takashi Iwai <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20210912230715.156221-1-cam@neo-zeon.de>
 <s5hy281jb7l.wl-tiwai@suse.de>
From: Cameron Berkenpas <cam@neo-zeon.de>
Message-ID: <e1c633dc-570f-d06a-51cb-bdfd0c1a2549@neo-zeon.de>
Date: Mon, 13 Sep 2021 04:59:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <s5hy281jb7l.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


I'll test this  and re-submit today or tomorrow. Should I re-submit the 
patch entirely? Ie, a new email thread with a [PATCH v2] subject?

Thanks for the fast response! It actually made it to my inbox this time.

-Cameron

On 9/12/21 10:28 PM, Takashi Iwai wrote:
> On Mon, 13 Sep 2021 01:07:16 +0200,
> Cameron Berkenpas wrote:
>> This patch initializes and enables speaker output on the Lenovo Legion 7i
>> 15IMHG05, Yoga 7i 14ITL5/15ITL5, and 13s Gen2 series of laptops using the
>> HDA verb sequence specific to each model.
>>
>> Speaker automute is disabled for the Lenovo Legion 7i 15IMHG05 to avoid
>> breaking speaker output on resume and when devices are unplugged from its
>> headphone jack.
>>
>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=208555
>> Signed-off-by: Cameron Berkenpas <cam@neo-zeon.de>
> Thanks for the patch.  This version looks almost good, but just one
> thing:
>
>> +/* Fixup for Lenovo Legion 15IMHg05 speaker output on headset removal. */
>> +static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec *codec,
>> +						  const struct hda_fixup *fix,
>> +						  int action)
>> +{
>> +	struct alc_spec *spec = codec->spec;
>> +
>> +	switch (action) {
>> +	case HDA_FIXUP_ACT_INIT:
>> +		spec->gen.automute_speaker = 0;
> This flag is effective only until "Auto-Mute Mode" mixer control is
> changed, so it's not persistent.  If you'd need to disable the
> auto-mute feature, set spec->gen.suppress_auto_mute=1 instead.
>
>
> thanks,
>
> Takashi

