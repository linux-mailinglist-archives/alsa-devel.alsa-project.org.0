Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6D2358F2E
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 23:30:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F3EB1675;
	Thu,  8 Apr 2021 23:30:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F3EB1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617917452;
	bh=ZZYwIsaz+3QqxAryTmC5OTztK8e7ckM5c2RQrUiN41E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D8ydKHq9CVM5fyMnl9SCP5BUkaGsBI3V/QIKQ4M6emI3PU3YsR2RL2J3kBdrvan6V
	 Odu6RN9wExlsfNdQo5LdZ8WWTcr+HsHkUkBsciLlvxXUUw9oeGgmqBnssCopYxx3tJ
	 NEhUoXCneQfxZ4IMz92eRk1/0YZQYdFaB0YdhkWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B858CF80169;
	Thu,  8 Apr 2021 23:29:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E55E6F8020B; Thu,  8 Apr 2021 23:28:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25A84F8012F
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 23:28:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25A84F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tl51DM/4"
Received: by mail-qk1-x72b.google.com with SMTP id x14so3828186qki.10
 for <alsa-devel@alsa-project.org>; Thu, 08 Apr 2021 14:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sg7DBir4xFhlpRNL4Na4rKPl5eiZYdQnGvF8H46CrDA=;
 b=tl51DM/4zDk3VDCBTkvFIgEg872RIaoAj5MZ83V0P3txHLjkFUMJOXMqwM2A35VoJ3
 /0Db/uDeMaUkM0rNuJeRjDiGszP7OYe2wVfmrADK1tWke6NAce2xlUvY2bLpbanxPXGC
 DGXugaWdENOckOvay0UF0o67XWvpega/efp0ylDXjoUPT2u2552GVltn3KcZIF3ZgyVe
 NzrXJgAvWs2DQi0VAC04fCqgNGR7hLdPC3v9iowMvZfzjUzlKcZ6B588Nk3qEAXV2T9/
 IMwjILVSXRTbpYsK0ODDn6BEjxcO3nsQUSOiIuyhsaGhUQ2E7A8uvfxftlTYuH1hwI8i
 hrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sg7DBir4xFhlpRNL4Na4rKPl5eiZYdQnGvF8H46CrDA=;
 b=k3weYUWnpoNbiHkWE9v7iqBJvWRctY0lXgZh4u6xHo3f56bzy+5YB1WvivW/6Ha6ST
 286wvyssnv+VKgUHWViyfQIGW6th+Y37p/9hQRqneQ/1pxcCsqMJH9SVVbVVMw/+shJP
 Cp4nW/QYj74VXEtAxoYXA6Gdc5ex5aBhGZKJRMlzYg1+OSx5J7mh0ClquefKMywVxwN0
 RdVy6yQWpyMPP10O+EYMHhucfN3Sc9oOaDkG5BuwhH6+NVTU9LNpKu9TqxyhYPAFK/Rx
 Fk7j1H2sUGfCkF/jtzUpiHETw638pjg1DXLqOfmWDWRQDrwvsJlfyzZVPttAt7HbN9ND
 qauw==
X-Gm-Message-State: AOAM532RYbfJnTYlVVyzFQIMmuUTB2o0tRwySu+J+nSGaYdsagndrnZq
 VjNIVyWFoOaeX6Uo17OmnwZGxBt36loFsV1g/6k=
