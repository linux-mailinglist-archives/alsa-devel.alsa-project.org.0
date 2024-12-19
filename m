Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A22C39F8012
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 17:40:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBF3460259;
	Thu, 19 Dec 2024 17:40:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBF3460259
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734626433;
	bh=O/sx5drJl5SW9rX8oRXw2QX2N7hkgDtfXMqzBMgh69k=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RtdazMFPtojnLhVjfB6vnN5Bjoh5IEj54twjwJOfP4UfATKvjmrNleLs9Xmdq8uyW
	 sb39fm5ktr1vufP7wIzKYjIG/SbVoQOy9O4PatHBwVdBNtpQZjww4QIwznxdjRSj3L
	 y6Vgnqrg3MqCfdGI0DjiwxU4QqEsJHIep14dcfTM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF759F805BE; Thu, 19 Dec 2024 17:39:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7100F805B0;
	Thu, 19 Dec 2024 17:39:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C10DF8014C; Thu, 19 Dec 2024 17:39:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A9BE7F800B0
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 17:39:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9BE7F800B0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1734626391109282494-webhooks-bot@alsa-project.org>
References: <1734626391109282494-webhooks-bot@alsa-project.org>
Subject: CS42L43 headset mic enable/disable not applied when jack insert state
 changes
Message-Id: <20241219163953.9C10DF8014C@alsa1.perex.cz>
Date: Thu, 19 Dec 2024 17:39:53 +0100 (CET)
Message-ID-Hash: YF734UDJASRONMK5CNRVKFS642LBFGJY
X-Message-ID-Hash: YF734UDJASRONMK5CNRVKFS642LBFGJY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YF734UDJASRONMK5CNRVKFS642LBFGJY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #489 was opened from rfvirgil:

Originally the configuration for sof-soundwire/cs42l43*.conf had the headset mic and internal mics on the same ALSA capture device 4. The Headset Mic enable and disable sequences ran as expected when the headset jack was inserted  and removed.

But SOF expects that device 4 is the internal mics, and headset mic should be on device 1. So we made this change to move the headset mic to capture device 1:
https://github.com/alsa-project/alsa-ucm-conf/commit/30989bd0c2aa3f9f4b6f5e393397b39678717f45

But now the Headset Mic enable and disable sequences do not run when the headset jack state changes.
Seen on multiple systems with Pipewire + alsa-ucm + CS42L43 on sof-soundwire.

Example from a system that booted with jack unplugged. The jack was then plugged in. The CS42L43 has reported that the headset mic is present:

```
Simple mixer control 'Headset Mic',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
```

But the enable sequence has not been applied (DP2TX1 and DP2TX2 should have been set to Decimator 1):

```
Simple mixer control 'cs42l43 DP2TX1 Input',0
  Capabilities: enum
  Items: 'None' 'Tone Generator 1' 'Tone Generator 2' 'Decimator 1' 'Decimator 2' 'Decimator 3' 'Decimator 4' 'ASPRX1' 'ASPRX2' 'ASPRX3' 'ASPRX4' 'ASPRX5' 'ASPRX6' 'DP5RX1' 'DP5RX2' 'DP6RX1' 'DP6RX2' 'DP7RX1' 'DP7RX2' 'ASRC INT1' 'ASRC INT2' 'ASRC INT3' 'ASRC INT4' 'ASRC DEC1' 'ASRC DEC2' 'ASRC DEC3' 'ASRC DEC4' 'ISRC1 INT1' 'ISRC1 INT2' 'ISRC1 DEC1' 'ISRC1 DEC2' 'ISRC2 INT1' 'ISRC2 INT2' 'ISRC2 DEC1' 'ISRC2 DEC2' 'EQ1' 'EQ2'
  Item0: 'None'
Simple mixer control 'cs42l43 DP2TX2 Input',0
  Capabilities: enum
  Items: 'None' 'Tone Generator 1' 'Tone Generator 2' 'Decimator 1' 'Decimator 2' 'Decimator 3' 'Decimator 4' 'ASPRX1' 'ASPRX2' 'ASPRX3' 'ASPRX4' 'ASPRX5' 'ASPRX6' 'DP5RX1' 'DP5RX2' 'DP6RX1' 'DP6RX2' 'DP7RX1' 'DP7RX2' 'ASRC INT1' 'ASRC INT2' 'ASRC INT3' 'ASRC INT4' 'ASRC DEC1' 'ASRC DEC2' 'ASRC DEC3' 'ASRC DEC4' 'ISRC1 INT1' 'ISRC1 INT2' 'ISRC1 DEC1' 'ISRC1 DEC2' 'ISRC2 INT1' 'ISRC2 INT2' 'ISRC2 DEC1' 'ISRC2 DEC2' 'EQ1' 'EQ2'
  Item0: 'None'
```

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/489
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
