Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CC1D220B
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 09:44:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18639166B;
	Thu, 10 Oct 2019 09:43:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18639166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570693453;
	bh=Q0/MirMgeHCU6/bWPzWuFULuqqBh6WiG6OiTVgRQy1I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lDNjMGDUIuTxJQIGjd3UpbwtGFChd+bt78iKk4MNaFNVOhofIQ50NHO5o75i2uPR6
	 cvir5erRvDtSgYAT8wJ54I8YrB3B6IqNhHFuzHLV9X5m0RnxNj0zmcJKmuDBZHD3UV
	 EJakwzd/+QuUU6tQYxNKjK20siuj6JelcA4ajebw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48940F8038F;
	Thu, 10 Oct 2019 09:42:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C8E9F80447; Thu, 10 Oct 2019 09:42:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6479EF80322
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 09:42:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6479EF80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="QIq6uzGJ"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9A7cHCn023051; Thu, 10 Oct 2019 03:42:16 -0400
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2051.outbound.protection.outlook.com [104.47.36.51])
 by mx0a-00128a01.pphosted.com with ESMTP id 2ver39qt28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Oct 2019 03:42:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C29/yiPKKWwumZakhThPGrFrk0e3M2xBb8lC6JJK8TKNO6a2BPv0GdbEVL31pyYuJn0bySzwvGlyCz7DvHG7Tn4WQSCK2aWOQkxjHrJ08GMtQ3lcwsiSQq7zsOfB0QQPmIkGcF+ohvatWmrAt1gusjXp77L9jL0DuCgW04xckH7zxK6aGVV++1Py9xFySBf+6a8wzQxnXxoiZeSu8GtYiyi6P/L8xHkB5p/+Qd0d0SMKIeD4XEnvIyGTCUtV4okxnvP9UWnd5sXzWjpa6FRnQJFVJ3vj+DdYEUNl6KcvLh9wXU/Swu1kH+rs0/Za9XWjct3RiJYfXjp6v55EdX96yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcaasmzVl3SQyrzMHNFBLH3SkeUDjrvLmE5s163pVPg=;
 b=VNfgjC4Vc2NmdIZXSyuJ1KpN5Lqy7CTIdCmNLT33a+phqXf3VtNee40DEuoTtv+9Xl+ycX9wznda6GQdjFJKd1cgOMbb8aeaT76oqpmUMiwO3RmqrSIDjZ6YPM3bAvMsn5jG4gqC6KyG/4d2NcElBSECooWs2rjvWYef2umIw+MCrCBWZNRqdPQJNJFkL2geZLedbdGGHkcl9HjW22+DcWC+eM1l1b7PDYqgIpn83BINJ00zc0w6obrRAlv4LXc4CkruwQU769XRiFhO0jlPExUTl2/enxGZkhoKY4Y6JnY5gzQwqYvyMqxE1+vJZE3z55OeAm2VxIFbGPyXwIRDBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.55) smtp.rcpttodomain=arm.com smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcaasmzVl3SQyrzMHNFBLH3SkeUDjrvLmE5s163pVPg=;
 b=QIq6uzGJtSoYQ3N+pWSzBADEkE8YdoetGTsBe21bUUi6S3JoVJmcK2QwJpRHcUkHRfDi0VuPjKCHCmkEPJdxr1QJPErq89f5Kmx7RTw/vuuQenZMwtgmI5rnG8AJ/lCnFHnZgScyZ8gRlh0Xam6MJufvMySpGSvznrxtAnT2pkw=
