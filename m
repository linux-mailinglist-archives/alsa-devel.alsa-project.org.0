Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28918A2E400
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2025 07:05:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B42EC601F8;
	Mon, 10 Feb 2025 07:05:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B42EC601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739167545;
	bh=gvtomO8mDGTgtPm0U1EXDu2ox725TZTFzzK/B2dMpdI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uVQYn65bKJ8XuvSltaxICVjES4kKdN7wZJ9cGwxY5A0U5ace6Sflz/5/oY8qnqhOA
	 L2z+BmCgzu266jahuHNO/4O+uKebGemFQm9D4gmiyc76RNUafi0uuy97nLOYETOFec
	 0v+yTB2Ec9Ye7u4918YcPLkzZVQI0Lf3Pjq8jddY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF26AF805B0; Mon, 10 Feb 2025 07:05:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF002F8053B;
	Mon, 10 Feb 2025 07:05:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACD36F8032D; Mon, 10 Feb 2025 07:05:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 90580F800D2
	for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2025 07:05:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90580F800D2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1739167505033385992-webhooks-bot@alsa-project.org>
References: <1739167505033385992-webhooks-bot@alsa-project.org>
Subject: alsaloop doesn't pass sound with libsamplerate resampling on
 raspberry pi 5
Message-Id: <20250210060507.ACD36F8032D@alsa1.perex.cz>
Date: Mon, 10 Feb 2025 07:05:07 +0100 (CET)
Message-ID-Hash: 3SBNYYU5LGUBCZOJOUVDE6IGT4CHVWX7
X-Message-ID-Hash: 3SBNYYU5LGUBCZOJOUVDE6IGT4CHVWX7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3SBNYYU5LGUBCZOJOUVDE6IGT4CHVWX7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdXRpbHMgaXNzdWUgIzI5MSB3YXMgZWRpdGVkIGZyb20gd2lsbGFu
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
dCBpdD8KCkkgZGlkbid0IHNlZSBlcnJvcnMgaW4gbG9ncyBhdCB0aGUgZGVmYXVsdCBsb2cgbGV2
ZWwuCgpUaGFuayB5b3UhICAKV2lsbAoKSXNzdWUgVVJMICAgICA6IGh0dHBzOi8vZ2l0aHViLmNv
bS9hbHNhLXByb2plY3QvYWxzYS11dGlscy9pc3N1ZXMvMjkxClJlcG9zaXRvcnkgVVJMOiBodHRw
czovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdXRpbHMK
