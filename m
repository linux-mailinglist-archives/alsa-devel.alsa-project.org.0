Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B996F98D4
	for <lists+alsa-devel@lfdr.de>; Sun,  7 May 2023 16:09:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C6F31479;
	Sun,  7 May 2023 16:08:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C6F31479
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683468562;
	bh=9C8AZjjqCU/5m8O3Fc4EoMDe0i/EmxiMb4bxOMQsWkI=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=arBqIAt7MB7HO6ziNxACUa2YKUIox0SjPzOr9821ZAECergbM5H/CokBNu9ihmYxG
	 maTjXiZGy7l37UsmVOlh9mlUOHAb7yubzcMsdJYztkBclS4xL85KiaSU2RHUz1tsSH
	 XQ3iA+0FCJNhbRe2UqgXt9RuVKRYqpyYZKzy4vqQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29388F80310;
	Sun,  7 May 2023 16:08:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15D1AF8032D; Sun,  7 May 2023 16:07:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9E54F802E8
	for <alsa-devel@alsa-project.org>; Sun,  7 May 2023 16:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9E54F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=rGCvSB7G
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-24e2b2a27ebso3417149a91.3
        for <alsa-devel@alsa-project.org>;
 Sun, 07 May 2023 07:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683468416; x=1686060416;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQ+Zv9iPIV5c5mEEYmPeczvWpn9ZYRYUNQh2mIfufVo=;
        b=rGCvSB7GU9uY+fxg4bXAR7aJ6m+HZcQEKHMVdurBrI+e6BgDtUb24072N2haXoKelu
         SJhkBnyKxjc1Q9JqIBsiLM26N2tVjqImYVBIuZFmsngGuNk0O5RA+maWkmiORuO2RbzF
         Z/HHfruvjtBL26lzW0H6n4wAXK7bGunJZiT9Iffs/jLxAlzzRBw++bz5O/gNYSHEMpT5
         2qDO/fDGSoX2d8LuuAld9P94hPvTK//xJ8x9jkuZaVLg4loOPhA/yD8AE5TI4jCxZDJd
         4R+BG0jcgYz6RIglz/Mxt2mNqwVUnocZ4najE0tLJ8o44xVFiFH+KLU5EVE+vvLsEYu9
         SXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683468416; x=1686060416;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yQ+Zv9iPIV5c5mEEYmPeczvWpn9ZYRYUNQh2mIfufVo=;
        b=HziYovJdbuGKjGL6H8Dl9Nn8nMtBjEaW93yBTor99SRm47vQYlfIQbKg2uufIJ3u6L
         /ONNgvgWIfXOYBPYlW5V/sRfaFcfqR8wVt9HeGDglK2jKg7Qz0BlvjN31LSiDAg0k51I
         LuOuKjYkkjOKogTomH7SCIblBN9WYyfx7jiZEa3QqlHjW3H8V6ZH6phfkO5CXQ6Wxyif
         WjB8D81xdxLxVZDYDVLIqd0X5mkfRmk23tU+dJHUwG38erwJNkOmoyceiWH3rAQ+Mqyd
         YaibejazgSLsz8DkD1w7sfA1rUb5BrvEaEsvOMUll3sNZouOkQrHUxJmlcy6QRuRYBYj
         p/yg==
X-Gm-Message-State: AC+VfDxfplSJzGdj7gMcfIc3gVLs0j6PqxXc1ekdOAbz0CvG39cv8Ir7
	UQkGLuc1r9RUYRU0lCYHHGU=
X-Google-Smtp-Source: 
 ACHHUZ5Zlrg01Q0siCjZqE7g7AXqHbKhr+8KfA/FK7msmbTd/DMW6fvxOFtUzSXxcOIEaEEHpV/YIQ==
X-Received: by 2002:a17:90a:508:b0:24b:be0c:6134 with SMTP id
 h8-20020a17090a050800b0024bbe0c6134mr8029580pjh.33.1683468415684;
        Sun, 07 May 2023 07:06:55 -0700 (PDT)
Received: from [192.168.43.80] (subs28-116-206-12-59.three.co.id.
 [116.206.12.59])
        by smtp.gmail.com with ESMTPSA id
 jo18-20020a170903055200b001a6a53c3b04sm5205302plb.306.2023.05.07.07.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 May 2023 07:06:55 -0700 (PDT)
Message-ID: <466c0d68-5fac-74cc-c32e-23174f48add7@gmail.com>
Date: Sun, 7 May 2023 21:06:48 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ALSA Subsystem Development <alsa-devel@alsa-project.org>,
 Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Asus ROG Zephyrus GX701L sound problem
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IJLORECVNKBWST57NWDUJRSXAPDC4K2L
X-Message-ID-Hash: IJLORECVNKBWST57NWDUJRSXAPDC4K2L
X-MailFrom: bagasdotme@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IJLORECVNKBWST57NWDUJRSXAPDC4K2L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I notice a year-old bug report on bugzilla [1]. As many developers
don't take a look on it, I decided to forward it by email. You will
need to log in to bugzilla in order to contact the reporter.

