Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF27579B99
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 23:55:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 641171808;
	Mon, 29 Jul 2019 23:54:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 641171808
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564437319;
	bh=Ic/1j0Y++l6AfrXRBv6YafdfDeCOcpfUeoqcZ5M6a9s=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oaGBPJicjNoB/sLpz9AYVYFA2CBsLpnnOLOZmLB7TOVxACT7WrPnh+CyNvRxBUILo
	 SXXrG211wriUg4QM/t3ENFHy9x3vVrdv9An5r3hhp3tgX7f7jiYiOxYXocV6RdKmzX
	 soE63t7PKHf4poMspqgFOnAzHOheLe5m86eLrFCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 931E1F8048F;
	Mon, 29 Jul 2019 23:53:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 059C6F800E4; Mon, 29 Jul 2019 23:53:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5B45F800E4
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 23:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5B45F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="j5z7AIOZ"
Received: by mail-lf1-x131.google.com with SMTP id b17so43160635lff.7
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 14:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=EDx/cxu0ExL9uhJyQINCrAA94juVwDm/8O7EjREm3yI=;
 b=j5z7AIOZ62oMtuANwFkngCmtM+3twdyFowUn9nSFJjDSwhjLFEbcfVALTAsqZQc5tm
 +aVeEBF6FlLUbJ2fT+/PoJBCCyos303zdTMQdRo6qQwM5+i1eLHCRjldJwNXZn9vMjmL
 4QkFKShuNuHXZBNbJD/aofRZVdukoMj1xuGGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=EDx/cxu0ExL9uhJyQINCrAA94juVwDm/8O7EjREm3yI=;
 b=BjL/MWfaIieeg3liFt1DtEmd5ssm+4VEdeOe+/VnI21sznNFdtoH1TRI5bGSptvmSX
 iLUo11nDeZDhvYrm8oCbBzskOx7fJ8yL0BmkpYUzjOsVWJwMeB3d6mRmxIk3iSGexVVn
 03zp1lJdFIXrAaAUKOPd0W2DsPwK3zP+JI5z8lxE/v/M/jIJTI/2KcVVvx1cHYnRF5CV
 +hKlcHPomkLztuRPQlUvxkDgs2Fb7QD5gdFygYP+qqgxakfCuWE8Sed5fPnIUaZt+Uu0
 vo7x8eqO28vofuoH4hVzVlxPlIOU0ApKYy+8sFQyqID2IQM5PsWi8uE4QLavAmztFpao
 tf2Q==
X-Gm-Message-State: APjAAAUCCBsY1zfc+9TIaO5lpOFvjsY/Uxa06kWi9tQSRDIT0gkfZxlC
 7jFRWPIvv/dcdh62uBP369POPS6UyLU=
X-Google-Smtp-Source: APXvYqz3GOEt0BLBOAnDUF0jUoEgZUtxVZTCfYNLXdLVGChlUhb3Ybn0RuYixEhPltQhq+Vo9oeD4A==
X-Received: by 2002:a05:6512:c1:: with SMTP id
 c1mr31083151lfp.35.1564437209087; 
 Mon, 29 Jul 2019 14:53:29 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id m10sm10768428lfd.32.2019.07.29.14.53.28
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 14:53:28 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id v85so43109282lfa.6
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 14:53:28 -0700 (PDT)
X-Received: by 2002:a19:6602:: with SMTP id a2mr51201993lfc.25.1564437207709; 
 Mon, 29 Jul 2019 14:53:27 -0700 (PDT)
MIME-Version: 1.0
From: Jon Flatley <jflat@chromium.org>
Date: Mon, 29 Jul 2019 14:53:16 -0700
X-Gmail-Original-Message-ID: <CACJJ=pxPm7dRUE534hDWy2tN3dGYDyrgU8JKqett=wOQx+nWCQ@mail.gmail.com>
Message-ID: <CACJJ=pxPm7dRUE534hDWy2tN3dGYDyrgU8JKqett=wOQx+nWCQ@mail.gmail.com>
To: alsa-devel@alsa-project.org
Cc: benzh@chromium.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
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

I've been working on upstreaming the bdw-rt5650 machine driver for the
Acer Chromebase 24 (buddy). There seems to be an issue when first
setting the hardware controls that appears to be crashing the DSP:

[   51.424554] haswell-pcm-audio haswell-pcm-audio: FW loaded, mailbox
readback FW info: type 01, - version: 00.00, build 77, source commit
id: 876ac6906f31a43b6772b23c7c983ce9dcb18a19
...
[   84.924666] haswell-pcm-audio haswell-pcm-audio: error: audio DSP
boot timeout IPCD 0x0 IPCX 0x0
[   85.260655] haswell-pcm-audio haswell-pcm-audio: ipc: --message
timeout-- ipcx 0x83000000 isr 0x00000000 ipcd 0x00000000 imrx
0x7fff0000
[   85.273609] haswell-pcm-audio haswell-pcm-audio: error: stream commit failed
[   85.279746]  System PCM: error: failed to commit stream -110
[   85.285388] haswell-pcm-audio haswell-pcm-audio: ASoC:
haswell-pcm-audio hw params failed: -110
[   85.293963]  System PCM: ASoC: hw_params FE failed -110

This happens roughly 50% of the time when first setting hardware
controls after a reboot. The other 50% of the time the DSP comes up
just fine and audio works fine thereafter. Adding "#define DEBUG 1" to
sound/soc/intel/haswell/sst-haswell-ipc.c makes the issue occur much
less frequently in my testing. Seems like a subtle timing issue.

There were timing issues encountered during the bringup of the 2015
chromebook pixel (samus) which uses the bdw-rt5677 machine driver.
Those were slightly different, and manifested during repeated
arecords. Both devices use the same revision of the sst2 firmware.

Any ideas for how to debug this?

Thanks,
Jon
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
