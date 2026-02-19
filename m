Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PeSHZoVl2kRugIAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Feb 2026 14:52:26 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0863815F41A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Feb 2026 14:52:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AA7360216;
	Thu, 19 Feb 2026 14:52:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AA7360216
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1771509145;
	bh=JVMiNE+AKgubBuDghWz0YkBh66uQJsP5TLVlN2RD1dA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=JRpWV59Cvusnlog93d3FAr5rJYMoKXS3IuOnCErdfc5fAsE0kAKUSige2xVArUmZO
	 1W235LwhHl9eDWIJqx6KOrk7cqJNl5RKMM99O6gcNNAj8TWZ2bafT4znyGNPEIKSL2
	 61pSS2hFEJz36ogZv4cL50TfRRzMnqcm+FHLruPs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45134F805E5; Thu, 19 Feb 2026 14:51:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCE20F80568;
	Thu, 19 Feb 2026 14:51:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B69D3F804F2; Thu, 19 Feb 2026 14:50:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,SPF_FAIL,SPF_HELO_NONE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 214D4F80162
	for <alsa-devel@alsa-project.org>; Thu, 19 Feb 2026 14:50:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 214D4F80162
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1895aa11aefc8600-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-lib/pr/494@alsa-project.org>
References: <alsa-project/alsa-lib/pr/494@alsa-project.org>
Subject: control: ucm: add ioctl to retrieve full card components
Date: Thu, 19 Feb 2026 14:50:25 +0100 (CET)
Message-ID-Hash: WGYZMBOWK2A3UCT43PIAIITVWEQU6FYN
X-Message-ID-Hash: WGYZMBOWK2A3UCT43PIAIITVWEQU6FYN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WGYZMBOWK2A3UCT43PIAIITVWEQU6FYN/>
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
X-Rspamd-Queue-Id: 0863815F41A
X-Rspamd-Action: no action

alsa-project/alsa-lib pull request #494 was edited from mstrozek:

The fixed-size components field in SNDRV_CTL_IOCTL_CARD_INFO can be too small on systems with many audio devices. The kernel [1] will provide a new ioctl to read the full string while truncating the original in card_info if it grows too big. Make sure alsa-lib can read the full string if the original is truncated.

[1] link to v3

Request URL   : https://github.com/alsa-project/alsa-lib/pull/494
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/494.patch
Repository URL: https://github.com/alsa-project/alsa-lib
