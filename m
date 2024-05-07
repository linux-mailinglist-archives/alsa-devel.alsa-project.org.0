Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A828BFDB4
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:52:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54E17950;
	Wed,  8 May 2024 14:51:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54E17950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715172725;
	bh=1rCkBQK864Y6MOkmD+RPoOJEeDKsMhNJkBGiUu4RjKs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lU1u0NqZeZnm5y9N4r/q98uD5X+0xBZVSBwj5kP/cpoiGJl+cMeeFJ5w3s3762Cim
	 dNC3vMZ6C8LtKiJA/avU/DM8GdM2tTuuAAPZiMlkg39TSb5JapIpz/LgfVrO6SsYsW
	 lu0tBrD9uTuw1U07lrf6Cw6KCuAbzgPSaRddw5/o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EA3BF8057C; Wed,  8 May 2024 14:51:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A6D3F80579;
	Wed,  8 May 2024 14:51:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2DB0F8049C; Tue,  7 May 2024 08:44:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDF23F8024C
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 08:44:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDF23F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=eGrfwvwT
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4475QHpB024193;
	Tue, 7 May 2024 06:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-type:message-id:date:mime-version:subject:to:cc
	:references:from:in-reply-to; s=qcppdkim1; bh=2f27cdr9IekvBEBqIw
	oljEf8JBtcINugS1g0Fixo53Y=; b=eGrfwvwTxM35Zb50qcCfjfbERrf8Tka21c
	xBcqnomIpWkMcCNuFWCmd8xWgibbOt30Vgmf+MgmD1azr0AAfEGDM6MshZR5V9Kt
	zbptKzmBFTOu0UD2yhoS5UHB11F4/r5yz0Zn/MPRWsGaAwpr2+m8GrwbA4vDL2hU
	pK+GD1i7pAnxYc5RvvaKKUJqgmw5sMo7nYsyZ1K6/U0+cqE+yUC6rt1+fyQ+YWO+
	BfjS2XfucO7/CvvKC2q5XP7TfSQOQEIUvMpfvdy0HPGh/QZwkzoNoUqxo2Dpuj6k
	PTbDH76v/tci+WcwvGCi+DbuDOBSiuMB6x4vmatauC62DChnQ+nQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xxw9aa6r5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 06:44:43 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 4476iPEQ028043
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 06:44:25 GMT
Received: from [10.218.46.108] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 May 2024
 23:44:17 -0700
