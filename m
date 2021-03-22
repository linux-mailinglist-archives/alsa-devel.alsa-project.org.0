Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1A134487F
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 16:03:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94CE315E5;
	Mon, 22 Mar 2021 16:02:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94CE315E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616425413;
	bh=axphiLiYtdupiWILfCCj0cNdcM+E3KPn52tNLVwJiVU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J07GYdjaxHG11LGb4hly1mD4IvhxyEgqPMgrMiC6xcFXL/9qsd3qckCCkY3iju5ua
	 +dwrAvlmQsQ5sQxHewSSfah34UvcHK+pM9BRlsNq5FLeyZT+e+REdJkP/WtSqRg2yT
	 sGwvwGV6PixjEbYXjtWfSvYGrb7g87IISrx4CHoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F05B3F801D5;
	Mon, 22 Mar 2021 16:02:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFE6FF8016B; Mon, 22 Mar 2021 16:02:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FC88F80155
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 16:01:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FC88F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="WMVNAyk6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616425308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TeRLT206rXHXoXA6r2Hs7f1XgjJsdt/tFB50GF52SxQ=;
 b=WMVNAyk6CfSWG5KV4KxdlTWgMf7O4YY+4Mk9v6QCtQV5VWpXQ0m7Gi15W56Yqw549MeUJt
 NpSpcgZ0NqqeA4BZU1nqEvRsJiw0JP7N8w0UEcKlLJIMWRyEl/FJj7JBfbUul6z0HEGF3m
 roY0QBocf/SRIeqiFLNyVexTth+ZhX8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-QtLEwls9OL2B_Zo-kl-HAw-1; Mon, 22 Mar 2021 11:01:44 -0400
X-MC-Unique: QtLEwls9OL2B_Zo-kl-HAw-1
Received: by mail-ej1-f72.google.com with SMTP id v27so15200130ejq.0
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 08:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TeRLT206rXHXoXA6r2Hs7f1XgjJsdt/tFB50GF52SxQ=;
 b=PDqh5aGePlJPZRL+ESVApbSj57wuf8MccDwrtopou8bg10JNAWn9/zBgpupEcEHlto
 VJv/5sJ4zhVDZq44XU4+c7ZDgS++AIk+ORQ6NgJz9sfct2givJintoygVupK6T+LQvAb
 E2I8qaXC6u9ooDDqT3IVcrvlcBLZi4WECI2F26g3QFKkcRXqn1JWlsE/w+5SmD0mfVGw
 Krjgkp4eSrpXhL+o/NoMNb2oadMH2Qx/Psebc9lWChoz/pNbNODa7/SRT7b413DiMqD7
 d5T+gnCki2t0/xHUIh82GgbRzI5DsLXJZSNNrJc5S8j6HVNTibUmwbPyT/a3XwKbwJjv
 8DRw==
X-Gm-Message-State: AOAM532EFgrVWovDSzQenU7qtY9rYahrIUpgJY4qAZqOuUHQ3OCxvi0Y
 S6j6qfwbyryKUhi8GKltlPVWU+zkdaJn0XEM7ryBfzeO79zTJZOgr6IxqhlXjqcbpyiF9OYSiSx
 YgAl3GChTaICuL+0rsDx5SHs=
X-Received: by 2002:a17:906:3395:: with SMTP id
 v21mr194803eja.322.1616425303018; 
 Mon, 22 Mar 2021 08:01:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygJHx1ycHTtFDczgClQt4BcWFdt1OOvBVNQ2zk/+MtCfJ3F3mpKUaH3/gRSfpKT7IqYY77Ig==
X-Received: by 2002:a17:906:3395:: with SMTP id
 v21mr194782eja.322.1616425302868; 
 Mon, 22 Mar 2021 08:01:42 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id q16sm11812147edv.61.2021.03.22.08.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 08:01:42 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] ASoC: rt715:add micmute led state control supports
To: Jaroslav Kysela <perex@perex.cz>, "Yuan, Perry" <Perry.Yuan@dell.com>,
 Mark Brown <broonie@kernel.org>, "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "Limonciello, Mario" <Mario.Limonciello@dell.com>
References: <20210301093834.19524-1-Perry_Yuan@Dell.com>
 <20210308172409.GF4656@sirena.org.uk>
 <SJ0PR19MB4528847687FEEE4A4DED8E3F84659@SJ0PR19MB4528.namprd19.prod.outlook.com>
 <604693cc-08c7-2b5f-632a-58ed537c54a0@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <5cad3045-7948-3282-c999-926095818d5f@redhat.com>
Date: Mon, 22 Mar 2021 16:01:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <604693cc-08c7-2b5f-632a-58ed537c54a0@perex.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pobrn@protonmail.com" <pobrn@protonmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
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

Hi,

On 3/22/21 3:37 PM, Jaroslav Kysela wrote:
> Dne 22. 03. 21 v 10:25 Yuan, Perry napsal(a):
>> Hi Mark:
>>
>>> -----Original Message-----
>>> From: Mark Brown <broonie@kernel.org>
>>> Sent: Tuesday, March 9, 2021 1:24 AM
>>> To: Yuan, Perry
>>> Cc: pobrn@protonmail.com; pierre-louis.bossart@linux.intel.com;
>>> oder_chiou@realtek.com; perex@perex.cz; tiwai@suse.com;
>>> hdegoede@redhat.com; mgross@linux.intel.com; Limonciello, Mario;
>>> lgirdwood@gmail.com; alsa-devel@alsa-project.org; linux-
>>> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org
>>> Subject: Re: [PATCH v4 2/2] ASoC: rt715:add micmute led state control
>>> supports
>>>
>>> On Mon, Mar 01, 2021 at 05:38:34PM +0800, Perry Yuan wrote:
>>>
>>>> +	/* Micmute LED state changed by muted/unmute switch */
>>>> +	if (mc->invert) {
>>>> +		if (ucontrol->value.integer.value[0] || ucontrol-
>>>> value.integer.value[1]) {
>>>> +			micmute_led = LED_OFF;
>>>> +		} else {
>>>> +			micmute_led = LED_ON;
>>>> +		}
>>>> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
>>>> +	}
>>>
>>> These conditionals on inversion seem weird and counterintuitive.  If we're
>>> going with this approach it would probably be clearer to define a custom
>>> operation for the affected controls that wraps the standard one and adds the
>>> LED setting rather than keying off invert like this.
>>
>> Currently the sof soundwire driver has no generic led control yet.
>> This patch can handle the led control needs for MIC mute LED, definitely the patch is a short term solution.
>> There is a feature request discussion when we started to implement this solution.
>> https://github.com/thesofproject/linux/issues/2496#issuecomment-713892620
>>
>> The workable way for now is that we put the LED mute control to the codec driver.
>> When there is new and full sound LED solution implemented, this part will be also optimized.
>> The Hardware privacy feature needs this patch to handle the Mic mute led state change.
>> Before that full solution ready in kernel, could we take this as short term solution?
> 
> Perry, it's about the machine detection. Your code is too much generic even
> for the top-level LED trigger implementation. We need an extra check, if the
> proper LED's are really controlled on the specific hardware. Other hardware
> may use RT715 for a different purpose. Use DMI / ACPI checks to detect this
> hardware and don't misuse the inversion flag to enable this code.

I think this would be a goo candidate for the new generic LED handling:

https://lore.kernel.org/alsa-devel/20210317172945.842280-1-perex@perex.cz/

And then use a udev-rule + hwdb and/or UCM profiles to configure the LED trigger
for specific models from userspace ?

Regards,

Hans




