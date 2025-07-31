Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FBEB17160
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Jul 2025 14:37:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9D2360226;
	Thu, 31 Jul 2025 14:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9D2360226
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753965461;
	bh=bXtzAXPnJGJkDae9yGwlo9h6rsjUumIys5rGtgCRRdc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=GNJev3QJD38y4inwKZ6IBlnF6p1scwXDWsvrbIv4QqI3rdMo/8fLxtWDgWiygg3bW
	 tkoE4dFY+dr7gSHqKq5Fv0L+PssnG10ytRIQia7ICoqIqg8T2HceZddYROpV9e0GEs
	 w+yrt7iNKIzameGL7ieLwtzv818n5akduJH19BLg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDF12F805C9; Thu, 31 Jul 2025 14:37:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D0B1F8025A;
	Thu, 31 Jul 2025 14:37:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE527F8025F; Thu, 31 Jul 2025 14:36:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 40E53F80088
	for <alsa-devel@alsa-project.org>; Thu, 31 Jul 2025 14:36:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40E53F80088
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1857563a3adab700-webhooks-bot@alsa-project.org>
In-Reply-To: <1857563a32607700-webhooks-bot@alsa-project.org>
References: <1857563a32607700-webhooks-bot@alsa-project.org>
Subject: snd_pcm_avail_delay() reporting inaccurate delay values
Date: Thu, 31 Jul 2025 14:36:31 +0200 (CEST)
Message-ID-Hash: MWI26MWJ7W67F3L6DDGUYEPFHX4F6RQZ
X-Message-ID-Hash: MWI26MWJ7W67F3L6DDGUYEPFHX4F6RQZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MWI26MWJ7W67F3L6DDGUYEPFHX4F6RQZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #468 was opened from kv2019i:

The alsa_conformance_test tool (https://chromium.googlesource.com/chromiumos/platform/audiotest/+/HEAD/alsa_conformance_test.md) has recently added support to use snd_pcm_avail_delay() to estimate the actual playback position. This has proven a very useful tool to test ALSA drivers on hardware (like that support by https://github.com/thesofproject/ ) where there is significant buffering in hardware (and hw_ptr can move in bursts).

When testing with high sampling rates, an issue was found where the estimated playback position seemed to go backwards in time, as observed by alsa_conformance_test. This was observed on multiple Intel platform using SOF firmware for DSP. Debugging the kernel driver delay() implementation showed, that driver never reported incorrect delay values, but somehow alsa_conformance_test still observed these. Example log:

```
alsa_conformance_test -P hw:sofnocodec,2 -d 1 -r 96000 -B 480 -c 2 -f S32_LE -p 480 --avail-delay --debug
... 
TIME_DIFF(s)    HW_LEVEL     PLAYED      DELAY       DIFF               RATE
[.. snip ]
0.000999950          960       3324       1476         96       96004.800240
0.000995762          864       3420       1380         96       96408.579560
0.001024820          672       3516       1284         96       93674.986827
0.000987638          621       3613       1187         97       98214.122988
[Notice] frame_diff -1 >= 4096.
0.000049322          576       3612       1188         -1      -20274.928024
# KV: the delay value of 1187 is never reported by driver and it causes the playback position to go backwards in time despite driver reporting the accurate delay correctly
0.000992228          480       3708       1092         96       96751.956204
0.000972403          864       3804       1476         96       98724.500027
0.000998287          768       3900       1380         96       96164.730183
0.000979150          768       3996       1284         96       98044.222029
0.000999349          672       4092       1188         96       96062.536711
0.001018172          480       4188       1092         96       94286.623478
0.000977025          960       4284       1476         96       98257.465264
0.001022131          768       4380       1380         96       93921.424945
0.000977795          768       4476       1284         96       98180.088873
0.001019073          601       4573       1187         97       95184.545170
[Notice] frame_diff -1 >= 4096.
0.000049433          576       4572       1188         -1      -20229.401412
0.000953494          480       4668       1092         96      100682.332558
0.000981225          960       4764       1476         96       97836.887564
0.001025294          768       4860       1380         96       93631.680279
```

When instrumenting alsa-lib snd_pcm_avail_delay() it became apparent the function is calling in middle of a DMA burst (when hw_ptr is moving fast ahead and the "avail" number is changing fast). alsa-lib does two syscalls to read avail and delay, the two values are not in sync and we end up reporting a bogus value. The error is not a big one, but this is enough to fail alsa_conformance_test test plans and push the calculcated standard rate error above acceptance criteria. This could also confuse media players who use this for video lip-sync, although in theory applications should handle this (a 0...3 frame error in delay reporting is not going to make a difference unless negative value breaks the application logic like happens here with alsa_conformance_test).

We can observe the error especially with higher rates (96, 176.4 and 192kHz). This is harder to hit with the more typical 48khz use-cases, and thus maybe has not been hit before.

Versions tested: 1.12.24, 1.12.11

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/468
Repository URL: https://github.com/alsa-project/alsa-lib