Message-ID: <5820d959-28c1-4d99-a943-dc90fa46c129@quicinc.com>
Date: Tue, 7 May 2024 12:14:14 +0530
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
X-Proofpoint-GUID: DMJdlYCdoC36EzHMnpXfpHJjoTrE24lB
X-Proofpoint-ORIG-GUID: DMJdlYCdoC36EzHMnpXfpHJjoTrE24lB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_02,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=786 spamscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405070046
X-MailFrom: quic_kuruva@quicinc.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RD5HQ256O2AD6TSALLDFNFS2UNUDLNJT
X-Message-ID-Hash: RD5HQ256O2AD6TSALLDFNFS2UNUDLNJT
X-Mailman-Approved-At: Wed, 08 May 2024 12:51:29 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RD5HQ256O2AD6TSALLDFNFS2UNUDLNJT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpPbiA0LzI5LzIwMjQgMTI6MjcgUE0sIFRha2FzaGkgSXdhaSB3cm90ZToNCj4gT24gTW9uLCAy
OSBBcHIgMjAyNCAwODoyMzoyNyArMDIwMCwNCj4gUmFqYXNoZWthciBLdXJ1dmEgKFRlbXApIHdy
b3RlOg0KPj4NCj4+IE9uIDQvMjYvMjAyNCA2OjEzIFBNLCBUYWthc2hpIEl3YWkgd3JvdGU6DQo+
Pj4gT24gRnJpLCAyNiBBcHIgMjAyNCAxNDoyNToxMSArMDIwMCwNCj4+PiBSYWphc2hla2FyIGt1
cnV2YSB3cm90ZToNCj4+Pj4gV2hlbiBtdWx0aXBsZSBwbHVnLWluIGFuZCBwbHVnLW91dCBldmVu
dHMgb2NjdXIsDQo+Pj4+IHRoZXJlIGlzIGEgcmlzayBvZiBlbmNvdW50ZXJpbmcgYSBOVUxMIHBv
aW50ZXIgZGVyZWZlcmVuY2UNCj4+Pj4gbGVhZGluZyB0byBhIGtlcm5lbCBwYW5pYyBkdXJpbmcg
YSBoZWFkc2V0IHVzZS1jYXNlLg0KPj4+PiB0aGlzIGlzc3VlIGFyaXNlcyBpbiB0aGUgc25kX3Vz
Yl9lbmRwb2ludF9jbG9zZSBmdW5jdGlvbg0KPj4+IFN1Y2ggYSBzY2VuYXJpbyBjYW4ndCBoYXBw
ZW46IGVwLT5pZmFjZV9yZWYgaXMgY2hhbmdlZCBvbmx5IGluDQo+Pj4gY2hpcC0+bXV0ZXggbG9j
aywgaGVuY2UgaXQgY2FuJ3QgYmUgTlVMTCB0aGVyZS4NCj4+Pg0KPj4+DQo+Pj4gdGhhbmtzLA0K
Pj4+DQo+Pj4gVGFrYXNoaQ0KPj4gSGkgVGFrYXNoaSwNCj4+DQo+PiBBY3R1YWxseSB3ZSBhcmUg
ZmFjaW5nIE5VTEwgcG9pbnRlciBkZWZlcmVuY2Ugd2hpbGUgcnVubmluZyBoZWFkc2V0DQo+PiBj
YXNlIHdoZW4gaSBjaGVja2VkIGNhbGwgdHJhY2UgdGhlIGxhc3QgcnVubmluZyBmdW5jdGlvbiBp
cw0KPj4gc25kX3VzYl9lbmRwb2ludF9jbG9zZSB3aGVyZSBpZmFjZV9yZWYgYW5kIGNsb2NrX3Jl
ZiBib3RoIGFyZSAweDANCj4+DQo+PiBbNzU3MDMuOTMzMTA0XVtUMTA1ODVdIFVuYWJsZSB0byBo
YW5kbGUga2VybmVsIE5VTEwgcG9pbnRlcg0KPj4gZGVyZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRy
ZXNzIDAwMDAwMDAwMDAwMDAwMDQNCj4+IFs3NTcwMy45MzMxMTNdW1QxMDU4NV0gW1JCL0VdcmJf
c3JlYXNvbl9zdHJfc2V0OiBzcmVhc29uX3N0ciBzZXQgTlVMTA0KPj4gcG9pbnRlciBkZXJlZmVy
ZW5jZQ0KPj4gWzc1NzAzLjkzMzExNl1bVDEwNTg1XSBNZW0gYWJvcnQgaW5mbzoNCj4+IFs3NTcw
My45MzMxMTddW1QxMDU4NV3CoMKgIEVTUiA9IDB4MDAwMDAwMDA5NjAwMDAwNQ0KPj4gWzc1NzAz
LjkzMzExOV1bVDEwNTg1XcKgwqAgRUMgPSAweDI1OiBEQUJUIChjdXJyZW50IEVMKSwgSUwgPSAz
MiBiaXRzDQo+PiBbNzU3MDMuOTMzMTIwXVtUMTA1ODVdwqDCoCBTRVQgPSAwLCBGblYgPSAwDQo+
PiBbNzU3MDMuOTMzMTIxXVtUMTA1ODVdwqDCoCBFQSA9IDAsIFMxUFRXID0gMA0KPj4gWzc1NzAz
LjkzMzEyM11bVDEwNTg1XcKgwqAgRlNDID0gMHgwNTogbGV2ZWwgMSB0cmFuc2xhdGlvbiBmYXVs
dA0KPj4gWzc1NzAzLjkzMzEyNF1bVDEwNTg1XSBEYXRhIGFib3J0IGluZm86DQo+PiBbNzU3MDMu
OTMzMTI0XVtUMTA1ODVdwqDCoCBJU1YgPSAwLCBJU1MgPSAweDAwMDAwMDA1DQo+PiBbNzU3MDMu
OTMzMTI1XVtUMTA1ODVdwqDCoCBDTSA9IDAsIFduUiA9IDANCj4+IOKApg0KPj4gWzc1NzAzLjkz
MzY3Nl1bVDEwNTg1XSBDUFU6IDMgUElEOiAxMDU4NSBDb21tOiBrd29ya2VyL3UxNzowIFRhaW50
ZWQ6DQo+PiBHIFPCoMKgwqDCoMKgIFfCoCBPRSA2LjEuNDMtYW5kcm9pZDE0LTExLWdhMmZhNzdk
MzZkMjYtYWIxMTIwNDgyOSAjMQ0KPj4gWzc1NzAzLjkzMzY5N11bVDEwNTg1XSBwc3RhdGU6IDYy
NDAwMDA1IChuWkN2IGRhaWYgK1BBTiAtVUFPICtUQ08gLURJVA0KPj4gLVNTQlMgQlRZUEU9LS0p
DQo+PiBbNzU3MDMuOTMzNzAwXVtUMTA1ODVdIHBjIDogc25kX3VzYl9lbmRwb2ludF9jbG9zZSsw
eDMwLzB4MTA0DQo+PiBbNzU3MDMuOTMzNzIxXVtUMTA1ODVdIGxyIDogc25kX3VzYl9lbmRwb2lu
dF9jbG9zZSsweDI4LzB4MTA0DQo+PiBbNzU3MDMuOTMzNzI0XVtUMTA1ODVdIHNwIDogZmZmZmZm
YzA0YjJiYjc0MA0KPj4gWzc1NzAzLjkzMzcyNV1bVDEwNTg1XSB4Mjk6IGZmZmZmZmMwNGIyYmI3
NDAgeDI4OiBmZmZmZmY4MDI0ZTNiYTc4DQo+PiB4Mjc6IGZmZmZmZmQyNjZlOTFkYTANCj4+IFs3
NTcwMy45MzM3MjhdW1QxMDU4NV0geDI2OiBmZmZmZmZjMDRiMmJiN2E4IHgyNTogZmZmZmZmODli
ZWM1YmUwMA0KPj4geDI0OiAwMDAwMDAwMGZmZmZmZmVhDQo+PiBbNzU3MDMuOTMzNzMwXVtUMTA1
ODVdIHgyMzogMDAwMDAwMDAwMDAwMDAwMiB4MjI6IGZmZmZmZjg4NWQ1NjgwMDgNCj4+IHgyMTog
ZmZmZmZmODAyNGUzYmE3OA0KPj4gWzc1NzAzLjkzMzczMl1bVDEwNTg1XSB4MjA6IGZmZmZmZjg4
NWQ1NjgwMDAgeDE5OiBmZmZmZmY4MDI0ZTNiYjE4DQo+PiB4MTg6IGZmZmZmZmQyNmRiMmQxNDAN
Cj4+IFs3NTcwMy45MzM3MzRdW1QxMDU4NV0geDE3OiAwMDAwMDAwMGYwMWIwODE4IHgxNjogMDAw
MDAwMDBmMDFiMDgxOA0KPj4geDE1OiAwMDAwMDAwMDAwMDAwMDA4DQo+PiBbNzU3MDMuOTMzNzM2
XVtUMTA1ODVdIHgxNDogZmZmZmZmOGEzZTJiNTc4MCB4MTM6IGZmZmZmZjhhM2UyYjU3ODANCj4+
IHgxMjogZmZmZmZmZDI2Y2JkMjc3MA0KPj4gWzc1NzAzLjkzMzczOF1bVDEwNTg1XSB4MTE6IDAw
MDAwMDAwMDAwMDAwMDEgeDEwOiBmZmZmZmY4OTg0MzIwMDAwIHg5DQo+PiA6IDRmNDNiODZlOTQ2
YjRlMDANCj4+IFs3NTcwMy45MzM3NDBdW1QxMDU4NV0geDggOiAwMDAwMDAwMDAwMDAwMDAwIHg3
IDogMDAwMDAwMDAwMDAwMDAwMSB4Ng0KPj4gOiBmZmZmZmZmZGVmOGU4YjcwDQo+PiBbNzU3MDMu
OTMzNzQyXVtUMTA1ODVdIHg1IDogMDAwMDAwMDAwMDAwMDAwMSB4NCA6IDAwMDAwMDAwMDAwMDAw
MDAgeDMNCj4+IDogZmZmZmZmODAyNGUzYmIyOA0KPj4gWzc1NzAzLjkzMzc0M11bVDEwNTg1XSB4
MiA6IDAwMDAwMDAxMDExZmE3YzkgeDEgOiBmZmZmZmZjMDRiMmJiNjgwIHgwDQo+PiA6IDAwMDAw
MDAwMDAwMDAwMDANCj4+IFs3NTcwMy45MzM3NDZdW1QxMDU4NV0gQ2FsbCB0cmFjZToNCj4+IFs3
NTcwMy45MzM3NDddW1QxMDU4NV3CoCBzbmRfdXNiX2VuZHBvaW50X2Nsb3NlKzB4MzAvMHgxMDQN
Cj4gV2hvIGlzIGFjdHVhbGx5IGNhbGxpbmcgc25kX3VzYl9lbmRwb2ludF9jbG9zZSgpPw0KPiBJ
IGd1ZXNzIHRoYXQncyByYXRoZXIgYSBidWcgaW4gdGhlIGNhbGwgcGF0dGVybiwgbm90IHRoZSBj
b2RlIGluDQo+IFVTQi1hdWRpbyBkcml2ZXIgaXRzZWxmLg0KPg0KPiBzbmRfdXNiX2VuZHBvaW50
X2Nsb3NlKCkgaXMgc3VwcG9zZWQgdG8gYmUgY2FsbGVkIG9ubHkgZm9yIGEgcmVhbGx5DQo+IG9w
ZW5lZCBlbmRwb2ludC4gIFNvLCBpZiBhbnksIGl0J3MgcmF0aGVyIGEgcmFjZSAob3IgYSBidWcp
IGluIHRoZQ0KPiBjYWxsZXIgc2lkZSwgYW5kIGl0IHNob3VsZCBiZSBhZGRyZXNzZWQgdGhlcmUg
aW5zdGVhZC4NCj4NCj4NCj4gdGhhbmtzLA0KPg0KPiBUYWthc2hpDQoNCkhpIFRha2FzaGksDQoN
CkknbSBjaGVja2luZyBvbiB3aG8gaXMgY2FsbGluZyBzbmRfdXNiX2VuZHBvaW50X2Nsb3NlKCks
IHdpdGhvdXQgb3BlbmVkIA0KZW5kcG9pbnQgaXMgY3JlYXRlZC4NCg0KQXMgaXRzIHJhcmVseSBy
ZXByb2R1Y2libGUsIGl0cyB0YWtpbmcgdGltZS4NCg0KSSdsbCByZXBseSB5b3UgYmFjay4NCg0K
LS1SYWphc2hla2FyIEsuDQo=
