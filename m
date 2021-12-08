Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D38F46DBB1
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 19:59:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C30025F3;
	Wed,  8 Dec 2021 19:58:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C30025F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638989944;
	bh=2Z4Yu4EfvmMBYSZ0dGmq5l02Ww4Ak3RcvrII7yrjyFU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tdZMo2jQOf6CfkeaFHtvGYepNTgr5VOqVDeE0AViaAfpDwxkfl7bUBtWuU96XqGCU
	 1nUa+p5FRNf5Bim+KHpiQPXMOUcGo52Sn+rFWHE+wDUfQfa5uAWRsBzDCgygViiT8A
	 n4KxNebWl0fa8OVr1OnNcgZquyoehPfY+LHRasf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54BBDF804F3;
	Wed,  8 Dec 2021 19:58:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB0BFF804ED; Wed,  8 Dec 2021 19:58:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 86AC7F804CC
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 19:57:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86AC7F804CC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1638989873422719955-webhooks-bot@alsa-project.org>
References: <1638989873422719955-webhooks-bot@alsa-project.org>
Subject: vxloader: no VX-compatible cards found VX222v2
Message-Id: <20211208185801.EB0BFF804ED@alsa1.perex.cz>
Date: Wed,  8 Dec 2021 19:58:01 +0100 (CET)
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

alsa-project/alsa-tools issue #9 was opened from LGCW:

I have an AMD AM4 motherboard with two legacy PCI slots. The bridge uses the ASMedia ASM1083. Running vxloader produces the following error. 

```
vxloader 
vxloader: no VX-compatible cards found

vxloader -D hw:0
vxloader: cannot open hwdep hw:0
```
If it's anything like the 9632 the firmware has to be loaded in order to function?  Best I can tell Debian 11 sees the card. 

```
lsmod | grep vx
snd_vx222              24576  0
snd_vx_lib             57344  1 snd_vx222
snd_pcm               147456  2 snd_hdsp,snd_vx_lib
snd                   110592  8 snd_seq_device,snd_hwdep,snd_hdsp,snd_timer,snd_vx_lib,snd_vx222,snd_pcm,snd_rawmidi
```

```
cat /proc/asound/card0/vx-status
Digigram VX222/v2 at 0xf100 & 0xf000, irq 25
Xilinx Firmware: Loaded
Device Initialized: Yes
DSP audio info: realtime linear8 linear16 linear24
Input Source: Analog
Clock Mode: Internal
Clock Source: Internal
Frequency: 48000
Detected Frequency: 0
Detected UER type: Not Present
Min/Max/Cur IBL: 252/2016/252 (granularity=126)
```
I noticed hdsploader picked it up as well.  
```
hdsploader 
hdsploader - firmware loader for RME Hammerfall DSP cards
Looking for HDSP + Multiface or Digiface cards :
Card 0 : Digigram VX222/v2 at 0xf100 & 0xf000, irq 25
Card 1 : RME Hammerfall HDSP 9632 at 0xf7400000, irq 27
```

Issue URL     : https://github.com/alsa-project/alsa-tools/issues/9
Repository URL: https://github.com/alsa-project/alsa-tools
