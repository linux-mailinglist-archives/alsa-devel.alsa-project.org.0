Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDDB658C7A
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Dec 2022 13:00:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A4E458C7;
	Thu, 29 Dec 2022 12:59:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A4E458C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672315210;
	bh=J6f1aq2kuA/fYtFIXIjyuulrnG3zC3VMzKFm2ZtFxGs=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=sb6p95HH10oVD0+czPN2EtB93C5Kwk5h/+nFiIN8xPfflb3N6cut0nIwjAQkAv0Ow
	 49Y5RQIYun3GqvSXZpo+zMN+UdTxFXw7k/qCd9gZKmb/3gtqxBSiR3/0X+NmKojEZ4
	 pilXw388UEuV5vZiaSG8k7vmO3aSo2mvqGvm7eKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4184F804FB;
	Thu, 29 Dec 2022 12:59:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 909C4F8023B; Thu, 29 Dec 2022 12:59:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DED4AF8023B
 for <alsa-devel@alsa-project.org>; Thu, 29 Dec 2022 12:59:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DED4AF8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=NNGE1crw
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EBEC21EC052A;
 Thu, 29 Dec 2022 12:59:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1672315150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Lp+vdmZQGHadMtj/xrHmq66kTM3YtHE5xn6Anog2k54=;
 b=NNGE1crwL4GCXhaVIsqMlucjtAR+YFYFAu5SyRxVVo0DF8EmCACt3NYrW+4Ix8/xNuFU8o
 59sFAQb/1hNjFrexEaCEdgFRGmhpbUbQb53NMqkNxMIeRLNpJlHs1agZKVSaC3VR2eOq3J
 oqAqYTysPQ13qCkBEQyrsjBlzGLXg8M=
Date: Thu, 29 Dec 2022 12:59:09 +0100
From: Borislav Petkov <bp@alien8.de>
To: alsa-devel@alsa-project.org
Subject: [bugzilla-daemon@kernel.org: [Bug 216861] New: sound disappearance
 on Acer Swift 3 SF314-59-78UR after update to 5.10.157]
Message-ID: <Y62BDSI/6nk9AUKp@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: zagagyka@basealt.ru
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Forwarding to the ALSA ML.

----- Forwarded message from bugzilla-daemon@kernel.org -----

Date: Thu, 29 Dec 2022 10:07:51 +0000
From: bugzilla-daemon@kernel.org
To: bp@alien8.de
Subject: [Bug 216861] New: sound disappearance on Acer Swift 3 SF314-59-78UR after update to 5.10.157
Message-ID: <bug-216861-6385@https.bugzilla.kernel.org/>

https://bugzilla.kernel.org/show_bug.cgi?id=216861

               URL: https://bugzilla.altlinux.org/44690
            Bug ID: 216861
           Summary: sound disappearance on Acer Swift 3 SF314-59-78UR
                    after update to 5.10.157
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.10.157
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: x86-64
          Assignee: platform_x86_64@kernel-bugs.osdl.org
          Reporter: zagagyka@basealt.ru
                CC: broonie@kernel.org, perex@perex.cz
        Regression: Yes

Created attachment 303497
  --> https://bugzilla.kernel.org/attachment.cgi?id=303497&action=edit
pulseaudio.log

Sudden sound disappearance was reported for some laptops, e.g.

Acer Swift 3 SF314-59-78UR 11th Gen Intel(R) Core(TM) i7-1165G7 @ 2.80GHz

# lspci
0000:00:1f.3 Multimedia audio controller: Intel Corporation Tiger Lake-LP Smart
Sound Technology Audio Controller (rev 20)
        Subsystem: Acer Incorporated [ALI] Device 148c
        Flags: bus master, fast devsel, latency 32, IRQ 197, IOMMU group 12
        Memory at 601f270000 (64-bit, non-prefetchable) [size=16K]
        Memory at 601f000000 (64-bit, non-prefetchable) [size=1M]
        Capabilities: [50] Power Management version 3
        Capabilities: [80] Vendor Specific Information: Len=14 <?>
        Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Kernel driver in use: sof-audio-pci

I am attaching the pulseaudio and dmesg logs

This bug started reproducing after updating the kernel from 5.10.156 to
5.10.157

Bisection revealed the commit being reverted:

c34db0d6b88b1da95e7ab3353e674f4f574cccee is the first bad commit
commit c34db0d6b88b1da95e7ab3353e674f4f574cccee
Author: Richard Fitzgerald <rf@opensource.cirrus.com>
Date:   Fri Nov 4 13:22:13 2022 +0000

    ASoC: soc-pcm: Don't zero TDM masks in __soc_pcm_open()

    [ Upstream commit 39bd801d6908900e9ab0cdc2655150f95ddd4f1a ]

    The DAI tx_mask and rx_mask are set by snd_soc_dai_set_tdm_slot()
    and used by later code that depends on the TDM settings. So
    __soc_pcm_open() should not be obliterating those mask values.

    The code in __soc_pcm_hw_params() uses these masks to calculate the
    active channels so that only the AIF_IN/AIF_OUT widgets for the
    active TDM slots are enabled. The zeroing of the masks in
    __soc_pcm_open() disables this functionality so all AIF widgets
    were enabled even for channels that are not assigned to a TDM slot.

    Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
    Fixes: 2e5894d73789 ("ASoC: pcm: Add support for DAI multicodec")
    Link:
https://lore.kernel.org/r/20221104132213.121847-1-rf@opensource.cirrus.com
    Signed-off-by: Mark Brown <broonie@kernel.org>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

 sound/soc/soc-pcm.c | 5 -----
 1 file changed, 5 deletions(-)

Original bug report: https://bugzilla.altlinux.org/44690

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

----- End forwarded message -----

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
