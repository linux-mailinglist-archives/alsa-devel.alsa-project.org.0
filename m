Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F71A24D84
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Feb 2025 11:16:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8615D60184;
	Sun,  2 Feb 2025 11:16:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8615D60184
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738491402;
	bh=C5KiXRE1foEPmoFgDEHqfJSC9/XFFFWY/940oQTQwX4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=aIQbyCLNIpJECEVrq3elNey+cK+pCeuWyyZsc9WC7ZWLzZ7nLvtqt7o3qsfy5NHIO
	 mxCqNSrqlKaYYD3CImNjdrc7wVYqsVZxN4YWaPxzjMxye/ZNpRk5QxW5j4PyEvEOZH
	 90+L6l2aSbc2JAWLtnbcXZsPbUQb+vb1EEqs1K6k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96C89F805BF; Sun,  2 Feb 2025 11:16:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D55B9F805BD;
	Sun,  2 Feb 2025 11:16:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04771F8049C; Sun,  2 Feb 2025 11:15:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 44470F8014B
	for <alsa-devel@alsa-project.org>; Sun,  2 Feb 2025 11:15:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44470F8014B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1738491340635127783-webhooks-bot@alsa-project.org>
References: <1738491340635127783-webhooks-bot@alsa-project.org>
Subject: alsaucm fails with unknown If.Condition.Type
Message-Id: <20250202101545.04771F8049C@alsa1.perex.cz>
Date: Sun,  2 Feb 2025 11:15:45 +0100 (CET)
Message-ID-Hash: JAT5PLRUTMYGCI5HTOOVHHBDREFISWLS
X-Message-ID-Hash: JAT5PLRUTMYGCI5HTOOVHHBDREFISWLS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JAT5PLRUTMYGCI5HTOOVHHBDREFISWLS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #290 was opened from abewieland:

I get the following when running `listcards`:
```
$ alsaucm listcards
ALSA lib ucm_cond.c:367:(if_eval) unknown If.Condition.Type
ALSA lib main.c:1554:(snd_use_case_mgr_open) error: failed to import hw:0 use case configuration -22
ALSA lib parser.c:2978:(uc_mgr_scan_master_configs) Unable to open '-hw:0': Invalid argument
alsaucm: error failed to get card list: Invalid argument
```

Let me know if I can provide any better debugging data. My system is a Dell laptop with Intel Tiger Lake and Realtek ALC3204, if that's helpful.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/290
Repository URL: https://github.com/alsa-project/alsa-utils