Received: from BN6PR03CA0080.namprd03.prod.outlook.com (2603:10b6:405:6f::18)
 by DM5PR03MB2428.namprd03.prod.outlook.com (2603:10b6:3:72::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 10 Oct
 2019 07:42:13 +0000
Received: from BL2NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::204) by BN6PR03CA0080.outlook.office365.com
 (2603:10b6:405:6f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Thu, 10 Oct 2019 07:42:13 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 BL2NAM02FT057.mail.protection.outlook.com (10.152.77.36) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2347.16
 via Frontend Transport; Thu, 10 Oct 2019 07:42:13 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x9A7g6Bd013839
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 10 Oct 2019 00:42:06 -0700
Received: from nsa.sphairon.box (10.44.3.90) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 10 Oct
 2019 03:42:12 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>
Date: Thu, 10 Oct 2019 09:42:34 +0200
Message-ID: <20191010074234.7344-2-nuno.sa@analog.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191010074234.7344-1-nuno.sa@analog.com>
References: <20191010074234.7344-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-Originating-IP: [10.44.3.90]
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(136003)(346002)(39860400002)(376002)(199004)(189003)(6306002)(8936002)(446003)(2616005)(336012)(478600001)(5820100001)(966005)(126002)(11346002)(476003)(486006)(50226002)(8676002)(426003)(23676004)(53416004)(246002)(4326008)(76176011)(47776003)(54906003)(316002)(110136005)(70206006)(70586007)(2870700001)(50466002)(1076003)(16526019)(5660300002)(356004)(6666004)(106002)(186003)(86362001)(45776006)(6116002)(26005)(36756003)(3846002)(7736002)(7636002)(305945005)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR03MB2428; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c44d8652-af07-46fc-88b6-08d74d555d63
X-MS-TrafficTypeDiagnostic: DM5PR03MB2428:
X-MS-Exchange-PUrlCount: 3
X-Microsoft-Antispam-PRVS: <DM5PR03MB2428DF4AD7F215FA89A4F15299940@DM5PR03MB2428.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 018632C080
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jc/jxf6oXsYki++AFTCRRRK2iq5haAnxMCEMayuPwg1ZMtz0B12MYzNYKkLSNbiUPMcEOHQHz5QemKU8FWRHyYY+G/t/l339oAkv607G65f+D9XzcTwWZqWhS4G5AdKQa9LVPod8fXK1K9C+ml8qncOUm5Ufz2T1w9rmk4Rp/xM2tMJCeR/HRiES0UgLK/yfrv6awxr9/viqyIl4sdtDDZyR2vpGm0U2RignGhr8Vjnw+pnOJskf+p7iD8fwsmM+u+bZbgW2r+sq1nIqNXZhvDl6qB9ujvjueeIVNhChov5R22ou/o40cpcq8XwozqGKMEiRPe6RjEEVcW4EcluyrKX45BRW4IMGNsRpv6MgnFEJw+svEeo0PTRDEZUUj2FLQAGNW7+VuhCNlMOsLk8N7mH834GizlNkBvzRb4EB1l5r3//6XIRt4xA77VSnOCqZUN0V1k7acNmC5DOmSVhIUw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2019 07:42:13.0107 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c44d8652-af07-46fc-88b6-08d74d555d63
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2428
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-10_04:2019-10-08,2019-10-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910100071
Cc: Mark Rutland <mark.rutland@arm.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH v3 2/2] dt-bindings: asoc: Add ADAU7118
	documentation
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

