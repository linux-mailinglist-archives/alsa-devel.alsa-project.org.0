Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NI4nNk5ij2nsQgEAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Feb 2026 18:41:34 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56785138B58
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Feb 2026 18:41:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B318960215;
	Fri, 13 Feb 2026 18:41:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B318960215
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1771004493;
	bh=CDpFdcG2JlGiilwq9OrTxomnpUDybg7pYjrt8++i0EI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=BGUiEHrawDx/IT/sLd5XL79PgGyiGijLCM0r5flozWZe/1E27Sl3CbgTnwAP84krt
	 COz5f/alQVMiGJFB8VZX8GU1oWfbr513i/JLU+SJnh3O5LTCFBTi6fTFqvP2VCfkrC
	 0SvIwWTO63PFEZq/H1Klx5K0chz9HqfN5NHO1AFI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A05F1F805E1; Fri, 13 Feb 2026 18:40:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4353F805E0;
	Fri, 13 Feb 2026 18:40:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D590F8025A; Fri, 13 Feb 2026 18:40:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_FAIL,
	SPF_HELO_NONE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D55FF8014E
	for <alsa-devel@alsa-project.org>; Fri, 13 Feb 2026 18:39:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D55FF8014E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1893df1d34d4fd00-webhooks-bot@alsa-project.org>
In-Reply-To: <1893df1d331d3200-webhooks-bot@alsa-project.org>
References: <1893df1d331d3200-webhooks-bot@alsa-project.org>
Subject: ASUS X870-F STRIX - no front panel/headphones audio
Date: Fri, 13 Feb 2026 18:40:15 +0100 (CET)
Message-ID-Hash: LBLENXZVK3W4BAFXCCAHG3NDRK3AFAP7
X-Message-ID-Hash: LBLENXZVK3W4BAFXCCAHG3NDRK3AFAP7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LBLENXZVK3W4BAFXCCAHG3NDRK3AFAP7/>
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
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	TAGGED_RCPT(0.00)[alsa-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DOM_EQ_FROM_DOM(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github@alsa-project.org,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+]
X-Rspamd-Queue-Id: 56785138B58
X-Rspamd-Action: no action

alsa-project/alsa-ucm-conf issue #705 was edited from dosiek:

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

My alsaucm version is 1.2.14 (upgrading it to 1.2.15 does not fix it), and I am attaching the alsa-info.sh output.

[alsa-info.txt](https://github.com/user-attachments/files/25296874/alsa-info.txt)

Thank you.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/705
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
