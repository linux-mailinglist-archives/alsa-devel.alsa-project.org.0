Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C940754852
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jul 2023 12:57:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0164784B;
	Sat, 15 Jul 2023 12:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0164784B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689418661;
	bh=j2MtOqbhEzDLtpmcegFLXKKaISp7ldEUg4hOZTFjgPA=;
	h=Date:To:Cc:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EW6ui8J2g5/eB/Nx60ew2RAwK4Ig7Ai6wQwDoo+bI48JnRV5VSuGaWcEltul+EH5r
	 bv49A6kiWyEG7ZS+iTDz0GTjCqwnUPvQwDqlA3rdfYRMB73Ql9fo7CN3QtQsUCbsmN
	 LxiC+sh/U28XTam69Inyz7Broq0guY5sAEBhQxU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44352F8027B; Sat, 15 Jul 2023 12:56:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD82CF80236;
	Sat, 15 Jul 2023 12:56:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE13FF80249; Sat, 15 Jul 2023 12:56:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8D96F80093
	for <alsa-devel@alsa-project.org>; Sat, 15 Jul 2023 12:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8D96F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=aiu0XVxZ
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6687096c6ddso1835789b3a.0
        for <alsa-devel@alsa-project.org>;
 Sat, 15 Jul 2023 03:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689418587; x=1692010587;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZERGPzw5TZLiZLEYlC5ABDoHNPFEd4U3QPZl/a2G3cU=;
        b=aiu0XVxZD6ByP16P8lg4JKH7/qKR+UkZBlpoXGfmezQ7plwJyCZXb2OgYwF4SprvGy
         wCyYi0VdzubWp2PDhl6cE4i3if1SmsOGjWqC1jTioEtu/NR6dvNpYmsgXEkGhm9CKDYn
         fwed1zjwHcxpzJoagUXDN7x+4YcdHf5sycQjdMkgn/PMy/2IVLOBWQWLQvVPMU9II7Lf
         AHZ4zjU7on6HuQ3WqP7w4xzQBSucZJdnHok8Bzr+axCGubh7PaY3NvFIfCtuscXUGMRv
         9wRavQd5wFBVP6E7ezEYVldbdbepV+s5MOFNtGBYXH3ozfRVf9Oqa6xgTreka5vt0wXF
         YUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689418587; x=1692010587;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZERGPzw5TZLiZLEYlC5ABDoHNPFEd4U3QPZl/a2G3cU=;
        b=GFfsx7UmWET/qUCDS1QNwQC2AnNgcuvH5jzVNJ8ghpJV+MhVFZvNIbZiR4DJEtrJsI
         30VladxcolA07TJ3dp3TpxxHP/i5AdIviMYuNiWmwxxi7KXzo7HFo/IeTBfmTH/VGU6R
         SMaosG4ihvly4Ts6zOBsb22ETu9q3yCxn7EZP+zN7IbhWraesdcIlnDx+RK0KZoF1vri
         tpTBRZttb6+mmF07IvUU6z9xjkp+MlotDdgQ1drpr4oVjXPu2Aa/1bIFcM5m/xwDnbwJ
         aWhauk4fGx1yymnh2WYGljWULowXReraPrIsdZiXGegaB9l2zXyPiwfKgHKEwCC+p4U4
         kdSQ==
X-Gm-Message-State: ABy/qLYkCzwIKWCE/2hGMP2NTvr/XYquC36h8RCjyMAOlssSQim9h3mE
	Cf8whpP9YLh4tuvGxmfi4L0=
X-Google-Smtp-Source: 
 APBJJlGOj8jl6PdCasGb35nlcC959eyVAjJa1/5upVEezCQMd7k/PX89IwG7inbwwmhtZGyUjoKl9Q==
X-Received: by 2002:a05:6a20:3d5:b0:128:fce6:dd8b with SMTP id
 21-20020a056a2003d500b00128fce6dd8bmr4130662pzu.39.1689418586644;
        Sat, 15 Jul 2023 03:56:26 -0700 (PDT)
Received: from [192.168.0.104] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id
 j10-20020a170902da8a00b001b895336435sm9264398plx.21.2023.07.15.03.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 03:56:26 -0700 (PDT)
Message-ID: <3ee79b53-5c1b-1542-ceea-e51141e3ab74@gmail.com>
Date: Sat, 15 Jul 2023 17:56:19 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Iyer <cydiaimpactor2003@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux ALSA Development <alsa-devel@alsa-project.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: 6.4 and higher causes audio distortion
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PKAR7TG4YQVEOI3O6ER6C44ECH2SX4UG
X-Message-ID-Hash: PKAR7TG4YQVEOI3O6ER6C44ECH2SX4UG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PKAR7TG4YQVEOI3O6ER6C44ECH2SX4UG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> I have a Lenovo ThinkPad X1 Yoga Gen 7 running Arch Linux. Linux 6.4 and higher, cause audio distortion. Sometimes, this occurs to the point that nearly nothing is discernible. This carries over to wired headphones. The issue occurs on the entire mainline 6.4.x kernel series and also the 6.4.3 stable and 6.5 RC1 kernel, which are the latest at the time of writing. The issue occurs on both the Arch distributed kernels, and the mainline kernels.
> 
> Linux kernels 6.3.x are not affected and neither is the 6.1 LTS kernel series which is what I am temporarily using. On Windows 10/11 too, the audio works as it should. This indicates that my hardware is not at fault. Bluetooth audio is not impacted from my testing, either.
> 
> The distortion doesn't start immediately. It either occurs automatically after a random amount of time, or when I increase/decrease the volume, or when I skip forward/backward to a section. In order to stop the distortion, I have to either increase/decrease the volume until it stops, or skip forward/backward until it stops, or restart Pipewire via systemd, however it starts again due to one of the aforementioned reasons.
> 
> At the time of this report, I am running Pipewire 0.3.74 and Wireplumber 0.4.14. This also doesn't seem like a Pipewire/Wireplumber issue, since these same versions work fine on the 6.1 LTS kernels without causing any audio distortion.
> 
> I wrote about this on the Arch Linux forums, too, and seems like at least two other people are facing this issue. Here's the forum post: https://bbs.archlinux.org/viewtopic.php?id=287068
> 
> Furthermore, I filed a bug report on the Arch Linux Bug Reporter, where they suggested that the issue is a kernel regression and should be reported upstream, here. Here's the bug report that I filed on the Arch Linux Bug Reporter for anyone interested: https://bugs.archlinux.org/task/79081?project=1&pagenum=10
> 
> I have attached the dmesg outputs of the mainline 6.5 RC1 kernel.
> 
> Here's some audio related hardware information from my device:
> 
> inxi -A
> 
> Audio:
> Device-1: Intel Alder Lake PCH-P High Definition Audio
> driver: sof-audio-pci-intel-tgl
> API: ALSA v: k6.5.0-rc1-1-mainline status: kernel-api
> 
> 
> pactl info
> 
> Server String: /run/user/1000/pulse/native
> Library Protocol Version: 35
> Server Protocol Version: 35
> Is Local: yes
> Client Index: 138
> Tile Size: 65472
> User Name: tux
> Host Name: NSA-Terminal-4
> Server Name: PulseAudio (on PipeWire 0.3.74)
> Server Version: 15.0.0
> Default Sample Specification: float32le 2ch 48000Hz
> Default Channel Map: front-left,front-right
> Default Sink: alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink
> Default Source: alsa_input.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_6__source
> Cookie: f9dc:5e7a
> 
> 
> I can't figure out why this is happening. Kindly ask for any more information that is necessary. Thank you.

See Bugzilla for the full thread and attached dmesg.

Anyway, I'm adding it to regzbot so that it doesn't fall through
cracks unnoticed:

#regzbot introduced: v6.3..v6.4 https://bugzilla.kernel.org/show_bug.cgi?id=217673
#regzbot title: PipeWire + Wireplumber audio distortion on Lenovo ThinkPad X1 Yoga Gen 7
#regzbot link: https://bbs.archlinux.org/viewtopic.php?id=287068
#regzbot link: https://bugs.archlinux.org/task/79081?project=1&pagenum=10

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217673

-- 
An old man doll... just what I always wanted! - Clara
