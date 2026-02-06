Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNs7HZoRhmk1JgQAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Fri, 06 Feb 2026 17:06:50 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FFE100067
	for <lists+alsa-devel@lfdr.de>; Fri, 06 Feb 2026 17:06:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51A9E601E0;
	Fri,  6 Feb 2026 17:06:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51A9E601E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1770394009;
	bh=dTcq7BwjJbtjqDdrrwwTc9MW6WU4DxkfbaP6ZlwlYc0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=PpExjjDVKWUE61lD8pOeIDTJtUpeTmRFw8IKqP5ZL8CDMIkl2MDwXsHs3yS0+58r7
	 UikrWndgmeJ3FplN7M63AeAS332twalEyOnjOso7j2qVIDSqqa9IIsI5XjdiBGlV2h
	 T0fSgeZoiSPFfmMJ2jjzIaPhUOoIrsGbRC9kZodA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D51C0F805ED; Fri,  6 Feb 2026 17:06:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81050F805E8;
	Fri,  6 Feb 2026 17:06:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8B48F804F3; Fri,  6 Feb 2026 17:05:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 26EC1F8016E
	for <alsa-devel@alsa-project.org>; Fri,  6 Feb 2026 17:05:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26EC1F8016E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1891b3ec6dd39e00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/703@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/703@alsa-project.org>
Subject: alsa-ucm-conf upstream update
Date: Fri,  6 Feb 2026 17:05:59 +0100 (CET)
Message-ID-Hash: Q4ZMDBMWAEKSTH3MYHGFGPCXIRIBJC7T
X-Message-ID-Hash: Q4ZMDBMWAEKSTH3MYHGFGPCXIRIBJC7T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q4ZMDBMWAEKSTH3MYHGFGPCXIRIBJC7T/>
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
	NEURAL_HAM(-0.00)[-0.912];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:helo,alsa0.perex.cz:rdns]
X-Rspamd-Queue-Id: F1FFE100067
X-Rspamd-Action: no action

alsa-project/alsa-ucm-conf pull request #703 was opened from jackpot51:

Updates to latest version in Ubuntu 26.04, should be compatible with 22.04 and 24.04.

It would be good to do audio testing of:

- thelio-mega-r2: Upstreamed :heavy_check_mark: 
- thelio-r3: Not upstreamed :x:
- thelio-b5: Not upstreamed :x:
- thelio-major-r5: Not upstreamed :x: 
- thelio-r4: Upstreamed :heavy_check_mark:

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/703
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/703.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
