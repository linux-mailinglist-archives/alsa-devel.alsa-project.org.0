Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id n7QOOW07rWlVzwEAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Sun, 08 Mar 2026 10:03:41 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC7E22F1C4
	for <lists+alsa-devel@lfdr.de>; Sun, 08 Mar 2026 10:03:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A17C60253;
	Sun,  8 Mar 2026 10:03:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A17C60253
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772960617;
	bh=5TRkxnDHmyBem1AxpIRsWjqBNHarSc7DBjOMG4HteW8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=iHk0oqtHu75D/f0gaVvG1s9/HGZDptsm9P7nG1HVVYphBHc4dqD8OqVz0Ye/S+zCw
	 caijgttWUfUEtKHERiu+MhYaHfIOx8++39zHKGnle/EUZR6BArguwJFvPpb6sTR357
	 N/Tww9ILgaLvBdnhOmxj3w293FOoYRebd1QZhEwQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41FB7F805EF; Sun,  8 Mar 2026 10:03:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1CB0F805E5;
	Sun,  8 Mar 2026 10:03:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67C85F80557; Sun,  8 Mar 2026 10:02:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 284D2F80087
	for <alsa-devel@alsa-project.org>; Sun,  8 Mar 2026 10:02:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 284D2F80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <189ad23ed017ae00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/715@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/715@alsa-project.org>
Subject: UCM2: Qualcomm: sc8280xp: add Huawei MateBook E Go support
Date: Sun,  8 Mar 2026 10:02:53 +0100 (CET)
Message-ID-Hash: PS6DQLO6LL2EGBABJRTM32TGEFS6BGIV
X-Message-ID-Hash: PS6DQLO6LL2EGBABJRTM32TGEFS6BGIV
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; emergency; member-moderation;
 nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size;
 news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PS6DQLO6LL2EGBABJRTM32TGEFS6BGIV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 6DC7E22F1C4
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo]
X-Rspamd-Action: no action

alsa-project/alsa-ucm-conf pull request #715 was opened from whitelewi1-ctrl:

## Summary

Add UCM configuration for the Huawei MateBook E Go (GK-W7X), an sc8280xp-based tablet with the same audio codec hardware as the Lenovo ThinkPad X13s (WCD938x + WSA8835 via SoundWire).

- Add `HUAWEI-MateBook-E-Go.conf` device configuration
- Update `sc8280xp.conf` to match HUAWEI DMI alongside existing LENOVO match
- Error message only emitted when no known vendor matches

## Hardware details

| Field | Value |
|-------|-------|
| Device | Huawei MateBook E Go (GK-W7X) |
| SoC | Snapdragon 8cx Gen 3 (sc8280xp) |
| Audio codec | WCD938x (headphones) + WSA8835 v2 (speakers) |
| Audio bus | SoundWire |
| `board_vendor` | `HUAWEI` |
| `product_family` | `MateBook E` |

## Test plan

- Tested on Huawei MateBook E Go with kernel 6.18.8 + Arch Linux
- Speaker playback, headphone playback, internal mic, headset mic all functional
- `wpctl status` shows correct device names (Speaker, Headphones, Internal microphones, Headset)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/715
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/715.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
