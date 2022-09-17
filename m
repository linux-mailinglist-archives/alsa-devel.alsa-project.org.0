Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A89C85BC475
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 10:40:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D3DB15DC;
	Mon, 19 Sep 2022 10:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D3DB15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663576837;
	bh=bCQMRMTqN+DwV10IadpYg6jDO11h0EiMHaWHIejo3FM=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=gNvy4Ynm0Hht1S+0L8Vs6kWm4HEM7Ehd6Rt5U16+BP5q5Ob43sUpwjvhxjX9a+n63
	 vocNJO1TiszRdwW1DcS3crFR4lf2Ny0yNZh3ba38r42O6uTRS0HDrFsnmAn3xCfXfq
	 DvoRz/ASrIB3Mb8y7WG1t4mojI3C35zI+tjd9QyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3037F8032B;
	Mon, 19 Sep 2022 10:39:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2BC4F8028D; Sat, 17 Sep 2022 20:53:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40301F800E5
 for <alsa-devel@alsa-project.org>; Sat, 17 Sep 2022 20:53:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40301F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hw3ZCiyR"
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-3450990b0aeso296151927b3.12
 for <alsa-devel@alsa-project.org>; Sat, 17 Sep 2022 11:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date; bh=J+CNqvxEaNrIYkD2JfuHI/IfFFIerafQrZHZrnpw/C8=;
 b=hw3ZCiyR0DOS+BzRzNMQ3s2Qy6SjGRqX68mTH6dfOjLXjPalKLmwW11HNYBZ2+0mm4
 wf9IEnYBuXSMbHuLXCuD8DIf3430DRYwiZhF/sQnyjygpreU7SD3YAstySiPPACad1gQ
 8hU7b/iDiFMTUVpt6Y5LSleCW3WwyLVEL6C92XQO/eY9WilgR2Wytazmq6KE7v+zri+s
 na5JSmPGOVcdn7rqlIhbNHJ2YzcnaGCpVDhwWQchnzRSE6CwNzChdSFnTdkos0ScpEZq
 sEl29AyLwoCafEAaiSmPpQ9auhz70+0gIbBrawKYvdcJpYdr+3diWSsBpJ1afJ8FCpz2
 C2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date;
 bh=J+CNqvxEaNrIYkD2JfuHI/IfFFIerafQrZHZrnpw/C8=;
 b=oIl5y3YDRY42AktNqj7Aj3Nv22rBlUH3hJ9sC++A4Zgt2kFgRvIxK2PyNvxa8tBAF7
 GWiG2CZMUZgWLI2Oo9D6K44cTjJB3hsn1B5obqwfw6vwrfPzxNzBNE0uNm+W+r1fVjXm
 ceiNIXcjOQLbZs10/nEmRl+fIBDsvzR9rXvxBukCqXdINkrDskULHHesWxRKDquhFpNK
 hYoY9TRSgE0Lkz9M/HGSz+L518bY77JfC9IudFDgjcngpA2xCzLllew9+QEEsYPMVGN7
 kbISAkQkE7grO7z4coLFiKhNWCsefOySUCofM7gzLvoP+NZJkhwknABoIqFQUJiWH8+V
 XFIQ==
X-Gm-Message-State: ACrzQf20vsemnZQtb5BHKNQ36ZsJ1dDpVJanZWbcht4JKPBgWT8PsLUq
 n1uAkifPdIyeHDg/xhjqy6b90+Pz1LVIRwMoOpAxjiTIbk4=
X-Google-Smtp-Source: AMsMyM7rfRSQbNpaui6mPWazky6S+QhaNKz6M2NAiyMgtnlg8COSGYwz5hvYPxWgmLucx7Ph5jAw+SAJP0gfDjYYHWs=
X-Received: by 2002:a81:7c45:0:b0:349:bc24:9591 with SMTP id
 x66-20020a817c45000000b00349bc249591mr9150474ywc.211.1663440795119; Sat, 17
 Sep 2022 11:53:15 -0700 (PDT)
MIME-Version: 1.0
From: Linas Vepstas <linasvepstas@gmail.com>
Date: Sat, 17 Sep 2022 13:53:03 -0500
Message-ID: <CAHrUA35O4Av+-+dbr69LrgHfXAWF1+d4xwJSF7k2Tx4YWrQ8kw@mail.gmail.com>
Subject: "no soundcard" for GeminiLake High Definition Audio (rev 06)
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 19 Sep 2022 10:39:37 +0200
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
Reply-To: linasvepstas@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Kernel reports "no soundcard". Presumably, this is why I don't have
sound. Let me dive right in with details:

cat /proc/asound/cards
--- no soundcards ---

lspci:
00:0e.0 Multimedia audio controller: Intel Corporation Celeron/Pentium
Silver Processor High Definition Audio (rev 06)
00:0e.0 0401: 8086:3198 (rev 06)

        DeviceName: Onboard - Sound
        Subsystem: Device 02f3:f000
        Kernel driver in use: sof-audio-pci-intel-apl
        Kernel modules: snd_hda_intel, snd_soc_skl, snd_sof_pci_intel_apl

dmesg |grep -iE 'snd|sof|audio'

