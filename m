Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKpSNQREmGm0EgMAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Feb 2026 12:22:44 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 598CD167422
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Feb 2026 12:22:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC67E601CA;
	Fri, 20 Feb 2026 12:22:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC67E601CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1771586563;
	bh=NYo6LDV8Sdq5GZuXabD1C22h5+9gd8PAqMZmKjGjVPY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bvCcvuqW9eTD0v0qhb4TqB3ZzU9zUnxY8s+mu9qGAQo+byCb32D/cezdoLYBtkyK4
	 7+LsWvPsl49jhsdz4IfUuavza1/chID05zb2W2sh8sOMo0yHz+R/hn9Zhnjh9lL9Wc
	 fXHQybKemOEYDAsXlJM4J4LCFckyXha9rAkxJ77o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F90CF8057A; Fri, 20 Feb 2026 12:22:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FBDEF805E5;
	Fri, 20 Feb 2026 12:22:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B359F800F3; Fri, 20 Feb 2026 12:19:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 244CFF800F3
	for <alsa-devel@alsa-project.org>; Fri, 20 Feb 2026 12:19:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 244CFF800F3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1895f0690d8bc200-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-utils/pr/322@alsa-project.org>
References: <alsa-project/alsa-utils/pr/322@alsa-project.org>
Subject: fix discards const from pointer target
Date: Fri, 20 Feb 2026 12:19:41 +0100 (CET)
Message-ID-Hash: XJIQXAYAHLH22G2CYJHD5QR3VCKM4YN6
X-Message-ID-Hash: XJIQXAYAHLH22G2CYJHD5QR3VCKM4YN6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XJIQXAYAHLH22G2CYJHD5QR3VCKM4YN6/>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	TAGGED_RCPT(0.00)[alsa-devel];
	TO_DOM_EQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[github@alsa-project.org,alsa-devel-bounces@alsa-project.org];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: 598CD167422
X-Rspamd-Action: no action

alsa-project/alsa-utils pull request #322 was opened from heitbaum:

Since glibc-2.43:

For ISO C23, the functions bsearch, memchr, strchr, strpbrk, strrchr, strstr, wcschr, wcspbrk, wcsrchr, wcsstr and wmemchr that return pointers into their input arrays now have definitions as macros that return a pointer to a const-qualified type when the input argument is a pointer to a const-qualified type.

https://lists.gnu.org/archive/html/info-gnu/2026-01/msg00005.html

```c

../../alsactl/init_parse.c: In function 'elemid_get':
../../alsactl/init_parse.c:695:29: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
  695 |                 char *pos = strchr(attr, ' ');
      |                             ^~~~~~
../../alsactl/init_parse.c: In function 'conf_name_filter':
../../alsactl/init_parse.c:1284:21: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
 1284 |         char *ext = strrchr(d->d_name, '.');
      |                     ^~~~~~~
../../aplay/aplay.c: In function 'create_path':
../../aplay/aplay.c:3226:23: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
 3226 |                 start = strchr(path + 1, '/');
      |                       ^
../../aplay/aplay.c:3228:23: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
 3228 |                 start = strchr(path, '/');
      |                       ^
../../topology/pre-process-object.c: In function 'tplg_pp_add_object_tuple_section':
../../topology/pre-process-object.c:562:14: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
  562 |         type = strchr(token_ref, '.');
      |              ^
../../topology/pre-process-dapm.c:175:14: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
  175 |         args = strchr(string, '.');
      |              ^

```

Request URL   : https://github.com/alsa-project/alsa-utils/pull/322
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/322.patch
Repository URL: https://github.com/alsa-project/alsa-utils
