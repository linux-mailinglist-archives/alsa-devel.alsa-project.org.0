Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD2060817A
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 00:28:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 875015D5F;
	Sat, 22 Oct 2022 00:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 875015D5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666391315;
	bh=RMZeO645L3PBHV1YiHLs0v6q9zvSW/uzhW0pcAGoooQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L+BaZmzKuYQJChma6j8kVZuRbhB6xdJ4jj1GiKzxO3NGFRgGfz5DXwcMonHPFVLCM
	 0uNF3zGcx1TTmkvXjHzYjLtFViSh5CsLFNiNPCfQkk9NV7xJCvndC6mcZo5w0sjOoa
	 6NtKFViYKnqZ6ACIA1Q/DsJtVNrv04m7skZhbUpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06EA7F80256;
	Sat, 22 Oct 2022 00:27:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53DB4F80134; Sat, 22 Oct 2022 00:27:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 4FBBAF800B8
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 00:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FBBAF800B8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1666391253116882086-webhooks-bot@alsa-project.org>
References: <1666391253116882086-webhooks-bot@alsa-project.org>
Subject: Using snd_device_name_hint() with iface "card"
Message-Id: <20221021222739.53DB4F80134@alsa1.perex.cz>
Date: Sat, 22 Oct 2022 00:27:39 +0200 (CEST)
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

alsa-project/alsa-lib issue #277 was edited from MathisMARION:

Hello,

I have been experimenting with the `alsa` library, and I tried to use the `snd_device_name_hint()` function to print information about devices. It doesn't seem documented [here](https://www.alsa-project.org/alsa-doc/alsa-lib/group___control.html) so I looked up for examples online, and explored the source code as well.

Looking at the [source code](https://github.com/alsa-project/alsa-lib/blob/master/src/control/namehint.c#L582), it seems like the function should be able to take `"card"` as a valid interface. However when I run this function, it returns `ENOENT`. I ran my program with `gdb` and found that [this call](https://github.com/alsa-project/alsa-lib/blob/master/src/control/namehint.c#L639) to `add_card()` was returning the error. `add_card` calls `snd_config_search` which loops through a list to find a match. In my case I found out that the list contained `"cards"` (with an `s`), while the code was searching for `"card"` so I am left wondering if this was done on purpose. Moreover I can get info about my sound cards using `/proc/asound/cards` (with an `s` again) so it makes me doubt even more...

I am running Ubuntu 20.04.5, and have installed `libasound2-dev` version `1.2.2-2.1ubuntu2.5`. I can give more info about my setup if needed, I am just unsure what other info would help as of right now.

Here's a simple program reproducing my issue:
```c
#include <alsa/asoundlib.h>
#include <stdio.h>

int main()
{
    void **hints;
    int ret;

    ret = snd_device_name_hint(-1, "card", &hints);
    if (ret) {
        printf("snd_device_name_hint: %s\n", snd_strerror(ret));
        return EXIT_FAILURE;
    }
    snd_device_name_free_hint(hints);
    return EXIT_SUCCESS;
}
```
```
snd_device_name_hint: No such file or directory
```
Putting `"cards"` instead results in `EINVAL`:
```
snd_device_name_hint: Invalid argument
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/277
Repository URL: https://github.com/alsa-project/alsa-lib