[    0.201569] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    4.715400] snd_hda_intel 0000:00:0e.0: DSP detected with PCI
class/subclass/prog-if info 0x040100
[    4.938181] snd_soc_skl 0000:00:0e.0: DSP detected with PCI
class/subclass/prog-if info 0x040100
[    5.324959] sof-audio-pci-intel-apl 0000:00:0e.0: DSP detected with
PCI class/subclass/prog-if info 0x040100
[    5.325268] sof-audio-pci-intel-apl 0000:00:0e.0: DSP detected with
PCI class/subclass/prog-if 0x040100
[    5.325465] sof-audio-pci-intel-apl 0000:00:0e.0: bound
0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[    5.357483] sof-audio-pci-intel-apl 0000:00:0e.0: use msi interrupt mode
[    5.393933] sof-audio-pci-intel-apl 0000:00:0e.0: NHLT_DEVICE_I2S
detected, ssp_mask 0x5
[    5.393945] sof-audio-pci-intel-apl 0000:00:0e.0: hda codecs found, mask 4
[    5.399557] sof-audio-pci-intel-apl 0000:00:0e.0: Firmware info:
version 2:1:1-3964a
[    5.399567] sof-audio-pci-intel-apl 0000:00:0e.0: Firmware: ABI
3:21:0 Kernel ABI 3:23:0
[    5.399579] sof-audio-pci-intel-apl 0000:00:0e.0: unknown
sof_ext_man header type 3 size 0x30
[    5.439596] sof-audio-pci-intel-apl 0000:00:0e.0: Firmware info:
version 2:1:1-3964a
[    5.439604] sof-audio-pci-intel-apl 0000:00:0e.0: Firmware: ABI
3:21:0 Kernel ABI 3:23:0

cat /proc/version
Linux version 6.0.0-rc5 (root@yippie) (gcc (Debian 12.2.0-1) 12.2.0,
GNU ld (GNU Binutils for Debian) 2.38.90.20220713) #3 SMP
PREEMPT_DYNAMIC Thu Sep 15 04:35:50 CDT 2022

I built this a few days ago from `make oldconfig` on the current
Debian testing 5.19.15 kernel.

I attempted debugging, and I found this:

sound/soc/sof/intel/pci-apl.c:
   { PCI_DEVICE(0x8086, 0x3198), /* GeminiLake */
      .driver_data = (unsigned long)&glk_desc},

Yay! That's my pci id!
Adding printk's to both
int snd_card_register(struct snd_card *card)
int snd_soc_register_card(struct snd_soc_card *card)

shows that neither of these are ever called.  I was unable to figure
out where they should have been called from. It's as if some driver is
missing ??? There's nothing in sound/soc/intel/boards/* that seems to
apply to my situation???

FWIW, more about this hardware:
-- It's a cheap laptop, from newegg, Ipason MaxBook P1X, 4-core Intel
Celeron, 12GB RAM, great price.
--  lspci
00:00.0 Host bridge: Intel Corporation Gemini Lake Host Bridge (rev 06)
00:00.1 Signal processing controller: Intel Corporation
Celeron/Pentium Silver Processor Dynamic Platform and Thermal
Framework Processor Participant (rev 06)
00:02.0 VGA compatible controller: Intel Corporation GeminiLake [UHD
Graphics 600] (rev 06)
00:0e.0 Multimedia audio controller: Intel Corporation Celeron/Pentium
Silver Processor High Definition Audio (rev 06)
00:0f.0 Communication controller: Intel Corporation Celeron/Pentium
Silver Processor Trusted Execution Engine Interface (rev 06)
00:12.0 SATA controller: Intel Corporation Celeron/Pentium Silver
Processor SATA Controller (rev 06)
00:13.0 PCI bridge: Intel Corporation Gemini Lake PCI Express Root Port (rev f6)
...
00:15.0 USB controller: Intel Corporation Celeron/Pentium Silver
Processor USB 3.0 xHCI Controller (rev 06)
00:16.0 Signal processing controller: Intel Corporation
Celeron/Pentium Silver Processor I2C 0 (rev 06)
...
00:18.0 Signal processing controller: Intel Corporation
Celeron/Pentium Silver Processor Serial IO UART Host Controller (rev
06)
...
00:1c.0 SD Host controller: Intel Corporation Celeron/Pentium Silver
Processor SDA Standard Compliant SD Host Controller (rev 06)
00:1e.0 SD Host controller: Intel Corporation Device 31d0 (rev 06)
00:1f.0 ISA bridge: Intel Corporation Celeron/Pentium Silver Processor
LPC Controller (rev 06)
00:1f.1 SMBus: Intel Corporation Celeron/Pentium Silver Processor
Gaussian Mixture Model (rev 06)
01:00.0 Network controller: Realtek Semiconductor Co., Ltd. RTL8821CE
802.11ac PCIe Wireless Network Adapter

So I guess there's "no soundcard" because the thing is wired directly
into the PCI bus ?? I used to know PCI intimately, but that was a
decade ago. I've forgotten all of that.

Advice on how to proceed would be appreciated. I could maybe even
write a device driver if someone holds my hand (I've written or worked
on drivers for ethernet, scsi before)

-- Linas

-- 
Patrick: Are they laughing at us?
Sponge Bob: No, Patrick, they are laughing next to us.
