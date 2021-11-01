Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B6F4421F1
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Nov 2021 21:50:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC63716C2;
	Mon,  1 Nov 2021 21:49:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC63716C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635799811;
	bh=uAAoJMZdUnfBG+ydVDwZFL3Frzxxx2jxtnV7vb08AFY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CRhvn/BXg0j7oonjLhcF9JWLba7Le6gnXUCt4b0TXNp2p23F0ADB1B+asyixRqYQz
	 zjZ+D4yriAJLpAEZJOOM+nPeNFNYQfd1+cgx5BiXSkcAegi4uyTgQ6yxf5xs2se3kc
	 BLlfdQ+KeVpXQZX6JGNIFZab7sTxyJvlYF+uMhGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70F95F8026A;
	Mon,  1 Nov 2021 21:48:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85237F80269; Mon,  1 Nov 2021 21:48:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 75CFBF8010A
 for <alsa-devel@alsa-project.org>; Mon,  1 Nov 2021 21:48:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75CFBF8010A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1635799726397581100-webhooks-bot@alsa-project.org>
References: <1635799726397581100-webhooks-bot@alsa-project.org>
Subject: alsatplg broken with musl-libc
Message-Id: <20211101204850.85237F80269@alsa1.perex.cz>
Date: Mon,  1 Nov 2021 21:48:50 +0100 (CET)
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

alsa-project/alsa-lib issue #187 was opened from Johnnynator:

alsatplg feeds empty and non Integer strings to `strtol(3)` and friends. Glibc just silently accepts such inputs and does not set errno and returns 0. Musl sets `errno` to `EINVAL` with such inputs.
This can easily be seen by most of the `alsatplg` invocation when compiling https://github.com/thesofproject/sof/

`STRTOL(3)` manpage explains that this behavior is allowed.
>  The implementation may also set errno to EINVAL in case no conversion
    was performed (no digits seen, and 0 returned).

There are like two ways I see this can be fixed

a) ignore EINVAL (and check if base is correct ourself)
b) make sure that strtol is only getting called with a valid input (I'm not sure if the current behavior is intended to just return 0 if e,g, `tplg_get_unsigned` did not even parse anything valid

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/187
Repository URL: https://github.com/alsa-project/alsa-lib
