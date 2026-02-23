Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBQgAxYznGkKAgQAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Feb 2026 11:59:34 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC731753CA
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Feb 2026 11:59:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C5A0601E5;
	Mon, 23 Feb 2026 11:59:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C5A0601E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1771844371;
	bh=KtY5BDzAiuFYy5HgZkfQmiz/4zZIIOhwXKNTN6e3iqs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=b+bfPoHFk4BYDErbzuoR/oZX2kPpSy5DJOyU9MFxkskiu4bZ1+hte+Fuo6JZfctHG
	 +fgoS0mCKObTPGFgYxoME/+2U/Vcg9Ul1XrREMqqmJHg7Z2IlkVTxwvB2KoaGg1XsL
	 WAFSPmKgxo05gu/LxM/rcFYKJamgqIYkTpwEglOc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDE59F805E6; Mon, 23 Feb 2026 11:59:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84682F8025A;
	Mon, 23 Feb 2026 11:59:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CF22F8025A; Mon, 23 Feb 2026 11:55:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,RCVD_IN_VALIDITY_SAFE_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_FAIL,SPF_HELO_NONE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C8DDF8014E
	for <alsa-devel@alsa-project.org>; Mon, 23 Feb 2026 11:55:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C8DDF8014E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1896dad8703a3200-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/709@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/709@alsa-project.org>
Subject: ucm2: sof-soundwire: Add support for Cirrus Logic CS47L47
Date: Mon, 23 Feb 2026 11:55:34 +0100 (CET)
Message-ID-Hash: JFV4IV4MZVX7JH7ZHSZGKXGVBTW633X7
X-Message-ID-Hash: JFV4IV4MZVX7JH7ZHSZGKXGVBTW633X7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JFV4IV4MZVX7JH7ZHSZGKXGVBTW633X7/>
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
	NEURAL_HAM(-0.00)[-0.979];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:mid,alsa-project.org:dkim]
X-Rspamd-Queue-Id: 6FC731753CA
X-Rspamd-Action: no action

alsa-project/alsa-ucm-conf pull request #709 was opened from rfvirgil:

Add the sof-soundwire and codec files for the CS47L47.

This is a SDCA codec with headphone/headset and digital mic. The configuration is based on the CS42L45 files.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/709
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/709.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
