Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA52C4750B
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:47:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15472602A8;
	Mon, 10 Nov 2025 15:46:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15472602A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762786018;
	bh=lusA9z16O7wcoo7d44mTWukzIYEfIQHtJuS9nXhX5SE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B5Zz589Wqz9y0hb51Pb0LnJ6dnEl49PgqQqB/dssUi8gasjE/U//Y/1Ux89sM50pO
	 ErpNO+xt0lBAioJLXj92rIFbzpQLdgVUf98WANLLsrbGEez47rDS/PnxjZSt9YwzZN
	 ipXMU5cOeVivzCgrKWYFr0T3Q0kw8udxmb3LWLz0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D78BF80689; Mon, 10 Nov 2025 15:41:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED8BAF8970D;
	Mon, 10 Nov 2025 15:41:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 411F2F800E3; Wed, 24 Sep 2025 06:11:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,NICE_REPLY_A,
	RCVD_IN_DNSWL_LOW,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59894F800E3
	for <alsa-devel@alsa-project.org>; Wed, 24 Sep 2025 06:11:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59894F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=oLD4Eqnt
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 58O1w9uK016173;
	Wed, 24 Sep 2025 04:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2bU1PTc0PE60NFw/xU59oNob
	O0bVwIZPrsqNxBLlmU8=; b=oLD4EqntcD6yJes7PUzU+vdqKCEJLMXoJfZzuQ34
	gI7TSdiVwWE68bfjPVeNRsMQUHWE/jrcgqCSYMZMbbiYKN79uc4aeLi04tGtYw6/
	fHRv6wWj6XITaV5TXgT9Om5WJyZNc5avMBU/85vYJBICSxMqyaVsqD00CF+bF55q
	CD6yUJ1poLkEyCwx/tWsIDRDQ0SgcGWxVlLP8T1qqSjm5+yv+jmcxnwPStB6R9aO
	0o4KOlrqZuMw9GglmpzHDelHXKpkF9ciLey55XfmsJyhGmlyVxyuuo3LlL3xlhCZ
	1nxk7HrkqQiaOBs4O1bKv0cvRqIbGvik0TXPZeZDcJ1qeA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp09yb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 04:11:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 58O4Bn2A025750
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 04:11:49 GMT
Received: from [10.218.4.221] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 23 Sep
 2025 21:11:45 -0700
Message-ID: <1d446576-efa1-8e51-e085-272428dbdb86@quicinc.com>
Date: Wed, 24 Sep 2025 09:41:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1] slimbus: qcom-ngd-ctrl: Add stream disable support
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
CC: <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>,
        <quic_anupkulk@quicinc.com>, <quic_cchiluve@quicinc.com>
References: <20240507063004.21853-1-quic_vdadhani@quicinc.com>
 <247e4ce7-1ba2-43b8-8a11-ec70f99a4fc1@linaro.org>
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <247e4ce7-1ba2-43b8-8a11-ec70f99a4fc1@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d36f86 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=1LQvoNWN6y0BiYmxHBAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=KKAkSRfTAAAA:8 a=XCnCvJ0eC7Z0sVeFT1UA:9
 a=NwzjdCN5krv2b2U0:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: KqEuhGkqevpYhqZ7pprF2OT0HuorvM8p
X-Proofpoint-ORIG-GUID: KqEuhGkqevpYhqZ7pprF2OT0HuorvM8p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX+IbO+Oy/psyR
 IthFZLPVTO29+NkHvi+LPkoWvNXwPghkFK145ngmZRl6jkwxuGIlh1pAOABkx5LE8wvBjlAwCpV
 0zGDTKelYNorjMryS/82/kDPyKZce6IWa6h5OKeFgmuR85KlwPcF/HlefZMn0r1lo3d03WLhaCf
 FamAxW7X1xwW3P7U8PLmMiSVgVeqQHV7VLRpxDsEOBQ6P/RFF6zdgZpZi8l2y5Jfi5t0HS0n2hF
 k6ouk3/ERMgd0F1z6hHiqTW+CesMRtRdKM8NbRXhGH3t4Ydid8k08NJrYXH72sWQJcQ677j3NA7
 UoW44JLwKLxiEJew+HSqGfmYcx+AHTRcqMqz6bSosSKMfbMRexbo8Axb6NoCqiacpqa9pgVzk9j
 KdzreZaf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_08,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1011 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138
