Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA1EA67289
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Mar 2025 12:23:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B2856035D;
	Tue, 18 Mar 2025 12:23:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B2856035D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742297026;
	bh=0sQCWESsp4O7/P+BJUB1lPlaKz0gGk+cr3xtEgwZ2WI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=c/GwY77mJwuiADAZDyWwkbnW1gS4GIf67NBEO0SJkY5NLs9A0wWB604w3Cvbv3LVz
	 6PsiJvsFtiaf+X4225scGl2/sIEtTq3ZUjeywNy29lYw1EiZqNVC/hzq4SfQA3wxWL
	 EV83jY6l0iphSfRF1FEHVL0DssJgrho9W8GZk/4M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BF49F805AF; Tue, 18 Mar 2025 12:23:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3777F805AF;
	Tue, 18 Mar 2025 12:23:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30EF8F80587; Tue, 18 Mar 2025 12:23:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 47873F802BE
	for <alsa-devel@alsa-project.org>; Tue, 18 Mar 2025 12:23:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47873F802BE
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <182de1e022522200-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/526@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/526@alsa-project.org>
Subject: 
 =?utf-8?q?ucm2=3A_HDA=3A_HiFi-analog/mic=3A_Refactor_the_analog_mic_discovery_and_pre=E2=80=A6?=
