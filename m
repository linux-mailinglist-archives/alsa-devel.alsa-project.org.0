Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNhAFM70hGlb7AMAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Feb 2026 20:51:42 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F30DBF6F04
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Feb 2026 20:51:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 704B46014D;
	Thu,  5 Feb 2026 20:51:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 704B46014D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1770321100;
	bh=SuVAF+Q3tHU29LTXtRDIInVYF+tEIniy3dogdLcPRaI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=u3f4ySkizRUqMV5Gwh+FRxynHjI9M1ej1YZwmB4M/tesJxfmFHmvbwE6OoAMkNEO4
	 ViPFBycxBHS2fcZhqp3UBo4sEj6DjiLGaGBrH6mb5uYoStJ5dKDtdnw7kWBHV9gKjV
	 VxSRKywgY86z2h1W9klhhJZdhJ/poGO6jgScoOE0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED3E7F805EA; Thu,  5 Feb 2026 20:51:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B8D4F805EA;
	Thu,  5 Feb 2026 20:51:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DB02F8051E; Thu,  5 Feb 2026 20:46:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_FAIL,SPF_HELO_NONE
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A9383F8016E
	for <alsa-devel@alsa-project.org>; Thu,  5 Feb 2026 20:46:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9383F8016E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1891715ff53e2200-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/702@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/702@alsa-project.org>
Subject: USB-Audio: MOTU M6 - fix playback channels
Date: Thu,  5 Feb 2026 20:46:42 +0100 (CET)
Message-ID-Hash: D55GYFPJHGUJTXWQQZTIPK2JM3XOCDKW
X-Message-ID-Hash: D55GYFPJHGUJTXWQQZTIPK2JM3XOCDKW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D55GYFPJHGUJTXWQQZTIPK2JM3XOCDKW/>
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
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	TO_DOM_EQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[github@alsa-project.org,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:helo,alsa0.perex.cz:rdns,alsa-project.org:mid,alsa-project.org:dkim]
X-Rspamd-Queue-Id: F30DBF6F04
X-Rspamd-Action: no action

alsa-project/alsa-ucm-conf pull request #702 was opened from puleglot:

There is only one incorrect instance of playback HWChannels. Fix it.

Closes: #700

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/702
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/702.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