Quoting from the bug report:

> Hello,
> 
> I must mention right at the beginning that I tried all the solutions I found on the forums, but without success.
> 
> The problem exists only with the speakers on the laptop, the microphone works, as do the headphones.
> 
> I extracted the audio dump from windows and compared it with the dump from Linux and thus created this pinfcg below.
> 
> Please, can someone add a kernel fix for ROG Zephyrus S17 GX701LWS_GX701LWS, Subsystem Id: 0x10431f01?
> 
> ```
> 
> [codec]
> 
> 0x10ec0294 0x10431f01 0
> 
> [pincfg]
> 
> 0x19 0x03A11050
> 
> 0x1a 0x03A11C30
> 
> ```
> 
> This is what a quirk should look like:
> 
> +SND_PCI_QUIRK(0x1043, 0x1f01, “ASUS GX701L”, ALC294_FIXUP_ASUS_SPK)
> 
> [ 2.396344] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC294: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
> [ 2.396348] snd_hda_codec_realtek hdaudioC0D0: speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [ 2.396349] snd_hda_codec_realtek hdaudioC0D0: hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
> [ 2.396350] snd_hda_codec_realtek hdaudioC0D0: mono: mono_out=0x0
> [ 2.396351] snd_hda_codec_realtek hdaudioC0D0: inputs:
> [ 2.396352] snd_hda_codec_realtek hdaudioC0D0: Headset Mic=0x19
> [ 2.396353] snd_hda_codec_realtek hdaudioC0D0: Internal Mic=0x12
> 
> 
> 
> 
>     hwinfo --sound  :heavy_check_mark:
>     22: PCI 1f.3: 0403 Audio device
>     [Created at pci.386]
>     Unique ID: nS1_.Qb7ky1jjQRD
>     SysFS ID: /devices/pci0000:00/0000:00:1f.3
>     SysFS BusID: 0000:00:1f.3
>     Hardware Class: sound
>     Model: “Intel Comet Lake PCH cAVS”
>     Vendor: pci 0x8086 “Intel Corporation”
>     Device: pci 0x06c8 “Comet Lake PCH cAVS”
>     SubVendor: pci 0x1043 “ASUSTeK Computer Inc.”
>     SubDevice: pci 0x1f01
>     Driver: “snd_hda_intel”
>     Driver Modules: “snd_hda_intel”
>     Memory Range: 0x94300000-0x94303fff (rw,non-prefetchable)
>     Memory Range: 0x94100000-0x941fffff (rw,non-prefetchable)
>     IRQ: 157 (817 events)
>     Module Alias: “pci:v00008086d000006C8sv00001043sd00001F01bc04sc03i80”
>     Driver Info #0:
>     Driver Status: snd_hda_intel is active
>     Driver Activation Cmd: “modprobe snd_hda_intel”
>     Driver Info #1:
>     Driver Status: snd_soc_skl is active
>     Driver Activation Cmd: “modprobe snd_soc_skl”
>     Driver Info #2:
>     Driver Status: snd_sof_pci_intel_cnl is active
>     Driver Activation Cmd: “modprobe snd_sof_pci_intel_cnl”
>     Config Status: cfg=new, avail=yes, need=no, active=unknown
> 
>     29: PCI 100.1: 0403 Audio device
>     [Created at pci.386]
>     Unique ID: NXNs.SkelvpPm387
>     Parent ID: vSkL.ZFPYIgTFUyC
>     SysFS ID: /devices/pci0000:00/0000:00:01.0/0000:01:00.1
>     SysFS BusID: 0000:01:00.1
>     Hardware Class: sound
>     Model: “nVidia TU104 HD Audio Controller”
>     Vendor: pci 0x10de “nVidia Corporation”
>     Device: pci 0x10f8 “TU104 HD Audio Controller”
>     SubVendor: pci 0x1043 “ASUSTeK Computer Inc.”
>     SubDevice: pci 0x186f
>     Revision: 0xa1
>     Driver: “snd_hda_intel”
>     Driver Modules: “snd_hda_intel”
>     Memory Range: 0x94080000-0x94083fff (rw,non-prefetchable)
>     IRQ: 17 (1698 events)
>     Module Alias: “pci:v000010DEd000010F8sv00001043sd0000186Fbc04sc03i00”
>     Driver Info #0:
>     Driver Status: snd_hda_intel is active
>     Driver Activation Cmd: “modprobe snd_hda_intel”
>     Config Status: cfg=new, avail=yes, need=no, active=unknown
>     Attached to: #13 (PCI bridge)
> 
> 
> If you need any more data, or smth just say so.

To the reporter: It seems like the hardware problem, right? If so, can
you test on different laptop?

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=216392

-- 
An old man doll... just what I always wanted! - Clara
