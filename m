Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B3F1C033B
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 18:57:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 756EB168A;
	Thu, 30 Apr 2020 18:56:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 756EB168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588265829;
	bh=ZhZYSsk5hS0xWWkSuDd/PIxg8h9PWndf6r1doa8ylkE=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LYPkLMLi1GgUGpsaEXUpo1LIWSaZpDjityiIOnL5e9EBt8E6pvh9gQOxBaVcIMp/c
	 1h0a7cxDtmAvp/OpiP6hbc8Y1QCSTubHFWeUimMR4OkKuuPizzAa/euQ9kOt5YvOGq
	 XZZxn8DtEtE+rRXwnhQccGHVEys5+0o0FbY2i4oQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A33FF802A2;
	Thu, 30 Apr 2020 18:53:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B658F8022B; Wed, 29 Apr 2020 05:35:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_65,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E7D9F800B6
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 05:35:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E7D9F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CDWiz+Ge"
Received: by mail-lf1-x12d.google.com with SMTP id u10so421233lfo.8
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 20:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/A4gfRgYVIRAk1K6THZaRTL9fcdNV1OglXttEjxzMnY=;
 b=CDWiz+Ge/Y9712NS8uE0axs6XCuaQZ7EAXUiKBAmp0Z0aqPrsLIcK+aEQskirHVHCO
 EzsZuQu4EU4YFjt5X0Kcm7BeNkn/+mbszUbQf6QNUtVf7aQUcCOFQpNs4DhumDNsG7KA
 2avmKoJnCn3zjEMFpvvenCMMukBJpSc+GUR5FVODnMPDoBkVk/5UlgZgE6w68uutqtGD
 d/93nPLTv5F0rO23EoZd3VsZc7e5OatSF7LZjSwoVfncTysEdZ6NjR2ZeOOUwiJlJ/UY
 et8XnxKUmvO1QxdeK5ULlGc0aMUdu3EdyBxb8pMdapP+ZW07vZpZSgxZQKnDVnDYURdY
 aEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/A4gfRgYVIRAk1K6THZaRTL9fcdNV1OglXttEjxzMnY=;
 b=WlJb5l0GY7lQtbMmRlc7L+a26n/Qq0hzhZaozIaGtCJryKl4y+GNwcMZopKhyhK6Rn
 CiZ0Jz9JK4QOGBt61NG/6gcK/6qiGhQmTlr/oduHpmMiVNLHySP69AAWTPYHwUxNUgCj
 9k8h6nML4h7bdaPrw9Vfa0xExOaysd+Syh7+uefmBz4i6aXpzMOiiGPX9snPwZbvIegf
 Fgk70H8CLNF5NfSivSaiTqL34GGj1seUW68zm4Bdzjr8EAyE1mlOhIFfokQDENOq7pH1
 rbioAguuzSEWk6yxW7G6wRhmONKf6p+NVQOwH8A2E7cOUdG+dGjq7A2aWuNalj88RusD
 eqeA==
X-Gm-Message-State: AGi0PuY+iZakNOcup5xPQusbhMlBsPhNKnWs6ND9kdI8IFDopwDOsjRa
 CGJOstDX8b/NzR/zIRcOVztXIeu4wTmcYTlm1LzxpB3OvsM=
X-Google-Smtp-Source: APiQypJnWMad78Ip9qDoPpZtGq6LKSU8ExmGP7x3Ku86rWX6hpxwM8o25dsMmRjoeS7b8WT61NYbdm56Yh4Hz2J0xko=
X-Received: by 2002:a19:ca0e:: with SMTP id a14mr21351564lfg.105.1588131338891; 
 Tue, 28 Apr 2020 20:35:38 -0700 (PDT)
MIME-Version: 1.0
From: Naoaki Ueda <nao.uedder@gmail.com>
Date: Wed, 29 Apr 2020 12:35:27 +0900
Message-ID: <CAHuMTPn7tNxste99VGfX=w=YnpwYhFc2xph=qj9A19YF8LN_VQ@mail.gmail.com>
Subject: Issue report: HDMI audio problem with kernel 5.6.6-300 and Nvidia
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 30 Apr 2020 18:53:43 +0200
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
Thank you for developing the awesome products.

I notice my machine doesn't output any sounds from the HDMI port with
kernel-5.6.6-300 and Nvidia.
I have tried booting my machine with kernel-5.3.7-301.fc31.x86_64, it
works fine.
So I'm reporting those here referring
https://bugzilla.redhat.com/show_bug.cgi?id=1784839.

Following are the part of the outputs from `lspci -v -k` on my machine:

```
05:00.0 VGA compatible controller: NVIDIA Corporation GP106 [GeForce
GTX 1060 3GB] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: NVIDIA Corporation Device 11c2
        Physical Slot: 2
        Flags: bus master, fast devsel, latency 0, IRQ 47
        Memory at ee000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d0000000 (64-bit, prefetchable) [size=256M]
        Memory at e0000000 (64-bit, prefetchable) [size=32M]
        I/O ports at c000 [size=128]
        Expansion ROM at 000c0000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Legacy Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [250] Latency Tolerance Reporting
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [420] Advanced Error Reporting
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1
Len=024 <?>
        Capabilities: [900] Secondary PCI Express
        Kernel driver in use: nouveau
        Kernel modules: nouveau

05:00.1 Audio device: NVIDIA Corporation GP106 High Definition Audio
Controller (rev a1)
        Subsystem: NVIDIA Corporation Device 11c2
        Physical Slot: 2
        Flags: bus master, fast devsel, latency 0, IRQ 50
        Memory at ef080000 (32-bit, non-prefetchable) [size=16K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Advanced Error Reporting
        Kernel driver in use: snd_hda_intel
        Kernel modules: snd_hda_intel
```

Best regards,

Nao Ueda
Japan
