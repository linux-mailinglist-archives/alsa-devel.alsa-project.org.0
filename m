Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAe4LBFImGnYFAMAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Feb 2026 12:40:01 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB52167522
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Feb 2026 12:40:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E5346020F;
	Fri, 20 Feb 2026 12:39:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E5346020F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1771587599;
	bh=s9Pm6o86b3AByAF9BmIpLlHSi8OSzaPy+nNW1wwy0ds=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=TV1aymODctgjyNP5O+QlBgGGxF6b+P30vbTHy1MY868GUxgdWKH8lmPA2dj65WZ/I
	 I65eBJ3zRO1mWZwW7OQwX6v3Q3qMA3IomwTJHv5zBEEvBMOPqaP9Pu734jQuy85xjQ
	 +cmri+sInJ+UFgFpxs6m/TIkeC5/a8gQaseD0lXU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A19FDF8057A; Fri, 20 Feb 2026 12:39:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B26DAF8026A;
	Fri, 20 Feb 2026 12:39:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEC75F8026A; Fri, 20 Feb 2026 12:38:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 1285DF800F3
	for <alsa-devel@alsa-project.org>; Fri, 20 Feb 2026 12:38:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1285DF800F3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1895f1766c757300-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-lib/pr/496@alsa-project.org>
References: <alsa-project/alsa-lib/pr/496@alsa-project.org>
Subject: fix discards const from pointer target
Date: Fri, 20 Feb 2026 12:38:52 +0100 (CET)
Message-ID-Hash: 3V2BB3CVY5TNPITFXUCJ75W2P6EJOOO4
X-Message-ID-Hash: 3V2BB3CVY5TNPITFXUCJ75W2P6EJOOO4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3V2BB3CVY5TNPITFXUCJ75W2P6EJOOO4/>
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
	NEURAL_HAM(-0.00)[-0.986];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url,alsa-project.org:mid,alsa-project.org:dkim]
X-Rspamd-Queue-Id: 5BB52167522
X-Rspamd-Action: no action

alsa-project/alsa-lib pull request #496 was opened from heitbaum:

Since glibc-2.43:

For ISO C23, the functions bsearch, memchr, strchr, strpbrk, strrchr, strstr, wcschr, wcspbrk, wcsrchr, wcsstr and wmemchr that return pointers into their input arrays now have definitions as macros that return a pointer to a const-qualified type when the input argument is a pointer to a const-qualified type.

https://lists.gnu.org/archive/html/info-gnu/2026-01/msg00005.html

fixes:
```c

../../../src/seq/seqmid.c: In function 'snd_seq_parse_address':
../../../src/seq/seqmid.c:449:24: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
  449 |                 if ((p = strpbrk(arg, ":.")) != NULL) {
      |                        ^
../../../src/ucm/main.c: In function 'snd_use_case_get_list':
../../../src/ucm/main.c:2396:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
 2396 |                 str1 = strchr(identifier, '/');
      |                      ^
../../../src/ucm/main.c: In function 'snd_use_case_geti':
../../../src/ucm/main.c:2721:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
 2721 |                 str1 = strchr(identifier, '/');
      |                      ^
../../../src/ucm/main.c: In function 'snd_use_case_set':
../../../src/ucm/main.c:3038:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
 3038 |                 str1 = strchr(identifier, '/');
      |                      ^
../../../src/ucm/ucm_subs.c: In function 'strchr_with_escape':
../../../src/ucm/ucm_subs.c:832:19: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
  832 |                 s = strchr(str, c);
      |                   ^
../../src/conf.c: In function 'snd_config_hook_load_for_all_cards':
../../src/conf.c:4446:51: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
 4446 |                                         char *s = strchr(driver, '.');
      |                                                   ^~~~~~

```

Request URL   : https://github.com/alsa-project/alsa-lib/pull/496
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/496.patch
Repository URL: https://github.com/alsa-project/alsa-lib
