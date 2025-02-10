Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B95A2E3F0
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2025 07:02:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D73D601F6;
	Mon, 10 Feb 2025 07:01:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D73D601F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739167323;
	bh=yfoLFLWr/xm5nE4Xl2coxdKWBjWkEyeSDEVkRBW9htM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=JrET8BbGHFnsz04pNL/gVbvtvCt5AHUtcqxiazdUgeM9iBXYph8ioPoIVCFj2jmBe
	 aVMBE/T894oUg69oyNZ5RY7NCkbCoGkC4vouMbUXpN5otnJBJi5xXcBkWhp9HJ8izx
	 qdJ9TPVEFtxfgPZNGDFj6q7kRDcHACBEmmcXuxug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60777F805BB; Mon, 10 Feb 2025 07:01:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CB3CF805BA;
	Mon, 10 Feb 2025 07:01:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4C6EF80424; Mon, 10 Feb 2025 07:01:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 660D3F800D2
	for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2025 07:01:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 660D3F800D2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1739167266071241617-webhooks-bot@alsa-project.org>
References: <1739167266071241617-webhooks-bot@alsa-project.org>
Subject: alsaloop doesn't pass sound with libsamplerate on raspberry pi 5
Message-Id: <20250210060119.B4C6EF80424@alsa1.perex.cz>
Date: Mon, 10 Feb 2025 07:01:19 +0100 (CET)
Message-ID-Hash: JGRV3TSDHH6LCGGHKXALEVAPIF77CNKA
X-Message-ID-Hash: JGRV3TSDHH6LCGGHKXALEVAPIF77CNKA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JGRV3TSDHH6LCGGHKXALEVAPIF77CNKA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdXRpbHMgaXNzdWUgIzI5MSB3YXMgb3BlbmVkIGZyb20gd2lsbGFu
Z2xleToKCkhpIGFsc2EtdXRpbHMgdGVhbSEKCkknbSB1c2luZyBgYWxzYWxvb3BgcyBvbiBhIFJh
c3BiZXJyeSBQaSA1IGFzIHBhcnQgb2YgYSBzbGlnaHRseSByaWRpY3Vsb3VzIHNpZ25hbCBjaGFp
bjoKCiogWWFtYWhhIFAtNTI1IGtleWJvYXJkCiogVVNCIEMtdG8tQSBjYWJsZQoqIFJhc3BiZXJy
eSBQaSA1CiogVVNCIEEtdG8tQiBjYWJsZQoqIEVTSSBVMjRYTAoqIFNQRElGIGluL291dAoqIEZv
Y3Vzcml0ZSBDbGFyZXR0KyA0UHJlCiogLi4uCiogTWFjQm9vayBQcm8KCltXaHk/IFRoZSBhbmFs
b2cgQXV4IEluL0F1eCBPdXQgb24gdGhlIGtleWJvYXJkIGhhdmUgYW4gYWx3YXlzIG9uIGxvb3Bi
YWNrIGNvbm5lY3Rpb24sIHdoaWNoIGlzIHVuZGVzaXJhYmxlIHdoZW4gcGxheWluZyB0byBhIHZp
ZGVvIG1lZXRpbmcuIFRoZSBVU0IgcG9ydCBoYXMgdXNlciBjb250cm9sbGFibGUgbG9vcGJhY2su
XQoKVHdvIGFsc2Fsb29wIHByb2Nlc3NlcyBydW4gb24gdGhlIFBpLCBvbmUgbW92aW5nIHNvdW5k
IGZyb20gdGhlIGNvbXB1dGVyIHRvIHRoZSBwaWFubywgb25lIG1vdmluZyBzb3VuZCBmcm9tIHRo
ZSBwaWFubyB0byB0aGUgY29tcHV0ZXIuIEJvdGggcnVuIHVuZGVyIGBzdXBlcnZpc29yZGAuCgpJ
J3ZlIGdvdCB0aGVtIHJ1bm5pbmcgYXQgYWNjZXB0YWJsZSBsYXRlbmN5IOKAlCBSVEwgVXRpbGl0
eSBzYXlzIDQwbXMgZnJvbSBteSBNYWNCb29rIFByby4KCkJ1dCBJIGhhdmVuJ3QgYmVlbiBhYmxl
IHRvIGdldCBhbnkgb2YgdGhlIGhpZ2ggcXVhbGl0eSByZXNhbXBsaW5nIG9wdGlvbnMgd29ya2lu
ZyAtLSBldmVyeXRoaW5nIG90aGVyIHRoYW4gYWRkL2Ryb3Agc3RvcHMgcGFzc2luZyBzb3VuZCB3
aXRoaW4gYSBmZXcgc2Vjb25kcy4gSSdtIHN1cnByaXNlZDsgdGhpcyBQaSBzaG91bGQgYmUgcG93
ZXJmdWwgZW5vdWdoIHRvIGhhbmRsZSB0aGlzLiBBbnkgaWRlYXMgaG93IHRvIHRyb3VibGVzaG9v
dCBpdD8KClRoYW5rIHlvdSEgIApXaWxsCgpJc3N1ZSBVUkwgICAgIDogaHR0cHM6Ly9naXRodWIu
Y29tL2Fsc2EtcHJvamVjdC9hbHNhLXV0aWxzL2lzc3Vlcy8yOTEKUmVwb3NpdG9yeSBVUkw6IGh0
dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11dGlscwo=
