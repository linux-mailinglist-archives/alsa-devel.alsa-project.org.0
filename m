Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B584A6FE345
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 19:30:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A1B5EFF;
	Wed, 10 May 2023 19:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A1B5EFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683739803;
	bh=CaqHszddgTyXgu3xb0srGpU7C8sv3zdBncPHByFWhTg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GPvB/4eG2x3wOCLoZv3J3VT1hDBYnUg8ssFiR+kV+qIsmIl0KVlflIpqW1wNenACa
	 PuA06f1TYK45c6sZn/F6t3jmRM23vfyAkvolxRvbAS0QGK3s5G43zNF7j+yncuE10l
	 Z8HDMHi2PjNfVNoIV1ah47LJ9+XWfTejbWmhdCHY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D0D1F8057B;
	Wed, 10 May 2023 19:27:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B81CF8032D; Wed, 10 May 2023 16:54:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HTML_MESSAGE,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 649CAF8014C
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 16:54:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 649CAF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=cBN/bqRy
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34A3iPiP002604;
	Wed, 10 May 2023 09:54:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=PODMain02222019;
 bh=5NqxY0JDrmwTtwaX1fymwYRbERiM2Ff3n2TGSUJHeVA=;
 b=cBN/bqRyyMeoSHDAnBPkSM+rkw8Sjw78kI5QJ9l+fQ9qvsOJ9T9NoRF+4JTy454unoe9
 PxKARFB99/QoRgf5t5c1nTfvgyTBpstYC8wPDMtrXakezyZv3gKQ2lGDzTTQWMKdozRz
 hZIL91yfYiodO1RaQPeLHFjLvjhczYEIjX4UcT4pOm+VKBbB3tCit10zsnTmeIe5ec35
 NvGrb5JWWaZ6lJSQcDzsQU24NSPqYd7KwM704ZilnEEj9zzyFlEd1F3hxTURfCRT8360
 gEn1KdAYGNO3oyM7p8SNiRYWiD4TKtVkK3/fS26cpDDPiwFQc5W3+RR3jyaxXAjXgO0C /g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qf7s42wuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 09:54:32 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Wed, 10 May
 2023 09:54:31 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 10 May 2023 09:54:31 -0500
