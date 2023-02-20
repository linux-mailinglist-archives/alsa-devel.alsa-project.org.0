Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E8A69D411
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Feb 2023 20:26:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 548EDEBB;
	Mon, 20 Feb 2023 20:25:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 548EDEBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676921205;
	bh=mhex65RHYPWiRq98JJHpdUOjqSti3H7l2Q2jmhLixig=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M/aiAFJoCxrHkYD3Olh2KNhn4fX4UkgGWJveop5svOk46PG4LSnVDbU47hHjW/JX6
	 fp4uc50awfJ7a61w4RX9/mNI1pi6YYtIOH2NF5T7yBhwx4W/MigNznrxuTGRjJOTTG
	 a/gkQ7gn8MJVU+D3HCXwOge+K9sFySCgi4G0qaZ4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 644AFF80083;
	Mon, 20 Feb 2023 20:25:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 356CEF80266; Mon, 20 Feb 2023 20:25:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HTML_MESSAGE,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 348EFF800BA
	for <alsa-devel@alsa-project.org>; Mon, 20 Feb 2023 20:25:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 348EFF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=H62igKwH
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31KHMr2N029656;
	Mon, 20 Feb 2023 13:25:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=PODMain02222019;
 bh=363M9H1sb198VwVEOhU4MvQdkpTmAqaUjxc8k/t/0jk=;
 b=H62igKwHpzu+/l1ta9V0BuUQPoGgQ9B/e2FnLMoysA6JTYyPW6VWOeMRhvryV9ikK/5J
 QPkJHJghLdvIXK+78Nt0qdl/FnpaC6mDkogQtkyCm1mgtXJekcnG063PH+SrMEMn7pH1
 SBQDLmG2HwXXQEzNyugVHLC6W3Nnv5KnS1fv+vw5aCBFgTA2fDdSpSLrIPsCt3CC2z6x
 /fQbcaLDJWE4Mf/Jl1muwGg0bLAclqf7tqTYJXwIuBLfuhbMxLN5yvVIJLP1gOQyOUql
 0IUUQKL48BD2RaK5MhhY9YH8KLZNrblnF8PnsKckZP7Ry5NKyat5gcsDMlBkaTElr/CE zw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ntvy7jkdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Feb 2023 13:25:37 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Mon, 20 Feb
 2023 13:25:35 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.21 via Frontend Transport; Mon, 20 Feb 2023 13:25:35 -0600
Received: from [141.131.215.58] (david-linux.ad.cirrus.com [141.131.215.58])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5C793B0E;
	Mon, 20 Feb 2023 19:25:33 +0000 (UTC)
Message-ID: <d86d989b-0d82-74b3-a5da-9972324e9477@opensource.cirrus.com>
Date: Mon, 20 Feb 2023 13:25:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 3/4] ALSA: cs35l41: Add shared boost feature
To: Lucas Tanure <lucas.tanure@collabora.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>
References: <20230210091942.10866-1-lucas.tanure@collabora.com>
 <20230210091942.10866-4-lucas.tanure@collabora.com>
 <20230210134341.GF68926@ediswmail.ad.cirrus.com>
 <cfacc3d6-2daa-6aa3-ba19-281b7e48bb47@collabora.com>
 <20230211170638.GG68926@ediswmail.ad.cirrus.com>
 <1e3ef067-9b39-dc19-5fbc-75436c67f206@collabora.com>
