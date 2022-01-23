Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFA8497007
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jan 2022 06:40:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A825339CD;
	Sun, 23 Jan 2022 06:39:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A825339CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642916427;
	bh=Hql/Pq7xpSpjjTFSDCqUiUZsN55itbnerW4lPhp3gVY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d/Ilvj/kznOSaJBfdnLGfFU6ICGw9wETXI9ctBNcNBdb7+TNTFUOnwVBcS5WXTLFO
	 x/i6o8RV3YL4NgSNbxap1hYjdt8f8ZAIiAHL8n2ixECa8amPXrcK1DnSVQ6QGjOOmy
	 NgNMXBDOozXSoxYKimKhoCFQKGUZZ/Txqckh12Fc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26426F804B0;
	Sun, 23 Jan 2022 06:39:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C79CF802E3; Sun, 23 Jan 2022 06:39:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D1606F80161
 for <alsa-devel@alsa-project.org>; Sun, 23 Jan 2022 06:39:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1606F80161
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1642916356213004112-webhooks-bot@alsa-project.org>
References: <1642916356213004112-webhooks-bot@alsa-project.org>
Subject: HP Spectre X360 fails to find soundcard
Message-Id: <20220123053919.4C79CF802E3@alsa1.perex.cz>
Date: Sun, 23 Jan 2022 06:39:19 +0100 (CET)
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

alsa-project/alsa-ucm-conf issue #135 was opened from bornmw:

HP Spectre x360 Convertible 13t-aw200

Vanilla kernel 5.16.2
alsa-ucm-conf-1.2.6.3
alsa-lib-1.2.6.1
alsa-utils-1.2.6
pulseaudio-15.0

[pulseverbose.log](https://github.com/alsa-project/alsa-ucm-conf/files/7919861/pulseverbose.log)

A combination of these commands plays noise successfully:
alsaucm -c sof-soundwire set _verb HiFi set _enadev Speaker
speaker-test -Dhw:0,2 -c2 -r48000


$ aplay -Ll
null
    Discard all samples (playback) or generate zero samples (capture)
pulse
    PulseAudio Sound Server
upmix
    Plugin for channel upmix (4,6,8)
vdownmix
    Plugin for channel downmix (stereo) with a simple spacialization
sysdefault:CARD=sofsoundwire
    sof-soundwire, 
    Default Audio Device
usbstream:CARD=sofsoundwire
    sof-soundwire
    USB Stream Output
**** List of PLAYBACK Hardware Devices ****
card 0: sofsoundwire [sof-soundwire], device 0: Headphone (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: sofsoundwire [sof-soundwire], device 2: SDW1-speakers (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: sofsoundwire [sof-soundwire], device 5: HDMI1 (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: sofsoundwire [sof-soundwire], device 6: HDMI2 (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: sofsoundwire [sof-soundwire], device 7: HDMI3 (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: sofsoundwire [sof-soundwire], device 8: HDMI4 (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/135
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
