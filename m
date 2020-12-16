Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 733D72DBFB2
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Dec 2020 12:48:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 242D317B6;
	Wed, 16 Dec 2020 12:48:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 242D317B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608119333;
	bh=oIonlnBwQ5leszyRqKsuqDCr80b6Vyg+EQeBLtouAOk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g4w4WAJgQXM7BF4ukJbxKPsBeiaklmffmLfq6CSxK0g2aQL3Iu2gXvaRCWs1SIOA1
	 Z1BlVd7Irx1kbK0H0mr85oXtm8YuowDE95x8Z8PFGgFWiXshgep4agCf9ioxq1ci3s
	 bX7dEYaMuT5RlH8lnsGyuVX6aRHYCpl1Bjay5to0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A8DBF801F7;
	Wed, 16 Dec 2020 12:47:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F2F1F80245; Wed, 16 Dec 2020 12:47:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81FA4F80171
 for <alsa-devel@alsa-project.org>; Wed, 16 Dec 2020 12:47:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81FA4F80171
Received: from [222.130.141.103] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1kpVGv-0004bq-CA; Wed, 16 Dec 2020 11:47:10 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de, perex@perex.cz,
 kai.vehmanen@linux.intel.com
Subject: [RFC][PATCH v2 0/1] design a way to change audio Jack state by
 software
Date: Wed, 16 Dec 2020 19:46:27 +0800
Message-Id: <20201216114628.35739-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

the changes in the V2:
 - using debugfs instead of sysfs
 - using jack_ctrl to create a folder instead of snd_jack, since ASoC drivers
   could create multi jack_ctrls within a snd_jack
 - create a folder for each jack_ctrl instead for all jack_ctrls

This is the layout of folder on a machine with 2 sound cards:
root@hwang4-ThinkPad-P1-Gen-3:/sys/kernel/debug# tree /sys/kernel/debug/sound-core/
/sys/kernel/debug/sound-core/
├── card0
│   ├── HDMI!DP,pcm=10 Jack
│   │   ├── jackin_inject
│   │   └── sw_inject_enable
│   ├── HDMI!DP,pcm=11 Jack
│   │   ├── jackin_inject
│   │   └── sw_inject_enable
│   ├── HDMI!DP,pcm=3 Jack
│   │   ├── jackin_inject
│   │   └── sw_inject_enable
│   ├── HDMI!DP,pcm=7 Jack
│   │   ├── jackin_inject
│   │   └── sw_inject_enable
│   ├── HDMI!DP,pcm=8 Jack
│   │   ├── jackin_inject
│   │   └── sw_inject_enable
│   └── HDMI!DP,pcm=9 Jack
│       ├── jackin_inject
│       └── sw_inject_enable
└── card1
    ├── HDMI!DP,pcm=3 Jack
    │   ├── jackin_inject
    │   └── sw_inject_enable
    ├── HDMI!DP,pcm=4 Jack
    │   ├── jackin_inject
    │   └── sw_inject_enable
    ├── HDMI!DP,pcm=5 Jack
    │   ├── jackin_inject
    │   └── sw_inject_enable
    ├── Headphone Jack
    │   ├── jackin_inject
    │   └── sw_inject_enable
    ├── Headset Jack
    │   ├── jackin_inject
    │   └── sw_inject_enable
    └── Mic Jack
        ├── jackin_inject
        └── sw_inject_enable

The sw_inject_enable has rw mode, the jackin_inject has write_only mode.

If users want to inject a plugin to Headphone Jack, they could run:
echo 1 > 'Headphone Jack'/sw_inject_enable  /* now, this jack state can't be changed by hw events */
cat 'Headphone Jack'/sw_inject_enable
ack: Headphone Jack		Inject Enabled: 1
echo 1 > 'Headphone Jack'/jackin_inject /* this will inject a plugin to Headphone Jack */

After testing, run
echo 0 > 'Headphone Jack'/sw_inject_enable /* the hw events will change the jack state */

Hui Wang (1):
  alsa: jack: implement software jack injection via debugfs

 include/sound/core.h |   2 +
 sound/core/init.c    |   7 ++
 sound/core/jack.c    | 202 ++++++++++++++++++++++++++++++++++++-------
 sound/core/sound.c   |   8 ++
 4 files changed, 188 insertions(+), 31 deletions(-)

-- 
2.25.1

