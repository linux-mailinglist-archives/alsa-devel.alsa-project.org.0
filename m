Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFXKIAPmo2lmRgUAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Sun, 01 Mar 2026 08:08:51 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B381CEB80
	for <lists+alsa-devel@lfdr.de>; Sun, 01 Mar 2026 08:08:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70CD26020B;
	Sun,  1 Mar 2026 08:08:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70CD26020B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772348929;
	bh=2LIGwtGGnl9kapoXGiN2OVxsaWNvU4TNW2CmJGytLvU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Xwhb5+y4+iH19Y4IUPXPJWc4Iyp37WsKLqUvktAV+lpQ3oBJmbCdsxHrRjplnDH40
	 gsrW5i5zov9p64hty7YPF/dtIhwe38mK02T7kmrCJSz4UjDIdIdRaw7hI+/8luWc5A
	 onxHQPOcXhqIIoVYQxHC42cI4E9dHvAN/Ojfj1wA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81EF6F805E8; Sun,  1 Mar 2026 08:08:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 983B8F805E5;
	Sun,  1 Mar 2026 08:08:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB299F80524; Sun,  1 Mar 2026 08:04:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A208EF8045D
	for <alsa-devel@alsa-project.org>; Sun,  1 Mar 2026 08:04:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A208EF8045D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1898a5bd497fa300-webhooks-bot@alsa-project.org>
In-Reply-To: <1898a5bd48340300-webhooks-bot@alsa-project.org>
References: <1898a5bd48340300-webhooks-bot@alsa-project.org>
Subject: ~/.config
Date: Sun,  1 Mar 2026 08:04:57 +0100 (CET)
Message-ID-Hash: RIPQWCY2HFWKQPMJMGAQBW3DNYEJHSO4
X-Message-ID-Hash: RIPQWCY2HFWKQPMJMGAQBW3DNYEJHSO4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RIPQWCY2HFWKQPMJMGAQBW3DNYEJHSO4/>
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
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:helo,alsa0.perex.cz:rdns]
X-Rspamd-Queue-Id: 20B381CEB80
X-Rspamd-Action: no action

alsa-project/alsa-ucm-conf issue #710 was opened from beatboxa:

Alsa has a long history, and I think as a result, there may be some approaches that may predate some of today's standards.

For example, I don't believe there are any configs stored in ~/.config/ like most other modern applications use.  Even alsa's overall standard user config is ~/.asoundrc 

This may make sense as alsa is a lower-level hardware driver; however with ucm it approaches the user space and has some overlap with systems like pipewire or pulseaudio.

Therefore, I'd like to recommend considering allowing ucm channel mappings to be stored in ~/.config/, which would override systemwide ucm mappings.  Perhaps it could be hierarchical, where the system looks for configs in:

- first looks at system directories (eg. /usr/share/alsa or /etc/alsa)
- then ~/.asoundrc   (for legacy compatibility)
- then ~/.config/alsa

Such that ~/.config/alsa is the override for the others.  Particularly for ucm2 (eg. ~/.config/alsa/ucm2/), since this is designed for the user/application layer.

One major benefit would be in surviving system or alsa package upgrades.  One challenge might be in order of operations, as downstream systems like pipewire/wireplumber or pulseaudio or jack often rely on alsa; however I believe these would still end up picking up user configs.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/710
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