RG9jdW1lbnQgdGhlIEFEQVU3MTE4IDggY2hhbm5lbCBQRE0gdG8gSTJTL1RETSBjb252ZXJ0ZXIg
ZGV2aWNldHJlZQpiaW5kaW5ncy4KClNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFu
YWxvZy5jb20+Ci0tLQpDaGFuZ2VzIGluIHYyOgogKiBMaXN0IHJlZ3VsYXRvcnMgYXMgcmVxdWly
ZWQ7CgpDaGFuZ2VzIGluIHYzOgogKiBTZXQgdGhlIGNvcnJlY3QgbGljZW5zZSBmb3IgbmV3IGJp
bmRpbmdzLgoKIC4uLi9iaW5kaW5ncy9zb3VuZC9hZGksYWRhdTcxMTgueWFtbCAgICAgICAgICB8
IDkwICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5MCBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nv
dW5kL2FkaSxhZGF1NzExOC55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3NvdW5kL2FkaSxhZGF1NzExOC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NvdW5kL2FkaSxhZGF1NzExOC55YW1sCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uY2ZjZWY2MDJiM2Q5Ci0tLSAvZGV2L251bGwKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2FkaSxhZGF1NzExOC55YW1s
CkBAIC0wLDAgKzEsOTAgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9u
bHkgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvc291bmQvYWRpLGFkYXU3MTE4LnlhbWwjCiskc2NoZW1hOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKworCit0aXRsZTogQW5hbG9n
IERldmljZXMgQURBVTcxMTggOCBDaGFubmVsIFBETSB0byBJMlMvVERNIENvbnZlcnRlcgorCitt
YWludGFpbmVyczoKKyAgLSBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgorCitkZXNjcmlw
dGlvbjogfAorICBBbmFsb2cgRGV2aWNlcyBBREFVNzExOCA4IENoYW5uZWwgUERNIHRvIEkyUy9U
RE0gQ29udmVydGVyIG92ZXIgSTJDIG9yIEhXCisgIHN0YW5kYWxvbmUgbW9kZS4KKyAgaHR0cHM6
Ly93d3cuYW5hbG9nLmNvbS9tZWRpYS9lbi90ZWNobmljYWwtZG9jdW1lbnRhdGlvbi9kYXRhLXNo
ZWV0cy9BREFVNzExOC5wZGYKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBlbnVt
OgorICAgICAgLSBhZGksYWRhdTcxMTgKKworICByZWc6CisgICAgbWF4SXRlbXM6IDEKKworICAi
I3NvdW5kLWRhaS1jZWxscyI6CisgICAgY29uc3Q6IDAKKworICBJT1ZERC1zdXBwbHk6CisgICAg
ZGVzY3JpcHRpb246IERpZ2l0YWwgSW5wdXQvT3V0cHV0IFBvd2VyIFN1cHBseS4KKyAgICAkcmVm
OiAiL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZSIKKworICBEVkRELXN1
cHBseToKKyAgICBkZXNjcmlwdGlvbjogSW50ZXJuYWwgQ29yZSBEaWdpdGFsIFBvd2VyIFN1cHBs
eS4KKyAgICAkcmVmOiAiL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZSIK
KworICBhZGksZGVjaW1hdGlvbi1yYXRpbzoKKyAgICBkZXNjcmlwdGlvbjogfAorICAgICAgVGhp
cyBwcm9wZXJ0eSBzZXQncyB0aGUgZGVjaW1hdGlvbiByYXRpbyBvZiBQRE0gdG8gUENNIGF1ZGlv
IGRhdGEuCisgICAgYWxsT2Y6CisgICAgICAtICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2Rl
ZmluaXRpb25zL3VpbnQzMgorICAgICAgLSBlbnVtOiBbNjQsIDMyLCAxNl0KKyAgICAgICAgZGVm
YXVsdDogNjQKKworICBhZGkscGRtLWNsay1tYXA6CisgICAgZGVzY3JpcHRpb246IHwKKyAgICAg
IFRoZSBBREFVNzExOCBoYXMgdHdvIFBETSBjbG9ja3MgZm9yIHRoZSBmb3VyIElucHV0cy4gRWFj
aCBpbnB1dCBtdXN0IGJlCisgICAgICBhc3NpZ25lZCB0byBvbmUgb2YgdGhlc2UgdHdvIGNsb2Nr
cy4gVGhpcyBwcm9wZXJ0eSBzZXQncyB0aGUgbWFwcGluZworICAgICAgYmV0d2VlbiB0aGUgY2xv
Y2tzIGFuZCB0aGUgaW5wdXRzLgorICAgIGFsbE9mOgorICAgICAgLSAkcmVmOiAvc2NoZW1hcy90
eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzItYXJyYXkKKyAgICAgIC0gbWluSXRlbXM6IDQK
KyAgICAgICAgbWF4SXRlbXM6IDQKKyAgICAgICAgaXRlbXM6CisgICAgICAgICAgbWF4aW11bTog
MQorICAgICAgICBkZWZhdWx0OiBbMCwgMCwgMSwgMV0KKworcmVxdWlyZWQ6CisgIC0gIiNzb3Vu
ZC1kYWktY2VsbHMiCisgIC0gY29tcGF0aWJsZQorICAtIElPVkRELXN1cHBseQorICAtIERWREQt
c3VwcGx5CisKK2V4YW1wbGVzOgorICAtIHwKKyAgICBpMmMwIHsKKyAgICAgICAgLyogZXhhbXBs
ZSB3aXRoIGkyYyBzdXBwb3J0ICovCisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OworICAg
ICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKKyAgICAgICAgc3RhdHVzID0gIm9rYXkiOworICAgICAg
ICBhZGF1NzExOF9jb2RlYzogYWRhdTcxMTgtY29kZWNAMTQgeworICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAiYWRpLGFkYXU3MTE4IjsKKyAgICAgICAgICAgICAgICByZWcgPSA8MTQ+Owor
ICAgICAgICAgICAgICAgICNzb3VuZC1kYWktY2VsbHMgPSA8MD47CisgICAgICAgICAgICAgICAg
c3RhdHVzID0gIm9rYXkiOworICAgICAgICAgICAgICAgIElPVkRELXN1cHBseSA9IDwmc3VwcGx5
PjsKKyAgICAgICAgICAgICAgICBEVkRELXN1cHBseSA9IDwmc3VwcGx5PjsKKyAgICAgICAgICAg
ICAgICBhZGkscGRtLWNsay1tYXAgPSA8MSAxIDAgMD47CisgICAgICAgICAgICAgICAgYWRpLGRl
Y2ltYXRpb24tcmF0aW8gPSA8MTY+OworICAgICAgICB9OworICAgIH07CisKKyAgICAvKiBleGFt
cGxlIHdpdGggaHcgc3RhbmRhbG9uZSBtb2RlICovCisgICAgYWRhdTcxMThfY29kZWNfaHc6IGFk
YXU3MTE4LWNvZGVjLWh3IHsKKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYWRpLGFkYXU3MTE4
IjsKKyAgICAgICAgICAgICNzb3VuZC1kYWktY2VsbHMgPSA8MD47CisgICAgICAgICAgICBzdGF0
dXMgPSAib2theSI7CisgICAgICAgICAgICBJT1ZERC1zdXBwbHkgPSA8JnN1cHBseT47CisgICAg
ICAgICAgICBEVkRELXN1cHBseSA9IDwmc3VwcGx5PjsKKyAgICB9OwotLSAKMi4yMy4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
