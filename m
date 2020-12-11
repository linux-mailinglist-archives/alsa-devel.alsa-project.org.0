Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFF42D7B40
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 17:47:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E93EE1718;
	Fri, 11 Dec 2020 17:46:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E93EE1718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607705258;
	bh=YSR75pMBMTqN/lF4Fvp+RqHlJ0CqrK2ViNV7RppMhpg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lGDapoCC5bnrmWaNIcCIO1bJCTL4Ik6Q0n7thaDEqKJHIY14wjXzDNsDf5jGlrXsL
	 aTf7rWTzTiQ9rEh6/9x/NM/ECnn1/fHFd2WtqnvtjmF5GBchJeXnYya6heFOfDSg9K
	 Y5iVVrb5sQ/D9RNxulNFd2c7Bsx6PhGtkY7bbCmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A1BAF801D8;
	Fri, 11 Dec 2020 17:46:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1699F8020D; Fri, 11 Dec 2020 17:46:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54FF3F80105
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 17:45:49 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4A19BA003F;
 Fri, 11 Dec 2020 17:45:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4A19BA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1607705148; bh=NTqm40kP0NmRlKWojQZACpkwi44CF+kYTmqIRj1PxfI=;
 h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
 b=KqWisNEVe2+XfejuBhSgaX2QMOjexZU0YCiGtpRosLohxkCaICPNNX+XRfTk9ScEn
 Xkr0Cp0zLN2vF5Bs0J8kJHuJwwEuxhe7axOyJISXqOnD+KC+AzShW3BjUAhHe+0kdT
 ZQEpEFy9TsqqxDiMZORzvJCiw966ZYfa5K12x/tg=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 11 Dec 2020 17:45:46 +0100 (CET)
Subject: Re: [PATCH] alsactl: Skip restore during the lock
To: ALSA development <alsa-devel@alsa-project.org>
References: <20201211083804.800-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <a9bd692e-a55f-f068-b78d-1429a587307e@perex.cz>
Date: Fri, 11 Dec 2020 17:45:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201211083804.800-1-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>
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

Dne 11. 12. 20 v 9:38 Takashi Iwai napsal(a):
> Currently alsactl-restore tries to initialize the device when an error
> is found for restore action.  But this isn't the right behavior in the
> case where the lock is held; it implies that another alsactl is
> running concurrently, hence you shouldn't initialize the card at the
> same time.  The situation is found easily when two alsactls get
> started by both udev and systemd (note that those two invocations are
> the designed behavior, see /usr/lib/udev/rules.d/78-sound-cards.rules
> for details).
> 
> This patch changes load_state() not to handle the initialization if
> the locking fails.

The operation should serialize in this case (there's limit of 10 seconds which
should be enough to finish the initialization). The state_lock() function
should return -EBUSY when the file is locked (and I'm fine to change the
behaviour from 'init' to 'skip' for this lock state).

It seems that -EEXIST is returned when the lock file exists, but the
open(file, O_CREAT|O_EXCL, 0644) caller has not enough priviledges to access
this file when another user owns the file.

But alsactl from /lib/udev/rules.d/90-alsa-restore.rules and
/lib/systemd/system/alsa-restore.service should be run as root, right?

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
