Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIP0LAJcj2lxQgEAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Feb 2026 18:14:42 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B69A1388B7
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Feb 2026 18:14:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DFF460217;
	Fri, 13 Feb 2026 18:14:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DFF460217
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1771002881;
	bh=/++fAOaVUqz8qfb1IBXyNcTmfcl+brFFHveX8RkPWmg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=JxWE2xkUwca5dR8GVF18/ZfGaSIJWVhfZmKaXy2u/DIdOEPL3i+A79oGb5NBgvy/G
	 gGZlCdzSjd7rqhlIDDsleIq8uCeQgBN5awTRgnBXq80TBqnOWTk+On3ZF/8tfgU6YK
	 l5qNikHZFXfHjGir6vEB9jmRVFEMqcxN2wNf7XG4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2546DF805E0; Fri, 13 Feb 2026 18:14:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E240FF805E5;
	Fri, 13 Feb 2026 18:14:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A205EF8025A; Fri, 13 Feb 2026 18:11:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_FAIL,SPF_HELO_NONE,
	URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id CBE2CF8001F
	for <alsa-devel@alsa-project.org>; Fri, 13 Feb 2026 18:11:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBE2CF8001F
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1893dd8a94972d00-webhooks-bot@alsa-project.org>
In-Reply-To: <1893dd8a933b3400-webhooks-bot@alsa-project.org>
References: <1893dd8a933b3400-webhooks-bot@alsa-project.org>
Subject: ASUS X870-F STRIX - no front panel/headphones audio
Date: Fri, 13 Feb 2026 18:11:31 +0100 (CET)
Message-ID-Hash: H6MBZ6Z5Q7STIAGGYQ3CO3L7RQAPMEF3
X-Message-ID-Hash: H6MBZ6Z5Q7STIAGGYQ3CO3L7RQAPMEF3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H6MBZ6Z5Q7STIAGGYQ3CO3L7RQAPMEF3/>
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
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	TAGGED_RCPT(0.00)[alsa-devel];
	TO_DOM_EQ_FROM_DOM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github@alsa-project.org,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:mid,alsa-project.org:dkim,alsa-info.sh:url]
X-Rspamd-Queue-Id: 4B69A1388B7
X-Rspamd-Action: no action

alsa-project/alsa-ucm-conf issue #705 was opened from dosiek:

Hello, I have an issue where I can't get my headphones/front panel jack to work - it is being detected upon connecting the headphones but no audio is being transmitted.

My motherboard is ASUS ROG STRIX X870-F GAMING WIFI, using the ALC4080. `Bus 001 Device 007: ID 0b05:1b9b ASUSTek Computer, Inc. USB Audio`

I am using Fedora 43 KDE and I have tried a lot of different fixes (such as disabling drivers, modifying the ALC4080 and ALC4080-HiFi files and way more) and nothing has worked out.
The motherboard is already in the UCM conf list for the ALC4080 (addressed as X870E-E but it's the same ID), but the front panel audio still does not work.

I am at the state where I freshly installed the system, and updated the alsa-ucm-conf using the commands provided (even though the default version already had the ID), and getting this error in alsaucm -i

`alsaucm>> listcards
ALSA lib parser.c:270:(parse_syntax_field) Incompatible syntax 8 in USB-Audio.conf
ALSA lib main.c:1554:(snd_use_case_mgr_open) error: failed to import hw:0 use case configuration -22
ALSA lib parser.c:2978:(uc_mgr_scan_master_configs) Unable to open '-hw:0': Invalid argument
alsaucm: error failed to get card list: Invalid argument`

My alsaucm version is 1.2.14, and I am attaching the alsa-info.sh output.

[alsa-info.txt](https://github.com/user-attachments/files/25296874/alsa-info.txt)

Thank you.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/705
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