Date: Tue, 18 Mar 2025 12:23:06 +0100 (CET)
Message-ID-Hash: IXALF4ZR72L5UYVO2JWXSDEKAQIE5KZD
X-Message-ID-Hash: IXALF4ZR72L5UYVO2JWXSDEKAQIE5KZD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IXALF4ZR72L5UYVO2JWXSDEKAQIE5KZD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYgcHVsbCByZXF1ZXN0ICM1MjYgd2FzIG9wZW5lZCBm
cm9tIHVqZmFsdXNpOgoK4oCmc2VudGF0aW9uDQoNClRoZSBjdXJyZW50IG1pYyBkZXZpY2UgY3Jl
YXRpb24gd29ya3Mgb24gY2VydGFpbiBtYWNoaW5lcyBhbmQgZmFpbHMgb24gb3RoZXJzLiBUaGVy
ZSBhcmUgc2V2ZXJhbCBwbGFjZXMgb2YgY29uZmxpY3RzIGFuZCBzZXR1cHMgd2hpY2ggY2FuIG9u
bHkganVzdCBmYWlsLCBidXQgdGhpcyBpcyBtb3N0bHkgbm90IGFuIGlzc3VlIGlmIHRoZSB1c2Vy
IG5ldmVyIHVzZXMgdGhlIG1pYywgb25seSB0aGUgc3BlYWtlci9oZWFkc2V0IC0gd2hpY2gsIHRv
IGJlIGhvbmVzdCBpcyB3aGF0IG1vc3Qgb2YgdXMgZG8gOykNCg0KQXMgYW4gZXhhbXBsZToNClRo
ZSBtaWMgc2VsZWN0aW9uIGluIG1vc3QgY29kZWNzIGFyZSB2aWEgZW51bSBhbmQgaXQgaXMgYXNz
dW1lZCB0byBiZSBuYW1lZCAnSW5wdXQgU291cmNlJywgd2hpY2ggaXMgbm90IGFsd2F5cyB0aGUg
Y2FzZSBhcyBzb21lIGRldmljZSB1c2VzICdDYXB0dXJlIFNvdXJjZScgZm9yIHRoZSBjb250cm9s
J3MgbmFtZS4NClRoZXJlIGlzIGFsc28gZGlmZmVyZW50IHNldHMgb2YgbWljcyB0aGF0IG9uZSBj
YW4gc2VsZWN0IGZyb206IEV4aGliaXQgQQ0KbnVtaWQ9NixpZmFjZT1NSVhFUixuYW1lPSdJbnB1
dCBTb3VyY2UnDQogIDsgdHlwZT1FTlVNRVJBVEVELGFjY2Vzcz1ydy0tLS0tLSx2YWx1ZXM9MSxp
dGVtcz0yDQogIDsgSXRlbSAjMCAnSGVhZHNldCBNaWMnDQogIDsgSXRlbSAjMSAnSGVhZHBob25l
IE1pYycNCiAgOiB2YWx1ZXM9MQ0KDQpFeGhpYml0IEINCm51bWlkPTYsaWZhY2U9TUlYRVIsbmFt
ZT0nQ2FwdHVyZSBTb3VyY2UnDQogIDsgdHlwZT1FTlVNRVJBVEVELGFjY2Vzcz1ydy0tLS0tLSx2
YWx1ZXM9MSxpdGVtcz0yDQogIDsgSXRlbSAjMCAnSW50ZXJuYWwgTWljJw0KICA7IEl0ZW0gIzEg
J0hlYWRzZXQgTWljJw0KICA6IHZhbHVlcz0wDQoNCkV4aGliaXQgQw0KbnVtaWQ9NixpZmFjZT1N
SVhFUixuYW1lPSdDYXB0dXJlIFNvdXJjZScNCiAgOyB0eXBlPUVOVU1FUkFURUQsYWNjZXNzPXJ3
LS0tLS0tLHZhbHVlcz0xLGl0ZW1zPTMNCiAgOyBJdGVtICMwICdJbnRlcm5hbCBNaWMnDQogIDsg
SXRlbSAjMSAnSGVhZHNldCBNaWMnDQogIDsgSXRlbSAjMiAnSGVhZHBob25lIE1pYycNCiAgOiB2
YWx1ZXM9MA0KDQpFeGhpYml0IEQgKHRoaXMgcHVzaGVzIHRoZSBsaW1pdHMuLi4gVGhlIHBhdGNo
IHdpbGwgaWdub3JlIGl0ZW0gMSkgbnVtaWQ9NixpZmFjZT1NSVhFUixuYW1lPSdDYXB0dXJlIFNv
dXJjZScNCiAgOyB0eXBlPUVOVU1FUkFURUQsYWNjZXNzPXJ3LS0tLS0tLHZhbHVlcz0xLGl0ZW1z
PTMNCiAgOyBJdGVtICMwICdJbnRlcm5hbCBNaWMnDQogIDsgSXRlbSAjMSAnSW50ZXJuYWwgTWlj
IDEnDQogIDsgSXRlbSAjMiAnTWljJw0KICA6IHZhbHVlcz0yDQoNCk90aGVyIGlzc3VlIGlzIHRo
YXQgd2UgaGF2ZSB0aGlzICdIZWFkcGhvbmUgTWljJywgd2hpY2ggdHVybmVkIG91dCB0byBiZSBh
ICdTdGVyZW8gTWljcm9waG9uZSBpbiBIZWFkcGhvbmUgSmFjaycsIHNvIGlmIGl0IGlzIHNlbGVj
dGVkIHRoZW4gdGhlIEhlYWRwaG9uZSBjYW5ub3Qgd29yaywgdGhleSBjb25mbGljdCwgdGhleSB1
c2UgdGhlIHNhbWUgcmluZ3MgZm9yIGRpZmZlcmVudCBkaXJlY3Rpb24gYW5kIHB1cnBvc2UuDQoN
ClRoaXMgcGF0Y2ggYWltcyB0byBtYWtlIHRoZSBtaWMgZGlzY292ZXJ5IGEgYml0IG1vcmUgZGV0
ZXJtaW5pc3RpYyBhbmQgcHJhZ21hdGljLg0KDQpCdXQgZXZlbiBpZiB0aGUgVUNNIGNyZWF0ZXMg
dGhlIHVzZSBjYXNlIHByb2ZpbGVzIGNvcnJlY3RseSwgaXQgaXMgc3RpbGwgdXAgdG8gVUlzIChL
REUvR05PTUUvZXRjKSB0byBtaXN1bmRlcnN0YW5kIGhvdyBVQ00gcHJlc2VudHMgdGhlIHByb2Zp
bGVzLCB3aGF0IHRoZXkgbWVhbiBhbmQgbW9zdCBvZiBhbGwgd2hhdCAnTWljMScsIGBNaWMyJywg
ZXRjIGlzLiBLREUgcHJlc2VudHMgdGhlIHByb2ZpbGVzIGFzIHRoZXkgYXJlIGFuZCB1c2VyIGNh
biBzZWxjdCBiZXR3ZWVuIHRoZW0gdG8gcGljayB0aGUgcmlnaHQgY29tYmluYXRpb24gb2Ygb3V0
cHV0IGFuZCBpbnB1dC4NCkdOT01FIGdvZXMgZnVydGhlciB3aXRoIHNpbXBsaWZpY2F0aW9uIChh
bmQgZmFpbHMgd2l0aCBpdCkgYW5kIHByZXNlbnRzICdyYW5kb20nIENvbmZpZ3VyYXRpb24gcHJv
ZmlsZXMgZm9yIE91dHB1dCBhbmQgSW5wdXQsIHBsdXMgYSBkZXZpY2Ugc2VsZWN0aW9uIGFuZCB0
aGV5IGRvIHdvcmsgaW4gYW4gaW50ZXJlc3Rpbmcgd2F5LiBHTk9NRSBhbHNvIGhhdmUgcG9wdXAg
Zm9yIHNwZWNpZnlpbmcgdGhlIHR5cGUgb2YgdGhlIHBsdWdnZWQgYWNjZXNzb3J5LCB3aGljaCBk
b2VzIG5vdCB3b3JsIGF0IGFsbCB3aXRoIFVDTSBwcm9maWxlcy4NCg0KQnV0LCB0aGlzIHBhdGNo
IGlzIG1lYW50IGZvciBhIHNtYWxsIHN0ZXAgdG8gaGF2ZSBjbGVhciBydWxlcyBiYXNlZCBtaWMg
cHJlc2VudGF0aW9uIGZvciBIREEuDQoNClRoZSBleHBlY3RhdGlvbiBpcyB0aGF0IHdoYXQgaGF2
ZSB3b3JrZWQgd2lsbCB3b3JrIGFzIGl0IHVzZWQgdG8gYW5kIHdoYXQgZGlkIG5vdCB3b3JrZWQg
c2hvdWxkIGJlIGRldGVjdGVkIGFuZCBwcmVzZW50ZWQgY29ycmVjdGx5LgoKUmVxdWVzdCBVUkwg
ICA6IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29uZi9wdWxsLzUy
NgpQYXRjaCBVUkwgICAgIDogaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLXVj
bS1jb25mL3B1bGwvNTI2LnBhdGNoClJlcG9zaXRvcnkgVVJMOiBodHRwczovL2dpdGh1Yi5jb20v
YWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYK
