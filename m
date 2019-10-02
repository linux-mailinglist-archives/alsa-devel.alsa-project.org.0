Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B63C4BA3
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 12:39:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CCCA1683;
	Wed,  2 Oct 2019 12:39:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CCCA1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570012798;
	bh=Cd6IpDOrjB75YiEfmv3d2izKyMmeX1rXRRDPyH+52rg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ChX4+fAj4bxK8WLSZ1B5+wXY5PPiXldJhI/nqoQVYSmoUUUpSMysWT81FhPghjlsZ
	 MV0Zgkpivfqfom1O+Qcp9SDaqJTWuaeUaSe5TECxfQsGcigcNWT1+or86CmcCRsVGc
	 +7ln5Sd/3L5O3xkx3A5nNYhv0jMJskTY68y0fbYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECB39F805FC;
	Wed,  2 Oct 2019 12:37:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 020A1F805AE; Wed,  2 Oct 2019 12:37:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73835F804CB
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 12:37:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73835F804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="5qqSdbU5"
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x92AWi2V026102; Wed, 2 Oct 2019 06:37:24 -0400
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2050.outbound.protection.outlook.com [104.47.37.50])
 by mx0b-00128a01.pphosted.com with ESMTP id 2va19cw2t1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Oct 2019 06:37:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNaeBDUPTVfm4hXPaI58QLqXPmkTOvyg72a5S5MaDGW+LEvQq4nBTUhv8qAmP2yaw2bNATkgoZ3/5Oh5DvH7ESYIeQGAMxKN4/OdsJLy/OZO6QJgyWdeQ83d8Uqra6yXUgSEi46X8WqMlCApaxhLjskESNzAhKcS5DD+jP9o7MQ+tT7noTAceSVDLL0r+ahKuWB+LgZMc4s1RugvyrDa0CoCbFdf6Pk5tm7LxVKKsPHeG3/jVrNmbW4TOPWO6uMtPyUQNNnMgn5ORKzqoEv55beAx/LJDbJ1BSQGfIk8ylh21oyC6+t2n14xw8VO2TJNYbQXKUxC8/nXmaAwcUD27g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjNxrtLezlSqNHncroevDpQ33gTifF45tOkRght2UDE=;
 b=GnV1mSQp9KsOm8y6+Ibje/D1b6aG7s1pBZqGozd+PEsxEjPdkr6tKfloFCsx+9/w1f13EJlFtMaGJ1b9KrDHtHLQ+Tgk8L874uc9E4zNLLVDT6NB+IoqyNlE1O0SI9ydmuQUpl1kjGk7u7A1LmHIUzyTSgcJdbNOrst2RqFsdapETNzfu88MBeopq5ST0HYjW+ZSH1YfLTrKLJ56QeNUOOLiJMljtOBt821aEXsrSORpHnrA57hwKyNYQAJkBzI1yqMoUsrJhWcF67TbO6MqZoaAr51VSmaUcARr/KaDfHGuFzkFAbLjC3pCqawtASDgnymMhVE5WvBS9ztWWcfmuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=kernel.org smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjNxrtLezlSqNHncroevDpQ33gTifF45tOkRght2UDE=;
 b=5qqSdbU5ip8wTaoyFBeYuO590y/30hRKbyiJQhFANRGto0Yij7wR3SBDLxPOmv8Xudv6kADyGpcrnPmGxR/Po91kCuMPEebTnvdCPeCGc9fD52h4aK/F395yqOS2AeRDntQQV/yxTR3tEg74m7S/kvmlL7HJ87NtYCDmAQX45RM=
Received: from DM6PR03CA0022.namprd03.prod.outlook.com (2603:10b6:5:40::35) by
 BN3PR03MB2307.namprd03.prod.outlook.com (2a01:111:e400:7bb1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.18; Wed, 2 Oct
 2019 10:37:21 +0000
Received: from CY1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::205) by DM6PR03CA0022.outlook.office365.com
 (2603:10b6:5:40::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.14 via Frontend
 Transport; Wed, 2 Oct 2019 10:37:21 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 CY1NAM02FT053.mail.protection.outlook.com (10.152.74.165) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2305.20
 via Frontend Transport; Wed, 2 Oct 2019 10:37:20 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x92AbHVZ019580
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 2 Oct 2019 03:37:17 -0700
Received: from nsa.sphairon.box (10.44.3.90) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 2 Oct
 2019 06:37:16 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>
Date: Wed, 2 Oct 2019 12:37:29 +0200
Message-ID: <20191002103729.94676-2-nuno.sa@analog.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191002103729.94676-1-nuno.sa@analog.com>
References: <20191002103729.94676-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-Originating-IP: [10.44.3.90]
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(136003)(396003)(189003)(199004)(478600001)(8676002)(50466002)(3846002)(6306002)(356004)(5660300002)(8936002)(1076003)(50226002)(246002)(47776003)(11346002)(36756003)(86362001)(76176011)(53416004)(2616005)(5820100001)(186003)(2906002)(16526019)(7736002)(316002)(7636002)(305945005)(26005)(70586007)(4326008)(110136005)(336012)(70206006)(126002)(476003)(54906003)(45776006)(2870700001)(966005)(6116002)(486006)(6666004)(426003)(106002)(446003)(23676004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR03MB2307; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9986d86d-33b3-4e47-a059-08d7472480c9
X-MS-TrafficTypeDiagnostic: BN3PR03MB2307:
X-MS-Exchange-PUrlCount: 3
X-Microsoft-Antispam-PRVS: <BN3PR03MB2307977D250F7AA8DF4C44CE999C0@BN3PR03MB2307.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vpwu8DszQ0bXQ6dH7fVxn/ku4GXZJk1uWElYErYHZ9sN3fj9kmEqXzO5+jFG+ODO3ql1vcEDplQMAOXkbxp9WQlexEUQ1AKIo1B7zvwqxQv+lZDz5DBrbQArn2fV20CvRqeE0U5oui16GODj1bfeAkPLDofBDHSHGj9I7y9lteyd6XFQQBXw8mcuWlGFpuqjWmBUt5GICIGC3dcux6H3/MsC57jJhpHICmb7jmz1Y5xc5BQmo2/1p56P2nDFEhUCP0LtfQQS2cW0onyBfwqVlxMgTDPbyaLM+8vtCblpuzqFs8rCQDb6bIboGuyRBdRe5KWFpPL0KlUvx3xmNNpqfNfeLemXNohgn6Bz9jppoafTjo+hAZja+3pCe0HietBeWOjxXyZA0odgSs5TZxBGS+tfy9msUHjhd21cSZ3S6ea3VJYy1ZtOLOSJJu9Vi7H5a/fTQGDP46rmTXvsT6vvMA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 10:37:20.0035 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9986d86d-33b3-4e47-a059-08d7472480c9
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2307
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-02_06:2019-10-01,2019-10-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910020099
Cc: Mark Rutland <mark.rutland@arm.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH v2 2/2] dt-bindings: asoc: Add ADAU7118
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
ZWQuCgogLi4uL2JpbmRpbmdzL3NvdW5kL2FkaSxhZGF1NzExOC55YW1sICAgICAgICAgIHwgOTAg
KysrKysrKysrKysrKysrKysrKwogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA5MSBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2Fk
aSxhZGF1NzExOC55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NvdW5kL2FkaSxhZGF1NzExOC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NvdW5kL2FkaSxhZGF1NzExOC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAwMC4uNTcxMzEzMzAwNWI1Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2FkaSxhZGF1NzExOC55YW1sCkBAIC0w
LDAgKzEsOTAgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKKyVZQU1MIDEu
MgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NvdW5kL2FkaSxhZGF1
NzExOC55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9j
b3JlLnlhbWwjCisKKwordGl0bGU6IEFuYWxvZyBEZXZpY2VzIEFEQVU3MTE4IDggQ2hhbm5lbCBQ
RE0gdG8gSTJTL1RETSBDb252ZXJ0ZXIKKworbWFpbnRhaW5lcnM6CisgIC0gTnVubyBTw6EgPG51
bm8uc2FAYW5hbG9nLmNvbT4KKworZGVzY3JpcHRpb246IHwKKyAgQW5hbG9nIERldmljZXMgQURB
VTcxMTggOCBDaGFubmVsIFBETSB0byBJMlMvVERNIENvbnZlcnRlciBvdmVyIEkyQyBvciBIVwor
ICBzdGFuZGFsb25lIG1vZGUuCisgIGh0dHBzOi8vd3d3LmFuYWxvZy5jb20vbWVkaWEvZW4vdGVj
aG5pY2FsLWRvY3VtZW50YXRpb24vZGF0YS1zaGVldHMvQURBVTcxMTgucGRmCisKK3Byb3BlcnRp
ZXM6CisgIGNvbXBhdGlibGU6CisgICAgZW51bToKKyAgICAgIC0gYWRpLGFkYXU3MTE4CisKKyAg
cmVnOgorICAgIG1heEl0ZW1zOiAxCisKKyAgIiNzb3VuZC1kYWktY2VsbHMiOgorICAgIGNvbnN0
OiAwCisKKyAgSU9WREQtc3VwcGx5OgorICAgIGRlc2NyaXB0aW9uOiBEaWdpdGFsIElucHV0L091
dHB1dCBQb3dlciBTdXBwbHkuCisgICAgJHJlZjogIi9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmlu
aXRpb25zL3BoYW5kbGUiCisKKyAgRFZERC1zdXBwbHk6CisgICAgZGVzY3JpcHRpb246IEludGVy
bmFsIENvcmUgRGlnaXRhbCBQb3dlciBTdXBwbHkuCisgICAgJHJlZjogIi9zY2hlbWFzL3R5cGVz
LnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUiCisKKyAgYWRpLGRlY2ltYXRpb24tcmF0aW86Cisg
ICAgZGVzY3JpcHRpb246IHwKKyAgICAgIFRoaXMgcHJvcGVydHkgc2V0J3MgdGhlIGRlY2ltYXRp
b24gcmF0aW8gb2YgUERNIHRvIFBDTSBhdWRpbyBkYXRhLgorICAgIGFsbE9mOgorICAgICAgLSAk
cmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKyAgICAgIC0gZW51
bTogWzY0LCAzMiwgMTZdCisgICAgICAgIGRlZmF1bHQ6IDY0CisKKyAgYWRpLHBkbS1jbGstbWFw
OgorICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICBUaGUgQURBVTcxMTggaGFzIHR3byBQRE0gY2xv
Y2tzIGZvciB0aGUgZm91ciBJbnB1dHMuIEVhY2ggaW5wdXQgbXVzdCBiZQorICAgICAgYXNzaWdu
ZWQgdG8gb25lIG9mIHRoZXNlIHR3byBjbG9ja3MuIFRoaXMgcHJvcGVydHkgc2V0J3MgdGhlIG1h
cHBpbmcKKyAgICAgIGJldHdlZW4gdGhlIGNsb2NrcyBhbmQgdGhlIGlucHV0cy4KKyAgICBhbGxP
ZjoKKyAgICAgIC0gJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMy
LWFycmF5CisgICAgICAtIG1pbkl0ZW1zOiA0CisgICAgICAgIG1heEl0ZW1zOiA0CisgICAgICAg
IGl0ZW1zOgorICAgICAgICAgIG1heGltdW06IDEKKyAgICAgICAgZGVmYXVsdDogWzAsIDAsIDEs
IDFdCisKK3JlcXVpcmVkOgorICAtICIjc291bmQtZGFpLWNlbGxzIgorICAtIGNvbXBhdGlibGUK
KyAgLSBJT1ZERC1zdXBwbHkKKyAgLSBEVkRELXN1cHBseQorCitleGFtcGxlczoKKyAgLSB8Cisg
ICAgaTJjMCB7CisgICAgICAgIC8qIGV4YW1wbGUgd2l0aCBpMmMgc3VwcG9ydCAqLworICAgICAg
ICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47CisgICAg
ICAgIHN0YXR1cyA9ICJva2F5IjsKKyAgICAgICAgYWRhdTcxMThfY29kZWM6IGFkYXU3MTE4LWNv
ZGVjQDE0IHsKKyAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFkaSxhZGF1NzExOCI7Cisg
ICAgICAgICAgICAgICAgcmVnID0gPDE0PjsKKyAgICAgICAgICAgICAgICAjc291bmQtZGFpLWNl
bGxzID0gPDA+OworICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsKKyAgICAgICAgICAg
ICAgICBJT1ZERC1zdXBwbHkgPSA8JnN1cHBseT47CisgICAgICAgICAgICAgICAgRFZERC1zdXBw
bHkgPSA8JnN1cHBseT47CisgICAgICAgICAgICAgICAgYWRpLHBkbS1jbGstbWFwID0gPDEgMSAw
IDA+OworICAgICAgICAgICAgICAgIGFkaSxkZWNpbWF0aW9uLXJhdGlvID0gPDE2PjsKKyAgICAg
ICAgfTsKKyAgICB9OworCisgICAgLyogZXhhbXBsZSB3aXRoIGh3IHN0YW5kYWxvbmUgbW9kZSAq
LworICAgIGFkYXU3MTE4X2NvZGVjX2h3OiBhZGF1NzExOC1jb2RlYy1odyB7CisgICAgICAgICAg
ICBjb21wYXRpYmxlID0gImFkaSxhZGF1NzExOCI7CisgICAgICAgICAgICAjc291bmQtZGFpLWNl
bGxzID0gPDA+OworICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOworICAgICAgICAgICAgSU9W
REQtc3VwcGx5ID0gPCZzdXBwbHk+OworICAgICAgICAgICAgRFZERC1zdXBwbHkgPSA8JnN1cHBs
eT47CisgICAgfTsKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXgg
OGJhNDdjYWM4ZTgzLi41OGY3YmM2ZTg4OTcgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBi
L01BSU5UQUlORVJTCkBAIC0xMDEzLDYgKzEwMTMsNyBAQCBGOglzb3VuZC9zb2MvY29kZWNzL2Fk
MSoKIEY6CXNvdW5kL3NvYy9jb2RlY3MvYWQ3KgogRjoJc291bmQvc29jL2NvZGVjcy9zc20qCiBG
Oglzb3VuZC9zb2MvY29kZWNzL3NpZ21hZHNwLioKK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb3VuZC9hZGksYWRhdSoKIAogQU5BTE9HIERFVklDRVMgSU5DIERNQSBEUklW
RVJTCiBNOglMYXJzLVBldGVyIENsYXVzZW4gPGxhcnNAbWV0YWZvby5kZT4KLS0gCjIuMjMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZl
bCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1h
bi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
