Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0D18BFD93
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:47:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0D24B6A;
	Wed,  8 May 2024 14:47:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0D24B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715172445;
	bh=eUOWAYz6goNVZAdVTJBQ6VCAuWLW4TCPLzpdwvdRvIU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wk+o/IxToVNROz7R/RBJ9xYjMEyT/dJ9GQObfzlCQ+pq1wmhr/KNX0mr426QEIQ3F
	 n2xOjw9BUQXyZ+O0eV6uFF5FqrLmtcG0Bvhuof43DiyxNY0m+z319V5luJqncFkBas
	 lDme/OjaU4gwem6KvBn89CQLsFtgjlKzq5rD58NA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1F4AF805AB; Wed,  8 May 2024 14:46:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37CC3F8059F;
	Wed,  8 May 2024 14:46:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F747F8049C; Tue,  7 May 2024 07:17:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D53FF80152
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 07:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D53FF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=D9D9l+aM
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4474pe4S019126;
	Tue, 7 May 2024 05:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-type:message-id:date:mime-version:subject:to:cc
	:references:from:in-reply-to; s=qcppdkim1; bh=rLPUdONqVEuYYcWykD
	azLiaavVg5w5VPjT+f8UIKWtA=; b=D9D9l+aM86klYMWRMtBP9f/Wytgj5foD0B
	Mqslo6xRlzzkKnXvCUNeR8l2uP9O4WkeXCe2jRi2FU8l6A29bfSwudICgnReN7Bg
	wg5YsJWnYpbmDbvLHsFoewjda14lpSbtRGmIoZGGL/ICiMbxO2FxHE7CIGvH5AaG
	2Hf3ZYcWTiUoChdbpa8o/45anR3gI7hna0+Q7oTCrRKyDGi2kDlGkDP644jPcgmF
	OD3K4PO6RfjawWA5I3Rx4fTrPcfd8xrw0SwELWJo0X/t8fvwevdNaL36Rade1P5S
	lrJQmL7TO7bmx4O6BCGLsbPC8ZYsUC+1jlGAHpG1u6FuJInCPUFg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyc03g6r0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 05:17:02 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 4475H0Nm022277
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 05:17:00 GMT
Received: from [10.218.46.108] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 May 2024
 22:16:53 -0700
Message-ID: <41e803a5-cff3-496c-80c7-f374f4faa393@quicinc.com>
Date: Tue, 7 May 2024 10:46:49 +0530
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
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: pqMHTu2Qdqy0kofJPoGop8pAVq5E84RW
X-Proofpoint-GUID: pqMHTu2Qdqy0kofJPoGop8pAVq5E84RW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_02,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 phishscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=787
 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2405070035
