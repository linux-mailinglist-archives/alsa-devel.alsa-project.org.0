Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D8A874FE8
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 14:24:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00AF884D;
	Thu,  7 Mar 2024 14:24:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00AF884D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709817884;
	bh=Bw4HU4Tl1OP6J55CeRLQChe2rUzmalbRo+zdkxj5SSA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=CffKSV7BUqPhjw5gk+VQL3qjQAdMeSc+QTHP3/wUUalOrmnh1RHUtf2yRTNtCNsbj
	 iw+EWeRo+B6tqyfOmKRlmh6xKuQTwlIsDAW3C1eLtjZtKfgyzWL/QgByhqcNb4Vss1
	 +unHqu2hxkUJwtkWG5euxmbw72jzxSvWBuBKQ/hk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41671F80578; Thu,  7 Mar 2024 14:24:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD27DF80570;
	Thu,  7 Mar 2024 14:24:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 354B2F8024E; Thu,  7 Mar 2024 14:24:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 8188FF80087
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 14:24:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8188FF80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1709817839083246231-webhooks-bot@alsa-project.org>
References: <1709817839083246231-webhooks-bot@alsa-project.org>
Subject: Strange trigger_htstamp after snd_pcm_drop
Message-Id: <20240307132406.354B2F8024E@alsa1.perex.cz>
Date: Thu,  7 Mar 2024 14:24:06 +0100 (CET)
Message-ID-Hash: OELUWQEAY6J4DS6I3YNPABYE7326IXMM
X-Message-ID-Hash: OELUWQEAY6J4DS6I3YNPABYE7326IXMM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OELUWQEAY6J4DS6I3YNPABYE7326IXMM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #387 was opened from z-s-e:

I have conceptually the following situation (actual code can be found [here](https://gitlab.com/z-s-e/alpe/-/blob/main/src/alpe_alsa.cpp?ref_type=heads#L590)):
```
// sound is currently playing
snd_pcm_status(pcm, pcm_status);
snd_pcm_status_get_htstamp(pcm_status, &ts1);
snd_pcm_drop(pcm);
snd_pcm_status(pcm, pcm_status);
snd_pcm_status_get_trigger_htstamp(status, &ts2);
```
On my hardware I get a `ts2` timestamp that is earlier than `ts1`.  From my understanding that should be impossible, as `ts2` should contain the timestamp of when the drop happened, which should obviously be after `ts1`. Is that a bug or do I misunderstand the meaning of those timestamps?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/387
Repository URL: https://github.com/alsa-project/alsa-lib
