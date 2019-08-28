Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B498A1E92
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:13:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7E1A1713;
	Thu, 29 Aug 2019 17:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7E1A1713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567091583;
	bh=Y8v3XSF2nqCuOqPmItLv3J5lnFqGNYdPZN0MtBRmREk=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VBIHSKXWXKexvB3e7Uy6GPxjwUUDmEadZaHqFKHTEL79EUtqviTKel8g54DLzC1Hp
	 OKzl6jON/ty1mYEwiYI0gpkmlxHsSwnpVo2V+X7svsL37hT+4vyuKj6viv7KGTFvLr
	 mPzcYfSgBgF630F8DcdAReeRJwiXGXjsGcTDQ5DM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF065F89757;
	Wed, 28 Aug 2019 13:17:21 +0200 (CEST)
X-Original-To: Alsa-devel@alsa-project.org
Delivered-To: Alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A64DDF89758; Wed, 28 Aug 2019 13:17:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 946ADF89754
 for <Alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 13:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 946ADF89754
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="U9Q3AUrX"
Received: by mail-qk1-x72f.google.com with SMTP id m2so1982965qkd.10
 for <Alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 04:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NgCf+w56g9fe/HpvO4KvHudAZh7y+BptnMFBJpXVbcM=;
 b=U9Q3AUrXaaTEwtNSD7kHOv+2dLKhwj5C9UQdCLBOu1FC9nwHw+K8lImdJpekPJQvMZ
 k7gJTSnJdyFwAFv7urkAWqPZdjrfPnYWtTEC0Zm2k+ch/ENJIpf3Jsm20SszHg/VOikO
 LEV1aDtuZLdzDRe3jQkXnzoPIeS2uJYg/xIpw5/LnkSs7ZePY/K5rmFCeJjexvZqFFf3
 eto5ahpTg+YyRUZp9pSLDKGwapoSOwLsdyXY3OAb10CPiDF8LAX+sF+cemm5GZOEkcEY
 BlURmAj0Nh/OGFHGeMOG7fcU05znO23qs2Of6U4i/JYcvxjhMAy93aQokESKFGW8/M8r
 jNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NgCf+w56g9fe/HpvO4KvHudAZh7y+BptnMFBJpXVbcM=;
 b=WL0DQuuYfbFw7FHjQzd+r4S7YtCE/fibDcVK6JdhBBwy8IIAw7J7VhnRVSNV3GV6XG
 OCd5tekbuAiPVAoZYXCYv4q4oKkwSFh5rHnTzsFVH8YgcpIiuxijweV/3DVhvwcDlopu
 d/j7Dlj4aFGkbBaQBu3ChS0aHRY3basv7LZcpHurjAgZcaiSd5vYNjJbR4hlxMGwfbl+
 MWiQ1I+ItUc/GRCk6Q3jtEp+9sZsFryAeWXCGufRXkDUifQ6VkSTe04i5o99A1c7bPjR
 2IoKgKESf7xbwON/KL8urvIfhWklGjD45Yv25ytovKNe/Gj4sLnH7JtunQFpTRqSIjTY
 Ybeg==
X-Gm-Message-State: APjAAAUxazbQjOLVQT2R9u4ug/LRL0ZDQ3Qvaqa2zEB2lcn4eRL57YcS
 FYCGU1BGnjpDooBmxlnUjd28KYE2u5WRapkSQFePYkHU
X-Google-Smtp-Source: APXvYqzSfW+rNvV8OcV9HhGZy0Jv/0IxABLf624bB4UOWGdAiVshq/9iXnAqUZRwdUFgxgknelQh2ThC/OBGVneqk14=
X-Received: by 2002:a37:4941:: with SMTP id w62mr2983658qka.119.1566991033163; 
 Wed, 28 Aug 2019 04:17:13 -0700 (PDT)
MIME-Version: 1.0
From: Pavel Hofman <pavhofman@gmail.com>
Date: Wed, 28 Aug 2019 13:17:01 +0200
Message-ID: <CA+SWvNwqg3Q37BWNpw7C+75Z+CO-zUo2UUYjvz88L3hW1tk=gQ@mail.gmail.com>
To: Alsa-devel@alsa-project.org
Subject: [alsa-devel] Options for ASYNC feedback source in USB-audio gadget
	(USB OTG)?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

The existing usb-audio v.2 gadget defines its EP OUT as asynchronous
https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/function/f_uac2.c#L276
, but does not define any feedback IN EP (which is against USB audio
class 2.0 specs).  Windows 10 USB audio class 2 driver requires
presence of the feedback EP. By changing the EP OUT to adaptive (which
in fact it is), we could fix the driver issue and windows plays
through such device (RPi4) correctly now (linux/OSX already worked OK
before). We will post a patch soon.

RPi can now be used as an "intelligent" USB soundcard, allowing
further processing in linux on RPi, before outputting to some final
sound device.

However, there are two clock domains involved - the host USB
controller sending stream to the USB gadget, and the output soundcard
of the gadget. While adaptive resampling is possible (jackd, PA do
that), IMO the correct solution is going back to ASYNC EP OUT in the
audio gadget and implementing a proper feedback EP.

But the feedback EP needs input data. The whole chain behind the
virtual capture alsa device defined by the gadget driver is clocked by
the playback soundcard. May I ask for your opinions on possible
options for

1) gathering the feedback data from the playback chain
2) passing the gathered samplerate-diff data to the gadget module for
the feedback EP to send to the USB host

A general solution would be very useful, at best without using
alsa-lib defined PCM devices (e.g. Java still supports only hardware
devices (hw:X), not  PCM devices defined by alsa-lib).

I very much appreciate your suggestions and help.

Best regards,

Pavel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
