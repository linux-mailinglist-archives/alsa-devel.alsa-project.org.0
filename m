Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F01383B201A
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 20:16:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63C1284D;
	Wed, 23 Jun 2021 20:15:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63C1284D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624472192;
	bh=pKNq6YFw89wchrPp7mx6cGyG36yfgb00ET3ctuRFtiQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dQaxoNZA8iN2MuhVFUifPN7s7pcY11kgBg/yr8GeQLOECuAjodsLjPywk2t6bGwrS
	 UQdnxeUALy3dq8ZEu2TA9TODOeGG0hHP/dAHy5S0FNdHlSm8IZFA8M6VSVzXqM8M+W
	 ZBN3INI324oHHqxs0549Eh9WQ4jX+B2MXRSeYhRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98D9EF801D5;
	Wed, 23 Jun 2021 20:15:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 628C8F8016D; Wed, 23 Jun 2021 20:15:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 0CDEEF800B5
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 20:14:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CDEEF800B5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1624472088770561934-webhooks-bot@alsa-project.org>
References: <1624472088770561934-webhooks-bot@alsa-project.org>
Subject: 1.2.5 now prefixing devices with "_ucm0001."
Message-Id: <20210623181502.628C8F8016D@alsa1.perex.cz>
Date: Wed, 23 Jun 2021 20:15:02 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #104 was opened from craftyguy:

I'm using a ucm2 config that is not yet upstream (see [1]), and 1e6297b650114cb2e043be4c677118f971e31eb7 has caused devices to get renamed; they are now prefixed with `_ucm0001.`:

alsaucm json output from 1.2.4:

```
...
  "Verbs": {
    "HiFi": {
      "Comment": "Default",
      "Devices": {
        "Handset": {
          "Comment": "Handset",
          "ConflictingDevices": [
            "Speaker",
            "Headphones"
          ],
          "Values": {
            "CaptureCTL": "hw:L5",
            "PlaybackCTL": "hw:L5",
            "PlaybackChannels": "2",
            "PlaybackPCM": "hw:L5,0",
            "PlaybackPriority": "100",
            "PlaybackSwitch": "name='Speaker Switch'",
            "PlaybackVolume": "name='Speaker Volume'"
          }
        },
...
```


alsaucm json output from 1.2.5:

```
...
  "Verbs": {
    "HiFi": {
      "Comment": "Default",
      "Devices": {
        "Handset": {
          "Comment": "Handset",
          "ConflictingDevices": [
            "Speaker",
            "Headphones"
          ],
          "Values": {
            "CaptureCTL": "_ucm0001.hw:L5",
            "PlaybackCTL": "_ucm0001.hw:L5",
            "PlaybackChannels": "2",
            "PlaybackPCM": "_ucm0001.hw:L5,0",
            "PlaybackPriority": "100",
            "PlaybackSwitch": "name='Speaker Switch'",
            "PlaybackVolume": "name='Speaker Volume'"
          }
        },
...
```

This breaks things [like pulseaudio config](https://source.puri.sm/Librem5/librem5-base/-/blob/pureos/byzantium/default/audio/pulse/librem5.pa) that expects specific device names. Was this renaming intentional?

cc @agx

1. https://source.puri.sm/Librem5/librem5-base/-/tree/pureos/byzantium/default/audio/ucm2/Librem_5

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/104
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