X-Google-Smtp-Source: ABdhPJw6uPZE/qIoVXgUv7+CSJJpD6FveiCZws4/DqLP2RZfLyG3b6SpOnZgPa3dwG906Wcy3/beueWBQk2Z/qdtX6A=
X-Received: by 2002:a05:620a:24a:: with SMTP id
 q10mr3664279qkn.366.1617917314905; 
 Thu, 08 Apr 2021 14:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
 <CAHXb3bddyVMXrZHxmtz5AM4j7TRwWSbZcLM94JjcbOMfrd4+2g@mail.gmail.com>
 <CAEsQvcs+-O_eGW928eLdbde9EhWiD3qxjCuv2iW477DZDprkBw@mail.gmail.com>
 <CAHXb3beRycUteezmWRqO0u3kZnV8TbCNAqfO3ksjVoJ6WSrdBw@mail.gmail.com>
 <CAEsQvcuBYnY_k1Rd8US5qrDKcJas62Q5kA4P0NSEJODBCcZMuw@mail.gmail.com>
 <CAHXb3bfD_YivP3r4wOeb8bcXmAU+_+eeZwudW6f1pxfYtpnq1g@mail.gmail.com>
 <CAEsQvcsCJUi8eP_t8MGUKf0zSf7Zmqiof8b0fmk-XhZtUScbmg@mail.gmail.com>
 <CAEsQvcspNZFS4gbS=dQ1enkshVnG+-=xvoc8kskmoweTQjQhRw@mail.gmail.com>
 <CAEsQvcurb3s_W47f3N1h1=+oW4rX8tUSfQKv+_zyMMXXqJCBVw@mail.gmail.com>
 <CAHXb3bf4estasrkRhyME9w2hO6UmwUPAY+Vg6e4kvCnZh=R2zA@mail.gmail.com>
 <CAEsQvcs2Ov71mpSCXgefEFV1QQeqND871nu4+BV5KfT3kXtu+Q@mail.gmail.com>
 <CAHXb3bcpUBH9F=K9npwK-xO5sX+H11EV0_Nc7Otw7o93M=DKYQ@mail.gmail.com>
In-Reply-To: <CAHXb3bcpUBH9F=K9npwK-xO5sX+H11EV0_Nc7Otw7o93M=DKYQ@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Thu, 8 Apr 2021 18:24:23 -0300
Message-ID: <CAEsQvcs8HasvcJm0oEr87gNPxB6o2Km_NtAojTq+VkEX9EZd0g@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Mike Oliphant <oliphant@nostatic.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Lucas <jaffa225man@gmail.com>, alsa-devel@alsa-project.org
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

Mike, could you test the following patch instead of your own modifications?

Lucas, you can test it too, just modify it for your devices.

Since I don't own any Roland devices this is of course completely untested,
but it's worth a try.

--- implicit.c.git      2021-04-04 20:51:57.226754632 -0300
+++ implicit.c  2021-04-08 18:15:02.971301050 -0300
@@ -75,7 +75,7 @@ static const struct snd_usb_implicit_fb_
        IMPLICIT_FB_SKIP_DEV(0x0582, 0x0171),   /* BOSS RC-505 */
        IMPLICIT_FB_SKIP_DEV(0x0582, 0x0185),   /* BOSS GP-10 */
        IMPLICIT_FB_SKIP_DEV(0x0582, 0x0189),   /* BOSS GT-100v2 */
-       IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d6),   /* BOSS GT-1 */
+       //IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d6), /* BOSS GT-1 */
        IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d8),   /* BOSS Katana */
        IMPLICIT_FB_SKIP_DEV(0x0582, 0x01e5),   /* BOSS GT-001 */
        IMPLICIT_FB_SKIP_DEV(0x0582, 0x0203),   /* BOSS AD-10 */
@@ -89,7 +89,7 @@ static const struct snd_usb_implicit_fb_
        IMPLICIT_FB_FIXED_DEV(0x0582, 0x0171, 0x0d, 0x01), /* BOSS RC-505 */
        IMPLICIT_FB_FIXED_DEV(0x0582, 0x0185, 0x0d, 0x01), /* BOSS GP-10 */
        IMPLICIT_FB_FIXED_DEV(0x0582, 0x0189, 0x0d, 0x01), /* BOSS GT-100v2
*/
-       IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d6, 0x0d, 0x01), /* BOSS GT-1 */
+       //IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d6, 0x0d, 0x01), /* BOSS GT-1 */
        IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d8, 0x0d, 0x01), /* BOSS Katana */
        IMPLICIT_FB_FIXED_DEV(0x0582, 0x01e5, 0x0d, 0x01), /* BOSS GT-001 */
        IMPLICIT_FB_FIXED_DEV(0x0582, 0x0203, 0x0d, 0x01), /* BOSS AD-10 */
@@ -339,8 +339,19 @@ int snd_usb_parse_implicit_fb_quirk(stru
                                    struct audioformat *fmt,
                                    struct usb_host_interface *alts)
 {
-       if (fmt->endpoint & USB_DIR_IN)
+        bool isRolandGT1;
+
+        if (alts->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
+            (USB_ID_VENDOR(chip->usb_id) == 0x0582 &&
+             USB_ID_PRODUCT(chip->usb_id) == 0x01d6 /* BOSS GT-1 */))
+            isRolandGT1 = true;
+
+       if (fmt->endpoint & USB_DIR_IN) {
+                if (isRolandGT1 == true)
+                    return 1;
                return audioformat_capture_quirk(chip, fmt, alts);
+       }
+
        else
                return audioformat_implicit_fb_quirk(chip, fmt, alts);
 }