Received: from [141.131.206.93] (vkarpovich-ThinkStation-P620.ad.cirrus.com
 [141.131.206.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 099EBB2F;
	Wed, 10 May 2023 14:54:29 +0000 (UTC)
Message-ID: <6991f71e-f92a-4edd-c0c6-cfea12e23433@opensource.cirrus.com>
Date: Wed, 10 May 2023 09:54:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ASoC: cs35l45: Relicense to GPL only
To: Charles Keepax <ckeepax@opensource.cirrus.com>, <broonie@kernel.org>
CC: <pierre-louis.bossart@linux.intel.com>, <u.kleine-koenig@pengutronix.de>,
        <james.schulman@cirrus.com>, <rf@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
References: <20230510092534.3919120-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
In-Reply-To: <20230510092534.3919120-1-ckeepax@opensource.cirrus.com>
X-Proofpoint-ORIG-GUID: Vi5xTbplBs2MzDKLgcMO87hBErtZiISX
X-Proofpoint-GUID: Vi5xTbplBs2MzDKLgcMO87hBErtZiISX
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=04949bf0a8=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VZO52ZPA2I2XA5D45YPO6RTZT2YP2A6A
X-Message-ID-Hash: VZO52ZPA2I2XA5D45YPO6RTZT2YP2A6A
X-Mailman-Approved-At: Wed, 10 May 2023 17:27:06 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VZO52ZPA2I2XA5D45YPO6RTZT2YP2A6A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

UmV2aWV3ZWQtYnk6IFZsYWQgS2FycG92aWNoIDx2a2FycG92aUBvcGVuc291cmNlLmNpcnJ1cy5j
b20+DQoNCk9uIDUvMTAvMjMgMDQ6MjUsIENoYXJsZXMgS2VlcGF4IHdyb3RlOg0KPiBDaXJydXMg
bmV2ZXIgaW50ZW5kZWQgdG8gdXBzdHJlYW0gZHVhbCBsaWNlbnNlZCBjb2RlLCBjb252ZXJ0IHRv
DQo+IEdQTCBvbmx5Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGVzIEtlZXBheDxja2VlcGF4
QG9wZW5zb3VyY2UuY2lycnVzLmNvbT4NCj4gLS0tDQo+DQo+IEFwb2xvZ2llcyBmb3IgdGhpcyBi
dXQgdGhpcyB3YXMgbmV2ZXIgb3VyIGludGVudGlvbiBhbmQgSSBiZWxpZXZlIHRoYXQNCj4gaXQg
Y2FuIGJlIGEgbGl0dGxlIGxlZ2FsbHkgaW52b2x2ZWQgbWFpbnRhaW5pbmcgZHVhbCBsaWNlbnNl
ZCBrZXJuZWwgY29kZS4NCj4gRm9ydHVuYXRlbHkgbm90IHRoYXQgbWFueSBwZW9wbGUgb3V0c2lk
ZSBvZiBDaXJydXMgaGF2ZSBjb250cmlidXRlZCB0bw0KPiB0aGUgZmlsZXMgaW4gcXVlc3Rpb24u
IEkgaGF2ZSBDQ2VkIGV2ZXJ5b25lIHdobyBoYXMgY29udHJpYnV0ZWQgYm90aA0KPiBpbnRlcm5h
bGx5IGFuZCBleHRlcm5hbGx5Lg0KPg0KPiBUaGFua3MsDQo+IENoYXJsZXMNCj4NCj4gICBzb3Vu
ZC9zb2MvY29kZWNzL2NzMzVsNDUtaTJjLmMgICAgfCA0ICsrLS0NCj4gICBzb3VuZC9zb2MvY29k
ZWNzL2NzMzVsNDUtc3BpLmMgICAgfCA0ICsrLS0NCj4gICBzb3VuZC9zb2MvY29kZWNzL2NzMzVs
NDUtdGFibGVzLmMgfCAyICstDQo+ICAgc291bmQvc29jL2NvZGVjcy9jczM1bDQ1LmMgICAgICAg
IHwgNCArKy0tDQo+ICAgc291bmQvc29jL2NvZGVjcy9jczM1bDQ1LmggICAgICAgIHwgMiArLQ0K
PiAgIDUgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPg0K
PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy9jczM1bDQ1LWkyYy5jIGIvc291bmQvc29j
L2NvZGVjcy9jczM1bDQ1LWkyYy5jDQo+IGluZGV4IDU4MzJlYmI5MGMyYjkuLjc3ZTBmODc1MGYz
NzUgMTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3NvYy9jb2RlY3MvY3MzNWw0NS1pMmMuYw0KPiArKysg
Yi9zb3VuZC9zb2MvY29kZWNzL2NzMzVsNDUtaTJjLmMNCj4gQEAgLTEsNCArMSw0IEBADQo+IC0v
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBPUiBCU0QtMy1DbGF1c2UNCj4gKy8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICAgLy8NCj4gICAvLyBjczM1bDQ1
LWkyYy5jIC0tIENTMzVMNDUgSTJDIGRyaXZlcg0KPiAgIC8vDQo+IEBAIC03Miw1ICs3Miw1IEBA
IG1vZHVsZV9pMmNfZHJpdmVyKGNzMzVsNDVfaTJjX2RyaXZlcik7DQo+ICAgDQo+ICAgTU9EVUxF
X0RFU0NSSVBUSU9OKCJJMkMgQ1MzNUw0NSBkcml2ZXIiKTsNCj4gICBNT0RVTEVfQVVUSE9SKCJK
YW1lcyBTY2h1bG1hbiwgQ2lycnVzIExvZ2ljIEluYyw8amFtZXMuc2NodWxtYW5AY2lycnVzLmNv
bT4iKTsNCj4gLU1PRFVMRV9MSUNFTlNFKCJEdWFsIEJTRC9HUEwiKTsNCj4gK01PRFVMRV9MSUNF
TlNFKCJHUEwiKTsNCj4gICBNT0RVTEVfSU1QT1JUX05TKFNORF9TT0NfQ1MzNUw0NSk7DQo+IGRp
ZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL2NzMzVsNDUtc3BpLmMgYi9zb3VuZC9zb2MvY29k
ZWNzL2NzMzVsNDUtc3BpLmMNCj4gaW5kZXggYTAwYjIzYjQxODBjNS4uNWVmYjc3NTMwY2MzMyAx
MDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2NvZGVjcy9jczM1bDQ1LXNwaS5jDQo+ICsrKyBiL3Nv
dW5kL3NvYy9jb2RlY3MvY3MzNWw0NS1zcGkuYw0KPiBAQCAtMSw0ICsxLDQgQEANCj4gLS8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wIE9SIEJTRC0zLUNsYXVzZQ0KPiArLy8gU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gICAvLw0KPiAgIC8vIGNzMzVsNDUtc3Bp
LmMgLS0gQ1MzNUw0NSBTUEkgZHJpdmVyDQo+ICAgLy8NCj4gQEAgLTc0LDUgKzc0LDUgQEAgbW9k
dWxlX3NwaV9kcml2ZXIoY3MzNWw0NV9zcGlfZHJpdmVyKTsNCj4gICANCj4gICBNT0RVTEVfREVT
Q1JJUFRJT04oIlNQSSBDUzM1TDQ1IGRyaXZlciIpOw0KPiAgIE1PRFVMRV9BVVRIT1IoIkphbWVz
IFNjaHVsbWFuLCBDaXJydXMgTG9naWMgSW5jLDxqYW1lcy5zY2h1bG1hbkBjaXJydXMuY29tPiIp
Ow0KPiAtTU9EVUxFX0xJQ0VOU0UoIkR1YWwgQlNEL0dQTCIpOw0KPiArTU9EVUxFX0xJQ0VOU0Uo
IkdQTCIpOw0KPiAgIE1PRFVMRV9JTVBPUlRfTlMoU05EX1NPQ19DUzM1TDQ1KTsNCj4gZGlmZiAt
LWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvY3MzNWw0NS10YWJsZXMuYyBiL3NvdW5kL3NvYy9jb2Rl
Y3MvY3MzNWw0NS10YWJsZXMuYw0KPiBpbmRleCA0NjYxMGU2NGU4MTg4Li4wNjZmODNjMGM3YWMy
IDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvY29kZWNzL2NzMzVsNDUtdGFibGVzLmMNCj4gKysr
IGIvc291bmQvc29jL2NvZGVjcy9jczM1bDQ1LXRhYmxlcy5jDQo+IEBAIC0xLDQgKzEsNCBAQA0K
PiAtLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgT1IgQlNELTMtQ2xhdXNlDQo+
ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiAgIC8vDQo+ICAgLy8gY3Mz
NWw0NS10YWJsZXMuYyAtLSBDUzM1TDQ1IEFMU0EgU29DIGF1ZGlvIGRyaXZlcg0KPiAgIC8vDQo+
IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL2NzMzVsNDUuYyBiL3NvdW5kL3NvYy9jb2Rl
Y3MvY3MzNWw0NS5jDQo+IGluZGV4IGMzMTU5N2Y2YmZhZTEuLmQxZWRiOTg3NmMxMGYgMTAwNjQ0
DQo+IC0tLSBhL3NvdW5kL3NvYy9jb2RlY3MvY3MzNWw0NS5jDQo+ICsrKyBiL3NvdW5kL3NvYy9j
b2RlY3MvY3MzNWw0NS5jDQo+IEBAIC0xLDQgKzEsNCBAQA0KPiAtLy8gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAgT1IgQlNELTMtQ2xhdXNlDQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMA0KPiAgIC8vDQo+ICAgLy8gY3MzNWw0NS5jIC0gQ1MzNUw0NSBBTFNB
IFNvQyBhdWRpbyBkcml2ZXINCj4gICAvLw0KPiBAQCAtMTI5Niw0ICsxMjk2LDQgQEAgRVhQT1JU
X1NZTUJPTF9OU19HUEwoY3MzNWw0NV9wbV9vcHMsIFNORF9TT0NfQ1MzNUw0NSk7DQo+ICAgTU9E
VUxFX0RFU0NSSVBUSU9OKCJBU29DIENTMzVMNDUgZHJpdmVyIik7DQo+ICAgTU9EVUxFX0FVVEhP
UigiSmFtZXMgU2NodWxtYW4sIENpcnJ1cyBMb2dpYyBJbmMsPGphbWVzLnNjaHVsbWFuQGNpcnJ1
cy5jb20+Iik7DQo+ICAgTU9EVUxFX0FVVEhPUigiUmljaGFyZCBGaXR6Z2VyYWxkPHJmQG9wZW5z
b3VyY2UuY2lycnVzLmNvbT4iKTsNCj4gLU1PRFVMRV9MSUNFTlNFKCJEdWFsIEJTRC9HUEwiKTsN
Cj4gK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2Rl
Y3MvY3MzNWw0NS5oIGIvc291bmQvc29jL2NvZGVjcy9jczM1bDQ1LmgNCj4gaW5kZXggMGRhMjg0
MzlmNjI4Yi4uNjExMzVhMzE2ZGYzMyAxMDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2NvZGVjcy9j
czM1bDQ1LmgNCj4gKysrIGIvc291bmQvc29jL2NvZGVjcy9jczM1bDQ1LmgNCj4gQEAgLTEsNCAr
MSw0IEBADQo+IC0vKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBPUiBCU0QtMy1D
bGF1c2UgKi8NCj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovDQo+ICAg
LyoNCj4gICAgKiBjczM1bDQ1LmggLSBDUzM1TDQ1IEFMU0EgU29DIGF1ZGlvIGRyaXZlcg0KPiAg
ICAq
