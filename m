Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62742607BF2
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 18:17:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAD76B765;
	Fri, 21 Oct 2022 18:16:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAD76B765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666369060;
	bh=BVouGW6GoGfiBtkM4adOWKngijfuGX1uMaiyEPP9ouE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I4PT8YBWxZ3d2T8j/ao/wwcjXST0mDy7xYl47xiyvEs1Vsp475pfKAicySeOXs76k
	 +ooJ8VbYobIM9XeTg41O5DWQSO1jFDnsX+gh6OPl/paGMzaqNSlJz6DimX7CzdV5PX
	 GhzJhNB2rG6SM5YGzR9aIESl8tm9Bh/yHF3h2ftM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F150F80256;
	Fri, 21 Oct 2022 18:16:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7880F8021D; Fri, 21 Oct 2022 18:16:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6B442F80118
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 18:16:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B442F80118
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1666369000775527000-webhooks-bot@alsa-project.org>
References: <1666369000775527000-webhooks-bot@alsa-project.org>
Subject: alsactl restore udev rule failing
Message-Id: <20221021161643.B7880F8021D@alsa1.perex.cz>
Date: Fri, 21 Oct 2022 18:16:43 +0200 (CEST)
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

alsa-project/alsa-utils issue #175 was opened from rnhmjoj:

It seems the udev rule to restore card settings is always failing during the boot:
```
$ journalctl -u systemd-udevd -b -o cat --grep alsa
controlC2: Process '/sbin/alsactl restore 2' failed with exit code 99.
controlC2: Process '/sbin/alsactl restore 2' failed with exit code 99.
controlC1: Process '/sbin/alsactl restore 1' failed with exit code 99.
controlC0: Process '/sbin/alsactl restore 0' failed with exit code 99.
```
I checked and made sure the file system is mounted and /var/lib/asound.state is ok by the time the rule runs.
I guess the issue could be the hardware is not yet fully initialised.

Somehow the settings of card 0 (HDA Intel PCH) are restored anyway, but not those of card 2 (HDA ATI HDMI).
Manually running `alsactl restore 2` later works, albeit partially (some softvol controls are never recovered).

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/175
Repository URL: https://github.com/alsa-project/alsa-utils
