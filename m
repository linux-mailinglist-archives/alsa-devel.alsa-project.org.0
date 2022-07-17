Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A90095775B0
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jul 2022 12:17:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44E191765;
	Sun, 17 Jul 2022 12:16:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44E191765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658053048;
	bh=Y8fMmeSIYM3BB5CV35ozshyU5VyFro6D6+2qoDBgluA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k3d0nkC0IBWKAurLs0bFWqFNPhcy86Gjxa8e61oyTePWEVxpz67ofvI656DS+dol6
	 hZLHKkvv6fTsH6uKueBXURQdl6feVEVyeqm53jGT6hJqRKO+dO1FIaKdsLnCWlpoQ6
	 YQKaeJzhfC+MnqbrJbJ99NyJKA0dH4wGbjh+4CLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABE89F80171;
	Sun, 17 Jul 2022 12:16:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEBB4F8015B; Sun, 17 Jul 2022 12:16:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A5A8F800CB
 for <alsa-devel@alsa-project.org>; Sun, 17 Jul 2022 12:16:19 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A7431A0040;
 Sun, 17 Jul 2022 12:16:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A7431A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1658052978; bh=4qymXpBcc3qSOwbGuZNjR7Wt/7jjVjLBVIkzVz8jRMw=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=ze8YqTJwaYf2iGErq+3lN2H0CYFIwbmOx5X+jj02fstPugdvoeRpjwdwM+YkymzwX
 Oxy6Ov8oPbMplynVqLNwrqenbuBKGcQe1sqcGRl0H50f6EOv4ns9NG4woFE2iSsIMo
 yYSPgLeUgp0FAIrg9SjJYBz2/iHC2Tz1wPl9kWNc=
Received: from [192.168.88.20] (unknown [95.168.116.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun, 17 Jul 2022 12:16:16 +0200 (CEST)
Message-ID: <2c1e5344-2f59-5e09-96a0-58e0afe7360e@perex.cz>
Date: Sun, 17 Jul 2022 12:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/5] ALSA: Drop async signal support
Content-Language: en-US
To: alsa-devel@alsa-project.org
References: <20220717070549.5993-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20220717070549.5993-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
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

Dne 17. 07. 22 v 9:05 Takashi Iwai napsal(a):
> Hi,
> 
> this is a revised patch set for dropping fasync support from ALSA
> core.
> 
> The async signal itself is very difficult to use properly due to
> various restrictions (e.g. you cannot perform any I/O in the context),
> hence it's a feature that has been never used by real applications.
> 
> OTOH, the real problem is that there have been quite a few syzcaller
> reports indicating that fasync code path may lead to some potential
> deadlocks for long time.  Dropping the feature is the easiest
> solution, obviously.

I would probably prefer to fix the problem (deferred async kill or so). The
SIGIO is just another way to wakeup the applications and there may be some
corner cases, where this wakeup is usable (threaded apps). Note that we had
some users (or testers) of SIGIO in past (at least there were questions about
this support).

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
