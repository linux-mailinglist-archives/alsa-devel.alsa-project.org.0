Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDBC70680E
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 14:26:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 189411F7;
	Wed, 17 May 2023 14:25:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 189411F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684326374;
	bh=ZdnZw29gNXuAQdLSzCiUFNQsPERQNjSnz3MX3E3cqOA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=szSgYSIHPp2tQsncMvFpguotRMLrgSFxP/2eUZJQ6jsUzJ5OtPk/vfx1+vahtmuYH
	 /ofR9zkKm7dj5Hp3c+phIbtbiUb5nTES3FgcXd2XJuB2G2+oqZGVCeHh2JCHKXl2k9
	 xl90YrhgUW0sR05Mg5aGGWf9Qmv7g+upvj627pfg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AEF5F8016D; Wed, 17 May 2023 14:25:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC803F8025A;
	Wed, 17 May 2023 14:25:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D711F80272; Wed, 17 May 2023 14:24:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0591F8016D
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 14:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0591F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=TZXIbrSY
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34HCOjDH077036;
	Wed, 17 May 2023 07:24:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684326285;
	bh=ZdnZw29gNXuAQdLSzCiUFNQsPERQNjSnz3MX3E3cqOA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=TZXIbrSYGkgeTg7sUwZoLimUISOmupo2ubHNtf2S/R1gAnO/oEJDDX+8BI4WwRSrB
	 EPTB6FN6PNL/rKPrxMw16h+u+uJdfiZLT3KjqunEIfFvsuQwmLk8Fz1tURtTUiTLCJ
	 DowI4GQ2nDH/mJpIf0hKp2sCSYMobVDbvhkQ9PcQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34HCOjQu012585
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 May 2023 07:24:45 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 May 2023 07:24:44 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Wed, 17 May 2023 07:24:44 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mark Brown
	<broonie@kernel.org>
CC: Shenghao Ding <13916275206@139.com>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org"
	<robh+dt@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
        "Lu, Kevin" <kevin-lu@ti.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Xu, Baojun"
	<x1077012@ti.com>, "Gupta, Peeyush" <peeyush@ti.com>,
        "Navada Kanyana,
 Mukund" <navada@ti.com>,
        "gentuser@gmail.com" <gentuser@gmail.com>,
        "Ryan_Chu@wistron.com" <Ryan_Chu@wistron.com>,
        "Sam_Wu@wistron.com"
	<Sam_Wu@wistron.com>
Subject: RE: [EXTERNAL] Re: [PATCH v2 2/5] ASoC: dt-bindings: Add tas2781
 amplifier
Thread-Topic: [EXTERNAL] Re: [PATCH v2 2/5] ASoC: dt-bindings: Add tas2781
 amplifier
Thread-Index: AQHZgw2r46dnAmj+dEya5A38wB/fZK9U5kcAgAA/wgD//+cmsIAAb9cAgAjm74A=
Date: Wed, 17 May 2023 12:24:44 +0000
Message-ID: <26c335994d91492eb9439483ac98f61c@ti.com>
References: <20230508054512.719-1-13916275206@139.com>
 <ca9d45cf-8a84-4fbc-e1dd-c96eef36fe25@linaro.org>
 <ZFyBzHWo3ORKAskX@finisterre.sirena.org.uk>
 <ca2ed8e9-850a-56c5-e395-72e5861b9c71@linaro.org>
 <3c48d5e47aff478b8ce8998d7efe001b@ti.com>
 <3e62d34b-a439-ac42-83a1-deb26ade63ff@linaro.org>
