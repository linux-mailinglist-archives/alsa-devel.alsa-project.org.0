Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFCD6FF294
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 15:20:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C489E82;
	Thu, 11 May 2023 15:20:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C489E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683811252;
	bh=dvtDQ02cGc7qai0bvj3/3r2KD0eHYXuLvZlUe0kvyHw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SsJ2sEXV9YiwkJbIgUP3hp4ejuOdnORzjskoeJTupCfWx+3q8fl6O04aXaucwSgAo
	 tWautnavCv4d73kP1M7pJGYN3gKdZDat5iA/aU1F4y0Lb7Aqbl0y4yKomEgQNvwGE6
	 JDKXlUTPk5mVv8kUmqMS3CvoC9dn4m9S4Ic5vsnc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 723FBF80310;
	Thu, 11 May 2023 15:20:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D989F8032D; Thu, 11 May 2023 15:19:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C919F802E8
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 15:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C919F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=THmbf0tg
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34BDJdYC024505;
	Thu, 11 May 2023 08:19:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683811179;
	bh=dvtDQ02cGc7qai0bvj3/3r2KD0eHYXuLvZlUe0kvyHw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=THmbf0tgqqkM1xRVXukDVWcjUNlgfBnIDLLWUUqKneCWk0iQH5uLlEnk0le7vnqc8
	 huf9sNvgujgS2C05LOwQbdLsj2j2HWwdMj06LeUBrTc+IyyouXqpzG5lQHlvuoEGpG
	 QduZP4fVaHXVELMIft612OzX0KxcoU+Qwo4JOLNQ=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34BDJd6q044702
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 May 2023 08:19:39 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 May 2023 08:19:39 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Thu, 11 May 2023 08:19:39 -0500
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
Thread-Index: AQHZgw2r46dnAmj+dEya5A38wB/fZK9U5kcAgAA/wgD//+cmsA==
Date: Thu, 11 May 2023 13:19:39 +0000
Message-ID: <3c48d5e47aff478b8ce8998d7efe001b@ti.com>
References: <20230508054512.719-1-13916275206@139.com>
 <ca9d45cf-8a84-4fbc-e1dd-c96eef36fe25@linaro.org>
 <ZFyBzHWo3ORKAskX@finisterre.sirena.org.uk>
 <ca2ed8e9-850a-56c5-e395-72e5861b9c71@linaro.org>
In-Reply-To: <ca2ed8e9-850a-56c5-e395-72e5861b9c71@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.160.143]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: X6N66KO2PSV6LZRMNDTHDG2DTJSW5BAY
X-Message-ID-Hash: X6N66KO2PSV6LZRMNDTHDG2DTJSW5BAY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X6N66KO2PSV6LZRMNDTHDG2DTJSW5BAY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpPbiAxMS8wNS8yMDIzIDA3OjQ5LCBNYXJrIEJyb3duIHdyb3RlOg0KPj4gTWlzc2luZyBtaW5J
dGVtcywgYnV0Li4uDQo+IA0KPj4+ICsgICAgaXRlbXM6DQo+Pj4gKyAgICAgIG1pbmltdW06IDB4
MzgNCj4+PiArICAgICAgbWF4aW11bTogMHgzZg0KPiANCj4+IC4uLiBTbyB0aGVzZSBhcmUgZml4
ZWQ/IE5vIG5lZWQgdG8gZW5jb2RlIHRoZW0gaW4gc3VjaCBjYXNlLi4uDQo+IA0KPiBJJ20gbm90
IHN1cmUgSSB1bmRlcnN0YW5kIHlvdXIgY29uY2VybiBoZXJlLCB0aGVyZSdzIHVwIHRvIDQgcG9z
c2libGUgDQo+IHZhbHVlcyBmcm9tIDB4MzgtMHgzZiB3aGljaCBoYXMgbW9yZSB0aGFuIDQgcG9z
c2libGUgdmFsdWVzLg0KDQpBcmVuJ3QgdGhlIGFkZHJlc3NlcyBnb2luZyB0byBiZSBpbmNyZW1l
bnRlZCBieSBvbmUgKHVwIHRvIDggb2YgZGV2aWNlcyBpbiB0b3RhbCk/DQoNCk5vLCB0aGUgaTJj
IGFkZHJlc3Mgb3JkZXIgaXMgbm90IGFsd2F5cyBtb25vdG9uaWMgaW5jcmVhc2Ugb3IgZGVjcmVh
c2UsIHNvbWV0aW1lIGl0IHdvdWxkIGJlIGRpc29yZGVyLCBhY2NvcmRpbmcgdG8gdGhlIGFwcGxp
Y2F0aW9uLg0KRWFjaCBkZXZpY2Ugd291bGQgaGF2ZSBlaWdodCBwb3NzaWJsZSBpMmMgYWRkcmVz
cywgdGhlIGZpbmFsIGFkZHJlc3MgZGVwZW5kcyBvbiB0aGUgaGFyZHdhcmUgY29ubmVjdGlvbnMu
DQoNCkJlc3QgcmVnYXJkcywNCktyenlzenRvZg0KDQo=
