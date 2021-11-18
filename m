Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EF0455B68
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 13:19:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 533A41856;
	Thu, 18 Nov 2021 13:18:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 533A41856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637237960;
	bh=9njVvjIhHV7flc3xt2jUR4+TCbLuXTYSsi3UJKIkjJY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=afy/XC9uQDNbREfs+0ToWlqoF+j3cZlTIbrlyYf2z1J71gFVfVgovffWkOa7wV/xl
	 JXkfww2YX2aBFJjlwT0/cpWkW08h8CH4Epghwsja4q6iA37VTCVwCW50Js5cxNgtBb
	 +5PRw8ZqGc1THUWIN44EAu9fIwRENrlvBlmTAUnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED720F8010B;
	Thu, 18 Nov 2021 13:18:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 954FDF80272; Thu, 18 Nov 2021 13:17:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 8001AF800FA
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 13:17:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8001AF800FA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1637237874359411955-webhooks-bot@alsa-project.org>
References: <1637237874359411955-webhooks-bot@alsa-project.org>
Subject: alsa-lib parser.c:242:(error_node) UCM is not supported for this HDA
 model (HDA Intel at 0xfa9f8000 irq 47)
Message-Id: <20211118121759.954FDF80272@alsa1.perex.cz>
Date: Thu, 18 Nov 2021 13:17:59 +0100 (CET)
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

alsa-project/alsa-utils issue #120 was opened from svarshavchik:

I'm using alsa-utils 1.2.5.1 on Fedora 35 (alsa-utils-1.2.5.1-2.fc35.x86_64)

There are two audio devices, built-in audio and a USB audio device.

After a reboot the default audio output gets reset to the USB audio service:

$ pactl get-default-sink
alsa_output.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00.analog-stereo

After resetting it back to built-in audio:

$ pactl set-default-sink alsa_output.pci-0000_00_1b.0.analog-stereo
$ pactl get-default-sink
alsa_output.pci-0000_00_1b.0.analog-stereo

This persists until the next reboot, when it gets reset back to the other device.

While perusing system boot messages the following caught my eye:

Nov 18 07:05:58 monster.email-scan.com systemd[1]: Started Manage Sound Card State (restore and store).
Nov 18 07:05:58 monster.email-scan.com alsactl[3870]: alsactl 1.2.5.1 daemon started
Nov 18 07:05:58 monster.email-scan.com alsactl[3870]: alsa-lib parser.c:242:(error_node) UCM is not supported for this HDA model (HDA Intel at 0xfa9f8000 irq 47)
Nov 18 07:05:58 monster.email-scan.com alsactl[3870]: alsa-lib main.c:1405:(snd_use_case_mgr_open) error: failed to import hw:0 use case configuration -6
Nov 18 07:05:58 monster.email-scan.com alsactl[3870]: alsa-lib main.c:1405:(snd_use_case_mgr_open) error: failed to import hw:1 use case configuration -2

The fedora package starts alsa like this:

/usr/sbin/alsactl -s -n 19 -c -E ALSA_CONFIG_PATH=/etc/alsa/alsactl.conf --initfile=/lib/alsa/init/00main rdaemon

and stops it like this:

/usr/sbin/alsactl -s kill save_and_quit

Stopping/restarting logs the same errors again. Not sure this is related to the default audio device getting reset on boot.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/120
Repository URL: https://github.com/alsa-project/alsa-utils
