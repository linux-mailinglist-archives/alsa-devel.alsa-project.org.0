Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A261A871F9
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Apr 2025 14:50:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C471B66D56;
	Sun, 13 Apr 2025 14:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C471B66D56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744548634;
	bh=X1uHqD5/wkbCsfpwxxouOoSxvFU2eMHNdaWypDtxlf4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nkBPBb9oWqr50X2Zldcr6kCeaofNLoyYi777668PzSn7xjnKpDOypJMCsmyD50Qcx
	 r/JS0cpnlyNDJyx7TF4Mme6nEX+MELl1vH7kIQVUXkfjLS7xN66QnZg31ZmlNjV1Zt
	 Ai8Ofp1f/hnuCg7i54ayO/WifoqglMFi9c2Nb8cQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27D39F805B5; Sun, 13 Apr 2025 14:50:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED80EF805BF;
	Sun, 13 Apr 2025 14:50:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE8B1F8016B; Sun, 13 Apr 2025 14:48:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 216EDF800D2
	for <alsa-devel@alsa-project.org>; Sun, 13 Apr 2025 14:48:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 216EDF800D2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1835e1a0d2c45500-webhooks-bot@alsa-project.org>
In-Reply-To: <1835e1a0d217ae00-webhooks-bot@alsa-project.org>
References: <1835e1a0d217ae00-webhooks-bot@alsa-project.org>
Subject: On output devices, `snd_pcm_open()` makes a bad loud tick.
Date: Sun, 13 Apr 2025 14:48:36 +0200 (CEST)
Message-ID-Hash: EP4Z6ZK5RMZ6ECJAWZ3J7NFRRQJSUJ7A
X-Message-ID-Hash: EP4Z6ZK5RMZ6ECJAWZ3J7NFRRQJSUJ7A
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EP4Z6ZK5RMZ6ECJAWZ3J7NFRRQJSUJ7A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #451 was opened from ewtoombs:

Minimal reproduction:

```
#include <alsa/asoundlib.h>
#include <stdbool.h>
int main(int argc, const char **argv)
{
    snd_pcm_t *out;
    assert(snd_pcm_open(&out,
                "default",    // the name of the device being opened
                SND_PCM_STREAM_PLAYBACK, // it is an output stream
                false         // iff nonblocking stream
                ) == 0);
}
```
(Compile with `gcc -o test test.c -lasound`.)

Relevant `lspci`:
```
00:1f.3 Audio device: Intel Corporation Sunrise Point-LP HD Audio (rev 21)
```

`uname`:
```
Linux robert 6.13.8-arch1-1 #1 SMP PREEMPT_DYNAMIC Sun, 23 Mar 2025 17:17:30 +0000 x86_64 GNU/Linux
```

alsa-lib version: 1.2.13-1 (archlinux)

I've heard similar artefacts on many different sound cards, though, across many different architectures, always on linux.
One must wait about five minutes in between trials, or the artefact does not occur.

This isn't a minor detail.
The tick is very loud.
It might even damage speakers in a worst case scenario.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/451
Repository URL: https://github.com/alsa-project/alsa-lib
