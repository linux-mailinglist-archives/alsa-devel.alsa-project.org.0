Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCAB8AACCC
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 12:29:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82DE6B65;
	Fri, 19 Apr 2024 12:28:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82DE6B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713522544;
	bh=+makS2b3neAgPF9YH7LZ77Yki7ztHOZ5tt1vMzjsK5U=;
	h=From:To:CC:References:In-Reply-To:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vX4OjdMdx/ZngHnmeyGC+psbgYEcDIbdKpvogZ64rMYjUzTMmdUGTMaZaJ9L519SZ
	 PL9o0jwiUqf+pTq2unabfWG1pCIw3WB0GH8s3Ju2YqCgzhgH/UG+zdiUvlWIsalgFM
	 WRg1SmTbc+SYKnZ1tkJ57ZS6PNiKrd739bW78Jk0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08A80F805AE; Fri, 19 Apr 2024 12:28:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6976FF805A0;
	Fri, 19 Apr 2024 12:28:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 614BBF8025A; Fri, 19 Apr 2024 12:28:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE449F80124
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 12:28:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE449F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=iRS9rAcU
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43J60Djm010031;
	Fri, 19 Apr 2024 05:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:references:in-reply-to:subject:date:message-id
	:mime-version:content-type; s=PODMain02222019; bh=8fy8Y4O7sO2L+u
	KRe6S0mDL83TLPyr4jEPxJ7MAQv+g=; b=iRS9rAcUFYGXtXrIiKE8v5ZRvgdwkE
	83odmLzODeDz4aikfTe531Ee8XQ1d6oDWREQxcrHCOyQXWvsyJ/rDwRZ+gnJ3uw3
	Ber8pGtLEss8qEfPKYNGYnwyIPAJdiXB1r82wsvMd7XJYmscX7RFFQWVZgzUpPQf
	+dW6vhcpti2iuZfCxUyuA0Ab+lgKSVFrhiDi25/I2hgiXyGJl7BHM5YepN3QprdC
	nNlP+PJux21O9NDh8Xq4r/cLRiwGzAUPI7i5y5vZrtnrlHoOPN46kV7iRIhDxI8R
	89v1jf4IL2whF6ZbN9FLfYiL5FmuLQnf3WbtTDVvMT/b6I3lUzhlpPdg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xfpfhwpkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 05:28:07 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 11:28:05 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 19 Apr 2024 11:28:05 +0100
Received: from LONN2DGDQ73 (LONN2DGDQ73.ad.cirrus.com [198.61.64.201])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3D9B8820242;
	Fri, 19 Apr 2024 10:28:05 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: =?UTF-8?Q?'Niclas_S=C3=B6derlund'?= <niclas@soderlund.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <perex@perex.cz>, <tiwai@suse.com>
References: 
 <CAOALB-ZrtXYvp5urv8xk+Lk+zcoK92mVANdY_kT7yR5QhT4=jg@mail.gmail.com>
In-Reply-To: 
 <CAOALB-ZrtXYvp5urv8xk+Lk+zcoK92mVANdY_kT7yR5QhT4=jg@mail.gmail.com>
Subject: RE: [PATCH v1 0/7] Add support for various laptops using CS35L41 HDA
 without _DSD
Date: Fri, 19 Apr 2024 11:28:05 +0100
Message-ID: <002101da9244$43d03180$cb709480$@opensource.cirrus.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQG2nY7S7JCbMZ/nDfri/e0e2FUknbG3TSeQ
X-Proofpoint-ORIG-GUID: SAkjJVbnmSNYgxu1P6gT0wQKbbMLvtWg
X-Proofpoint-GUID: SAkjJVbnmSNYgxu1P6gT0wQKbbMLvtWg
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IOPN3ZJYXP3V34N4H4GQ3QTLIJT5BW27
X-Message-ID-Hash: IOPN3ZJYXP3V34N4H4GQ3QTLIJT5BW27
X-MailFrom: prvs=1839b4c55b=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IOPN3ZJYXP3V34N4H4GQ3QTLIJT5BW27/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgTmljbGFzLA0KIA0KVGhlIFNLVSBpbiBxdWVzdGlvbiBpc24ndCBjdXJyZW50bHkgc2NoZWR1
bGVkIGZvciBzdXBwb3J0LCBob3dldmVyIGlmIHlvdSBjcmVhdGUgYSBidWd6aWxsYSB0aWNrZXQg
YXQgdGhlIGJlbG93IGFkZHJlc3MgYW5kIENDIENpcnJ1cyBQYXRjaGVzIChwYXRjaGVzQG9wZW5z
b3VyY2UuY2lycnVzLmNvbSkgdG8gaXQsIHdlIHdpbGwgaW52ZXN0aWdhdGUgYWRkaW5nIHN1cHBv
cnQgYXMgc29vbiBhcyB3ZSBjYW4uDQogDQpodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvDQog
DQpUaGFua3MsDQogDQpTdGVmYW4NCiANCkZyb206IE5pY2xhcyBTw7ZkZXJsdW5kIDxuaWNsYXNA
c29kZXJsdW5kLm9yZz4gDQpTZW50OiBGcmlkYXksIEFwcmlsIDE5LCAyMDI0IDg6NDUgQU0NClRv
OiBzYmluZGluZ0BvcGVuc291cmNlLmNpcnJ1cy5jb20NCkNjOiBhbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXNvdW5kQHZnZXIu
a2VybmVsLm9yZzsgcGF0Y2hlc0BvcGVuc291cmNlLmNpcnJ1cy5jb207IHBlcmV4QHBlcmV4LmN6
OyB0aXdhaUBzdXNlLmNvbQ0KU3ViamVjdDogUkU6IFtQQVRDSCB2MSAwLzddIEFkZCBzdXBwb3J0
IGZvciB2YXJpb3VzIGxhcHRvcHMgdXNpbmcgQ1MzNUw0MSBIREEgd2l0aG91dCBfRFNEDQogDQpI
aSwNCg0KYW1hemluZ2x5IGhpZ2ggbGV2ZWwgb2YgbGF5bWFuc2hpcCBoZXJlIGFuZCBlcXVhbGx5
IGhpZ2ggbGV2ZWwgb2YgZGlzcGVhci4gQnV0IG1vZGVsIGFmdGVyIG1vZGVsIGlzIGFkZGVkIHRv
IGZpeCB0aGUgcHJvYmxlbSB3aXRoIHNwZWFrZXJzIG5vdCB3b3JraW5nLCBidXQgbm93aGVyZSBp
cyBteSBtb2RlbCBzZWVuLiBJIGhhdmUgdGhlIExlbm92byAxM1ggRzIgbW9kZWwgYW5kIGV2ZW4g
YXQga2VybmVsIDYuOC43IG15IHNwZWFrZXJzIHN0aWxsIGRvZXNudCB3b3JrLg0KDQpXaGVyZSBj
YW4gSSBhZGQgYSByZXF1ZXN0IHRvIGFsc28gaW5jbHVkZSB0aGlzIG1vZGVsIGluIHRoZSBwYXRj
aGVzLCBzbyBJIGhhdmUgYSBob3BlIG9mIGhhdmluZyB0aGUgc3BlYWtlcnMgc3RhcnQgd29ya2lu
Zz8NCg0KSSBkbyBhcG9sb2dpc2UgaW4gYWR2YW5jZSwNCg0KTXZoLCBOaWNsYXMNCiANCiANCg==
