Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABA55E7B8C
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 15:12:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2ECB3E7;
	Fri, 23 Sep 2022 15:11:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2ECB3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663938752;
	bh=gRo/SZQGH/d3keT/BjBthckDAptxQYZ+AlsxQWLu5nM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=otd+ZpamgrFjr/77dlM0Arf2x3Uz2F3WeNnwwuEUq6TBs6CUvEMKrSZCLfoFrQteu
	 Hk0gdFlZkNHGz2FAy94hnXXFBIiwhK5OoCPU7M7KUkEBPmVv8Wt1buafW+915wr9f4
	 lWbFpIpxTgVe6o/wdHPH06mGe/VJyh0RIam3PtQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FDAAF80107;
	Fri, 23 Sep 2022 15:11:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A01D1F80269; Fri, 23 Sep 2022 15:11:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 85036F80107
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 15:11:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85036F80107
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1663938688009516001-webhooks-bot@alsa-project.org>
References: <1663938688009516001-webhooks-bot@alsa-project.org>
Subject: [Allen & Heath Qu-Pac] regression since 0.3.53+ / no audio inputs
 unless
 manual selection of config profile ("Pro") in pulse audio control
Message-Id: <20220923131134.A01D1F80269@alsa1.perex.cz>
Date: Fri, 23 Sep 2022 15:11:34 +0200 (CEST)
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

alsa-project/alsa-lib issue #272 was opened from ianhundere:

<!-- If you are filing this issue with a regular release please try master as it might already be fixed. -->

- PipeWire version (`pipewire --version`):
    - `0.3.58` but also experienced with `0.3.53`, `0.3.55` and `0.3.56`. did not experience this prior to `0.3.53`.
- Distribution and distribution version (`PRETTY_NAME` from `/etc/os-release`):
    - `Pop!_OS 22.04 LTS`
- Desktop Environment: 
    - `GNOME 42.3.1`
- Kernel version (`uname -r`):  
    - `5.19.0-76051900-generic`

## Description of Problem:
have to manually set audio profile in pulse audio control.

## How Reproducible:
reset interface / no inputs in daw (bitwig 4.3.2)

### Steps to Reproduce:

1.  reset interface (allen heath qupac)
1.  go to pulse audio control 
1.  unselect pro / reselect pro

errors:

`journalctl --no-hostname --user -u pipewire `
```
Jul 30 14:39:43 systemd[1618]: Started PipeWire Multimedia Service.
Jul 30 14:39:43 pipewire[1635]: spa.alsa: hw:acp: Rate doesn't match (requested 44100, got 48000)
Jul 30 14:39:43 pipewire[1635]: spa.alsa: hw:acp: Rate doesn't match (requested 44100, got 48000)
Jul 30 14:39:43 pipewire[1635]: spa.alsa: hw:acp: Rate doesn't match (requested 44100, got 48000)
Jul 30 14:40:42 pipewire[1635]: spa.alsa: hw:3,0: snd_pcm_start: Broken pipe
Jul 30 14:40:42 pipewire[1635]: spa.audioadapter: 0x56374b3cf218: can't send command 2: Broken pipe
Jul 30 14:40:42 pipewire[1635]: pw.node: (alsa_input.usb-Allen_Heath_Ltd_QU-PAC-01.pro-input-0-110) suspended -> error (Start error: Broken>
```

then i unselect / reselect "Pro" via pulseaudio volume control:
```
Jul 30 22:54:35 pipewire[1632]: pw.link: 0x55618e69d5d0: one of the nodes is in error out:error in:suspended
Jul 30 22:54:35 pipewire[1632]: pw.link: 0x55618e69e200: one of the nodes is in error out:error in:suspended
Jul 30 22:54:35 pipewire[1632]: spa.alsa: hw:3,0: snd_pcm_start: Broken pipe
Jul 30 22:54:35 pipewire[1632]: spa.audioadapter: 0x55618e007e58: can't send command 2: Broken pipe
Jul 30 22:54:35 pipewire[1632]: spa.alsa: hw:3,0: snd_pcm_start: Broken pipe
Jul 30 22:54:35 pipewire[1632]: spa.audioadapter: 0x55618e007e58: can't send command 2: Broken pipe
Jul 30 22:54:35 pipewire[1632]: spa.alsa: hw:3,0: snd_pcm_start: Broken pipe
Jul 30 22:54:35 pipewire[1632]: spa.audioadapter: 0x55618e007e58: can't send command 2: Broken pipe
Jul 30 22:54:36 pipewire[1632]: spa.alsa: hw:3,0: snd_pcm_start: Broken pipe
Jul 30 22:54:36 pipewire[1632]: spa.audioadapter: 0x55618e007e58: can't send command 2: Broken pipe
Jul 30 22:54:36 pipewire[1632]: spa.alsa: hw:acp: Rate doesn't match (requested 44100, got 48000)
Jul 30 22:54:36 pipewire[1632]: spa.alsa: hw:3,0: snd_pcm_start: Broken pipe
Jul 30 22:54:36 pipewire[1632]: spa.audioadapter: 0x55618e007e58: can't send command 2: Broken pipe
Jul 30 22:54:36 pipewire[1632]: spa.alsa: hw:3,0: snd_pcm_start: Broken pipe
Jul 30 22:54:36 pipewire[1632]: spa.audioadapter: 0x55618e007e58: can't send command 2: Broken pipe
Jul 30 22:54:46 pipewire[1632]: spa.alsa: hw:3,0: follower delay:520 target:256 thr:256, resync
```

### Actual Results:
no audio from external inputs 

### Expected Results:
you shouldn't need to reselect a profile

# Additional Info (as attachments):

 - more info: https://github.com/pop-os/pipewire/issues/16, https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2567

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/272
Repository URL: https://github.com/alsa-project/alsa-lib
