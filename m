Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26602392C00
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 12:40:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A817C170C;
	Thu, 27 May 2021 12:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A817C170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622112013;
	bh=Ng2FWtCJdsgi8XPj25rMR6i6SrEH9TWLKrT07sylsMM=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dxMhBHLEAVVtK+ANjokQwLlGVKaWUmKZ9nci0mMKMEE9aMb15lcFdmshHwNIQEgaW
	 foobQjkHk0UfWcf/gzkmUSPRAIq2yvyE1I242ZJ5eHTwbpC36zSZFQG/MSPHbSNT8y
	 +uLDHVL7pII4yFfRR/fHbP4CGjlTs80g7hfNUYbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7DDAF80147;
	Thu, 27 May 2021 12:38:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 881B1F8012E; Thu, 27 May 2021 12:38:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp.ungleich.ch (mx.ungleich.ch [185.203.112.16])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBF64F800EA
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 12:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBF64F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ungleich.ch header.i=@ungleich.ch
 header.b="Kjz3OT/z"
Received: from nb3.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id B38181FE6A;
 Thu, 27 May 2021 12:38:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1622111913; bh=Ng2FWtCJdsgi8XPj25rMR6i6SrEH9TWLKrT07sylsMM=;
 h=References:From:To:Cc:Subject:In-reply-to:Date:From;
 b=Kjz3OT/za7qu2JcPhMACGi6oFktEOho9dQatilAU5+fK8EiGua49PeBeBKizH9KQV
 WSJiKph+PV0b50tiZbQ5DVDZ0VqJCVC5NkNWqtZA4s+TCtSkTqExkBHDhHzQgpZIHq
 GCsc/pcuGLYGUkq7Q2kDNoGDHTy1T9UEu07Ge1hhVvh4BRq9yx1kyo7C+RWdfsmGG9
 qkKvR2zGSfEuHBUybnOyS3GK+gtcas7Fs6S4nD9y5ScYLwCng1oJE88BXzr80YHQLN
 6pgBpyTIpRUhszpDAoAsCiH9vUymIcBk2MAYR5xB8WdQqLcSn/K+kw5YafOPDLui1y
 wd4cDefaJBqjg==
Received: by nb3.localdomain (Postfix, from userid 1000)
 id 846C314C01E2; Thu, 27 May 2021 12:39:01 +0200 (CEST)
References: <874keoijzh.fsf@ungleich.ch>
 <f2e7c889-cc99-63b3-3bd3-302faf1745fa@perex.cz>
User-agent: mu4e 1.4.15; emacs 27.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: Internal microphone does not work with 5.12 (Tiger Lake, X1 Nano)
In-reply-to: <f2e7c889-cc99-63b3-3bd3-302faf1745fa@perex.cz>
Date: Thu, 27 May 2021 12:39:01 +0200
Message-ID: <87r1hs31h6.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>,
 alsa-devel@alsa-project.org
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



Jaroslav Kysela <perex@perex.cz> writes:

> On 27. 05. 21 11:50, Nico Schottelius wrote:
> Could you check, if the Intel SOF driver is enabled in your kernel?
>
> CONFIG_SND_SOC_SOF_TIGERLAKE

Just checked, it was disabled. I rebuilt 5.12.6, rebooted, but now the
sound card is gone (no device files in /dev/snd anymore), proably
failing due to:

[   55.713668] snd_hda_intel 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040380
[   55.713679] snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ platform, using SOF driver
[   55.745863] sof-audio-pci-intel-tgl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040380
[   55.745872] sof-audio-pci-intel-tgl 0000:00:1f.3: Digital mics found on Skylake+ platform, using SOF driver
[   55.746033] sof-audio-pci-intel-tgl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040380
[   55.748315] sof-audio-pci-intel-tgl 0000:00:1f.3: use msi interrupt mode
[   55.752671] sof-audio-pci-intel-tgl 0000:00:1f.3: warning: No matching ASoC machine driver found
[   55.752673] sof-audio-pci-intel-tgl 0000:00:1f.3: error: no matching ASoC machine driver found - aborting probe
[   55.752673] sof-audio-pci-intel-tgl 0000:00:1f.3: error: failed to get machine info -19
[   55.752764] sof-audio-pci-intel-tgl 0000:00:1f.3: error: failed to probe DSP hardware!

I have uploaded the full report on http://alsa-project.org/db/?f=d3c7ba9611b3c823709d7bce0df0f592b3471735

Nico

--
Sustainable and modern Infrastructures by ungleich.ch
