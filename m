Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8D5DEEE4
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 16:09:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB76D1672;
	Mon, 21 Oct 2019 16:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB76D1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571666986;
	bh=rOcP6Xzv+dMmZJkYyD/R5JSEGnBDiEyxBPAQgx1DsYo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sAjsxjPZPSu5h1W4hoy8Ch18Xnojw8uwz4zGslOSMISiLCsKsXjncDm6sF8lunDJa
	 +XWcNnsztsJTiZu1dwU5oQJNMUi42TUtN7uvH7hHwHH7ZsU5aiJXCmH4uTw2/COG0N
	 8NfNQILp7jh/xl41RLin2wmzlHXdi9WEZjJhA6eM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A47DF8036F;
	Mon, 21 Oct 2019 16:08:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABDEAF8036F; Mon, 21 Oct 2019 16:07:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89365F800C0
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 16:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89365F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="nXUr7mZH"
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9LE7o5v004219; Mon, 21 Oct 2019 10:07:53 -0400
Received: from nam01-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam01lp2055.outbound.protection.outlook.com [104.47.32.55])
 by mx0b-00128a01.pphosted.com with ESMTP id 2vqv8akt8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2019 10:07:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaq5rTSzqDTy3LjjfU5cINhRylgSGFcE69AU7lcgELuhDBK56uAtDremftWS9iTqC/QabC/I7SRW9rpa0L7kXs6CBmxubZsST+ER/eFX79A0ZqcRgbr5wPr/cm8pYZzFB8TkWquKc7Q/b44eupCHhTMWcSXqVrhHVmNMA6PY5SFor6izjP5yTbFJdvLgeDNpt6+cKLCkvJsbMTaJrBkOtbuQ8AxmR1zcPTF8IPUUbWuR3v0TulpVBcuyek+j2ZbQ5QT60BZj9dSC2J0h61KXWZam9K3IHU7w6g3jP16J6svuZaGp3LkQl7A2CLG+zpaiNozIcIAsDyeTXbEq9ijkxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+i6sGtZxvcrwzX4SjQToH0Dizu5BMKV9kHoANdcp44=;
 b=mZK1sRBdI2cys8VjvkOsYb1Nbh4yif5T0Gp5w/GH5UYOSgJMcTTYqIe/DBB/Sj6P37Jlezq7h1ctde0r3+yC3znQPPqo7+tvchDqgrh16bZI9Pp4VX3kAobAK+c8WtINzlwVZNH9YTzqeqL2fgBp0Mo6H25Fio0Crk6kn0MqUX/d9EZVvvd8hTvdplBZ6TEnLwbWAXCCWJbPk3H8aALTcxlqAMPOHQLHh5NLlZBohHPByTJBxQMh7Yncx5rkzKRrZaJSBEVoIbXtzZCeKms1yRaITjskHna+i8Y20ZGdkftHf9JO4dMN5zVywi729fTSA/ODO881cUTjINqijLCS2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=gmail.com smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+i6sGtZxvcrwzX4SjQToH0Dizu5BMKV9kHoANdcp44=;
 b=nXUr7mZHWxhteC+A1+Cwae7W3PZl5Q1/G/R7k+ggMQVfnvwn1RVpymj76pbqhtD2L2VC7xdFB1NP7Kn4+uYaIuFe+Vrn/9VBMMxUYr+9DBnFkVFKejQlo4SC0BJUQNmK42bAvfFThMFR2KCLFoiqw+7Z31Uc6JAfCFFEztBrl9E=
Received: from DM6PR03CA0054.namprd03.prod.outlook.com (2603:10b6:5:100::31)
 by CY4PR03MB2855.namprd03.prod.outlook.com (2603:10b6:903:137::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.24; Mon, 21 Oct
 2019 14:07:52 +0000
Received: from SN1NAM02FT026.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::206) by DM6PR03CA0054.outlook.office365.com
 (2603:10b6:5:100::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2367.21 via Frontend
 Transport; Mon, 21 Oct 2019 14:07:52 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 SN1NAM02FT026.mail.protection.outlook.com (10.152.72.97) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2367.14
 via Frontend Transport; Mon, 21 Oct 2019 14:07:51 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x9LE7iIG013900
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 21 Oct 2019 07:07:44 -0700
Received: from nsa.sphairon.box (10.44.3.90) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server (TLS) id 14.3.408.0; Mon, 21 Oct
 2019 10:07:50 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>
Date: Mon, 21 Oct 2019 16:08:15 +0200
Message-ID: <20191021140816.262401-2-nuno.sa@analog.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021140816.262401-1-nuno.sa@analog.com>
References: <20191021140816.262401-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-Originating-IP: [10.44.3.90]
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(136003)(346002)(39860400002)(376002)(189003)(199004)(446003)(246002)(86362001)(1076003)(356004)(6666004)(50466002)(478600001)(8676002)(8936002)(50226002)(70206006)(426003)(45776006)(70586007)(5820100001)(126002)(486006)(476003)(11346002)(186003)(53416004)(5660300002)(2616005)(26005)(16526019)(336012)(47776003)(76176011)(23676004)(3846002)(7736002)(305945005)(7636002)(6116002)(4326008)(36756003)(2870700001)(106002)(2906002)(54906003)(110136005)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR03MB2855; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8842ffd0-e0ee-4181-74de-08d756300fd2
X-MS-TrafficTypeDiagnostic: CY4PR03MB2855:
X-Microsoft-Antispam-PRVS: <CY4PR03MB28552A51997644968AD7A70899690@CY4PR03MB2855.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-Forefront-PRVS: 0197AFBD92
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R8o6ecUpMD5MzBKQ4hRaM6ccNitxNem/R5tW3tASw3x7rBrTLnFXnxdrI9Y10Jqc6n0Tzp9y22p86D61Kq6Y0OIkM1xy6oXEU4NFNWV5QKvbWFWJ33KvkCv3i+55S6uJkZNs6AEdz7YWA0k/R9fGQ3b6XwAHYyzkDXk7niN3BFEiDburMmcCUzJ6jHfATiyc4ljlz6AgnzqIykgtT85j9VH41LsjlUbZpg61InOzxqRnCFSH1G9B7rXK61Mf7L93+h1s1JO7JYe7zwlt2xTjHsZHNpBktjaRcOmkxx6nkJkOBSaBwv6sSGWS4kp8BOzWhxjDPQhERVkMMgQWghpey5OYRuyHrReWDEfgDlcrYqbWNWe/DNsntzSBfxIHEVgeMvcjXNthdGXMYDTG7VUc1udpys8PllL8Z+yeStfflvgDE+iaHRUxOmmyf0d5kz7E
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 14:07:51.7432 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8842ffd0-e0ee-4181-74de-08d756300fd2
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2855
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-21_04:2019-10-21,2019-10-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 spamscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910210134
Cc: Mark Rutland <mark.rutland@arm.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH 1/2] dt-bindings: asoc: adau7118: Cleanup
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

