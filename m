Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD1xKBP4pmmgawAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Tue, 03 Mar 2026 16:02:43 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1961F1F63
	for <lists+alsa-devel@lfdr.de>; Tue, 03 Mar 2026 16:02:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5493260241;
	Tue,  3 Mar 2026 16:02:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5493260241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772550162;
	bh=2P2uwG2grQvHPX/IGAFkagB8LV1VkAQrIzhDaLaKvMw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=pG2oUquaCvnssBBPysc3n8FMLaKELtAfE/e7WgUm8Wlx/CMsjUXu82YXF7HVglPJb
	 jaikB3cg2pt52E0PlJqZ1UxFKwoCyBiggykZmVQmwuKk+SFLg2BWLrwt7eeikupPK4
	 ZwBE79GYel472hmDcAzme0AxTzX9OQ3nMs3d+zXk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A574F80633; Tue,  3 Mar 2026 16:01:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C4ABF80636;
	Tue,  3 Mar 2026 16:01:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56468F804B4; Tue,  3 Mar 2026 16:01:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_FAIL,
	SPF_HELO_NONE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id D0031F8015B
	for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2026 16:01:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0031F8015B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18995ce80c622200-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-lib/pr/494@alsa-project.org>
References: <alsa-project/alsa-lib/pr/494@alsa-project.org>
Subject: control: ucm: add ioctl to retrieve full card components
Date: Tue,  3 Mar 2026 16:01:26 +0100 (CET)
Message-ID-Hash: ND3X5TZUJXWAZXXIWZMRK75SEEJQMMJ5
X-Message-ID-Hash: ND3X5TZUJXWAZXXIWZMRK75SEEJQMMJ5
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: BB1961F1F63
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
	NEURAL_HAM(-0.00)[-0.961];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo]
X-Rspamd-Action: no action

alsa-project/alsa-lib pull request #494 was edited from mstrozek:

The fixed-size components field in SNDRV_CTL_IOCTL_CARD_INFO can be too small on systems with many audio devices. The kernel [1] will provide a new ioctl to read the full string while truncating the original in card_info if it grows too big. Make sure alsa-lib can read the full string if the original is truncated.

[1] [link to v3](https://lore.kernel.org/all/20260303145815.9930-1-mstrozek@opensource.cirrus.com/)

Request URL   : https://github.com/alsa-project/alsa-lib/pull/494
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/494.patch
Repository URL: https://github.com/alsa-project/alsa-lib