Content-Language: en-US
From: David Rhodes <drhodes@opensource.cirrus.com>
In-Reply-To: <1e3ef067-9b39-dc19-5fbc-75436c67f206@collabora.com>
X-Proofpoint-ORIG-GUID: 7E8p-1ad3S1xAjSE2WY4DJOcAWapiNh5
X-Proofpoint-GUID: 7E8p-1ad3S1xAjSE2WY4DJOcAWapiNh5
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: QLGE2G4SFMQSI6SI6Q6VBT6XRTHMCBFH
X-Message-ID-Hash: QLGE2G4SFMQSI6SI6Q6VBT6XRTHMCBFH
X-MailFrom: prvs=74150f5cb0=drhodes@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: David Rhodes <david.rhodes@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QLGE2G4SFMQSI6SI6Q6VBT6XRTHMCBFH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpPbiAyLzEyLzIzIDAzOjI4LCBMdWNhcyBUYW51cmUgd3JvdGU6DQo+IE9uIDExLTAyLTIwMjMg
MTc6MDYsIENoYXJsZXMgS2VlcGF4IHdyb3RlOg0KPj4gT24gRnJpLCBGZWIgMTAsIDIwMjMgYXQg
MDI6Mzk6NTZQTSArMDAwMCwgTHVjYXMgVGFudXJlIHdyb3RlOg0KPj4+IE9uIDEwLTAyLTIwMjMg
MTM6NDMsIENoYXJsZXMgS2VlcGF4IHdyb3RlOg0KPj4+PiBPbiBGcmksIEZlYiAxMCwgMjAyMyBh
dCAwOToxOTo0MUFNICswMDAwLCBMdWNhcyBUYW51cmUgd3JvdGU6DQo+Pj4+PiArIHtDUzM1TDQx
X01EU1lOQ19FTizCoMKgwqDCoMKgwqDCoCAweDAwMDAxMDAwfSwNCj4+Pj4gRGF2aWQncyBpbnRl
cm5hbCBwYXRjaCBhcHBlYXJzIHRvIHNldCAweDMwMDAgb24gdGhlIGFjdGl2ZSBzaWRlLA0KPj4+
PiBub3Qgc3VyZSB3aGVyZSB0aGF0IGRpZmZlcmVuY2Ugc251Y2sgaW4sIG9yIHdoaWNoIGlzIHRo
ZSBjb3JyZWN0DQo+Pj4+IHZhbHVlLiBZb3VyIHNldHRpbmdzIGFwcGVhciB0byBtYWtlIGxvZ2lj
YWwgc2Vuc2UgdG8gbWUgdGhvdWdoLCBUWA0KPj4+PiBvbiB0aGUgYWN0aXZlIHNpZGUsIFJYIG9u
IHRoZSBwYXNzaXZlIHNpZGUuDQo+Pj4gQW5kIGFzIHRoZSBwYXRjaCBzZXRzIFRYIGFuZCBSWCBp
biB0aGUgc2FtZSBjaGlwIEkgY2hhbmdlZCB0byBmb2xsb3cNCj4+PiB0aGUgZG9jdW1lbnRhdGlv
bi4NCj4+DQo+PiBZZWFoIEkgbWVhbiBJIHN1c3BlY3QgdGhpcyBpcyBzZW5zaWJsZSwgdW5sZXNz
IHRoZXJlIGlzIHNvbWUNCj4+IHJlYXNvbiB0aGUgY29udHJvbGxlciBzaWRlIGFsc28gbmVlZHMg
dG8gaGF2ZSBSWCBlbmFibGVkLiBQZXJoYXBzDQo+PiBmb3IgZmVlZGJhY2sgb3Igc29tZXRoaW5n
IGZyb20gdGhlIHBhc3NpdmUgc2lkZSwgYnV0IEkgaW1hZ2luZQ0KPj4gdGhpcyBpcyBqdXN0IGEg
dHlwbyBpbiB0aGUgb3JpZ2luYWwgcGF0Y2guDQo+DQo+IE9rLCBidXQgdGhlIG90aGVyIHNpZGUg
ZG9lc24ndCBoYXZlIGJvdGggUlggYW5kIFRYIGVuYWJsZWQuDQo+IElmIHRoZSBhY3RpdmUgc2lk
ZSBuZWVkZWQgUlggdG8gcmVjZWl2ZSBpbmZvcm1hdGlvbiBmb3IgdGhlIG90aGVyIA0KPiBzaWRl
LCB0aGUgcGFzc2l2ZSBvbmUgd291bGQgbmVlZCBUWCBlbmFibGVkIHRvby4NCj4gU28gaWYgYSBm
ZWVkYmFjayBpcyBuZWNlc3NhcnksIGJvdGggY2hhbm5lbHMgb24gYm90aCBzaWRlcyB3b3VsZCBi
ZSANCj4gZW5hYmxlZCwgbm90IG9uZSBjaGFubmVsIGluIG9uZSBzaWRlIGFuZCBib3RoIG9uIHRo
ZSBvdGhlci4NCj4NCkJvdGggYW1wcyBuZWVkIHRvIHRyYW5zbWl0IHRoZWlyIGJvb3N0IHRhcmdl
dHMgdG8gdGhlIE1EU1lOQyBidXMuIFRoZSANCmFjdGl2ZSBhbXAgbmVlZHMgdG8gcmVjZWl2ZSB0
aGUgY29tYmluZWQgYm9vc3QgdGFyZ2V0IGZyb20gdGhlIE1EU1lOQyANCmJ1cy4gVGhhdCBpcyB3
aHkgdGhlIGFjdGl2ZSBhbXAgc2hvdWxkIGVuYWJsZSBib3RoIFJYIGFuZCBUWCwgYW5kIHRoZSAN
CnBhc3NpdmUgYW1wIG9ubHkgbmVlZHMgdG8gZW5hYmxlIFRYLiBJdCBpcyBub3Qgc2ltcGx5IGEg
dW5pZGlyZWN0aW9uYWwgDQpmbG93IG9mIGRhdGEgZnJvbSBvbmUgYW1wIHRvIHRoZSBvdGhlci4N
Cg0KU29ycnkgaWYgdGhlIGRvY3VtZW50YXRpb24gaGFzIGJlZW4gbWlzbWF0Y2hlZCBvciBjb25m
dXNpbmcgYXQgdGltZXMuIA0KSXQncyB0YWtlbiBtZSBhIHdoaWxlIHRvIGdhdGhlciB0aGUgcmln
aHQgdW5kZXJzdGFuZGluZyBvZiBob3cgdGhpcyBhbGwgDQp3b3Jrcy4NCg0KDQpPbiAyLzEwLzIz
IDAzOjE5LCBMdWNhcyBUYW51cmUgd3JvdGU6DQo+ICsgICAgICBTaGFyZWQgYm9vc3QgYWxsb3dz
IHR3byBhbXBsaWZpZXJzIHRvIHNoYXJlIGEgc2luZ2xlIGJvb3N0IGNpcmN1aXQgYnkNCj4gKyAg
ICAgIGNvbW11bmljYXRpbmcgb24gdGhlIE1EU1lOQyBidXMuIFRoZSBwYXNzaXZlIGFtcGxpZmll
ciBkb2VzIG5vdCBjb250cm9sDQo+ICsgICAgICB0aGUgYm9vc3QgYW5kIHJlY2VpdmVzIGRhdGEg
ZnJvbSB0aGUgYWN0aXZlIGFtcGxpZmllci4gR1BJTzEgc2hvdWxkIGJlDQoNCk5vdCBxdWl0ZSBj
b3JyZWN0LiBJIHdvdWxkIHN1Z2dlc3Q6ICJTaGFyZWQgYm9vc3QgYWxsb3dzIHR3byBhbXBsaWZp
ZXJzIA0KdG8gc2hhcmUgYSBzaW5nbGUgYm9vc3QgY2lyY3VpdCBieSBjb21tdW5pY2F0aW5nIG9u
IHRoZSBNRFNZTkMgYnVzLiBUaGUgDQphY3RpdmUgYW1wbGlmaWVyIGNvbnRyb2xzIHRoZSBib29z
dCBjaXJjdWl0IHVzaW5nIGNvbWJpbmVkIGRhdGEgZnJvbSANCmJvdGggYW1wbGlmaWVycy4iDQoN
Cg0KT24gMi8xMC8yMyAwODozOSwgTHVjYXMgVGFudXJlIHdyb3RlOg0KPg0KPiBUaGlzIHdyaXRl
IGhlcmUgaXMgdG8gc2VsZWN0IHRoZSBib29zdCBjb250cm9sIHNvdXJjZSwgd2hpY2ggZm9yIHRo
ZSANCj4gYWN0aXZlIHNob3VsZCBiZSAiQ2xhc3MgSCB0cmFja2luZyB2YWx1ZSIuIA0KDQpBY3Rp
dmUgc2hvdWxkIHVzZSB0aGUgTURTWU5DIHZhbHVlLiBPdGhlcndpc2UgaXQgd2lsbCBub3QgcHJv
dmlkZSBib29zdCANCnRvIHRoZSBwYXNzaXZlIGFtcCB3aGVuIHRoZXJlIGlzIG9ubHkgYXVkaW8g
b24gdGhlIHBhc3NpdmUgYW1wJ3MgY2hhbm5lbC4NCg0KDQpJIGJlbGlldmUgdGhlcmUgaXMgYW5v
dGhlciBjaGFuZ2UgbmVlZGVkIGZvciB0aGUgRGVjaywgdG8gaGFuZGxlIHRoZSANCidsZWdhY3kn
IHByb3BlcnR5IG5hbWVzIGluc3RlYWQgb2YgYnN0LXR5cGU/DQoNCk90aGVyIHRoYW4gdGhlIGNo
YW5nZXMgbmVlZGVkIHRvIHRoZSByZWdfc2VxdWVuY2VzIHRoaXMgbG9va3MgZ29vZC4NCg0KDQpU
aGFua3MsDQoNCkRhdmlkDQo=
