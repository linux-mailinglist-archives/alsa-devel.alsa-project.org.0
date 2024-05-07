Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6448BFD9F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:48:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5884D741;
	Wed,  8 May 2024 14:48:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5884D741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715172507;
	bh=ItPkwbUuA4Sl7zEUjbgrHzGpce3sVxdZBtq3V6d3Sw4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mt72HC9ZjldExQe+6s3LeM573rYOmePDciaUxN19/4+kLxg418YAJfI5nqpkradxS
	 Nz4zvSustN5PIFHd8reWrC7+tlePVmfnJWgkjBQyJZyyoGyraUhnXwyP26LqvWAI9E
	 ZockvzffNby8YP/tWu8Tp0L+LKWOutCOwGXcCg+o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5CD1F80622; Wed,  8 May 2024 14:47:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0485F8062D;
	Wed,  8 May 2024 14:47:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A4A2F8049C; Tue,  7 May 2024 08:36:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74256F8003A
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 08:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74256F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=XBD4T508
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4474pCki004447;
	Tue, 7 May 2024 06:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-type:message-id:date:mime-version:subject:to:cc
	:references:from:in-reply-to; s=qcppdkim1; bh=pAiGP0mZVrIegCCucH
	GucQuyij6+mvOZYFaX/7zZyd4=; b=XBD4T508MjQBPILKdMAjvdiH0qxKEDE5T+
	TBnr2HONyBwLgZDQwMOAbzdcfzz05qpdw9S7fFvTSO4mGuJBGj3DYYcK45m5GYHc
	G5qHtmPtIsyVS0Ge/9LNfyEYv7W17PZS8Qnb7cY34hB1dLpmc0pkgofrVNQ6nNXN
	nU99W6E05kbgfAdhi7FaSokYhXImNM45ieEOdVGFTWNZFIdV/WAvWYnxfRIjm1km
	OKADH4yY1wIwGSj4mMK6Wlvlc4a2Q0pSQdKcQ3K8VQ2kaacAI1K79b44fe5PRE4q
	F4XjQIww/QCpQRF4IYfFv/LEJjYXbZVMl9hVLTNp/d5t0+3prOrg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyc9b09x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 06:35:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 4476ZqNn002121
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 06:35:52 GMT
Received: from [10.218.46.108] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 May 2024
 23:35:45 -0700
Message-ID: <2f49e0cf-3bc5-4e3a-8389-df559619dc21@quicinc.com>
Date: Tue, 7 May 2024 12:05:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC PATCH] ALSA: usb-audio: endpoint: Prevent NULL
 pointer deference in snd_usb_endpoint_close
To: Takashi Iwai <tiwai@suse.de>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>
References: <20240426122511.547755-1-quic_kuruva@quicinc.com>
 <877cgks399.wl-tiwai@suse.de>
 <64ed9496-577c-4f31-b061-9f3dcaca4b26@quicinc.com>
 <87o79s1ws7.wl-tiwai@suse.de>
Content-Language: en-US
From: "Rajashekar Kuruva (Temp)" <quic_kuruva@quicinc.com>
In-Reply-To: <87o79s1ws7.wl-tiwai@suse.de>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 5FeeRLkT1bozE0PSXpXiJivj9JASPq9-
X-Proofpoint-ORIG-GUID: 5FeeRLkT1bozE0PSXpXiJivj9JASPq9-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_02,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 suspectscore=0 mlxlogscore=787
 malwarescore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405070044
