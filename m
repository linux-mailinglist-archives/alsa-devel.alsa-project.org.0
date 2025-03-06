Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1042A54D08
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Mar 2025 15:09:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B621B603E4;
	Thu,  6 Mar 2025 15:09:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B621B603E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741270150;
	bh=epMvAYU/UtwfnujXe+Mq+BOubbWU8OizsAnfZRrgc10=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Xn3/wbTBXGsCiQOObHxxExT6lc83rqU1/UzfToYp6dqedifefM4DnqZTO8gFf5dVK
	 av+UsxEruTVbfcQwa87u7NfzyOZK3Nw3Te0oG8gMxUGLnnUWQwj5U2vpVH7p1SyAeB
	 9ZSMZOFVkvmugAZ0MIiSQj1Q7VafIh+kke+7bCzc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64BC1F805B6; Thu,  6 Mar 2025 15:08:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF23FF80589;
	Thu,  6 Mar 2025 15:08:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1421F804B0; Thu,  6 Mar 2025 15:08:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 33E7CF80152
	for <alsa-devel@alsa-project.org>; Thu,  6 Mar 2025 15:08:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33E7CF80152
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1741270089765899658-webhooks-bot@alsa-project.org>
References: <1741270089765899658-webhooks-bot@alsa-project.org>
Subject: Midi Ports are ambiguously named after some alsa update,
 should be distinct.
Message-Id: <20250306140821.F1421F804B0@alsa1.perex.cz>
Date: Thu,  6 Mar 2025 15:08:21 +0100 (CET)
Message-ID-Hash: 5NRTR7W4XYGZX75WDNCIWP73Z65TGEF5
X-Message-ID-Hash: 5NRTR7W4XYGZX75WDNCIWP73Z65TGEF5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5NRTR7W4XYGZX75WDNCIWP73Z65TGEF5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #442 was opened from Thrilled-Oaf:

Greetings~.

I'm on Slackware, which is a pretty languid, laid back distro... so I have to admit that I don't know when this happened...
But I recently updated it, cause I bought a new midi keyboard, a launchkey mk4, and it should have a 'DAW' port, both on its USB connection and the classic pinned midi cable thing.

But instead, aconnect -i and all that just gives me 
```
client 24: 'Launchkey MK4 61' [type=kernel,card=2]
    0 'Launchkey MK4 61 Launchkey MK4 '
    1 'Launchkey MK4 61 Launchkey MK4 '
```

I actually use JACK audio on top of alsa but even without jack, this still occurs.
I can sort of pretty print this for JACK but it would be best to have this working properly at the very base... cause if I disable all alsa seq/raw support from JACK, then DAWs like ardour won't even see any midi ports anymore.

I also tried being 'clever' and loading `snd-seq-dummy`  and setting up some routing that way... didn't work.
Then I actually edited the source file for the dummy device to specifically give me a properly named DAW port if the index of the dummy port was like, 3 or something. 
And while the naming worked, it was ultimately ...not able to help out with this issue.

What is basically assumed by many clients, including the configuration utility `components` for the keyboard is that it has a distinguishable second midi port with a DAW suffix, thus...this is what `aconnect -i` should ideally show.

```
client 24: 'Launchkey MK4 61' [type=kernel,card=2]
    0 'Launchkey MK4 61 Launchkey MK4 '
    1 'Launchkey MK4 61 Launchkey MK4 DAW'
```

I think I read an email somewhere that alsa might be running into a name length limit, but ...perhaps there's a way to configure this? 
If not through a configuration file, then maybe somewhere in the source itself...?

I am not shy about that but I would need directions...100% lol. 

I also looked up other issues here and some talk about portaudio and mixxx and stuff but this is definitely a system wide issue for me.
And so sad too, it's a text descriptor... a text label of all things... bringing the mighty ALSA to its knees.
A measly, peasly, text label for a little bittle MIDI port... 

I tried udev too but ...that was utterly fruitless due to my lack of knowledge/skill... but this all should signal that I'm willing to put in some work, too.
I just don't know what to do anymore. maybe .asoundrc but all the examples are about PCM and my PCM cards work fine, it's just this MIDI ambiguity thing...

Kernel:
` 6.12.17 #1 SMP PREEMPT_DYNAMIC Thu Feb 27 15:22:43 CST 2025 x86_64 AMD Ryzen 7 2700 Eight-Core Processor AuthenticAMD GNU/Linux`

All the alsa related packages on my system (many are third party but compiled by me)
```
alsa-lib-1.2.13-x86_64-2
alsa-oss-1.1.8-x86_64-3
alsa-plugin-jack-1.2.5-x86_64-1SBo-git
alsa-plugins-1.2.12-x86_64-2
alsa-plugins-compat32-1.2.12-x86_64-2compat32
alsa-tools-1.0.28-x86_64-1ponce
alsa-utils-1.2.13-x86_64-3
alsamixergui-0.9.0rc2-x86_64-2_SBo
bluez-alsa-3.1.0-x86_64-2ponce
zita-alsa-pcmi-0.3.2-x86_64-1alien
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/442
Repository URL: https://github.com/alsa-project/alsa-lib
