Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA72548323
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 11:40:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28F2D1758;
	Mon, 13 Jun 2022 11:39:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28F2D1758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655113228;
	bh=f17WY8WdbJdbKnJcuptdfrkdV3G0k9BWWfPTtOnI3+k=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ilTCIC5G5RSW2yzeyPnrqmXlIpy9trw5L30QdpRmpzoh36p4Z8pyiE3XLiIE7rMF6
	 Nl+rtMWyX790a38aOVONySNBfBUTqlhNFBrk0m+pFsxbxlSyj2maEB7ygcFcepCGUk
	 TPaTgrIdQGekA0ABFOs3XRrumBg+B6SATPGJTSEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 990CFF804CC;
	Mon, 13 Jun 2022 11:39:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4402F804C1; Mon, 13 Jun 2022 11:39:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3EFC0F800D8
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 11:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EFC0F800D8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1655113162277198076-webhooks-bot@alsa-project.org>
References: <1655113162277198076-webhooks-bot@alsa-project.org>
Subject: ucm2: add ALC4080 ID for Asus Z690-I Gaming Wifi
Message-Id: <20220613093926.A4402F804C1@alsa1.perex.cz>
Date: Mon, 13 Jun 2022 11:39:26 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #169 was opened from brenmous:

```
inxi -M
Machine:
  Type: Desktop System: ASUS product: N/A v: N/A serial: <superuser required>
  Mobo: ASUSTeK model: ROG STRIX Z690-I GAMING WIFI v: Rev 1.xx
    serial: <superuser required> UEFI: American Megatrends v: 1403
    date: 03/30/2022
```
```
aplay -l
**** List of PLAYBACK Hardware Devices ****
card 1: HDMI [HDA ATI HDMI], device 3: HDMI 0 [27GL850]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: HDMI [HDA ATI HDMI], device 7: HDMI 1 [HDMI 1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: HDMI [HDA ATI HDMI], device 8: HDMI 2 [HDMI 2]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: HDMI [HDA ATI HDMI], device 9: HDMI 3 [HDMI 3]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: HDMI [HDA ATI HDMI], device 10: HDMI 4 [HDMI 4]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: HDMI [HDA ATI HDMI], device 11: HDMI 5 [HDMI 5]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 3: Audio [USB Audio], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 3: Audio [USB Audio], device 1: USB Audio [USB Audio #1]
  Subdevices: 0/1
  Subdevice #0: subdevice #0
card 3: Audio [USB Audio], device 2: USB Audio [USB Audio #2]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 3: Audio [USB Audio], device 3: USB Audio [USB Audio #3]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```
Card 3 is ALC4080
```
udevadm info -a -p /sys/class/sound/card3 | grep idVendor -m1
ATTRS{idVendor}=="0b05"
udevadm info -a -p /sys/class/sound/card3 | grep idProduct -m1
ATTRS{idProduct}=="1a20"
```

Rear panel line out and front panel headphone now work. Jack detection also working properly. Haven't tested any of the other inputs/outputs as I don't have suitable devices.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/169
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/169.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