In-Reply-To: <3e62d34b-a439-ac42-83a1-deb26ade63ff@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.160.143]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: 5KPEMIGGMJT5YJOD5OSG6R7GWNUQ6Q7H
X-Message-ID-Hash: 5KPEMIGGMJT5YJOD5OSG6R7GWNUQ6Q7H
X-MailFrom: shenghao-ding@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5KPEMIGGMJT5YJOD5OSG6R7GWNUQ6Q7H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQoNCk9uIDExLzA1LzIwMjMgMTU6MTksIERpbmcsIFNoZW5naGFvIHdyb3RlOg0KPiANCj4gT24g
MTEvMDUvMjAyMyAwNzo0OSwgTWFyayBCcm93biB3cm90ZToNCj4+PiBNaXNzaW5nIG1pbkl0ZW1z
LCBidXQuLi4NCj4+DQo+Pj4+ICsgICAgaXRlbXM6DQo+Pj4+ICsgICAgICBtaW5pbXVtOiAweDM4
DQo+Pj4+ICsgICAgICBtYXhpbXVtOiAweDNmDQo+Pg0KPj4+IC4uLiBTbyB0aGVzZSBhcmUgZml4
ZWQ/IE5vIG5lZWQgdG8gZW5jb2RlIHRoZW0gaW4gc3VjaCBjYXNlLi4uDQo+Pg0KPj4gSSdtIG5v
dCBzdXJlIEkgdW5kZXJzdGFuZCB5b3VyIGNvbmNlcm4gaGVyZSwgdGhlcmUncyB1cCB0byA0IHBv
c3NpYmxlIA0KPj4gdmFsdWVzIGZyb20gMHgzOC0weDNmIHdoaWNoIGhhcyBtb3JlIHRoYW4gNCBw
b3NzaWJsZSB2YWx1ZXMuDQo+IA0KPiBBcmVuJ3QgdGhlIGFkZHJlc3NlcyBnb2luZyB0byBiZSBp
bmNyZW1lbnRlZCBieSBvbmUgKHVwIHRvIDggb2YgZGV2aWNlcyBpbiB0b3RhbCk/DQoNCldpdGgg
eW91ciBzdHlsZSBvZiByZXBsaWVzLCBpdCBsb29rcyBsaWtlIHlvdSB3cm90ZSBpdC4uLg0KDQpB
bGwgdGhlIGFkZHJlc3NlcyBvZiB0YXMyNzgxIGFyZSBpbiByYW5nZSBmcm9tIDB4MzggdG8gMHgg
M2YsIHRoZSBvcmRlciBvZiB0aGVtIGluIHRoZSBhdWRpby1zbG90cyBpdGVtIGFyZSB1cCB0byB0
aGUgaGFyZHdhcmUgY29ubmVjdGlvbnMuDQpJIGhhdmUgc3R1ZGllZCB0aGUgcmVnIGl0ZW0gdG8g
c2F2ZSBtdWx0aXBsZSBpMmMgYWRkcmVzc2VzIGZvciBtdWx0aXBsZSBwaWVjZXMgb2YgdGFzMjc4
MSBhbmQgZm91bmQgdGhhdCAiJyNhZGRyZXNzLWNlbGxzJzogICAgIG1heGltdW06IDMiDQp0aGF0
IG1lYW5zICJyZWciIHN0b3JlIG5vdCBtb3JlIHRoYW4gdGhyZWUgYWRkcmVzc2VzLCB0aGlzIGNh
bid0IHN1cHBvcnQgdGhlIG1vcmUgdGhhbiAzIHBpZWNlcyBvZiB0YXMyNzgxLCANCnN1Y2ggYXMg
NC1zbG90IFRETSBjYXNlIG9yIG11bHRpcGxlIGR1YWwtbWVtYnJhbmUgc3BlYWtlcnMgY2FzZSwg
aW4gc3VjaCBhIGNhc2UsIG9uZSBzcGVha2VyIHdpbGwgdXNlDQogdHdvIHBpZWNlcyBvZiB0YXMy
NzgxIHRvIGJvb3N0LCB1c3VhbGx5IGF0IGxlYXN0IDYgcGllY2VzIG9mIHRhczI3ODEgd2lsbCBi
ZSB1c2VkIGluIGEgbGFwdG9wIG9yIG90aGVyIGRldmljZS4NCg0KPiANCj4gTm8sIHRoZSBpMmMg
YWRkcmVzcyBvcmRlciBpcyBub3QgYWx3YXlzIG1vbm90b25pYyBpbmNyZWFzZSBvciBkZWNyZWFz
ZSwgc29tZXRpbWUgaXQgd291bGQgYmUgZGlzb3JkZXIsIGFjY29yZGluZyB0byB0aGUgYXBwbGlj
YXRpb24uDQo+IEVhY2ggZGV2aWNlIHdvdWxkIGhhdmUgZWlnaHQgcG9zc2libGUgaTJjIGFkZHJl
c3MsIHRoZSBmaW5hbCBhZGRyZXNzIGRlcGVuZHMgb24gdGhlIGhhcmR3YXJlIGNvbm5lY3Rpb25z
Lg0KDQpPSywgdGhlIHF1ZXN0aW9uIGFib3V0IHRoZSBicm9hZGNhc3QgaXMgc3RpbGwgdGhlcmUg
LSBjYW5ub3QgaXQgYmUgZGVkdWNlZD8NCg0KVGhlIHJlYXNvbiB0byBkZWZpbmUgdGhpcyBpdGVt
IGFuZCBhZGQgaXQgaW4gZHRzIGlzIHRoYXQgdGVsbCB0YXMyNzgxIGRyaXZlciBjb2RlIHRvIGVu
YWJsZSBicm9hZGNhc3QgYW5kIGl0cyBhZGRyZXNzLiANClJlbW92aW5nIHRoaXMgaXRlbSBtZWFu
cyBkaXNhYmxpbmcgYnJvYWRjYXN0LiBEbyB5b3Ugd2FudCB0byBoYXJkY29kZSB0aGUgZ2xvYmFs
IGFkZHJlc3MgaW4gdGhlIGNvZGU/DQpBbmQgdGhpcyBpdGVtIG9ubHkgdXNlZCBhcyBhIGZsYWcg
dG8gZW5hYmxlIG9yIGRpc2FibGU/DQoNCkJlc3QgcmVnYXJkcywNCktyenlzenRvZg0KDQo=