X-MailFrom: quic_kuruva@quicinc.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HPVCRO2JECIW5XDBY52IN4ZQMT5IIE4U
X-Message-ID-Hash: HPVCRO2JECIW5XDBY52IN4ZQMT5IIE4U
X-Mailman-Approved-At: Wed, 08 May 2024 12:46:49 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HPVCRO2JECIW5XDBY52IN4ZQMT5IIE4U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiBPbiBNb24sIDI5IEFwciAyMDI0IDA4OjIzOjI3ICswMjAwLA0KPiBSYWphc2hla2FyIEt1cnV2
YSAoVGVtcCkgd3JvdGU6DQo+Pg0KPj4gT24gNC8yNi8yMDI0IDY6MTMgUE0sIFRha2FzaGkgSXdh
aSB3cm90ZToNCj4+PiBPbiBGcmksIDI2IEFwciAyMDI0IDE0OjI1OjExICswMjAwLA0KPj4+IFJh
amFzaGVrYXIga3VydXZhIHdyb3RlOg0KPj4+PiBXaGVuIG11bHRpcGxlIHBsdWctaW4gYW5kIHBs
dWctb3V0IGV2ZW50cyBvY2N1ciwNCj4+Pj4gdGhlcmUgaXMgYSByaXNrIG9mIGVuY291bnRlcmlu
ZyBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZQ0KPj4+PiBsZWFkaW5nIHRvIGEga2VybmVsIHBh
bmljIGR1cmluZyBhIGhlYWRzZXQgdXNlLWNhc2UuDQo+Pj4+IHRoaXMgaXNzdWUgYXJpc2VzIGlu
IHRoZSBzbmRfdXNiX2VuZHBvaW50X2Nsb3NlIGZ1bmN0aW9uDQo+Pj4gU3VjaCBhIHNjZW5hcmlv
IGNhbid0IGhhcHBlbjogZXAtPmlmYWNlX3JlZiBpcyBjaGFuZ2VkIG9ubHkgaW4NCj4+PiBjaGlw
LT5tdXRleCBsb2NrLCBoZW5jZSBpdCBjYW4ndCBiZSBOVUxMIHRoZXJlLg0KPj4+DQo+Pj4NCj4+
PiB0aGFua3MsDQo+Pj4NCj4+PiBUYWthc2hpDQo+PiBIaSBUYWthc2hpLA0KPj4NCj4+IEFjdHVh
bGx5IHdlIGFyZSBmYWNpbmcgTlVMTCBwb2ludGVyIGRlZmVyZW5jZSB3aGlsZSBydW5uaW5nIGhl
YWRzZXQNCj4+IGNhc2Ugd2hlbiBpIGNoZWNrZWQgY2FsbCB0cmFjZSB0aGUgbGFzdCBydW5uaW5n
IGZ1bmN0aW9uIGlzDQo+PiBzbmRfdXNiX2VuZHBvaW50X2Nsb3NlIHdoZXJlIGlmYWNlX3JlZiBh
bmQgY2xvY2tfcmVmIGJvdGggYXJlIDB4MA0KPj4NCj4+IFs3NTcwMy45MzMxMDRdW1QxMDU4NV0g
VW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyDQo+PiBkZXJlZmVyZW5jZSBhdCB2
aXJ0dWFsIGFkZHJlc3MgMDAwMDAwMDAwMDAwMDAwNA0KPj4gWzc1NzAzLjkzMzExM11bVDEwNTg1
XSBbUkIvRV1yYl9zcmVhc29uX3N0cl9zZXQ6IHNyZWFzb25fc3RyIHNldCBOVUxMDQo+PiBwb2lu
dGVyIGRlcmVmZXJlbmNlDQo+PiBbNzU3MDMuOTMzMTE2XVtUMTA1ODVdIE1lbSBhYm9ydCBpbmZv
Og0KPj4gWzc1NzAzLjkzMzExN11bVDEwNTg1XcKgwqAgRVNSID0gMHgwMDAwMDAwMDk2MDAwMDA1
DQo+PiBbNzU3MDMuOTMzMTE5XVtUMTA1ODVdwqDCoCBFQyA9IDB4MjU6IERBQlQgKGN1cnJlbnQg
RUwpLCBJTCA9IDMyIGJpdHMNCj4+IFs3NTcwMy45MzMxMjBdW1QxMDU4NV3CoMKgIFNFVCA9IDAs
IEZuViA9IDANCj4+IFs3NTcwMy45MzMxMjFdW1QxMDU4NV3CoMKgIEVBID0gMCwgUzFQVFcgPSAw
DQo+PiBbNzU3MDMuOTMzMTIzXVtUMTA1ODVdwqDCoCBGU0MgPSAweDA1OiBsZXZlbCAxIHRyYW5z
bGF0aW9uIGZhdWx0DQo+PiBbNzU3MDMuOTMzMTI0XVtUMTA1ODVdIERhdGEgYWJvcnQgaW5mbzoN
Cj4+IFs3NTcwMy45MzMxMjRdW1QxMDU4NV3CoMKgIElTViA9IDAsIElTUyA9IDB4MDAwMDAwMDUN
Cj4+IFs3NTcwMy45MzMxMjVdW1QxMDU4NV3CoMKgIENNID0gMCwgV25SID0gMA0KPj4g4oCmDQo+
PiBbNzU3MDMuOTMzNjc2XVtUMTA1ODVdIENQVTogMyBQSUQ6IDEwNTg1IENvbW06IGt3b3JrZXIv
dTE3OjAgVGFpbnRlZDoNCj4+IEcgU8KgwqDCoMKgwqAgV8KgIE9FIDYuMS40My1hbmRyb2lkMTQt
MTEtZ2EyZmE3N2QzNmQyNi1hYjExMjA0ODI5ICMxDQo+PiBbNzU3MDMuOTMzNjk3XVtUMTA1ODVd
IHBzdGF0ZTogNjI0MDAwMDUgKG5aQ3YgZGFpZiArUEFOIC1VQU8gK1RDTyAtRElUDQo+PiAtU1NC
UyBCVFlQRT0tLSkNCj4+IFs3NTcwMy45MzM3MDBdW1QxMDU4NV0gcGMgOiBzbmRfdXNiX2VuZHBv
aW50X2Nsb3NlKzB4MzAvMHgxMDQNCj4+IFs3NTcwMy45MzM3MjFdW1QxMDU4NV0gbHIgOiBzbmRf
dXNiX2VuZHBvaW50X2Nsb3NlKzB4MjgvMHgxMDQNCj4+IFs3NTcwMy45MzM3MjRdW1QxMDU4NV0g
c3AgOiBmZmZmZmZjMDRiMmJiNzQwDQo+PiBbNzU3MDMuOTMzNzI1XVtUMTA1ODVdIHgyOTogZmZm
ZmZmYzA0YjJiYjc0MCB4Mjg6IGZmZmZmZjgwMjRlM2JhNzgNCj4+IHgyNzogZmZmZmZmZDI2NmU5
MWRhMA0KPj4gWzc1NzAzLjkzMzcyOF1bVDEwNTg1XSB4MjY6IGZmZmZmZmMwNGIyYmI3YTggeDI1
OiBmZmZmZmY4OWJlYzViZTAwDQo+PiB4MjQ6IDAwMDAwMDAwZmZmZmZmZWENCj4+IFs3NTcwMy45
MzM3MzBdW1QxMDU4NV0geDIzOiAwMDAwMDAwMDAwMDAwMDAyIHgyMjogZmZmZmZmODg1ZDU2ODAw
OA0KPj4geDIxOiBmZmZmZmY4MDI0ZTNiYTc4DQo+PiBbNzU3MDMuOTMzNzMyXVtUMTA1ODVdIHgy
MDogZmZmZmZmODg1ZDU2ODAwMCB4MTk6IGZmZmZmZjgwMjRlM2JiMTgNCj4+IHgxODogZmZmZmZm
ZDI2ZGIyZDE0MA0KPj4gWzc1NzAzLjkzMzczNF1bVDEwNTg1XSB4MTc6IDAwMDAwMDAwZjAxYjA4
MTggeDE2OiAwMDAwMDAwMGYwMWIwODE4DQo+PiB4MTU6IDAwMDAwMDAwMDAwMDAwMDgNCj4+IFs3
NTcwMy45MzM3MzZdW1QxMDU4NV0geDE0OiBmZmZmZmY4YTNlMmI1NzgwIHgxMzogZmZmZmZmOGEz
ZTJiNTc4MA0KPj4geDEyOiBmZmZmZmZkMjZjYmQyNzcwDQo+PiBbNzU3MDMuOTMzNzM4XVtUMTA1
ODVdIHgxMTogMDAwMDAwMDAwMDAwMDAwMSB4MTA6IGZmZmZmZjg5ODQzMjAwMDAgeDkNCj4+IDog
NGY0M2I4NmU5NDZiNGUwMA0KPj4gWzc1NzAzLjkzMzc0MF1bVDEwNTg1XSB4OCA6IDAwMDAwMDAw
MDAwMDAwMDAgeDcgOiAwMDAwMDAwMDAwMDAwMDAxIHg2DQo+PiA6IGZmZmZmZmZkZWY4ZThiNzAN
Cj4+IFs3NTcwMy45MzM3NDJdW1QxMDU4NV0geDUgOiAwMDAwMDAwMDAwMDAwMDAxIHg0IDogMDAw
MDAwMDAwMDAwMDAwMCB4Mw0KPj4gOiBmZmZmZmY4MDI0ZTNiYjI4DQo+PiBbNzU3MDMuOTMzNzQz
XVtUMTA1ODVdIHgyIDogMDAwMDAwMDEwMTFmYTdjOSB4MSA6IGZmZmZmZmMwNGIyYmI2ODAgeDAN
Cj4+IDogMDAwMDAwMDAwMDAwMDAwMA0KPj4gWzc1NzAzLjkzMzc0Nl1bVDEwNTg1XSBDYWxsIHRy
YWNlOg0KPj4gWzc1NzAzLjkzMzc0N11bVDEwNTg1XcKgIHNuZF91c2JfZW5kcG9pbnRfY2xvc2Ur
MHgzMC8weDEwNA0KPiBXaG8gaXMgYWN0dWFsbHkgY2FsbGluZyBzbmRfdXNiX2VuZHBvaW50X2Ns
b3NlKCk/DQo+IEkgZ3Vlc3MgdGhhdCdzIHJhdGhlciBhIGJ1ZyBpbiB0aGUgY2FsbCBwYXR0ZXJu
LCBub3QgdGhlIGNvZGUgaW4NCj4gVVNCLWF1ZGlvIGRyaXZlciBpdHNlbGYuDQo+DQo+IHNuZF91
c2JfZW5kcG9pbnRfY2xvc2UoKSBpcyBzdXBwb3NlZCB0byBiZSBjYWxsZWQgb25seSBmb3IgYSBy
ZWFsbHkNCj4gb3BlbmVkIGVuZHBvaW50LiAgU28sIGlmIGFueSwgaXQncyByYXRoZXIgYSByYWNl
IChvciBhIGJ1ZykgaW4gdGhlDQo+IGNhbGxlciBzaWRlLCBhbmQgaXQgc2hvdWxkIGJlIGFkZHJl
c3NlZCB0aGVyZSBpbnN0ZWFkLg0KPg0KPg0KPiB0aGFua3MsDQo+DQo+IFRha2FzaGkNCg0KSGkg
VGFrYXNoaSwNCg0KSSdtIGNoZWNraW5nIG9uIHdobyBpcyBjYWxsaW5nIHNuZF91c2JfZW5kcG9p
bnRfY2xvc2UsIHdpdGhvdXQgb3BlbmVkIA0KZW5kcG9pbnQgaXMgY3JlYXRlZC4NCg0KQXMgaXRz
IHJhcmVseSByZXByb2R1Y2libGUsIGl0cyB0YWtpbmcgdGltZS4NCg0KSSdsbCByZXBsYXkgeW91
IGJhY2suDQoNCi0tUmFqYXNoZWthciBLLg0K
