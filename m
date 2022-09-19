Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C78D5BD654
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 23:25:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7780846;
	Mon, 19 Sep 2022 23:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7780846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663622722;
	bh=mTiFigv/JZpWDshV7ji9WU4jNfeA8aOADy+LLrcdldk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g+gTCBQbRwMIZ6j7X5dFccCmvBJ8GbsDi7Xw2Nv+yzkgrNNw+Rw57bcj2ydLTuddX
	 FhDkqgQKfqSjWqIPWjVeihgyrjTG/L8QjRuzb7/EukqrTsRRnMMR+6036U8HV/YXic
	 sGc/5M4uT5GpG2jk+ycozID094GRJ07uC3vDYJh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BCA9F800E5;
	Mon, 19 Sep 2022 23:24:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A834AF8023A; Mon, 19 Sep 2022 23:24:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 662AEF800E5
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 23:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 662AEF800E5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1663622629266396046-webhooks-bot@alsa-project.org>
References: <1663622629266396046-webhooks-bot@alsa-project.org>
Subject: Alsa - has invalid interface number
Message-Id: <20220919212416.A834AF8023A@alsa1.perex.cz>
Date: Mon, 19 Sep 2022 23:24:16 +0200 (CEST)
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

alsa-project/alsa-lib issue #271 was opened from smangels:

hi,
I'm running the latest ArchLinux installation using a Behringer Flow8 as my main audio interface. Today I'm running into an issue where the USB audio hardware can not be loaded successfully.

```
[ 1690.797522] usb 1-3.1.1.4: new high-speed USB device number 14 using xhci_hcd
[ 1690.891936] usb 1-3.1.1.4: config 1 has an invalid interface number: 7 but max is 5
[ 1690.891940] usb 1-3.1.1.4: config 1 has no interface number 5
[ 1690.892620] usb 1-3.1.1.4: New USB device found, idVendor=1397, idProduct=050d, bcdDevice= 2.10
[ 1690.892624] usb 1-3.1.1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=6
[ 1690.892627] usb 1-3.1.1.4: Product: FLOW 8
[ 1690.892628] usb 1-3.1.1.4: Manufacturer: Behringer
[ 1690.892630] usb 1-3.1.1.4: SerialNumber: 18-04-ED-FB-BE-A0
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/271
Repository URL: https://github.com/alsa-project/alsa-lib
