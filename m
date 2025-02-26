Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB251A466B2
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2025 17:35:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 769C7602EE;
	Wed, 26 Feb 2025 17:34:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 769C7602EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740587708;
	bh=ihAGjhn7+c4jOZplW2qkbiH50bnTaRar+a9cA87RRgQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=hlbEM2YOYzYWs4QLDzdAGYTPWBU8uSYJ/SxrTFMAD0tgXkU5l6JsvnDx0VQ0wlXPU
	 Gesfbjj2/jqpyOBzE1cQMdFcMeIoKYzgtd6tQDH/WGoaivWzMQqNQd/lQ7z510KhVR
	 h63RPIUHdBqBdBy8VGpV7JYU7sgOm2OedLUd80o8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 282E4F805CA; Wed, 26 Feb 2025 17:34:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72560F805B4;
	Wed, 26 Feb 2025 17:34:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10D78F8016E; Wed, 26 Feb 2025 17:34:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D7EBF80116
	for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2025 17:33:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D7EBF80116
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1740587635831308842-webhooks-bot@alsa-project.org>
References: <1740587635831308842-webhooks-bot@alsa-project.org>
Subject: Potential incorrect argument to snd_seq_port_info_set_ump_group in
 seqmid.c
Message-Id: <20250226163400.10D78F8016E@alsa1.perex.cz>
Date: Wed, 26 Feb 2025 17:34:00 +0100 (CET)
Message-ID-Hash: L7K5HUUBDJHQLOLLM2CU24T7TBFEDV5C
X-Message-ID-Hash: L7K5HUUBDJHQLOLLM2CU24T7TBFEDV5C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L7K5HUUBDJHQLOLLM2CU24T7TBFEDV5C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #440 was opened from reuk:

https://github.com/alsa-project/alsa-lib/blob/df8f1cc1ec9d9ee15be5e2c23ad25b9389fd8766/src/seq/seqmid.c#L585-L589

I think this call in seqmid.c is incorrect. According to the docs, the second argument to `snd_seq_port_info_set_ump_group` should be a 1-based group number (probably 0 for the UMP endpoint).

I'm testing on Fedora 41 with alsa-lib-devel 1.2.13-3.fc41, and I'm seeing the following printed to the console when I call `snd_seq_create_ump_endpoint`:

```
ALSA lib seqmid.c:592:(snd_seq_create_ump_endpoint) Failed to create MIDI 2.0 port
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/440
Repository URL: https://github.com/alsa-project/alsa-lib
