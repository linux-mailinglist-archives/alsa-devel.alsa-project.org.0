Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJeYCGzHlmkGmwIAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Feb 2026 09:18:52 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA39315D01B
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Feb 2026 09:18:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E987960213;
	Thu, 19 Feb 2026 09:18:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E987960213
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1771489131;
	bh=7o5Md7MNyOu1abTSMDGMaN+b1soev5h6IrJWGcCD7H0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=LHOn24yuofUSS4UuhwEj4DzAwvC7poGXmZvowqOmcOEcJ5+0Vy1p3pyyIEMV+J7I0
	 DLG+GP1Y4/4ghESrH2LPlDd2aFrzWQL/1h2jRcMFvJ5uNbXiilKSyWLKtdAET2mBiM
	 seOuGlLQbwvwwxJ4ovsNIsYZTm+RXRFc3iIm5s1c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09605F805E4; Thu, 19 Feb 2026 09:18:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B7C5F805E5;
	Thu, 19 Feb 2026 09:18:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3D26F804F2; Thu, 19 Feb 2026 09:12:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 58691F80153
	for <alsa-devel@alsa-project.org>; Thu, 19 Feb 2026 09:12:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58691F80153
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1895979bfe6f8700-webhooks-bot@alsa-project.org>
In-Reply-To: <1895979bfdb03700-webhooks-bot@alsa-project.org>
References: <1895979bfdb03700-webhooks-bot@alsa-project.org>
Subject: MSI Z690 has the same problem. Can't get the SPDIF working,
 front panel doesn't work with microphone.
Date: Thu, 19 Feb 2026 09:12:17 +0100 (CET)
Message-ID-Hash: S2Z6WTLIWN4Z3QIBDWBOI3V7HFT24CVA
X-Message-ID-Hash: S2Z6WTLIWN4Z3QIBDWBOI3V7HFT24CVA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S2Z6WTLIWN4Z3QIBDWBOI3V7HFT24CVA/>
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
	NEURAL_HAM(-0.00)[-0.980];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:mid,alsa-project.org:dkim,alsa0.perex.cz:helo,alsa0.perex.cz:rdns]
X-Rspamd-Queue-Id: BA39315D01B
X-Rspamd-Action: no action

alsa-project/alsa-ucm-conf issue #706 was edited from Ralfpf:

Hope you could help me too, for i saw, that you helped another user with a MSI Z790 and a ALC4080. 

Her is the thread I read

 _Originally posted by @perexg in [#664](https://github.com/alsa-project/alsa-ucm-conf/issues/664#issuecomment-3779380548)_

This I posted already on another thread:

> I am very new to this subject. I recently switched from Win10 to Linux, so please be patient with my lack of knowledge. I am using a MS690 Unify. Despite the fact, that I can find one in the USB-Audio.conf on line 83 "# 0db0:82c7 MSI MEG Z690I Unify", I still can't get my optical SPDIF working. If i choose digital out, the digital signal is routed to the analog output, which is very ugly to listen to. Also my microphone isn't working. It seems, as if the mic in is configured as sink for monitor out of any other source.
sudo dmidecode -t 2 answers
dmidecode 3.6

Getting SMBIOS data from sysfs.
SMBIOS 3.6.0 present.

Handle 0x0002, DMI type 2, 15 bytes
Base Board Information
Manufacturer: Micro-Star International Co., Ltd.
Product Name: MEG Z690 UNIFY (MS-7D28)
Version: 1.0
Serial Number: 07D2810_N81E356737
Asset Tag: Default string
Features:
Board is a hosting board
Board is replaceable
Location In Chassis: Default string
Chassis Handle: 0x0003
Type: Motherboard
Contained Object Handles: 0

Hope this is usefull. Please let me know, if you need more information. Of course I have an ALC4080 built in, but it's also recognised as USB-Audio.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/706
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