X-MailFrom: quic_kuruva@quicinc.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 45BJQS2VUKTL7CLFXF55DW6YDDPJ5PT5
X-Message-ID-Hash: 45BJQS2VUKTL7CLFXF55DW6YDDPJ5PT5
X-Mailman-Approved-At: Wed, 08 May 2024 12:46:49 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/45BJQS2VUKTL7CLFXF55DW6YDDPJ5PT5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgVGFrYXNoaSwNCg0KSSdtIGNoZWNraW5nIG9uIHdobyBpcyBjYWxsaW5nIHNuZF91c2JfZW5k
cG9pbnRfY2xvc2UsIHdpdGhvdXQgb3BlbmVkIA0KZW5kcG9pbnQgaXMgY3JlYXRlZC4NCg0KQXMg
aXRzIHJhcmVseSByZXByb2R1Y2libGUsIGl0cyB0YWtpbmcgdGltZS4NCg0KSSdsbCByZXBsYXkg
eW91IGJhY2suDQoNClRoYW5rcywNCg0KUmFqYXNoZWthciBLLg0KDQpPbiA0LzI5LzIwMjQgMTI6
MjcgUE0sIFRha2FzaGkgSXdhaSB3cm90ZToNCj4gT24gTW9uLCAyOSBBcHIgMjAyNCAwODoyMzoy
NyArMDIwMCwNCj4gUmFqYXNoZWthciBLdXJ1dmEgKFRlbXApIHdyb3RlOg0KPj4NCj4+IE9uIDQv
MjYvMjAyNCA2OjEzIFBNLCBUYWthc2hpIEl3YWkgd3JvdGU6DQo+Pj4gT24gRnJpLCAyNiBBcHIg
MjAyNCAxNDoyNToxMSArMDIwMCwNCj4+PiBSYWphc2hla2FyIGt1cnV2YSB3cm90ZToNCj4+Pj4g
V2hlbiBtdWx0aXBsZSBwbHVnLWluIGFuZCBwbHVnLW91dCBldmVudHMgb2NjdXIsDQo+Pj4+IHRo
ZXJlIGlzIGEgcmlzayBvZiBlbmNvdW50ZXJpbmcgYSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UN
Cj4+Pj4gbGVhZGluZyB0byBhIGtlcm5lbCBwYW5pYyBkdXJpbmcgYSBoZWFkc2V0IHVzZS1jYXNl
Lg0KPj4+PiB0aGlzIGlzc3VlIGFyaXNlcyBpbiB0aGUgc25kX3VzYl9lbmRwb2ludF9jbG9zZSBm
dW5jdGlvbg0KPj4+IFN1Y2ggYSBzY2VuYXJpbyBjYW4ndCBoYXBwZW46IGVwLT5pZmFjZV9yZWYg
aXMgY2hhbmdlZCBvbmx5IGluDQo+Pj4gY2hpcC0+bXV0ZXggbG9jaywgaGVuY2UgaXQgY2FuJ3Qg
YmUgTlVMTCB0aGVyZS4NCj4+Pg0KPj4+DQo+Pj4gdGhhbmtzLA0KPj4+DQo+Pj4gVGFrYXNoaQ0K
Pj4gSGkgVGFrYXNoaSwNCj4+DQo+PiBBY3R1YWxseSB3ZSBhcmUgZmFjaW5nIE5VTEwgcG9pbnRl
ciBkZWZlcmVuY2Ugd2hpbGUgcnVubmluZyBoZWFkc2V0DQo+PiBjYXNlIHdoZW4gaSBjaGVja2Vk
IGNhbGwgdHJhY2UgdGhlIGxhc3QgcnVubmluZyBmdW5jdGlvbiBpcw0KPj4gc25kX3VzYl9lbmRw
b2ludF9jbG9zZSB3aGVyZSBpZmFjZV9yZWYgYW5kIGNsb2NrX3JlZiBib3RoIGFyZSAweDANCj4+
DQo+PiBbNzU3MDMuOTMzMTA0XVtUMTA1ODVdIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwg
cG9pbnRlcg0KPj4gZGVyZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRyZXNzIDAwMDAwMDAwMDAwMDAw
MDQNCj4+IFs3NTcwMy45MzMxMTNdW1QxMDU4NV0gW1JCL0VdcmJfc3JlYXNvbl9zdHJfc2V0OiBz
cmVhc29uX3N0ciBzZXQgTlVMTA0KPj4gcG9pbnRlciBkZXJlZmVyZW5jZQ0KPj4gWzc1NzAzLjkz
MzExNl1bVDEwNTg1XSBNZW0gYWJvcnQgaW5mbzoNCj4+IFs3NTcwMy45MzMxMTddW1QxMDU4NV3C
oMKgIEVTUiA9IDB4MDAwMDAwMDA5NjAwMDAwNQ0KPj4gWzc1NzAzLjkzMzExOV1bVDEwNTg1XcKg
wqAgRUMgPSAweDI1OiBEQUJUIChjdXJyZW50IEVMKSwgSUwgPSAzMiBiaXRzDQo+PiBbNzU3MDMu
OTMzMTIwXVtUMTA1ODVdwqDCoCBTRVQgPSAwLCBGblYgPSAwDQo+PiBbNzU3MDMuOTMzMTIxXVtU
MTA1ODVdwqDCoCBFQSA9IDAsIFMxUFRXID0gMA0KPj4gWzc1NzAzLjkzMzEyM11bVDEwNTg1XcKg
wqAgRlNDID0gMHgwNTogbGV2ZWwgMSB0cmFuc2xhdGlvbiBmYXVsdA0KPj4gWzc1NzAzLjkzMzEy
NF1bVDEwNTg1XSBEYXRhIGFib3J0IGluZm86DQo+PiBbNzU3MDMuOTMzMTI0XVtUMTA1ODVdwqDC
oCBJU1YgPSAwLCBJU1MgPSAweDAwMDAwMDA1DQo+PiBbNzU3MDMuOTMzMTI1XVtUMTA1ODVdwqDC
oCBDTSA9IDAsIFduUiA9IDANCj4+IOKApg0KPj4gWzc1NzAzLjkzMzY3Nl1bVDEwNTg1XSBDUFU6
IDMgUElEOiAxMDU4NSBDb21tOiBrd29ya2VyL3UxNzowIFRhaW50ZWQ6DQo+PiBHIFPCoMKgwqDC
oMKgIFfCoCBPRSA2LjEuNDMtYW5kcm9pZDE0LTExLWdhMmZhNzdkMzZkMjYtYWIxMTIwNDgyOSAj
MQ0KPj4gWzc1NzAzLjkzMzY5N11bVDEwNTg1XSBwc3RhdGU6IDYyNDAwMDA1IChuWkN2IGRhaWYg
K1BBTiAtVUFPICtUQ08gLURJVA0KPj4gLVNTQlMgQlRZUEU9LS0pDQo+PiBbNzU3MDMuOTMzNzAw
XVtUMTA1ODVdIHBjIDogc25kX3VzYl9lbmRwb2ludF9jbG9zZSsweDMwLzB4MTA0DQo+PiBbNzU3
MDMuOTMzNzIxXVtUMTA1ODVdIGxyIDogc25kX3VzYl9lbmRwb2ludF9jbG9zZSsweDI4LzB4MTA0
DQo+PiBbNzU3MDMuOTMzNzI0XVtUMTA1ODVdIHNwIDogZmZmZmZmYzA0YjJiYjc0MA0KPj4gWzc1
NzAzLjkzMzcyNV1bVDEwNTg1XSB4Mjk6IGZmZmZmZmMwNGIyYmI3NDAgeDI4OiBmZmZmZmY4MDI0
ZTNiYTc4DQo+PiB4Mjc6IGZmZmZmZmQyNjZlOTFkYTANCj4+IFs3NTcwMy45MzM3MjhdW1QxMDU4
NV0geDI2OiBmZmZmZmZjMDRiMmJiN2E4IHgyNTogZmZmZmZmODliZWM1YmUwMA0KPj4geDI0OiAw
MDAwMDAwMGZmZmZmZmVhDQo+PiBbNzU3MDMuOTMzNzMwXVtUMTA1ODVdIHgyMzogMDAwMDAwMDAw
MDAwMDAwMiB4MjI6IGZmZmZmZjg4NWQ1NjgwMDgNCj4+IHgyMTogZmZmZmZmODAyNGUzYmE3OA0K
Pj4gWzc1NzAzLjkzMzczMl1bVDEwNTg1XSB4MjA6IGZmZmZmZjg4NWQ1NjgwMDAgeDE5OiBmZmZm
ZmY4MDI0ZTNiYjE4DQo+PiB4MTg6IGZmZmZmZmQyNmRiMmQxNDANCj4+IFs3NTcwMy45MzM3MzRd
W1QxMDU4NV0geDE3OiAwMDAwMDAwMGYwMWIwODE4IHgxNjogMDAwMDAwMDBmMDFiMDgxOA0KPj4g
eDE1OiAwMDAwMDAwMDAwMDAwMDA4DQo+PiBbNzU3MDMuOTMzNzM2XVtUMTA1ODVdIHgxNDogZmZm
ZmZmOGEzZTJiNTc4MCB4MTM6IGZmZmZmZjhhM2UyYjU3ODANCj4+IHgxMjogZmZmZmZmZDI2Y2Jk
Mjc3MA0KPj4gWzc1NzAzLjkzMzczOF1bVDEwNTg1XSB4MTE6IDAwMDAwMDAwMDAwMDAwMDEgeDEw
OiBmZmZmZmY4OTg0MzIwMDAwIHg5DQo+PiA6IDRmNDNiODZlOTQ2YjRlMDANCj4+IFs3NTcwMy45
MzM3NDBdW1QxMDU4NV0geDggOiAwMDAwMDAwMDAwMDAwMDAwIHg3IDogMDAwMDAwMDAwMDAwMDAw
MSB4Ng0KPj4gOiBmZmZmZmZmZGVmOGU4YjcwDQo+PiBbNzU3MDMuOTMzNzQyXVtUMTA1ODVdIHg1
IDogMDAwMDAwMDAwMDAwMDAwMSB4NCA6IDAwMDAwMDAwMDAwMDAwMDAgeDMNCj4+IDogZmZmZmZm
ODAyNGUzYmIyOA0KPj4gWzc1NzAzLjkzMzc0M11bVDEwNTg1XSB4MiA6IDAwMDAwMDAxMDExZmE3
YzkgeDEgOiBmZmZmZmZjMDRiMmJiNjgwIHgwDQo+PiA6IDAwMDAwMDAwMDAwMDAwMDANCj4+IFs3
NTcwMy45MzM3NDZdW1QxMDU4NV0gQ2FsbCB0cmFjZToNCj4+IFs3NTcwMy45MzM3NDddW1QxMDU4
NV3CoCBzbmRfdXNiX2VuZHBvaW50X2Nsb3NlKzB4MzAvMHgxMDQNCj4gV2hvIGlzIGFjdHVhbGx5
IGNhbGxpbmcgc25kX3VzYl9lbmRwb2ludF9jbG9zZSgpPw0KPiBJIGd1ZXNzIHRoYXQncyByYXRo
ZXIgYSBidWcgaW4gdGhlIGNhbGwgcGF0dGVybiwgbm90IHRoZSBjb2RlIGluDQo+IFVTQi1hdWRp
byBkcml2ZXIgaXRzZWxmLg0KPg0KPiBzbmRfdXNiX2VuZHBvaW50X2Nsb3NlKCkgaXMgc3VwcG9z
ZWQgdG8gYmUgY2FsbGVkIG9ubHkgZm9yIGEgcmVhbGx5DQo+IG9wZW5lZCBlbmRwb2ludC4gIFNv
LCBpZiBhbnksIGl0J3MgcmF0aGVyIGEgcmFjZSAob3IgYSBidWcpIGluIHRoZQ0KPiBjYWxsZXIg
c2lkZSwgYW5kIGl0IHNob3VsZCBiZSBhZGRyZXNzZWQgdGhlcmUgaW5zdGVhZC4NCj4NCj4NCj4g
dGhhbmtzLA0KPg0KPiBUYWthc2hp