VGhpcyBjaGFuZ2VzIGFyZSBpbiBhY2NvcmRhbmNlIHdpdGggdGhlIHJldmlldyBkb25lIHRvIHRo
aXMgYmluZGluZ3MuClRoaXMgaXMgYSBmb2xsb3ctdXAgcGF0Y2ggdG8gOTY5ZDQ5YjJjZGM4LgoK
U2lnbmVkLW9mZi1ieTogTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KLS0tCiAuLi4vYmlu
ZGluZ3Mvc291bmQvYWRpLGFkYXU3MTE4LnlhbWwgICAgICAgICAgfCAyNSArKysrKysrKy0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2Fk
aSxhZGF1NzExOC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5k
L2FkaSxhZGF1NzExOC55YW1sCmluZGV4IGNmY2VmNjAyYjNkOS4uYzNmMTBhZmJkZDZmIDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvYWRpLGFkYXU3
MTE4LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2Fk
aSxhZGF1NzExOC55YW1sCkBAIC0yNiwxMyArMjYsMTEgQEAgcHJvcGVydGllczoKICAgIiNzb3Vu
ZC1kYWktY2VsbHMiOgogICAgIGNvbnN0OiAwCiAKLSAgSU9WREQtc3VwcGx5OgorICBpb3ZkZC1z
dXBwbHk6CiAgICAgZGVzY3JpcHRpb246IERpZ2l0YWwgSW5wdXQvT3V0cHV0IFBvd2VyIFN1cHBs
eS4KLSAgICAkcmVmOiAiL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZSIK
IAotICBEVkRELXN1cHBseToKKyAgZHZkZC1zdXBwbHk6CiAgICAgZGVzY3JpcHRpb246IEludGVy
bmFsIENvcmUgRGlnaXRhbCBQb3dlciBTdXBwbHkuCi0gICAgJHJlZjogIi9zY2hlbWFzL3R5cGVz
LnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUiCiAKICAgYWRpLGRlY2ltYXRpb24tcmF0aW86CiAg
ICAgZGVzY3JpcHRpb246IHwKQEAgLTU4LDIzICs1NiwyMSBAQCBwcm9wZXJ0aWVzOgogcmVxdWly
ZWQ6CiAgIC0gIiNzb3VuZC1kYWktY2VsbHMiCiAgIC0gY29tcGF0aWJsZQotICAtIElPVkRELXN1
cHBseQotICAtIERWREQtc3VwcGx5CisgIC0gaW92ZGQtc3VwcGx5CisgIC0gZHZkZC1zdXBwbHkK
IAogZXhhbXBsZXM6CiAgIC0gfAotICAgIGkyYzAgeworICAgIGkyYyB7CiAgICAgICAgIC8qIGV4
YW1wbGUgd2l0aCBpMmMgc3VwcG9ydCAqLwogICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsK
ICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Ci0gICAgICAgIHN0YXR1cyA9ICJva2F5IjsKLSAg
ICAgICAgYWRhdTcxMThfY29kZWM6IGFkYXU3MTE4LWNvZGVjQDE0IHsKKyAgICAgICAgYWRhdTcx
MThfY29kZWM6IGF1ZGlvLWNvZGVjQDE0IHsKICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0g
ImFkaSxhZGF1NzExOCI7CiAgICAgICAgICAgICAgICAgcmVnID0gPDE0PjsKICAgICAgICAgICAg
ICAgICAjc291bmQtZGFpLWNlbGxzID0gPDA+OwotICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJv
a2F5IjsKLSAgICAgICAgICAgICAgICBJT1ZERC1zdXBwbHkgPSA8JnN1cHBseT47Ci0gICAgICAg
ICAgICAgICAgRFZERC1zdXBwbHkgPSA8JnN1cHBseT47CisgICAgICAgICAgICAgICAgaW92ZGQt
c3VwcGx5ID0gPCZzdXBwbHk+OworICAgICAgICAgICAgICAgIGR2ZGQtc3VwcGx5ID0gPCZzdXBw
bHk+OwogICAgICAgICAgICAgICAgIGFkaSxwZG0tY2xrLW1hcCA9IDwxIDEgMCAwPjsKICAgICAg
ICAgICAgICAgICBhZGksZGVjaW1hdGlvbi1yYXRpbyA9IDwxNj47CiAgICAgICAgIH07CkBAIC04
NCw3ICs4MCw2IEBAIGV4YW1wbGVzOgogICAgIGFkYXU3MTE4X2NvZGVjX2h3OiBhZGF1NzExOC1j
b2RlYy1odyB7CiAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFkaSxhZGF1NzExOCI7CiAgICAg
ICAgICAgICAjc291bmQtZGFpLWNlbGxzID0gPDA+OwotICAgICAgICAgICAgc3RhdHVzID0gIm9r
YXkiOwotICAgICAgICAgICAgSU9WREQtc3VwcGx5ID0gPCZzdXBwbHk+OwotICAgICAgICAgICAg
RFZERC1zdXBwbHkgPSA8JnN1cHBseT47CisgICAgICAgICAgICBpb3ZkZC1zdXBwbHkgPSA8JnN1
cHBseT47CisgICAgICAgICAgICBkdmRkLXN1cHBseSA9IDwmc3VwcGx5PjsKICAgICB9OwotLSAK
Mi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpB
bHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6
Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
