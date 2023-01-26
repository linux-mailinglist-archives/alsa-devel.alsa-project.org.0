Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D933F67C426
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 06:05:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44C391DD;
	Thu, 26 Jan 2023 06:04:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44C391DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674709502;
	bh=IOO31S3UZEFg+OBPuIodU/9szzd9qdRTd6fV6k1E22M=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mAySlO28s9hxzQIYiPuVPhJ8ubmkUO49++e7lAsW+O6dPumVV1Nf4I7r//pUOrRWi
	 u6i+EwCIn7924wZyX1IxOAzxu9HZpuKlkSMPxSpyWL9vOEv13NgDxwHi8vmF+O0iQG
	 NTCMWKDOB9kcED7v7y5GtSIn9xlZ/9PqiBjyLQO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BE48F802DF;
	Thu, 26 Jan 2023 06:04:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2D9CF8027D; Thu, 26 Jan 2023 06:03:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no
 autolearn_force=no version=3.4.6
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23591F8016E
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 06:03:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23591F8016E
Received: by mail-lj1-f182.google.com with SMTP id y19so742547ljq.7
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 21:03:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IOO31S3UZEFg+OBPuIodU/9szzd9qdRTd6fV6k1E22M=;
 b=1PEGbhuDZZgveAgTV3uIHG0rUdyjFhmSTPJH3I471IyHqGi3lwF/e6G8KcuspmDCOO
 /uDVLlEU5mQYeRwFb0QBvyEz8XEC6tCss70mSpEW64EPsffAaV1y9uCqF+eu/XbVeZFc
 atCnt9GXICrmLhQCHi5PDmoqXYrvXfY9jXRNYMqr+Wd5MkQuiukfywYyGXbVsyN0+A1Q
 d/hX+lAORRuJC0dTL9gOxIFxrr8vH8JhWH6kPgRSVHKsH8EZHzEHXjC1yhHY6i1NiRrM
 tJHTG4SKMlRkfwTAWqXciwhNtOVrmuQ43Vi63hHN+0Z2U9aHIuwApy0BNUPy7Yqs+Jwp
 F3lg==
X-Gm-Message-State: AFqh2krHdMZ23Ckc5rqwV5NyqTTjBQf/fZgvO4O1rI42faqSKBvpE22r
 3gu+RRbfnyjXTviB9vdUl5LSxaxnxNyctmlpRyFBNissE4o=
X-Google-Smtp-Source: AMrXdXuF2OMwCwuS6ThLW9lHOePCPFBJcnUhWtmCxJTsXoZyUwH/QRwqgkKxFMw/R4JwCNxTEX/1QhRtfkGlBX9V3qA=
X-Received: by 2002:a2e:9008:0:b0:28b:7067:94fa with SMTP id
 h8-20020a2e9008000000b0028b706794famr1631412ljg.304.1674709431759; Wed, 25
 Jan 2023 21:03:51 -0800 (PST)
MIME-Version: 1.0
From: Marijn Kruisselbrink <mkruisselbrink@kde.org>
Date: Wed, 25 Jan 2023 21:03:39 -0800
Message-ID: <CAEVe4dFkR7LbbV7RWd+PzZJmeBbe=Pfr2SEC1aD6TMhPHVtZEw@mail.gmail.com>
Subject: Best way to add support a USB audio device where only the second usb
 configuration works
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

(disclaimer: I'm fairly new to kernel stuff, alsa and low level usb
things in general, so my terminology might all not be correct, and I
might be missing obvious stuff, but:)

I've been trying (and succeeding) to get a SoundDevices MixPre II 10
to work well under linux. What I figured out is that this device
advertises two usb configurations. The first configuration claims to
be a UAC1 interface, exposing stereo in and output channels. This
configuration isn't actually class compliant though, or at least
neither playback nor recording are working right with this
configuration. The second configuration on the other hand claims to be
a UAC2 interface, exposing the full 12 in and 4 output channels the
device is supposed to support. And in this configuration everything
I've tried seems to work perfectly.

I'm not sure what the best/cleanest way would to actually make
snd-usb-audio/the linux kernel select this second configuration. In my
experimenting I made this work by adding a usb_device_driver to
snd-usb-audio that makes sure to select the second configuration for
this particular USB device. Is that the right approach? Or would it be
better for this to be an entirely separate module?

I also wonder if this is something that would make sense to address in
the generic usb driver's usb_choose_configuration method? Currently it
seems that for audio devices it always picks the first configuration,
unless one of the configurations uses the UAC3 protocol (in which case
it picks the first UAC3 configuration). For this device in question,
the first (non compliant/non functioning) configuration claims to use
UAC1 protocol, while the second (and seemingly functioning completely
fine) configuration uses UAC2. Should the generic logic prefer UAC2
configurations over UAC1 configurations, like it already prefers UAC3
configurations over anything else? Or is there a particular reason why
UAC2 doesn't get that treatment?

Or maybe I'm missing some other way of making sure this second
configuration is used for this device?

Thanks for any advice/help you can give me,
Marijn