On Thu, Apr 8, 2021 at 5:54 PM Mike Oliphant <oliphant@nostatic.org> wrote:

> Geraldo - the implicit feedback stuff is by no means new - it's been there
> for quite some time. The recent changes just refactored it a bit.
>
> Mike
>
> On Thu, Apr 8, 2021 at 1:09 PM Geraldo Nascimento <
> geraldogabriel@gmail.com> wrote:
>
>> Em Qui, 8 de abr de 2021 16:42, Mike Oliphant <oliphant@nostatic.org>
>> escreveu:
>>
>>> Hi Geraldo - yes. In fact, that is how I've been operating for the past
>>> year or so before the recent implicit feedback changes. I use the GT-1 most
>>> every day as a guitar interface and it works perfectly.
>>>
>>
>> Thanks Mike, but I'm not sure I understand. You have been operating with
>> implicit feedback sync on the playback for the past year? I thought that
>> was a new idea?
>>
>> The key point here is that with a stock kernel you have to comment out
>> the IMPLICIT_FB_SKIP_DEV() entry for the GT-1 for the Roland code inside
>> audioformat_implicit_fb_quirk properly kick in.
>>
>> I was suggesting you try your workaround without adding a
>> IMPLICIT_FB_GENERIC_DEV() for your device.
>>
>>
>>> The GT-1 (and I suspect many of the other Roland/BOSS devices) doesn't
>>> seem to be quirky at all with regard to implicit feedback setup - it works
>>> exactly as the endpoint definitions say it should.
>>>
>>> Where the GT-1 *does* seem to be quirky is that is doesn't seem to want
>>> to send capture data until it receives some playback data - hence my
>>> endpoint.c patch.
>>>
>>
>> If that is true then there's definitely a need to rewrite endpoint.c. But
>> it could be something else, Mike. One thing is certain: the present kernel
>> behaviour is far from the ideal.
>>
>> I insist: engage implicit feedback sync for the playback, disable it for
>> the captures and inspect your dyndbg logs for the failure cases in starting
>> JACK that happen when you don't patch endpoint.c.
>>
>> If you see something related to sync_ep then the problem lies elsewhere,
>> specifically inside pcm.c
>>
>> Although whether this behavior is quirky or typical I don't know. I do
>>> know that the GT-1 does not claim to be USB class compliant. It requires
>>> custom drivers on Windows and macOS and does not work at all with iOS, so
>>> it definitely seems to be somewhat non-standard.
>>>
>>
>> Non-standard to say the least. I really hope that's not the case or it'll
>> give Takashi Iwai plenty of headache ;-)
>>
>>
>>> Mike
>>>
>>> On Thu, Apr 8, 2021 at 12:13 PM Geraldo Nascimento <
>>> geraldogabriel@gmail.com> wrote:
>>>
>>>> Hey Mike, got another question for you, sorry about that.
>>>>
>>>> If you comment out your GT-1 IMPLICIT_FB_GENERIC_DEV() entry and
>>>> instead let audioformat_implicit_fb_quirk() call add_roland_implicit_fb()
>>>> with everything else customized your way, your custom endpoint.c etc., does
>>>> it still work? And does it work crystal clear?
>>>>
>>>> I'm sorry about this test this, test that, provide the dyndbg logs
>>>> attitude but I'm honestly just trying to help you write the best patch
>>>> possible.
>>>>
>>>> Thank you,
>>>> Geraldo
>>>>
>>>> Em Qui, 8 de abr de 2021 02:05, Geraldo Nascimento <
>>>> geraldogabriel@gmail.com> escreveu:
>>>>
>>>>> Mike, I just realize I missed reply-to-all once again.
>>>>>
>>>>> In case you were wondering, I was looking for a sync_ep event right in
>>>>> the start of the loading of snd-usb-audio. It happens inside pcm.c. If you
>>>>> see one of those specifically let me know.
>>>>>
>>>>> With my Pioneer device, the DDJ-SR2, snd-usb-audio recognized the
>>>>> device's implicit feedback EP as sync_ep and that prevented JACK from
>>>>> starting.
>>>>>
>>>>> Em Qua, 7 de abr de 2021 23:47, Mike Oliphant <oliphant@nostatic.org>
>>>>>> escreveu:
>>>>>>
>>>>>>> Hi Geraldo - I had the same thought and I have tried enabling
>>>>>>> playback feedback while turning off capture feedback without my endpoint
>>>>>>> patch. It doesn't work - at least not on the GT-1. Playback/capture fails
>>>>>>> to start.
>>>>>>>
>>>>>>
>>>>>> Would you mind sharing the dyndbg logs for the failure case from the
>>>>>> point you connect the device, and trying to start JACK?
>>>>>>
>>>>>> Sometimes failures elucidate more than success cases.
>>>>>>
>>>>>>
>>>>>>> Speaking of testing, if you (or anyone else following this
>>>>>>> discussion) have one of these Roland/BOSS devices, it would be great if you
>>>>>>> could try testing with playback feedback enabled and my endpoint.c
>>>>>>> workaround.
>>>>>>>
>>>>>>
>>>>>> I don't have the hardware, but I'm sure it works. The problem is that
>>>>>> endpoint.c code really shouldn't be disabled unless all the other options
>>>>>> fail, and even then, I'm not so sure the maintainers will be so willing to
>>>>>> disable it. So let's keep some other options on the table by debugging a
>>>>>> little further.
>>>>>>
>>>>>> Thank you,
>>>>>> Geraldo
>>>>>>
>>>>>>
>>>>>>> Mike
>>>>>>>
>>>>>>> On Wed, Apr 7, 2021 at 7:21 PM Geraldo Nascimento <
>>>>>>> geraldogabriel@gmail.com> wrote:
>>>>>>>
>>>>>>>> Thanks, Mike, one thing I can tell you right off the bat is that if
>>>>>>>> you turn implicit feedback sync on for both endpoints at the same time like
>>>>>>>> you mentioned, without your workaround inside endpoint.c, they most likely
>>>>>>>> will stall because they would both be waiting for each other to start.
>>>>>>>>
>>>>>>>> Have you tried engaging the generic implicit feedback sync just for
>>>>>>>> the playback, thereby commenting out the capture implicit feedback entries,
>>>>>>>> and re-enabling snd_usb_endpoint_implicit_feedback_sink(ep) inside
>>>>>>>> endpoint.c? Does playback still fail to start?
>>>>>>>>
>>>>>>>> If you choose to perform this simple test please share with us the
>>>>>>>> test's dyndbg logs right from the moment you turn on the device, not just
>>>>>>>> after you start jackd.
>>>>>>>>
>>>>>>>> Sorry for the endless do-this, do-that. Such is the pace of
>>>>>>>> teledebugging
>>>>>>>>
>>>>>>>>
>>>>>>>> Em Qua, 7 de abr de 2021 21:38, Mike Oliphant <
>>>>>>>> oliphant@nostatic.org> escreveu:
>>>>>>>>
>>>>>>>>> Geraldo - here is the dmesg output when starting up jackd for
>>>>>>>>> capture/playback:
>>>>>>>>>
>>>>>>>>> With my patch:
>>>>>>>>>
>>>>>>>>> [  136.734081] usb 3-1.2: Open EP 0x8e, iface=2:1, idx=0
>>>>>>>>> [  136.734088] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
>>>>>>>>> period_bytes=256, periods=2, implicit_fb=0
>>>>>>>>> [  136.734092] usb 3-1.2: Setting usb interface 2:0 for EP 0x8e
>>>>>>>>> [  136.734233] usb 3-1.2: Setting usb interface 2:1 for EP 0x8e
>>>>>>>>> [  136.734381] usb 3-1.2: 2:1 Set sample rate 44100, clock 0
>>>>>>>>> [  136.734388] usb 3-1.2: Setting params for data EP 0x8e, pipe
>>>>>>>>> 0x70480
>>>>>>>>> [  136.734394] usb 3-1.2: Set up 12 URBS, ret=0
>>>>>>>>> [  136.734466] usb 3-1.2: Open EP 0xd, iface=1:1, idx=0
>>>>>>>>> [  136.734468] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
>>>>>>>>> period_bytes=256, periods=2, implicit_fb=1
>>>>>>>>> [  136.734471] usb 3-1.2: Reopened EP 0x8e (count 1)
>>>>>>>>> [  136.734473] usb 3-1.2: Setting usb interface 1:0 for EP 0xd
>>>>>>>>> [  136.734605] usb 3-1.2: Setting usb interface 1:1 for EP 0xd
>>>>>>>>> [  136.734762] usb 3-1.2: 1:1 Set sample rate 44100, clock 0
>>>>>>>>> [  136.734774] usb 3-1.2: Setting params for data EP 0xd, pipe
>>>>>>>>> 0x68400
>>>>>>>>> [  136.734781] usb 3-1.2: Set up 12 URBS, ret=0
>>>>>>>>> [  136.734830] usb 3-1.2: Starting data EP 0xd (running 0)
>>>>>>>>> [  136.734873] usb 3-1.2: 12 URBs submitted for EP 0xd
>>>>>>>>> [  136.734876] usb 3-1.2: Starting data EP 0x8e (running 0)
>>>>>>>>> [  136.734906] usb 3-1.2: 12 URBs submitted for EP 0x8e
>>>>>>>>> [  136.740627] usb 3-1.2: Starting data EP 0x8e (running 1)
>>>>>>>>> [  136.740634] usb 3-1.2: 2:1 Start Capture PCM
>>>>>>>>> [  136.740635] usb 3-1.2: 1:1 Start Playback PCM
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> With the unpatched kernel:
>>>>>>>>>
>>>>>>>>> [  344.813203] usb 3-1.2: Open EP 0x8e, iface=2:1, idx=0
>>>>>>>>> [  344.813210] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
>>>>>>>>> period_bytes=256, periods=2, implicit_fb=1
>>>>>>>>> [  344.813213] usb 3-1.2: Open EP 0xd, iface=1:1, idx=0
>>>>>>>>> [  344.813215] usb 3-1.2:   channels=2, rate=44100, format=S32_LE,
>>>>>>>>> period_bytes=256, periods=2, implicit_fb=0
>>>>>>>>> [  344.813217] usb 3-1.2: Setting usb interface 2:0 for EP 0x8e
>>>>>>>>> [  344.813367] usb 3-1.2: Setting usb interface 2:1 for EP 0x8e
>>>>>>>>> [  344.813494] usb 3-1.2: 2:1 Set sample rate 44100, clock 0
>>>>>>>>> [  344.813503] usb 3-1.2: Setting params for data EP 0x8e, pipe
>>>>>>>>> 0x70580
>>>>>>>>> [  344.813509] usb 3-1.2: Set up 12 URBS, ret=0
>>>>>>>>> [  344.813513] usb 3-1.2: Setting usb interface 1:0 for EP 0xd
>>>>>>>>> [  344.813587] usb 3-1.2: Setting usb interface 1:1 for EP 0xd
>>>>>>>>> [  344.813758] usb 3-1.2: 1:1 Set sample rate 44100, clock 0
>>>>>>>>> [  344.813765] usb 3-1.2: Setting params for data EP 0xd, pipe
>>>>>>>>> 0x68500
>>>>>>>>> [  344.813770] usb 3-1.2: Set up 2 URBS, ret=0
>>>>>>>>> [  344.813858] usb 3-1.2: Reopened EP 0xd (count 1)
>>>>>>>>> [  344.813883] usb 3-1.2: Starting data EP 0xd (running 0)
>>>>>>>>> [  344.813899] usb 3-1.2: 2 URBs submitted for EP 0xd
>>>>>>>>> [  344.819499] usb 3-1.2: Starting data EP 0x8e (running 0)
>>>>>>>>> [  344.819532] usb 3-1.2: 12 URBs submitted for EP 0x8e
>>>>>>>>> [  344.819535] usb 3-1.2: Starting data EP 0xd (running 1)
>>>>>>>>> [  344.819538] usb 3-1.2: 2:1 Start Capture PCM
>>>>>>>>> [  344.819540] usb 3-1.2: 1:1 Start Playback PCM
>>>>>>>>> [  344.820663] usb 3-1.2: Stopping data EP 0xd (running 2)
>>>>>>>>> [  344.820688] usb 3-1.2: Stopping data EP 0x8e (running 1)
>>>>>>>>> [  344.820693] usb 3-1.2: 2:1 Stop Capture PCM
>>>>>>>>> [  344.820695] usb 3-1.2: Stopping data EP 0xd (running 1)
>>>>>>>>> [  344.820697] usb 3-1.2: 1:1 Stop Playback PCM
>>>>>>>>> [  344.833799] usb 3-1.2: Starting data EP 0xd (running 0)
>>>>>>>>> [  344.833852] usb 3-1.2: 2 URBs submitted for EP 0xd
>>>>>>>>> [  344.833867] usb 3-1.2: Starting data EP 0x8e (running 0)
>>>>>>>>> [  344.833888] usb 3-1.2: 12 URBs submitted for EP 0x8e
>>>>>>>>> [  344.833890] usb 3-1.2: Starting data EP 0xd (running 1)
>>>>>>>>> [  344.833891] usb 3-1.2: 2:1 Start Capture PCM
>>>>>>>>> [  344.833893] usb 3-1.2: 1:1 Start Playback PCM
>>>>>>>>>
>>>>>>>>> On Wed, Apr 7, 2021 at 1:30 PM Geraldo Nascimento <
>>>>>>>>> geraldogabriel@gmail.com> wrote:
>>>>>>>>>
>>>>>>>>>> Em Qua, 7 de abr de 2021 17:16, Mike Oliphant <
>>>>>>>>>> oliphant@nostatic.org> escreveu:
>>>>>>>>>>
>>>>>>>>>>> Hi Geraldo - I don't have that patch applied, but it shouldn't
>>>>>>>>>>> make any behavioral difference - it just seems to be simplifying the code.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Point taken.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> The issue is that the BOSS GT-1 *does* need implicit feedback on
>>>>>>>>>>> playback to avoid clock timing issues, and the current behavior is
>>>>>>>>>>> disabling that feedback.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Mike, would you mind posting some dyndbg logs for both the stock
>>>>>>>>>> behaviour and your endpoint.c/generic quirk modified behaviour?
>>>>>>>>>>
>>>>>>>>>> Just add snd_usb_audio.dyndbg=+p to your kernel options and
>>>>>>>>>> please share the logs.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> Mike
>>>>>>>>>>>
>>>>>>>>>>> On Wed, Apr 7, 2021 at 1:04 PM Geraldo Nascimento <
>>>>>>>>>>> geraldogabriel@gmail.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>>> Hey Mike, did you catch the latest patch by Takashi Iwai for
>>>>>>>>>>>> capture quirky devices?
>>>>>>>>>>>>
>>>>>>>>>>>> You can find it here:
>>>>>>>>>>>> https://patchwork.kernel.org/project/alsa-devel/patch/20210406113837.32041-1-tiwai@suse.de/
>>>>>>>>>>>>
>>>>>>>>>>>> Em Qua, 7 de abr de 2021 16:55, Mike Oliphant <
>>>>>>>>>>>> oliphant@nostatic.org> escreveu:
>>>>>>>>>>>>
>>>>>>>>>>>>> I had thought that the recent implicit feedback changes were
>>>>>>>>>>>>> fully working
>>>>>>>>>>>>> on the BOSS GT-1, but it turns out that I just hadn't tested
>>>>>>>>>>>>> well enough.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Audio playback and capture works, but with periodic dropouts.
>>>>>>>>>>>>> I get the
>>>>>>>>>>>>> exact same behavior as I did with the quirk to completely
>>>>>>>>>>>>> disable implicit
>>>>>>>>>>>>> feedback. Without the implicit feedback, you get dropouts from
>>>>>>>>>>>>> clock drift
>>>>>>>>>>>>> - how bad probably varies from card to card. On mine it is
>>>>>>>>>>>>> every second or
>>>>>>>>>>>>> so.
>>>>>>>>>>>>>
>>>>>>>>>>>>> If I switch playback feedback for the GT-1 to generic by doing
>>>>>>>>>>>>> "IMPLICIT_FB_GENERIC_DEV(0x0582, 0x01d6)", I get the previous
>>>>>>>>>>>>> old behavior,
>>>>>>>>>>>>> which is that playback completely fails to start.
>>>>>>>>>>>>>
>>>>>>>>>>>>> With generic playback feedback, and using my previous patch to
>>>>>>>>>>>>> endpoint.c
>>>>>>>>>>>>> to avoid playback waiting on capture mentioned here:
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> https://mailman.alsa-project.org/pipermail/alsa-devel/2020-January/161951.html
>>>>>>>>>>>>>
>>>>>>>>>>>>> playback and capture work perfectly for me.
>>>>>>>>>>>>>
>>>>>>>>>>>>
