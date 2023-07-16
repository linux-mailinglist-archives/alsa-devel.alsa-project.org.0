Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C3A754E9A
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jul 2023 14:36:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E83D7AE8;
	Sun, 16 Jul 2023 14:35:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E83D7AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689510962;
	bh=0x2P08+l/pbfhSxnyHHr/kyN6kNudGpOV24p+zWSWFk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Fy+b+XzupX30XbROfzeOZ7zmYwu+6dPDCxcIGXTjBvqzRjaqgvqmG0TfMLTxDnZh1
	 SWIMpLnbykSsw6Vlu/4CqUKwGxgnZHO/FA6hvBoBjaXsoGzyl3QTy5wNk+O8WFUVZo
	 qaqr6+ii8snUfi045G/gxu9EkT/qI7xT0FpsyJeQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C88EF8053B; Sun, 16 Jul 2023 14:34:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9F91F8027B;
	Sun, 16 Jul 2023 14:34:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57FD3F8047D; Sun, 16 Jul 2023 14:33:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E5986F8027B
	for <alsa-devel@alsa-project.org>; Sun, 16 Jul 2023 14:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5986F8027B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1689510822921379566-webhooks-bot@alsa-project.org>
References: <1689510822921379566-webhooks-bot@alsa-project.org>
Subject: speaker-test: inconsistent behaviour of --buffer option.
Message-Id: <20230716123344.57FD3F8047D@alsa1.perex.cz>
Date: Sun, 16 Jul 2023 14:33:44 +0200 (CEST)
Message-ID-Hash: 23C4LHHMSFRNFJ3P2N26PHNZ4ROBNDLS
X-Message-ID-Hash: 23C4LHHMSFRNFJ3P2N26PHNZ4ROBNDLS
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/23C4LHHMSFRNFJ3P2N26PHNZ4ROBNDLS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #224 was edited from AndrewAmmerlaan:

Without specifying the `--buffer` option `speaker-test` returns this:

```
andrew@andrew-gentoo-pc ~ % speaker-test -c2 -twav -Dplughw:CARD=PCH,DEV=3

speaker-test 1.2.9

Playback device is plughw:CARD=PCH,DEV=3
Stream parameters are 48000Hz, S16_LE, 2 channels
WAV file(s)
Rate set to 48000Hz (requested 48000Hz)
Buffer size range from 64 to 1048576
Period size range from 32 to 524288
Using max buffer size 1048576
Periods = 4
was set period_size = 262144
was set buffer_size = 1048576
0 - Front Left
1 - Front Right
Write error: -77,File descriptor in bad state
xrun_recovery failed: -77,File descriptor in bad state
Transfer failed: File descriptor in bad state
```

Note that it says `Using max buffer size 1048576`. But now if we try to explicitly specify this maximum buffer size:

```
andrew@andrew-gentoo-pc ~ % speaker-test -c2 -twav -Dplughw:CARD=PCH,DEV=3 --buffer 1048576

speaker-test 1.2.9

Playback device is plughw:CARD=PCH,DEV=3
Stream parameters are 48000Hz, S16_LE, 2 channels
WAV file(s)
Rate set to 48000Hz (requested 48000Hz)
Buffer size range from 64 to 1048576
Period size range from 32 to 524288
Requested buffer time 1000000 us
Periods = 4
was set period_size = 12000
was set buffer_size = 48000
0 - Front Left
1 - Front Right
Time per period = 2.251287
```

Note that now we get `Requested buffer time 1000000 us` which is less then what we actually specified. In fact this will happen with any `--buffer` parameter larger then `1000000`:

```
andrew@andrew-gentoo-pc ~ % speaker-test -c2 -twav -Dplughw:CARD=PCH,DEV=3 --buffer 1000001

speaker-test 1.2.9

Playback device is plughw:CARD=PCH,DEV=3
Stream parameters are 48000Hz, S16_LE, 2 channels
WAV file(s)
Rate set to 48000Hz (requested 48000Hz)
Buffer size range from 64 to 1048576
Period size range from 32 to 524288
Requested buffer time 1000000 us
Periods = 4
was set period_size = 12000
was set buffer_size = 48000
0 - Front Left
1 - Front Right
Time per period = 2.251042
```

Leading me to believe that despite what `speaker-test` claims, `1000000` is actually the maximum, not `1048576`.

Discovered while debugging https://gitlab.freedesktop.org/drm/intel/-/issues/8462
This behaviour of `speaker-test` is confusing though and feels to me like a separate issue.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/224
Repository URL: https://github.com/alsa-project/alsa-utils
