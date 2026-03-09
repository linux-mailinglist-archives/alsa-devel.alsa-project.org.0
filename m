Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLWoI9K1rmkSHwIAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Mon, 09 Mar 2026 12:58:10 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA122384A4
	for <lists+alsa-devel@lfdr.de>; Mon, 09 Mar 2026 12:58:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 193896028A;
	Mon,  9 Mar 2026 12:57:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 193896028A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1773057489;
	bh=KTN9zqsPBZXmLFVvSEJKqCxK4eB5dr8m1pPbm/GE6Ys=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RMnQnkOE4APH/F79ogDpUU4KZ38sOx5xpYj6ZLFYNEdCE7mSwZFH1DhDo1xazZ0Rz
	 wjjROoR4HlNwZzUAZ5+xtat4Ivn9R7DTHIMHkh+cMqjekI7jzAQAoUNjKtUA8D+lMr
	 vJOFKKDyKBfutMAGENanbTDxR0r4c9u0m1I+Zk/8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CE30F805ED; Mon,  9 Mar 2026 12:57:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0A05F805EA;
	Mon,  9 Mar 2026 12:57:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E58E7F80571; Mon,  9 Mar 2026 12:57:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A0605F80071
	for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2026 12:57:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0605F80071
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <189b2a59ae270000-webhooks-bot@alsa-project.org>
In-Reply-To: <189b2a59ae008400-webhooks-bot@alsa-project.org>
References: <189b2a59ae008400-webhooks-bot@alsa-project.org>
Subject: Add UCM2 profile for Lenovo Legion Pro 7 16IAX10H (ALC287,
 Subsystem ID 0x17aa3907)
Date: Mon,  9 Mar 2026 12:57:25 +0100 (CET)
Message-ID-Hash: YZMQMBALXQYBDNYQP2OZ7GCKGEKHJQIB
X-Message-ID-Hash: YZMQMBALXQYBDNYQP2OZ7GCKGEKHJQIB
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; emergency; member-moderation;
 nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size;
 news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZMQMBALXQYBDNYQP2OZ7GCKGEKHJQIB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 2AA122384A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[alsa-project.org,none];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	TO_DOM_EQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[github@alsa-project.org,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo]
X-Rspamd-Action: no action

alsa-project/alsa-ucm-conf issue #717 was opened from someoneKeith:

Hardware
- Machine: Lenovo Legion Pro 7 16IAX10H
- CPU: Intel Core Ultra 9 275HX (Meteor Lake)
- Kernel: 6.17.0-14-generic
- OS: Ubuntu 24.04

Audio codec
- Codec: Realtek ALC287
- Vendor ID: 0x10ec0287
- Subsystem ID: 0x17aa3907
- Card ID: PCH

Problem
Internal microphone not detected at all.
No UCM2 profile exists for this subsystem ID.
`pactl list sources short` shows no internal microphone source.
Only USB audio and monitor sources are listed.

Pins detected (via hdajackretask)
- Pin 0x12: Internal Mic
- Pin 0x14: Internal Speaker
- Pin 0x17: Internal Speaker  
- Pin 0x19: Black Mic, Left side (jack)
- Pin 0x21: Black Headphone, Left side

Request
Please add a UCM2 profile for Subsystem ID 0x17aa3907
to enable the internal microphone on this Lenovo Legion model.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/717
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
