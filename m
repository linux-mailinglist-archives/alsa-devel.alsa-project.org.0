Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0771477E224
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 15:07:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC4DA741;
	Wed, 16 Aug 2023 15:06:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC4DA741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692191221;
	bh=Z8EcsXPFB9TOhik8IEsW3foix15+bRuZSR+Cd9Z7YXs=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eYJyc4Xh5ZLhGeHZyfVO7TJ/rG3pmCFVQ0Y2xOXx1m7ts2ILUS3fH5Z9J10fZjWH7
	 P1aulyipgbd4ygMP6FNt5Sk96FtH9vrkJpFrb8Q7DbbjQ+SOnQbttAe6qr2vmY3Qao
	 27h+6T1vPq8T4VSlVLVPjxL9/cRssx8Z3wfFcbqM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B655CF8016A; Wed, 16 Aug 2023 15:06:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3156DF8016A;
	Wed, 16 Aug 2023 15:06:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CB76F8016D; Wed, 16 Aug 2023 15:06:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from asave02.hostfactory.ch (asave02.hostfactory.ch
 [217.150.252.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 759DFF800D1
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 15:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 759DFF800D1
Received: from server11.hostfactory.ch ([185.117.169.60])
	by asave02.hostfactory.ch with esmtps (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <michele.perrone@weiss.ch>)
	id 1qWGDR-0003LW-1i; Wed, 16 Aug 2023 15:05:39 +0200
Received: from [192.168.0.84]
 (156.14.3.213.static.wline.lns.sme.cust.swisscom.ch [213.3.14.156])
	(Authenticated sender: michele.perrone@weiss.ch)
	by server11.hostfactory.ch (Postfix) with ESMTPSA id 3AD85437BD369;
	Wed, 16 Aug 2023 15:05:36 +0200 (CEST)
Message-ID: <a41c675d-c1bd-4e89-9519-63b2b088f16d@weiss.ch>
Date: Wed, 16 Aug 2023 15:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: ALSA: dice: improve support for Weiss devices
Content-Language: en-US
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20230728131308.GA142765@workstation.local>
 <7a0cf3fd-9e31-45e1-7aa4-97cab27dafa7@weiss.ch>
 <20230731140655.GA367100@workstation.local>
 <81450de2-3bf5-cb96-114f-6d75314e5a03@weiss.ch>
 <20230808152511.GA729027@workstation.local>
From: Michele Perrone <michele.perrone@weiss.ch>
Cc: alsa-devel@alsa-project.org, Rolf Anderegg <rolf.anderegg@weiss.ch>
In-Reply-To: <20230808152511.GA729027@workstation.local>
X-PPP-Message-ID: 
 <169219113648.2854.9624285877659529926@server11.hostfactory.ch>
X-PPP-Vhost: weiss.ch
X-Originating-IP: 185.117.169.60
X-SpamExperts-Domain: outboundprotection.hostfactory.ch
X-SpamExperts-Username: 185.117.169.60
Authentication-Results: hostfactory.ch;
 auth=pass smtp.auth=185.117.169.60@outboundprotection.hostfactory.ch
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.12)
X-Recommended-Action: accept
X-Filter-ID: 
 Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/29HgFTXyjkQ19nTddQnzoPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5ynOqv5wVH0VS/etXvrFNNzaJlM0GUlwLkcZrRacppWhTh3
 wKoTBNAKgp9qBcKLgDl1CmCG4MXmWFl9KMUaH9XX58fMnqZUTt7CyKlJUh+zhrvskOodkcldbUU6
 +Q9Im5WDJYXE4Dl0gs/Km8rE1WFZib4c+8u03zgcPIi1BNOnFPiovdiMNMKaOo4Dx5PVJ7yZn7S9
 PqmI7CxqPRD6uYFuoeEA50uKT1YmNQ2DvAHx0II9SfYN0aBss3KI3DngazAIqrmbzLx+8GuT8WcG
 RBnXYsS6bGduFax79ZwOlDcJsct4QGHh8z4JwntNZcENOTyB/XXeZlhRtdWlq12+IWgwmQe0NR41
 Q9AG+69OB6hwB6O1G7ls8LzOXkY85X1GAzFhYDivIFvoWs4fOKAXjLRhjFuf4WPrajHp59bHW7Tl
 Bk5sFyZCCKyQ/k+e9zBhOBhIsKDbCcElRJKYxQF4OhLdO16QjsEYeg42J7ak274f2+4cBKp6T12C
 LGXmAnuBrE287L+pOM+0/tNr7IsS5IMjobsZ9+My2AC4mR5ccG6aT64Dt0gTEK9vOlOvpFXXjOyu
 cj735mFcFqoc4yysvQM8ASJFC/49WOPBr5nlEUI4xLBpoZcNE+vM+X233U3d8LWOs4jBArdmWzwW
 0zSRzUC2+9VZJ64KHdGb2/jW2da4NoSmF6LMiGhbC2bkJPe2GCpgLvPVIQFQU8Zue1Kappt5Si4d
 epZIcd7EAFf4+g4ytYsEMysPur9wmiDBurOy6iQ0IVZJFipEM6e248dVVmjA5/7U84vJO+qpeJoO
 e8qvmpuhOUtYxkUsqeZDRWuuHEaVb7PnV6322gGZJI0fWlNtIbtf63VNbf0lrvssY+k7AOoAmX20
 xstT04qrH1/m4gHa1jQXnFQnrHKF7ReAaHp6exS6lSlnItIVuWbLJvn1uUiOu2mJtJv9LJXa2A+9
 T30DsiqxLKWYV9F9r/yjLIC1HR6eirSlewASTJ/bwsRmpRQhJGFj5o4PTIqoGc/vp2ol9j/N2U5+
 S7qUjz5LOeD+XkdCBsItqDkW7DNRbrJ6anrRPZBwBIx+StaZKSXSkXxHt3gJalK3+yb+BiGY1whI
X-Report-Abuse-To: spam@asave01.hostfactory.ch
Message-ID-Hash: 6SY6TY53VLXREA2E3QMX55GLWAD4YK4E
X-Message-ID-Hash: 6SY6TY53VLXREA2E3QMX55GLWAD4YK4E
X-MailFrom: michele.perrone@weiss.ch
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SY6TY53VLXREA2E3QMX55GLWAD4YK4E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RGVhciBNci4gU2FrYW1vdG8sDQoNCnNpbmNlIHdlIGFyZSBub3QgZGlzY3Vzc2luZyBhYm91dCB0
aGUgcGF0Y2ggYW55bW9yZSwgbGV0IG1lIHJlcGx5IHRvIG91cg0Kb3BlbiB0aHJlYWRzIGluIGEg
c2VwYXJhdGUgbWVzc2FnZS4NCg0KT24gMDgvMDgvMjMgMTc6MjUsIFRha2FzaGkgU2FrYW1vdG8g
d3JvdGU6DQo+IEFzIGEgcG9saWN5IHRvIG1haW50YWluIGN1cnJlbnQgQUxTQSBmaXJld2lyZSBz
dGFjaywgYW55IGNvZGUgZm9yIGNvbnRyb2wNCj4gZnVuY3Rpb24gaXMgb3V0IG9mIGtlcm5lbCBs
YW5kLCB0aHVzIHlvdXIgQVZDIGZ1bmN0aW9uIGNhbiBub3QgdG8gYmUNCj4gbWVyZ2VkIHRvIExp
bnV4IHVwc3RyZWFtIGFzIGlzLg0KPg0KPiBJIHRoaW5rIHRoZSBtb3N0IGNvbnZlbmllbnQgd2F5
IGlzIHRvIHByb3ZpZGUgc291cmNlIGNvZGUgZm9yIHRoZQ0KPiBBVkMgZnVuY3Rpb24gdG8gbWUu
IFRoZW4gSSByZS1pbXBsZW1lbnQgaXQgYnkgUnVzdCBsYW5ndWFnZSBmb3INCj4gc25kLWRpY2Ut
Y3RsLXNlcnZpY2UgcHJvZ3JhbS4gQXMgbG9uZyBhcyBpbnRlcnByZXRpbmcgb3JpZ2luYWwgY29k
ZSwgd2UNCj4gaGF2ZSBubyBsaWNlbnNlIGlzc3VlIGZvciB0aGUgbmV3IGNvZGUuDQoNClRoYXQg
aXMgdmVyeSBraW5kIG9mIHlvdS4gWW91IGNhbiBub3cgZmluZCBvdXIgY3VycmVudCBBVkMgY29k
ZSBpbiB0aGUNCmZvbGxvd2luZyBwdWJsaWMgcmVwb3NpdG9yeSAoYnJhbmNoICdhdmMnKToNCg0K
aHR0cHM6Ly9naXRodWIuY29tL3dlaXNzLWVuZ2luZWVyaW5nL3NuZC1kaWNlL3RyZWUvYXZjDQoN
CklmIHlvdSBoYXZlIHF1ZXN0aW9ucyBhYm91dCB0aGUgY29kZSwgYWxzbyBvbiB0aGUgZmlybXdh
cmUgc2lkZSBvZiB0aGluZ3MsDQpmZWVsIGZyZWUgdG8gYXNrLg0KDQo+IEJ1dCBBcyBhIGZpcnN0
IHN0ZXAsIEkgd291bGQgbGlrZSB5b3UgdG8gYXNzaXN0IG15IHN1cHBvcnQgZm9yIERJQ0UgY29t
bW9uDQo+IGNvbnRyb2xzIGluIHlvdXIgbW9kZWxzLg0KPiBJIG5lZWQgdGhlIGBjbG9jayBjYXBz
YCBhbmQgYGNsb2NrIHNvdXJjZSBuYW1lc2AgZmllbGRzIHRvIGltcGxlbWVudCB0aGUNCj4gY29t
bW9uIGNvbnRyb2xzIGZvciB5b3VyIGRldmljZSBpbiBzbmQtZmlyZXdpcmUtY3RsLXNlcnZpY2Vz
Lg0KDQpZb3UgY2FuIGZpbmQgdGhlIGBjbG9jayBjYXBzYCBhbmQgYGNsb2NrIHNvdXJjZSBuYW1l
c2AgZmllbGRzIGZvciBhbGwgDQpvdXIgRmlyZXdpcmUgZGV2aWNlcyBiZWxvdy4gQXMgSSBjdXJy
ZW50bHkgZG8gbm90IGhhdmUgYWNjZXNzIHRvIG91ciANCkZpcmV3aXJlIGhhcmR3YXJlIGV4Y2Vw
dCBmb3IgTUFOMzAxLCBEQUMyMDIsIGFuZCBJTlQyMDIsIGZvciB0aGUgDQpyZW1haW5pbmcgZGV2
aWNlcyBJIGNvcGllZCB0aGUgZmllbGRzIGZyb20gdGhlaXIgbGF0ZXN0IGZpcm13YXJlIHNvdXJj
ZSANCmNvZGUuIC0tIE1BTjMwMSAtLSBjbG9jayBjYXBzOiA0NDEwMCA0ODAwMCA4ODIwMCA5NjAw
MCAxNzY0MDAgMTkyMDAwIA0KYWVzMSBhZXMyIGFlczMgd2MgaW50ZXJuYWwgY2xvY2sgc291cmNl
IG5hbWVzOiBBRVMvRUJVIChYTFIpXFMvUERJRiANCihSQ0EpXFMvUERJRiAoVE9TKVxVbnVzZWRc
VW51c2VkXFVudXNlZFxVbnVzZWRcV29yZCBDbG9jayANCihCTkMpXFVudXNlZFxVbnVzZWRcVW51
c2VkXFVudXNlZFxJbnRlcm5hbFxcIC0tIERBQzIwMiAtLSBjbG9jayBjYXBzOiANCjQ0MTAwIDQ4
MDAwIDg4MjAwIDk2MDAwIDE3NjQwMCAxOTIwMDAgYWVzMSBhZXMyIGFlczMgd2MgYXJ4MSBpbnRl
cm5hbCANCmNsb2NrIHNvdXJjZSBuYW1lczogQUVTL0VCVSAoWExSKVxTL1BESUYgKFJDQSlcUy9Q
RElGIA0KKFRPU0xJTkspXFVudXNlZFxVbnVzZWRcVW51c2VkXFVudXNlZFxXb3JkIA0KQ2xvY2tc
VW51c2VkXFVudXNlZFxVbnVzZWRcVW51c2VkXEludGVybmFsXFwgLS0gSU5UMjAyIC0tIGNsb2Nr
IGNhcHM6IA0KNDQxMDAgNDgwMDAgODgyMDAgOTYwMDAgMTc2NDAwIDE5MjAwMCBhcngxIGludGVy
bmFsIGNsb2NrIHNvdXJjZSBuYW1lczogDQpVbnVzZWRcVW51c2VkXFVudXNlZFxVbnVzZWRcVW51
c2VkXFVudXNlZFxVbnVzZWRcVW51c2VkXFVudXNlZFxVbnVzZWRcVW51c2VkXFVudXNlZFxJbnRl
cm5hbFxcIA0KLS0gSU5UMjAzIC0tIGNsb2NrIGNhcHM6IDQ0MTAwIDQ4MDAwIDg4MjAwIDk2MDAw
IDE3NjQwMCAxOTIwMDAgYWVzMSBhZXMyIA0KYXJ4MSBpbnRlcm5hbCBjbG9jayBzb3VyY2UgbmFt
ZXM6IEFFUy9FQlUgKFhMUilcUy9QRElGIA0KKFJDQSlcVW51c2VkXFVudXNlZFxVbnVzZWRcVW51
c2VkXFVudXNlZFxVbnVzZWRcVW51c2VkXFVudXNlZFxVbnVzZWRcVW51c2VkXEludGVybmFsXFwg
DQotLSBBREMyIC0tIGNsb2NrIGNhcHM6IDQ0MTAwIDQ4MDAwIDg4MjAwIDk2MDAwIDE3NjQwMCAx
OTIwMDAgYWVzMSBjbG9jayANCnNvdXJjZSBuYW1lczogDQpBRVMxMlxVbnVzZWRcVW51c2VkXFVu
dXNlZFxVbnVzZWRcVW51c2VkXFVudXNlZFxVbnVzZWRcVW51c2VkXFVudXNlZFxVbnVzZWRcVW51
c2VkXFVudXNlZFxcIA0KLS0gREFDMi9NaW5lcnZhIC0tIGNsb2NrIGNhcHM6IDQ0MTAwIDQ4MDAw
IDg4MjAwIDk2MDAwIDE3NjQwMCAxOTIwMDAgDQphZXMxIGFlczIgYWVzMyBhcngxIGludGVybmFs
IGNsb2NrIHNvdXJjZSBuYW1lczogQUVTL0VCVSAoWExSKVxTL1BESUYgDQooUkNBKVxTL1BESUYg
DQooVE9TTElOSylcVW51c2VkXFVudXNlZFxVbnVzZWRcVW51c2VkXFVudXNlZFxVbnVzZWRcVW51
c2VkXFVudXNlZFxVbnVzZWRcSW50ZXJuYWxcXCANCi0tIFZlc3RhIC0tIGNsb2NrIGNhcHM6IDQ0
MTAwIDQ4MDAwIDg4MjAwIDk2MDAwIDE3NjQwMCAxOTIwMDAgYWVzMSBhZXMyIA0KYWVzMyBhcngx
IGludGVybmFsIGNsb2NrIHNvdXJjZSBuYW1lczogQUVTL0VCVSAoWExSKVxTL1BESUYgKFJDQSlc
Uy9QRElGIA0KKFRPU0xJTkspXFVudXNlZFxVbnVzZWRcVW51c2VkXFVudXNlZFxVbnVzZWRcVW51
c2VkXFVudXNlZFxVbnVzZWRcVW51c2VkXEludGVybmFsXFwgDQotLSBBRkkxIC0tIGNsb2NrIGNh
cHM6IDQ0MTAwIDQ4MDAwIDg4MjAwIDk2MDAwIDE3NjQwMCAxOTIwMDAgYWVzMSBhZXMyIA0KYWVz
MyBhZXM0IGFkYXQgd2MgaW50ZXJuYWwgY2xvY2sgc291cmNlIG5hbWVzOiANCkFFUzEyXEFFUzM0
XEFFUzU2XEFFUzc4XFVudXNlZFxBREFUXFVudXNlZFxXb3JkIA0KQ2xvY2tcVW51c2VkXFVudXNl
ZFxVbnVzZWRcVW51c2VkXEludGVybmFsXFwNCg0KPiBJbiBteSBwb2ludCBvZiB2aWV3LCB3ZSBu
ZWVkIHRvIGRlY2lkZSBsaWNlbnNlIHVuZGVyIHdoaWNoIHRoZSBmaWxlIG9mDQo+IGNvbmZpZ3Vy
YXRpb24gUk9NIGltYWdlIGlzIHB1YmxpYy4gSSB0aGluayBDQzBbMF0gaXMgYmV0dGUgZm9yIG91
ciBjYXNlLg0KDQpJIGhhdmUgY3JlYXRlZCBhIHB1bGwgcmVxdWVzdCBpbiB0YWthc3dpZS9hbS1j
b25maWctcm9tcyB3aXRoIHRocmVlIFJPTQ0KaW1hZ2VzOiBNQU4zMDEsIERBQzIwMiwgSU5UMjAy
LiBJIGNhbm5vdCBleHRyYWN0IHRoZSByZW1haW5pbmcgaW1hZ2VzIGF0DQp0aGUgbW9tZW50LCBi
ZWNhdXNlIEkgZG8gbm90IGhhdmUgYWxsIEZpcmV3aXJlIGRldmljZXMgYXZhaWxhYmxlLiBJIHdp
bGwNCmFkZCB0aGUgcmVtYWluaW5nIGltYWdlcyBhcyBzb29uIGFzIEkgY2FuIGdldCBteSBoYW5k
cyBvbiB0aGVtLg0KDQpLaW5kIHJlZ2FyZHMsDQpNaWNoZWxlIFBlcnJvbmUNCg==
