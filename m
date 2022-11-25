Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2D3639471
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:10:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F213186C;
	Sat, 26 Nov 2022 09:09:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F213186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450233;
	bh=fp6XqQpL9EV6MCaRRytTNHroBgmTNRjgfEMJDkvpH/4=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=e6/9buJhdSrqPKaYwj+AGZbOhrkaT8CKKmit8A35thf5Rwb1CmvEvlGKDwxGnMo6j
	 R76WHQY2UQRkcezac6utrHXemBmuIxAV5eld1iWabuRVE434Dn7bT9hLn7NsB9lmEz
	 fW7zyf8O20mtXN6y59LeuZIJ1nRxUYwAXk33gQNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6F81F80640;
	Sat, 26 Nov 2022 08:59:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18C5BF80236; Fri, 25 Nov 2022 09:52:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FREEMAIL_REPLYTO,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBC9DF800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 09:52:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBC9DF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="U25EnEfO"
Received: by mail-il1-x129.google.com with SMTP id bp12so1716669ilb.9
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 00:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=isTCofvVL7P9dcD3ZjO24cUl7DxiMDU3I93o15gZ/9c=;
 b=U25EnEfOZZVYs8FjvGI5gQhqb6IT6wAuDc14dIyaxkrl4QHUKrSLJJU+tKy0AZv65E
 /5Ex3VbBz3u34znyupN2qhvzV/GGLiYuQ1bYyDdKAP3CgEa1JzzYf3FMPYmz4Rukchnz
 HWWBzdJRpcxm7j20tFM/YEX87lgv183221h3LMNHGoNSW7IZGnmQn0VzjLorn3iWOxa3
 I84u4oK0duAL0TCfAFSZCaOAmRXKQuCh9KjIbzWifgQmaxVJRm73ow35hAn5gf3Vw6Cy
 yZdvy4YrZD06IjjiBuBgjEJbWBqGafSKpwdD7mBunyfTAyMYL3dhqZnKsr+tsz7BDjdo
 SUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=isTCofvVL7P9dcD3ZjO24cUl7DxiMDU3I93o15gZ/9c=;
 b=LY/HZKXTrg7j8HKyHMts3Vqff4LtiOOgUf3EXspGEqDWpxZ4+9MMrCZEwR157gEaly
 Qkj1v+tC/ZiDhQXrQ2pStdDS+fFkECUOwpQ02va1MZvxN0yuoVwqW8W2//k4JbWGQBNL
 Tv5QhsfRPfkmjl3uU3frzJZiR9t3fR+sGrLivGum8MNDBYoCGO+Q1VSMRa3Q+OcxiDqk
 6Uc3969TX1B1QGH661jRB/WYmJ1PZTP4alMZIkkp69jBOXOs+MzL8JwyQakoLecMgr5n
 nWdJWazbLmrVC6+j4rg0rjWwt4qD371sEC6VT8XjpdI4GL4uyVl/DKt8t5m6hCLFoOTa
 x/qA==
X-Gm-Message-State: ANoB5pmTZPSE6CFFdo1KiXPRa9HOH7hjB9SklW8esPSSZJta8SsUxYtR
 Wsmz28HGMAR6kchovKBcNucX5PLcH+JhaYr0vhA=
X-Google-Smtp-Source: AA0mqf5H9G3SzpdncpPet9d//MPYqe5QUDuNoMnk8hLUsTV6TJ3wQJd+HzFTKQm/xY00bwcElLibzoa2erdtv5S9b+k=
X-Received: by 2002:a92:6e12:0:b0:302:abfb:51d5 with SMTP id
 j18-20020a926e12000000b00302abfb51d5mr8856626ilc.196.1669366327251; Fri, 25
 Nov 2022 00:52:07 -0800 (PST)
MIME-Version: 1.0
From: Ivan Mrva <ivanmrva@gmail.com>
Date: Fri, 25 Nov 2022 09:51:56 +0100
Message-ID: <CACVs=vJpoCp2jfFof62HbQFtk75azbGCdWgRW0n12sVsdxQo-g@mail.gmail.com>
Subject: PROBLEM: No sound on HP Firefly 14 G9 laptop
To: tiwai@suse.com
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:51 +0100
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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
Reply-To: ivan.mrva@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

[1.] One line summary of the problem:
No sound on HP Firefly 14 G9

[2.] Full description of the problem/report:
Although the corresponding kernel module is loaded successfully and I can
also see a sound output being produced on the software level (in
gnome-control-center), physically there is still no sound coming out of the
speakers. My HW card was identified with the code "0x103c" "0x896d", for
which a patch was already submitted in the following commit:
https://github.com/torvalds/linux/commit/f86bfeb689f2c4ebe12782ef0578ef778fb1a050.
Unfortunately not working in my case. Also the patch identified the model
as "HP Zbook Firefly 16 G9", however in my case the model is used "HP Zbook
Firefly 14 G6" (14 not 16).

[4.1.] Kernel version:
6.1-rc6

[8.3.] Module information:
snd_hda_scodec_cs35l41_i2c

[8.4.] Loaded driver and hardware information (/proc/ioports, /proc/iomem):
Here some relevant output from systemd's journalctl:

Nov 24 20:52:43 laptop-brn alsactl[2916]: Found hardware: "HDA-Intel"
"Realtek ALC245" "HDA:10ec0245,103c8972,00100001
HDA:8086281c,80860101,00100000" "0x103c" "0x896d"
Nov 24 21:07:26 laptop-brn alsactl[2937]: Found hardware: "HDA-Intel"
"Realtek ALC245" "HDA:10ec0245,103c8972,00100001
HDA:8086281c,80860101,00100000" "0x103c" "0x896d"

Nov 25 07:34:11 laptop-brn kernel: snd_hda_intel 0000:00:1f.3: DSP detected
with PCI class/subclass/prog-if info 0x040100
Nov 25 07:34:11 laptop-brn kernel: snd_hda_intel 0000:00:1f.3: Digital mics
found on Skylake+ platform, using SOF driver
Nov 25 07:34:15 laptop-brn kernel: snd_hda_codec_realtek ehdaudio0D0:
autoconfig for ALC245: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
Nov 25 07:34:15 laptop-brn kernel: snd_hda_codec_realtek ehdaudio0D0:
 speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
Nov 25 07:34:15 laptop-brn kernel: snd_hda_codec_realtek ehdaudio0D0:
 hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
Nov 25 07:34:15 laptop-brn kernel: snd_hda_codec_realtek ehdaudio0D0:
 mono: mono_out=0x0
Nov 25 07:34:15 laptop-brn kernel: snd_hda_codec_realtek ehdaudio0D0:
 inputs:
Nov 25 07:34:15 laptop-brn kernel: snd_hda_codec_realtek ehdaudio0D0:
 Mic=0x19
Nov 25 07:34:15 laptop-brn kernel: snd_hda_codec_realtek ehdaudio0D0: ASoC:
sink widget AIF1TX overwritten
Nov 25 07:34:15 laptop-brn kernel: snd_hda_codec_realtek ehdaudio0D0: ASoC:
source widget AIF1RX overwritten

[X.] Other notes, patches, fixes, workarounds:
I don't know by myself how to fix it - not sure what exactly is relevant on
the HW side to be checked and how to patch it in the patch_realtek.c
exactly. Would be glad if you could help me navigate here (what HW
information should I look for) and would be happy to try to patch it and
test by myself on my machine.

Thank you.
