Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AC64FA7AD
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Apr 2022 14:33:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 142D218EE;
	Sat,  9 Apr 2022 14:32:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 142D218EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649507614;
	bh=cvmxKaWWH4h9hw2g1qMin6dvw6Henpq5DU7P6qlLi20=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G/eSAKGDa0HlQLufAUz7Edtgm7ELByFkLYnXVxYGEISuK2LPhnzd4vh1viiXwWpb7
	 ylzWuKzfS2jrGR8AXDn3Q/yTq5XP3d9NQIh/7c3QzMCOS+0WqKk00t4yF6t0PkuQZS
	 vcrbjy9/IjaW5vmZTzHHpkmthSXt/Kui0hYNjhRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76BF4F80254;
	Sat,  9 Apr 2022 14:32:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24855F80253; Sat,  9 Apr 2022 14:32:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,PRX_APP_ATTACH,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E796F80054
 for <alsa-devel@alsa-project.org>; Sat,  9 Apr 2022 14:32:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E796F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MdkD+LRR"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 239CWDri038222;
 Sat, 9 Apr 2022 07:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1649507533;
 bh=VPSKr+fE4UN+HClFuDN9x/kAxwQ26BcKeLG+mwPc8Rg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=MdkD+LRRORW56Vi31T+iri67g5gMEXqF0Gpj+tO+LuYcFI17bioRzPBnvaQp/b8oI
 tdPCWG0r/z2lVoWCi5/hxOuPF7MuhSfqEhCyyuyEnRICgS/Nq1V479cw9U1xFb2wMu
 oET4l3i+9ZiUZFCtFJf8fcWFjf2kyOvni2bd5Xt4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 239CWDiu014102
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 9 Apr 2022 07:32:13 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 9
 Apr 2022 07:32:12 -0500
Received: from DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe]) by
 DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe%17]) with mapi id
 15.01.2308.014; Sat, 9 Apr 2022 07:32:12 -0500
From: "Xu, Yang" <raphael-xu@ti.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [EXTERNAL] Re: [PATCH v6 3/3] update to support either TAS2764 or
 TAS2780
Thread-Topic: [EXTERNAL] Re: [PATCH v6 3/3] update to support either TAS2764
 or TAS2780
Thread-Index: AQHYSNG0ZpP17ReTjUCeCp3SNVUls6zniglH
Date: Sat, 9 Apr 2022 12:32:12 +0000
Message-ID: <0818F893-038F-47B2-9003-2893316038B1@ti.com>
References: <20220401150301.1011-1-13691752556@139.com>
 <20220401150301.1011-3-13691752556@139.com>,<YkwPZJLnxDe9YyZp@sirena.org.uk>
In-Reply-To: <YkwPZJLnxDe9YyZp@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/mixed;
 boundary="_004_0818F893038F47B290032893316038B1ticom_"
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "Ding, Shenghao" <shenghao-ding@ti.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Raphael-Xu <13691752556@139.com>, "Navada Kanyana, Mukund" <navada@ti.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--_004_0818F893038F47B290032893316038B1ticom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCg0KDQrlnKggMjAyMuW5tDTmnIg15pel77yM5LiL5Y2INTo0NO+8jE1hcmsgQnJvd24gPGJy
b29uaWVAa2VybmVsLm9yZz4g5YaZ6YGT77yaDQoNCu+7v09uIEZyaSwgQXByIDAxLCAyMDIyIGF0
IDExOjAzOjAxUE0gKzA4MDAsIFJhcGhhZWwtWHUgd3JvdGU6DQpmaXggbm8gc291bmQgaXNzdWUg
b24gc29tZSBwbGF0Zm9ybXMNCg0KU2lnbmVkLW9mZi1ieTogUmFwaGFlbC1YdSA8MTM2OTE3NTI1
NTZAMTM5LmNvbT4NCi0tLQ0Kc291bmQvc29jL2NvZGVjcy90YXMyN3h4LmMgfCA0MDUgKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0Kc291bmQvc29jL2NvZGVjcy90YXMyN3h4
LmggfCAgIDIgKy0NCjIgZmlsZXMgY2hhbmdlZCwgMjk1IGluc2VydGlvbnMoKyksIDExMiBkZWxl
dGlvbnMoLSkNCg0KVGhpcyBkb2Vzbid0IGFwcGx5IGFnYWluc3QgY3VycmVudCBjb2RlICh3aXRo
IHlvdXIgZmlyc3QgdHdvIHBhdGNoZXMNCmFwcGxpZWQpLCBwbGVhc2UgY2hlY2sgYW5kIHJlc2Vu
ZCAtIHNob3VsZCBqdXN0IGJlIGEgcmViYXNlLg0KDQpKdXN0IHJlc3VibWl0IHRoZSBwYXRjaGVz
IHdoaWNoIGJhc2Ugb24gdGhlICBsYXRlc3Qga2VybmVsIG9yaWdpbi9tYXN0ZXIgdG9kYXkuDQo=

--_004_0818F893038F47B290032893316038B1ticom_
Content-Type: application/octet-stream; name="signature.asc"
Content-Description: signature.asc
Content-Disposition: attachment; filename="signature.asc"; size=499;
	creation-date="Sat, 09 Apr 2022 12:32:12 GMT";
	modification-date="Sat, 09 Apr 2022 12:32:12 GMT"
Content-ID: <EB0F7F24-26EB-41C5-92DD-5DFA2C453684>
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NCg0KaVFFekJBQUJDZ0FkRmlFRXJlWm9xbWRY
R0xXZjRwL3FKTmFMY2wxVWg5QUZBbUpNRDJRQUNna1FKTmFMY2wxVQ0KaDlDU3BnZ0FnTEEzVit5
MDZ6QklueFNpSnhuamZjT3VJZ2Vrdk1KTWdydG1LQW5CVmhIeVdFVjQ4NXdHT3pDaw0KMzI5K1Zj
Y1ZIaENoS1l2cU51L20vQXIvdGxzNG4wNXZveFFWTVRqSm9mTUlqeFJsVEd3MXJON1EyZElBT2lm
YQ0KazBZSTEvRE9iWVg2K2gwUVI1Q3ZwV2Z4VFpmdFJTcFVzd3Y0cjB5aTNCaGZMMmRsMExTMktF
VmVMWjlKTkQ5Vg0KQS9EN3V5Vm5NOFUzQ201ZFYvT3NSQ1BPL1JRTloza2FDU0NhWXg4ZS9FYkQr
MW44RFFWQzZmVCtBaWdPUWlOUw0Kc3U1bTdLdzlPTE5PNUp2TjhxeS9yMG1sbUpuWWZ1bm5TSTdH
c0ZMN3FGOG9ORlNPRzIvbWpTN1FrMmllT091WA0KdWFTV2RaT045VmlwYkhTR083L2xzSFhqN1g3
VzZ3PT0NCj1CQWJQDQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg==

--_004_0818F893038F47B290032893316038B1ticom_--
