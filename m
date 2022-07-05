Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CD85671B1
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 16:59:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AA9716F3;
	Tue,  5 Jul 2022 16:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AA9716F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657033197;
	bh=rYtaP6Gn7ucTz2ulHbBzdWodxfbfuhUv5bpUi6Wq5mo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cnNr+18H6GpT2q4AmVONuos+vVl19/t9kOFbVbTZ3ZirGUl/rnXL6RHQkC1InyHEX
	 LGdaWMJPxct+xsKzqNCR2WjUHGNOW8/yVVb7EAOIS5HU5g0/u45ssxIEouLMPatiAH
	 rMRXtCRjIEK6ySwqu/hmAEusOoIAGer/PAKApwo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09F65F800CB;
	Tue,  5 Jul 2022 16:58:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 288E9F800CB; Tue,  5 Jul 2022 16:58:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A3A68F800CB
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 16:58:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3A68F800CB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1657033132968010902-webhooks-bot@alsa-project.org>
References: <1657033132968010902-webhooks-bot@alsa-project.org>
Subject: Scarlett 18i20 USB, USB Audio
Message-Id: <20220705145856.288E9F800CB@alsa1.perex.cz>
Date: Tue,  5 Jul 2022 16:58:56 +0200 (CEST)
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

alsa-project/alsa-topology-conf issue #2 was opened from juanpc2018:

Problems:
$ alsamixer
does Not allow to change SampleRate,
only clock source.

Focusrite Scarlett 18i20mk2 USB, USB Audio
has a Control Software only for OSX and Windows.
works in Wine/PlayOnMac,
but does Not detect the USB device.
sometimes even the Control Software also does Not detect the USB in OSX or Windows.
anyway...

i go to OSX, change the Sample Rate.
96khz,

reboot and go back to Kubuntu 21.10,
Kubuntu changes the SR to 44.1Khz at boot,

problems #2.
SampleRateConverter does Not work well,

if i play a 48khz file in VLC,
does Not play in 44.1Khz SR.

jackd2 can change SampleRate No problems.
VLC has jack output,
but Firefox does Not, unless compied from source with the option in config

anyway..
need to create:
/etc/asound.conf



$ aplay -L

hw:CARD=USB,DEV=0
    Scarlett 18i20 USB, USB Audio
    Direct hardware device without any conversions
plughw:CARD=USB,DEV=0
    Scarlett 18i20 USB, USB Audio
    Hardware device with all software conversions
sysdefault:CARD=USB
    Scarlett 18i20 USB, USB Audio
    Default Audio Device
front:CARD=USB,DEV=0
    Scarlett 18i20 USB, USB Audio
    Front output / input
surround21:CARD=USB,DEV=0
    Scarlett 18i20 USB, USB Audio
    2.1 Surround output to Front and Subwoofer speakers
surround40:CARD=USB,DEV=0
    Scarlett 18i20 USB, USB Audio
    4.0 Surround output to Front and Rear speakers
surround41:CARD=USB,DEV=0
    Scarlett 18i20 USB, USB Audio
    4.1 Surround output to Front, Rear and Subwoofer speakers
surround50:CARD=USB,DEV=0
    Scarlett 18i20 USB, USB Audio
    5.0 Surround output to Front, Center and Rear speakers
surround51:CARD=USB,DEV=0
    Scarlett 18i20 USB, USB Audio
    5.1 Surround output to Front, Center, Rear and Subwoofer speakers
surround71:CARD=USB,DEV=0
    Scarlett 18i20 USB, USB Audio
    7.1 Surround output to Front, Center, Side, Rear and Woofer speakers
iec958:CARD=USB,DEV=0
    Scarlett 18i20 USB, USB Audio
    IEC958 (S/PDIF) Digital Audio Output
dmix:CARD=USB,DEV=0
    Scarlett 18i20 USB, USB Audio
    Direct sample mixing device
usbstream:CARD=USB
    Scarlett 18i20 USB
    USB Stream Output

Issue URL     : https://github.com/alsa-project/alsa-topology-conf/issues/2
Repository URL: https://github.com/alsa-project/alsa-topology-conf
