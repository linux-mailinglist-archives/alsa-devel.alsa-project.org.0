Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4D6291876
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Oct 2020 19:02:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58CA61791;
	Sun, 18 Oct 2020 19:01:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58CA61791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603040562;
	bh=bhb2XMRfCPTvvdJ1t3SS39o3yijqIoKerXOz+/D7kbg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pYtCjYWm6tqUEyOUiWGI2d9Jfl49OhVqy2c+DfuIfe/eb/QgNSb4jGBGy6SVIHFdx
	 jjfvVv0bNAA4eMDvzGaZp6EoBswspnM9nxkXC7HZgsHdoNSALzEH4rfQ9OPGcJnyF8
	 TauWvQOch3Bi/vDP5V9rjiRPy+xga8UPZOo6sfMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07914F8014D;
	Sun, 18 Oct 2020 19:01:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FA11F801F2; Sun, 18 Oct 2020 19:00:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B3C36F80111
 for <alsa-devel@alsa-project.org>; Sun, 18 Oct 2020 19:00:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3C36F80111
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1603040447351521969-webhooks-bot@alsa-project.org>
References: <1603040447351521969-webhooks-bot@alsa-project.org>
Subject: dcef48f "add support for AMD acp microphone devices" can break
 pulseaudio
Message-Id: <20201018170059.5FA11F801F2@alsa1.perex.cz>
Date: Sun, 18 Oct 2020 19:00:59 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #54 was opened from danielrparks:

I recently upgraded alsa-ucm-conf from 1.2.3 to 1.2.4 on Arch Linux, and now pulseaudio fails to initialize my sound card.
This system is a Dell Inspiron 7405 with a Ryzen 7 4700U and a Realtek ALC3204 sound card. The microphone is handled by the audio co-processor.
Pulseaudio generates the following error:
```
Failed to find a working profile.
Failed to load module "module-alsa-card" (argument: "device_id="1" name="pci-0000_03_00.6" card_name="alsa_card.pci-0000_03_00.6" namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no deferred_volume=yes use_ucm=yes avoid_resampling=no card_properties="module-udev-detect.discovered=1""): initialization failed.
```
[notworking-journal.txt](https://github.com/alsa-project/alsa-ucm-conf/files/5397852/notworking-journal.txt)
[working-pacmd-list-sinks.txt](https://github.com/alsa-project/alsa-ucm-conf/files/5397853/working-pacmd-list-sinks.txt)

I did a git bisect and got this:
```
dcef48f13d4f5db79b006755074940b94730a883 is the first bad commit
commit dcef48f13d4f5db79b006755074940b94730a883
Author: Jaroslav Kysela <perex@perex.cz>
Date:   Wed Jun 24 13:39:07 2020 +0200

    HDA-Intel: add support for AMD acp microphone devices
    
    - move the generic HDA code from sof-hda-dsp to HDA-Intel
    - add generic codecs/hda/hdmi.conf
    
    Signed-off-by: Jaroslav Kysela <perex@perex.cz>

 ucm2/HDA-Intel/HDA-Capture-value.conf   |   4 +
 ucm2/HDA-Intel/HDA-Intel.conf           |  28 +++++++
 ucm2/HDA-Intel/Hdmi.conf                |  37 +++++++++
 ucm2/HDA-Intel/HiFi-acp.conf            |   8 ++
 ucm2/HDA-Intel/HiFi-analog.conf         | 133 +++++++++++++++++++++++++++++++
 ucm2/HDA-Intel/HiFi.conf                |  32 ++++++++
 ucm2/HDA-Intel/init.conf                |  39 +++++++++
 ucm2/codecs/hda/hdmi.conf               |  25 ++++++
 ucm2/module/lib/linked.conf             |   3 +
 ucm2/module/snd_acp3x_rn.conf           |   1 +
 ucm2/sof-hda-dsp/HDA-Capture-value.conf |   4 -
 ucm2/sof-hda-dsp/Hdmi.conf              |  78 +++++-------------
 ucm2/sof-hda-dsp/HiFi.conf              | 135 +-------------------------------
 13 files changed, 331 insertions(+), 196 deletions(-)
 create mode 100644 ucm2/HDA-Intel/HDA-Capture-value.conf
 create mode 100644 ucm2/HDA-Intel/HDA-Intel.conf
 create mode 100644 ucm2/HDA-Intel/Hdmi.conf
 create mode 100644 ucm2/HDA-Intel/HiFi-acp.conf
 create mode 100644 ucm2/HDA-Intel/HiFi-analog.conf
 create mode 100644 ucm2/HDA-Intel/HiFi.conf
 create mode 100644 ucm2/HDA-Intel/init.conf
 create mode 100644 ucm2/codecs/hda/hdmi.conf
 create mode 100644 ucm2/module/lib/linked.conf
 create mode 120000 ucm2/module/snd_acp3x_rn.conf
 delete mode 100644 ucm2/sof-hda-dsp/HDA-Capture-value.conf
```

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/54
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
