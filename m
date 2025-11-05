Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FC7C37C61
	for <lists+alsa-devel@lfdr.de>; Wed, 05 Nov 2025 21:47:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46FD9601F7;
	Wed,  5 Nov 2025 21:47:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46FD9601F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762375670;
	bh=sUof8GSahUivpphT03koz/MCsgwzNFtKiKytyKTL/BQ=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cVPRRDOBj28goG8hNQCUOY3yrxku2zZVYNsMh0V96A2Us5wez+AOFyJfNwA4YgyF8
	 quBQHDgJz1Ilh0OyAm1D6d2SzERIyVEVkM8xc8OEfPsgcjINs4Sp/b8DhKuYpI+Jn9
	 8MXhe1IQAj9FxPHzyMrwKiR9P9BEhTS1wHJWvUsk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38935F805B5; Wed,  5 Nov 2025 21:47:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01E5BF805C8;
	Wed,  5 Nov 2025 21:47:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CF56F8020D; Wed,  5 Nov 2025 21:47:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR,XPRIO shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C198FF80087
	for <alsa-devel@alsa-project.org>; Wed,  5 Nov 2025 21:47:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C198FF80087
Received: from
 open-xchange-core-mw-default-4.open-xchange-core-mw-hazelcast-headless.open-xchange.svc.cluster.local
 ([10.73.158.124]) by mrelay.perfora.net (mreueus002 [172.19.143.1]) with
 ESMTPSA (Nemesis) id 0LzMRT-1wKLX00Mq1-00x6c9 for
 <alsa-devel@alsa-project.org>; Wed, 05 Nov 2025 21:46:59 +0100
Date: Wed, 5 Nov 2025 15:46:58 -0500 (EST)
From: Shane Kirk <shane@shanekirk.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Message-ID: <559037066.501734.1762375618239@email.ionos.com>
Subject: SND_MIXER_SABSTRACT_BASIC Mixer Abstraction
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v8.38.93
X-Originating-Client: open-xchange-appsuite
X-Provags-ID: V03:K1:e1Dv2MV0RtyyAVXluEyB5UfIvYt7eEidz5EaVpB9J3+OBrQ14yY
 kh7ZzktMOI0B+SJ3mrX5QjGrHQkKQI2sGJAT7msO9zOqxMm83FQlkXxbxV93HlBSfJbl4ZO
 b3k0r/0VEqe+Zrg/zuIsBcLwbM5PN8HnbGCzibyS+QpTQPlPbnR4F2w+SdK48V/jyNOKhbx
 1Z9wpZRHadCmQ3OMevU4Q==
