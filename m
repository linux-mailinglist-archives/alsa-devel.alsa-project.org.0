Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C61607C07
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 18:19:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C786A13B;
	Fri, 21 Oct 2022 18:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C786A13B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666369190;
	bh=7P+zb4+mv4eFLJOOonUBc/Td/erVW1g10hlxW4D0nyk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MZjbes6lP7x69jeQb03PHcwfhPPnNbiL3SFKwXacpw5RdYIFWk4hM+CEn2xN94ojk
	 FUwiE6y0lfFx71/fSCy6pfIUBVOLZjqRUvP3poGnWrOJ66w+xUme+f2Lt+/feltOrG
	 EOFV3SVjKNQ7lPlCvSxRNQzAHo4VnSxTlyCKyFf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6184F8021D;
	Fri, 21 Oct 2022 18:18:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD372F8021D; Fri, 21 Oct 2022 18:18:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id ECAD6F800B5
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 18:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECAD6F800B5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1666369130586050987-webhooks-bot@alsa-project.org>
References: <1666369130586050987-webhooks-bot@alsa-project.org>
Subject: alsactl restore udev rule failing
Message-Id: <20221021161854.AD372F8021D@alsa1.perex.cz>
Date: Fri, 21 Oct 2022 18:18:54 +0200 (CEST)
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

alsa-project/alsa-utils issue #175 was edited from rnhmjoj:

It seems the udev rule to restore card settings is always failing during the boot:
```
$ journalctl -u systemd-udevd -b -o cat --grep alsa
controlC2: Process '/sbin/alsactl restore 2' failed with exit code 99.
controlC2: Process '/sbin/alsactl restore 2' failed with exit code 99.
controlC1: Process '/sbin/alsactl restore 1' failed with exit code 99.
controlC0: Process '/sbin/alsactl restore 0' failed with exit code 99.
```
I checked and made sure the file system is mounted and /var/lib/asound.state is ok by the time the rule runs. I guess the issue could be the hardware is not yet fully initialised.

Somehow the settings of card 0 (HDA Intel PCH) are restored anyway, but not those of card 1 (HDA ATI HDMI). Manually running `alsactl restore 2` later works, albeit partially (some softvol controls are never recovered).

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/175
Repository URL: https://github.com/alsa-project/alsa-utils
