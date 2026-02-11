Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ILIBudvjGlsoAAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Feb 2026 13:02:47 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EE61240DA
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Feb 2026 13:02:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ECEE601D9;
	Wed, 11 Feb 2026 13:02:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ECEE601D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1770811358;
	bh=kbLCRSLMtiQPxJIHlyLlnhrdA6kF5eN5WoLmnZQEPD4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uOYhehJKzvO0pqjI1vJzX6SsRAyAwFlxkdlsBpmfMEgXkkgHxBtq/Tgb3OybwKF2z
	 c5TODAk99zvHxWUsz/WUD7QohNOV+GyF4Hu/LRzfMrJN1akvMh8zbyuFwKx3nuKM5x
	 ebnvD1ld0WhZU5zDW0meFvdy/41wsj0JdlvcNcI8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82819F805EE; Wed, 11 Feb 2026 13:02:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E5CAF805E8;
	Wed, 11 Feb 2026 13:02:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68850F8049C; Wed, 11 Feb 2026 12:59:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id B65ACF800BD
	for <alsa-devel@alsa-project.org>; Wed, 11 Feb 2026 12:59:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B65ACF800BD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - reopened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18932f6348ca5c00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/665@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/665@alsa-project.org>
Subject: ucm2: sof-soundwire: Add support for CS42L43B variant
Date: Wed, 11 Feb 2026 12:59:51 +0100 (CET)
Message-ID-Hash: YVQHCMPWNBR4XD7EVNREJLPCR44J5AKG
X-Message-ID-Hash: YVQHCMPWNBR4XD7EVNREJLPCR44J5AKG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YVQHCMPWNBR4XD7EVNREJLPCR44J5AKG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[alsa-project.org,none];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	TAGGED_RCPT(0.00)[alsa-devel];
	TO_DOM_EQ_FROM_DOM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github@alsa-project.org,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:mid,alsa-project.org:dkim,alsa0.perex.cz:helo,alsa0.perex.cz:rdns]
X-Rspamd-Queue-Id: 57EE61240DA
X-Rspamd-Action: no action

alsa-project/alsa-ucm-conf pull request #665 was reopened from mstrozek:

>From UCM point of view CS42L43B codec adds 2 new decimators and removes a control to change Decimator 1 mode from base CS42L43. Thus reuse CS42L43 files, and guard the CS42L43B additions behind a condition that the new Decimator controls exist.

Link: https://lore.kernel.org/all/20251219100235.1247053-1-mstrozek@opensource.cirrus.com/

Set as Draft PR until kernel support is merged.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/665
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/665.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