UI-OutboundReport: notjunk:1;M01:P0:H55LBektFbQ=;0Om9icrKV2CfP9BNGXb1otbbnQP
 lCKLnwSHw/tyUklR/BFnBvtKnzGu8AtD6oPiNTKPva9FSpGVfblcMSJHe0Z0qiHDCI0DcrERr
 KHtfHQqFooh5zbBqJI7YtcKGhzlFZ3E/gETU5MyFqpYyoMy6TK32oWrDBbA7mX2zWYqOEjEjS
 XTwuLg0Smx3ZzTbM83st3XCl8E/095erikSsuP6pOis8dPWu/q8avAy/dNcDhiJh+SeG2fsOP
 SD9xVioOenKB/4WCzyWx770T/OaKTtjanDIn3ofSyHdB5Ob15CF8p9KdNs0fmhWu9IIJ8SnJI
 wawatLLNZxBMf4Uq/lSQGeS51Pxp4vD4X8YwOQhN04TdchdS+el6RAV72e24HEHBErOsETLaJ
 VQhFcX8NhXkWBoCFXyOmvJOXGe1IEZao4TmOQEe5w3PR4wSkQshoBzg7yRL24esbw4Ari9LTy
 UVkJeY6tcx4I+Bn+4dX3OsoSbeJ3H9lNtd3EGjfIKpzBhv4V/G2KChfcSL2ZCgh/yhh8qU4fl
 us1Fstq9fkzJ0oid0Z08fyC5+i/KD1rPGlIzsdAoseSBJejHrWltDet/+m4mnZenqHTFpN/aT
 MEKmg6HOXbpyDtGFjMmgWsd7/UrtYo1B7s9xA48mo3+5AWWZD7xl48f704nYSIDXIIHPPkk5v
 3r88brinj9nKzhb1vwLgSSbY99H0o0Hvwryw5eI8S5c3V11vNk7KUSNOhKRl/mwF2MGxTpGuW
 H5wU+Jj8HpBves7I6/QdgSbCYw5dCwbWt+Slob1ZI2hbXbfIg4/lQhBxv/UwlhOhPICjtssQg
 2C0f00g/vtOPZBCz1WvT7uzv+tTuYv0rSjASs328/yYfhb/PuPxuO3Fv0cxqjIkEt3oT8ppyd
 /gbZDnQpd+FJUFSTwvCzgb0ycgQgYI0x8MAy0N6ETP8TubGB61DtWEOw8lMtnxzPh2QyxgDug
 OTa/gg+FDpR1R8jEa1jAVSTwBO6Y93Uw5a333cKneeKGoEnbjUJ4MGzE2qjAFfVlMfRFvz2Ly
 ugb5XYi1Go0LCpHZ+rEGzEPPwc0Fl8bAEPHGTsuv1l14xDowmDKfh7whEzhjDvXlykuwWUP4W
 ZVAnlpldq5ylnOgRmPaFblsqZO2KKS4P29wjz5W5FbXoupI3J4Rje4u1GfejzWBnr0wImRN+O
 A8NOYmO39mm1EkVkZakyNVKuipdUSXne2cNLIm5ywDOIvEQeX6Wdy8JwOtY3mQPtaxX/EUEvy
 zh1p/PhofXVns5VTDtc7iwT+guq+R5Jku95IUcNlVn8aou7TYxAV2yxbTeoLnW6Ic3I87/D3k
 KVSyycb4KK4Rg2f6KIXASdxSJn0QggyIh5JIaB3oY7+fzhgPBJaNzbA2ItstHYkIWhZ2qX4sP
 FD4hJ0pey+C9Ns+0hm9fw5l+UkgTA7Kb2QsiLo9557ulv9SCfPB/VfidxhwQ8/MfzvVOzL+oj
 0dUPUo4CewOtewlDbjzrzcoEfTtdLoAnzG53szdHD0wgJVehQx9lewVaF7pc2sn/C8g4PrI0r
 QMqAeP3aOUhRra1D2jMpvhxZ2WH9W73aKvBwpiiITHqFQBvtneB8J8Dv1nIKVDY9aI9ppbsOP
 T9FIV3LrA852gglx+K3MKd4l9JCO0r1
Message-ID-Hash: VN4ALK2PDHYIXMOCGMDEHS7KXTGSOYBA
X-Message-ID-Hash: VN4ALK2PDHYIXMOCGMDEHS7KXTGSOYBA
X-MailFrom: shane@shanekirk.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VN4ALK2PDHYIXMOCGMDEHS7KXTGSOYBA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RG9lcyBhbnlvbmUga25vdyB0aGUgc3RhdGUgb2YgdGhlIFNORF9NSVhFUl9TQUJTVFJBQ1RfQkFT
SUMgbWl4ZXIgYWJzdHJhY3Rpb24/IEhhcyB0aGlzIGJlZW4gdW5vZmZpY2lhbGx5L29mZmljaWFs
bHkgZGVwcmVjYXRlZD8gSSd2ZSBiZWVuIGN1cmlvdXMgYWJvdXQgaXQgZm9yIGEgd2hpbGUgYW5k
IGhhdmUgYmVlbiB3YW50aW5nIHRvIGV4cGVyaW1lbnQgd2l0aCBpdCwgYnV0IG5vbmUgb2YgdGhl
IGRpc3Ryb3MgSSd2ZSB1c2VkIHJlY2VudGx5IHNlZW0gdG8gaW5zdGFsbCBzdXBwb3J0IGZvciBp
dC4gQWxzbywgdGhlIHNtaXhlci5jb25mIHVzZWQgYnkgdGhpcyBtaXhlciBhYnN0cmFjdGlvbiBz
ZWVtcyB0byBsZWFuIG9uIGEgbGlicmFyeSB0aGF0J3Mgbm90IGJ1aWx0IGFzIHBhcnQgb2YgYWxz
YS1saWIuIEl0J3MgYmVlbiBtYW55LCBtYW55IHllYXJzIHNpbmNlIG1vc3Qgb2YgdGhpcyBjb2Rl
IGhhcyBiZWVuIHRvdWNoZWQsIHNvIEknbSB3b25kZXJpbmcgaWYgSSdtIGdvaW5nIGRvd24gYSBy
YWJiaXQgaG9sZSB0aGF0J3MgYmVlbiBsb25nIGFiYW5kb25lZC4NCiANClRoYW5rcyENCiANCi1T
aGFuZSBLaXJr