X-MailFrom: quic_vdadhani@quicinc.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4EZNOZSLDSG2DPCQA45LQXHM52U6U7Y3
X-Message-ID-Hash: 4EZNOZSLDSG2DPCQA45LQXHM52U6U7Y3
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:39:57 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4EZNOZSLDSG2DPCQA45LQXHM52U6U7Y3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpPbiA1LzcvMjAyNCA1OjA5IFBNLCBLb25yYWQgRHliY2lvIHdyb3RlOg0KPg0KPg0KPiBPbiA1
LzcvMjQgMDg6MzAsIFZpa2VuIERhZGhhbml5YSB3cm90ZToNCj4+IEN1cnJlbnRseSBzbGltYnVz
IGRyaXZlciBkb2Vzbid0IHN1cHBvcnQgc3RyZWFtIGRpc2FibGUNCj4+IGNhbGxiYWNrLCBpdCBv
bmx5IHN1cHBvcnRzIHN0cmVhbSBlbmFibGUgY2FsbGJhY2suDQo+Pg0KPj4gSW4gc2xpbWJ1cyB1
c2VjYXNlLCBjbGllbnQgaXMgc3dpdGNoaW5nIHRvIG5ldyBmcmVxdWVuY3kNCj4+IHdpdGggc2Ft
ZSBjaGFubmVsIGFuZCBjYWxsaW5nIGVuYWJsZSBzdHJlYW0gY2FsbGJhY2sgZm9yDQo+PiBuZXcg
ZnJlcXVlbmN5IGJ1dCBEU1Agc3Vic3lzdGVtIGlzIGNyYXNoaW5nIGFzIHdlIGFyZSBzd2l0Y2hp
bmcNCj4+IHRvIG5ldyBmcmVxdWVuY3kgd2l0aCBzYW1lIGNoYW5uZWwgd2l0aG91dCBkaXNhYmxp
bmcgc3RyZWFtDQo+PiBmb3Igb2xkZXIgZnJlcXVlbmN5Lg0KPg0KPiBUaGlzIGlzIHZlcnkgZGlm
ZmljdWx0IHRvIHJlYWQNCj4NCj4gYnV0IEFGQUlDVSBjb21lcyBkb3duIHRvOg0KPiAiVHJ5aW5n
IHRvIHN3aXRjaCBmcmVxdWVuY2llcyB3aXRob3V0IGNsb3NpbmcgdGhlIGNoYW5uZWwgcmVzdWx0
cw0KPiBpbiBhbiBhdHRlbXB0IHRvIHJlLWVuYWJsZSB0aGUgY2hhbm5lbCB3aXRob3V0IGEgY2xl
YW4gc2h1dGRvd24sDQo+IHdoaWNoIHRoZW4gbGVhZHMgdG8gYSBjcmFzaCBvbiB0aGUgQURTUC4i
DQo+DQpTdXJlLCBJIHdpbGwgdXBkYXRlIGFuZCB2Mi4NCj4+DQo+PiBJZGVhbGx5LCBiZWZvcmUg
c3dpdGNoaW5nIHRvIGFub3RoZXIgZnJlcXVlbmN5LCBjbGllbnQgc2hvdWxkDQo+PiBjYWxsIGRp
c2FibGUgc3RyZWFtIGNhbGxiYWNrIGFuZCB0aGVuIGVuYWJsZSBzdHJlYW0gZm9yIG5ld2VyIGZy
ZXF1ZW5jeS4NCj4+DQo+PiBIZW5jZSBhZGQgc3VwcG9ydCB0byBkaXNhYmxlIHN0cmVhbSB2aWEg
cWNvbV9zbGltX25nZF9kaXNhYmxlX3N0cmVhbSgpLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFZp
a2VuIERhZGhhbml5YSA8cXVpY192ZGFkaGFuaUBxdWljaW5jLmNvbT4NCj4+IC0tLQ0KPj4gwqAg
ZHJpdmVycy9zbGltYnVzL3Fjb20tbmdkLWN0cmwuYyB8IDcwICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPj4gwqAgZHJpdmVycy9zbGltYnVzL3NsaW1idXMuaMKgwqDCoMKgwqDC
oCB8IDEzICsrKysrKw0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA4MyBpbnNlcnRpb25zKCspDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc2xpbWJ1cy9xY29tLW5nZC1jdHJsLmMgYi9kcml2
ZXJzL3NsaW1idXMvcWNvbS1uZ2QtY3RybC5jDQo+PiBpbmRleCBlMGIyMWYwZjc5YzEuLmQ5NTI4
MjdkMmUxMiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvc2xpbWJ1cy9xY29tLW5nZC1jdHJsLmMN
Cj4+ICsrKyBiL2RyaXZlcnMvc2xpbWJ1cy9xY29tLW5nZC1jdHJsLmMNCj4+IEBAIC0xLDYgKzEs
NyBAQA0KPj4gwqAgLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4+IMKgIC8v
IENvcHlyaWdodCAoYykgMjAxMS0yMDE3LCBUaGUgTGludXggRm91bmRhdGlvbi4gQWxsIHJpZ2h0
cyByZXNlcnZlZC4NCj4+IMKgIC8vIENvcHlyaWdodCAoYykgMjAxOCwgTGluYXJvIExpbWl0ZWQN
Cj4+ICsvLyBDb3B5cmlnaHQgKGMpIDIwMjQgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIElu
Yy4gQWxsIHJpZ2h0cyByZXNlcnZlZC4NCj4+IMKgIMKgICNpbmNsdWRlIDxsaW51eC9pcnEuaD4N
Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4NCj4+IEBAIC0xMDg0LDYgKzEwODUsNzQg
QEAgc3RhdGljIGludCBxY29tX3NsaW1fbmdkX2VuYWJsZV9zdHJlYW0oc3RydWN0IHNsaW1fc3Ry
ZWFtX3J1bnRpbWUgKnJ0KQ0KPj4gwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPj4gwqAgfQ0KPj4g
wqAgK3N0YXRpYyBpbnQgcWNvbV9zbGltX25nZF9kaXNhYmxlX3N0cmVhbShzdHJ1Y3Qgc2xpbV9z
dHJlYW1fcnVudGltZSAqcnQpDQo+PiArew0KPj4gK8KgwqDCoCBzdHJ1Y3Qgc2xpbV9kZXZpY2Ug
KnNkZXYgPSBydC0+ZGV2Ow0KPj4gK8KgwqDCoCBzdHJ1Y3Qgc2xpbV9jb250cm9sbGVyICpjdHJs
ID0gc2Rldi0+Y3RybDsNCj4+ICvCoMKgwqAgc3RydWN0IHNsaW1fdmFsX2luZiBtc2cgPcKgIHsw
fTsNCj4+ICvCoMKgwqAgdTggd2J1ZltTTElNX01TR1FfQlVGX0xFTl07DQo+PiArwqDCoMKgIHU4
IHJidWZbU0xJTV9NU0dRX0JVRl9MRU5dOw0KPj4gK8KgwqDCoCBzdHJ1Y3Qgc2xpbV9tc2dfdHhu
IHR4biA9IHswLH07DQo+IHsgMCB9IGlzIGVub3VnaA0KPg0KPiBBbHNvLCByZXZlcnNlLUNocmlz
dG1hcy10cmUsIHBsZWFzZQ0KDQpTdXJlLCBJIHdpbGwgdXBkYXRlIGFuZCB2Mi4NCg0KPg0KPj4g
K8KgwqDCoCBpbnQgaSwgcmV0Ow0KPj4gKw0KPj4gK8KgwqDCoCB0eG4ubXQgPSBTTElNX01TR19N
VF9ERVNUX1JFRkVSUkVEX1VTRVI7DQo+PiArwqDCoMKgIHR4bi5kdCA9IFNMSU1fTVNHX0RFU1Rf
TE9HSUNBTEFERFI7DQo+PiArwqDCoMKgIHR4bi5sYSA9IFNMSU1fTEFfTUdSOw0KPj4gK8KgwqDC
oCB0eG4uZWMgPSAwOw0KPj4gK8KgwqDCoCB0eG4ubXNnID0gJm1zZzsNCj4+ICvCoMKgwqAgdHhu
Lm1zZy0+bnVtX2J5dGVzID0gMDsNCj4+ICvCoMKgwqAgdHhuLm1zZy0+d2J1ZiA9IHdidWY7DQo+
PiArwqDCoMKgIHR4bi5tc2ctPnJidWYgPSByYnVmOw0KPj4gKw0KPj4gK8KgwqDCoCBmb3IgKGkg
PSAwOyBpIDwgcnQtPm51bV9wb3J0czsgaSsrKSB7DQo+PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0
IHNsaW1fcG9ydCAqcG9ydCA9ICZydC0+cG9ydHNbaV07DQo+PiArDQo+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKHR4bi5tc2ctPm51bV9ieXRlcyA9PSAwKSB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB3YnVmW3R4bi5tc2ctPm51bV9ieXRlcysrXSA9ICh1OCkoU0xJTV9DSF9SRU1PVkUgPDwg
NikNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAoc2Rldi0+bGFkZHIgJiAweDFmKTsNCj4NCj4gQWRkIGEgI2RlZmluZSBhbmQgdXNl
IEZJRUxEX1BSRVANClN1cmUsIEkgd2lsbCB1cGRhdGUgYW5kIHYyLg0KPg0KPj4gKw0KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gc2xpbV9hbGxvY190eG5fdGlkKGN0cmwsICZ0eG4p
Ow0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkgew0KPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKCZzZGV2LT5kZXYsICJGYWlsIHRvIGFsbG9jYXRl
IFRJRFxuIik7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5Y
SU87DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB3YnVmW3R4bi5tc2ctPm51bV9ieXRlcysrXSA9IHR4bi50aWQ7DQo+PiArwqDCoMKgwqDC
oMKgwqAgfQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHdidWZbdHhuLm1zZy0+bnVtX2J5dGVzKytdID0g
cG9ydC0+Y2guaWQ7DQo+PiArwqDCoMKgIH0NCj4+ICsNCj4+ICvCoMKgwqAgdHhuLm1jID0gU0xJ
TV9VU1JfTUNfQ0hBTl9DVFJMOw0KPj4gK8KgwqDCoCB0eG4ucmwgPSB0eG4ubXNnLT5udW1fYnl0
ZXMgKyA0Ow0KPg0KPiBXaHkgKzQ/DQoNClNsaW1idXMgbWVzc2FnZXMgaW5jbHVkZSBhIDQtYnl0
ZSBoZWFkZXIgYmVmb3JlIHRoZSBwYXlsb2FkLCBzbyB0eG4ucmwgYWRkcyA0IHRvIGNvdmVyIHRo
YXQgZml4ZWQgaGVhZGVyIHNpemUuDQoNCg0KPj4gK8KgwqDCoCByZXQgPSBxY29tX3NsaW1fbmdk
X3hmZXJfbXNnX3N5bmMoY3RybCwgJnR4bik7DQo+PiArwqDCoMKgIGlmIChyZXQpIHsNCj4+ICvC
oMKgwqDCoMKgwqDCoCBzbGltX2ZyZWVfdHhuX3RpZChjdHJsLCAmdHhuKTsNCj4+ICvCoMKgwqDC
oMKgwqDCoCBkZXZfZXJyKCZzZGV2LT5kZXYsICJUWCB0aW1lZCBvdXQ6TUM6MHgleCxtdDoweCV4
IHJldDolZFxuIiwNCj4NCj4gUGxlYXNlIGNsZWFuIHRoaXMgdXAsIGFkZCBjb21tYXMgdG8gc2Vw
YXJhdGUgYWxsIHRocmVlIHByaW50cyBhbmQgYQ0KPiBzcGFjZSBhZnRlciBlYWNoIGNvbW1hDQo+
DQo+IFsuLi5dDQoNClN1cmUsIEkgd2lsbCB1cGRhdGUgYW5kIHYyLg0KPg0KPj4gwqAgKy8qDQo+
PiArICogZW51bSBzbGltX2NoX2NvbnRyb2w6IENoYW5uZWwgY29udHJvbC4NCj4+ICsgKiBBY3Rp
dmF0ZSB3aWxsIHNjaGVkdWxlIGNoYW5uZWwgYW5kL29yIGdyb3VwIG9mIGNoYW5uZWxzIGluIHRo
ZSBURE0gZnJhbWUuDQo+PiArICogU3VzcGVuZCB3aWxsIGtlZXAgdGhlIHNjaGVkdWxlIGJ1dCBk
YXRhLXRyYW5zZmVyIHdvbid0IGhhcHBlbi4NCj4+ICsgKiBSZW1vdmUgd2lsbCByZW1vdmUgdGhl
IGNoYW5uZWwvZ3JvdXAgZnJvbSB0aGUgVERNIGZyYW1lLg0KPg0KPiAid2lsbCIgc3VnZ2VzdHMg
dGhlc2UgYXJlIG5vdCBpbW1lZGlhdGUuDQoNClN1cmUsIEkgd2lsbCB1cGRhdGUgYW5kIHYyLg0K
Pg0KPiBLb25yYWQ=
