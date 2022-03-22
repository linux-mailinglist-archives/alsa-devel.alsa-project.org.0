Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 669694E4F02
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 10:13:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBD1C165D;
	Wed, 23 Mar 2022 10:12:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBD1C165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648026821;
	bh=QSWGoY6oHBLH39/wKbyKN91qris4qer3Q2c9o3zontA=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xwmn+csn9e4Z5qKl1iiUxCqe5qBQMktumV4i8f8OD/x6UJEcg9TZQvhkbn9mTo7Zp
	 F87Jf7xwVidFhF7v1IW//k/dIqu4f5ezLNk0F+HLLvW9T+pcXdIuKML1oR2iA2pWmf
	 8ggZKytFKc0uTQozclwCpWr/S7mHFwtGmUx/ZgBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 727ECF800AA;
	Wed, 23 Mar 2022 10:12:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1955F8016C; Tue, 22 Mar 2022 19:57:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE065F80116
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 19:57:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE065F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eMTM4rh6"
Received: by mail-lj1-x22b.google.com with SMTP id 17so10305175ljw.8
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 11:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=c5arXiiJ3Quxh2p9b37Ov74GNTyAuz+uBeCMvna+SX0=;
 b=eMTM4rh6Kpfj5QSdag9f5gXvQF2BDBUZU+9r8i+vkbHecQbYiZXzcxxOtoogtI+rL6
 9lOJ4E3aDw4touXwGMLda879hD9Q/Jk6uNNfkcAcewkxy3rqpYiEmatQVA5REroLLgGQ
 jGqNV0zqv9tJQAqKjBxYH1hcqmVZBBZL9scMEJVS/B80QUwA3eRB0O5WgZ85Y2YgHfqh
 nkBOXngu6JinFix1eYOUMRdL3QSS6GOz8aypiCh/BGzIn6FCOSwO5UnvmaoIAITlXkmo
 F2lJc3oIvIrVnt04kzKPIKMGBXtG4PEJn9xVqTzhlHr1+jvbB+7Rdu71Cx79zCOf8j3N
 4zkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=c5arXiiJ3Quxh2p9b37Ov74GNTyAuz+uBeCMvna+SX0=;
 b=36GXBzFIvx7hG/aoLM9wtKCa0krqjO2NGEDyryTj7Jri0D+8UBsflyBQK7bNqym+4f
 dZ5vC135akKS/eCwxSEyw3wDqGJD3Zb8ngCX5MUakPhLCzVVri6zB33LaVSplSQAfIHS
 6KiTtaa+yiptJ7e7D3y0vBxBM68/Q1A4Oo6Yp9aDN8MU9GBjbXh1mCuJH3OOlRqaH7EG
 JxgA7JXuns/iYcydqzAV0sT5xVmDIM85pZR/ea56BRWXsLJq+04mnNFDwQ/h5IHPqDYd
 bUXe/FLmE+TtcWuBpSWxc21r2c/6tilkP5iaBhfEKMPPx0k3SPAlMGEbZsbHfu73pclD
 OXrA==
X-Gm-Message-State: AOAM531hO96UAJ6SF9rHijzq5t8H1LIT7ORy0VNwy2xw1tEwmlaHlfcV
 oQGWSWSvWFwuEjHW9UObpLbQ+VEQUdC16314uZmxwHzItaw=
X-Google-Smtp-Source: ABdhPJwVO8SyOEht2Z21TQ8VidOk3FjuwOCru3BcM8/m3C4pEICNjQm3+qz6OZDM3KcIMRWj86AXZam1nOV7T/O7GlM=
X-Received: by 2002:a05:651c:503:b0:249:230d:8ddb with SMTP id
 o3-20020a05651c050300b00249230d8ddbmr19862353ljp.459.1647975461359; Tue, 22
 Mar 2022 11:57:41 -0700 (PDT)
MIME-Version: 1.0
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 22 Mar 2022 14:57:27 -0400
Message-ID: <CAKf6xpuRJ84RVfqPRJu3RL4xGF-FLkvO84SHTWEmXJFUWTgBGQ@mail.gmail.com>
Subject: snd_hda_intel initialization failure with Xen PCI passthrough
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 23 Mar 2022 10:12:33 +0100
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

I'm running Xen hypervisor and using PCI passthrough to assign an
Intel HDA audio device (00:1f.3 Audio device: Intel Corporation Cannon
Point-LP High Definition Audio Controller (rev 30)) to a Xen HVM
virtual machine.  I do this for both Linux 5.4.185 and a different
Windows 10 VM (only one at a time).  The Windows VM seems to work
every time.  The Linux VM has issues after the first VM boot.  This is
one boot of the physical hardware and multiple boots of the virtual
machines.

For Linux, on first boot, the sound card is detected and works
properly.  After that, things usually don't work.  I just ran a reboot
loop and it was:
1st boot - audio detected and working
2 & 3 - no audio
4th - audio detected and working
5 - 20 - no audio

For boots 2, 3, 5-7, dmesg shows:
[    0.760401] hdaudio hdaudioC0D0: no AFG or MFG node found
[    0.760415] snd_hda_intel 0000:00:06.0: no codecs initialized

For boots 8+, the errors changed to:
[    0.783397] hdaudio hdaudioC0D0: cannot read sub nodes for FG 0x10
[    0.783413] snd_hda_intel 0000:00:06.0: no codecs initialized

At this point, I booted a Windows 10 VM and audio works

Trying to boot Linux again gives a new error message
[    0.789041] snd_hda_intel 0000:00:06.0: Unknown capability 0
[    1.811205] snd_hda_intel 0000:00:06.0: No response from codec,
resetting bus: last cmd=0x0eef0004
[    1.811246] hdaudio hdaudioC0D0: cannot read sub nodes for FG 0x10ee
[    1.811263] snd_hda_intel 0000:00:06.0: no codecs initialized

Reboot VM and it's back to:
[    0.775917] hdaudio hdaudioC0D0: no AFG or MFG node found
[    0.775932] snd_hda_intel 0000:00:06.0: no codecs initialized

Reboot VM and again:
[    0.789069] hdaudio hdaudioC0D0: cannot read sub nodes for FG 0x10
[    0.789084] snd_hda_intel 0000:00:06.0: no codecs initialized

Reboot physical laptop:
1. boot Windows 10 - audio works
2. boot Linux - audio works
3. reboot Linux - no audio
[    0.773111] hdaudio hdaudioC0D0: no AFG or MFG node found
[    0.773151] snd_hda_intel 0000:00:06.0: no codecs initialized

This seems to me like Windows does a better job resetting the card to
get the audio hardware working.  Any suggestions on what to
investigate?

Thanks,
Jason
