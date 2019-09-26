Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 450C6BEC73
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 09:19:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD38C1737;
	Thu, 26 Sep 2019 09:18:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD38C1737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569482383;
	bh=0r8bmaqFi6V8vFtYzuaBXn/5Ufsk3St1RGI0Btrr6mk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P938xkwTEgKj4fUpuhl2ZJPmmcsoCGyMV8zhiCatYz+/cX9tpRaXikX/g6h8NL6BN
	 SVNNkwd2TJLFs6a/fZZezNRrwXuqx6QKqkfmx9A8jryC6n6sTSFOlsU5Rwok+BwJBE
	 iUbj4qm+BlV0wEvV9R95j1m2pB8SlO35ewhl6HRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8520FF805FD;
	Thu, 26 Sep 2019 09:17:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AEACF80534; Thu, 26 Sep 2019 09:17:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BC67F80213
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 09:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BC67F80213
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="LaMwEHki"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8Q7DSsq018177; Thu, 26 Sep 2019 03:17:03 -0400
Received: from nam03-co1-obe.outbound.protection.outlook.com
 (mail-co1nam03lp2058.outbound.protection.outlook.com [104.47.40.58])
 by mx0a-00128a01.pphosted.com with ESMTP id 2v6hj969un-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 26 Sep 2019 03:17:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jlum2Mpq3xaXUlqEdDe6aNv0jwBm6CH1OTH1hodoPp1765b4C97S+jAGgybmjT9xx7IQqvP+Tg19uzQ22d02lpOF2ejAska4lfEEH6cbyTf52uK9GJjGvedQsXHX4Rvsu/ZZxpjV50FR+OXrBm/KpnguWMgWrAvyn34mSe2qJFeRX5OX4ph1c+qwT9nvdpMI4EPy5d8ugjh61pkP8KlJIKgs6nn7NTAq01VjmLQFJn3B+lVzahmj74mhdZTglPo+2jbkMydfEnbEiYuXGoA+N90qflJ8+pMWj1glyZYdZ3ZMtsp+huTkW+zxw6ipwn9zcRwn8OI5uyhWf4uJs0i7xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wcg7UWO0/Plxleu8dzxFj4LVb81L0J7le8pWpWVMe2w=;
 b=UpImwPB9C15LuO3JY2EXzRJ0MjkdUsbl0pqfHGhZBqU2XVg62dY5edsppJxD0c4q9KdbWsobjVLxM07rXPAaVO7VbxpfUrl5uo1xtMt32NZY6dIB0RQV4rYjKJFlONCF3a7aMIX8vYkwKrsKqdl01gch0M+H7QiTDpaqTUOoKnD+rxrRlkiLjWZ4HNNyTMIbjAYoYh4YNMoOI5LrRC+PilCNnFqNNmttNmmahwara4q44i+aspiBVDU7KfFZSrWuvyCdbtB7WWjElQq3qp+hOb67r+TsJ0C2AeyR6aOS1w7xS5SbRbSzQYDL2YuiOv59ns0cdPvqpTeCtaqFVP+ixA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.55) smtp.rcpttodomain=gmail.com smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wcg7UWO0/Plxleu8dzxFj4LVb81L0J7le8pWpWVMe2w=;
 b=LaMwEHkiGn+uQwpD6tIWusJWqL+21BNP8DyvDgCjTLyFyHRlCFOhXeAmtTdFee+XYQpw4zu15PJA3l7fA74/AyuvfzhNV7Qs6DnbbyrndtNujHO0qCK3Oz8ssNKWj5wAh7XS3MZQR+7C8c2nUiPaYAh7N9qOc91RhCOBztlwaeE=
Received: from BL0PR03CA0034.namprd03.prod.outlook.com (2603:10b6:208:2d::47)
 by BYAPR03MB3989.namprd03.prod.outlook.com (2603:10b6:a03:7c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.25; Thu, 26 Sep
 2019 07:17:01 +0000
Received: from SN1NAM02FT011.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::202) by BL0PR03CA0034.outlook.office365.com
 (2603:10b6:208:2d::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.21 via Frontend
 Transport; Thu, 26 Sep 2019 07:17:00 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 SN1NAM02FT011.mail.protection.outlook.com (10.152.72.82) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2284.20
 via Frontend Transport; Thu, 26 Sep 2019 07:17:00 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x8Q7Gsga010188
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 26 Sep 2019 00:16:54 -0700
Received: from nsa.ad.analog.com (10.44.3.90) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 26 Sep
 2019 03:16:59 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>
Date: Thu, 26 Sep 2019 09:17:07 +0200
Message-ID: <20190926071707.17557-2-nuno.sa@analog.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190926071707.17557-1-nuno.sa@analog.com>
References: <20190926071707.17557-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-Originating-IP: [10.44.3.90]
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(396003)(136003)(346002)(189003)(199004)(476003)(11346002)(8676002)(7696005)(2616005)(76176011)(5660300002)(246002)(5820100001)(4326008)(70586007)(23676004)(26005)(86362001)(3846002)(6116002)(966005)(47776003)(1076003)(6666004)(356004)(70206006)(50226002)(36756003)(16526019)(6306002)(478600001)(186003)(45776006)(305945005)(7736002)(7636002)(2906002)(316002)(486006)(106002)(2870700001)(54906003)(110136005)(336012)(8936002)(126002)(50466002)(446003)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR03MB3989; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdca5296-7b07-4724-49a0-08d74251862f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(4709080)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR03MB3989; 
X-MS-TrafficTypeDiagnostic: BYAPR03MB3989:
X-MS-Exchange-PUrlCount: 3
X-Microsoft-Antispam-PRVS: <BYAPR03MB3989C6BB9B7CF4EF409F174999860@BYAPR03MB3989.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0172F0EF77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: jbLlIjfxITK6Tkhxl6oPNouwES0KgYdDd9zQnyUAUbi28KEtmLyF5iSZWV5nII7QAjaAMWPXggTZCyb7CXXs6DYsuKkRI1qV+6CdtKVFBcNjr6uwxD7Q+TLa1/hgMrLaTlcHbbcoymBxFRiLGAP651sGd5gmuOu9omP2GSACsOoTmJMx1ocByIux8VV/FtVMmgY2J2Z+XP1W5Or8SiyZCTEImDRNROfbP5hnJDaxOSmeVUKp3olY7DV+CJcWuj5dq17MIuVucJ+apBEdWdGbjrMDZkWXCUIEjFO9G72PCCxmKn3pk8cVbSucpagxEsNSJgnAojvRt3yVeRh/65iA7NjSvvYfaeGMeU5sffjWz4ybB4CeNYWFJzs6ABV4aACS6/gOhhTL4vtiI3mm/QNGcrH5Wxrcx8+tw8rT0CxioAE77K54wAdRJeoO1H5qosviMV6JlOrFzBKIqpwFuLIx2Q==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2019 07:17:00.5953 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdca5296-7b07-4724-49a0-08d74251862f
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3989
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-26_02:2019-09-25,2019-09-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1909260072
Cc: Mark Rutland <mark.rutland@arm.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [alsa-devel] [PATCH 2/2] dt-bindings: asoc: Add ADAU7118
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
YWxvZy5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL3NvdW5kL2FkaSxhZGF1NzExOC55YW1sICAgICAg
ICAgIHwgODggKysrKysrKysrKysrKysrKysrKwogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA4OSBpbnNlcnRpb25z
KCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NvdW5kL2FkaSxhZGF1NzExOC55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NvdW5kL2FkaSxhZGF1NzExOC55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2FkaSxhZGF1NzExOC55YW1sCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZTU3NzZmYjYwYzdmCi0tLSAvZGV2L251bGwKKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2FkaSxhZGF1NzExOC55
YW1sCkBAIC0wLDAgKzEsODggQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAK
KyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NvdW5k
L2FkaSxhZGF1NzExOC55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwjCisKKwordGl0bGU6IEFuYWxvZyBEZXZpY2VzIEFEQVU3MTE4IDgg
Q2hhbm5lbCBQRE0gdG8gSTJTL1RETSBDb252ZXJ0ZXIKKworbWFpbnRhaW5lcnM6CisgIC0gTnVu
byBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KKworZGVzY3JpcHRpb246IHwKKyAgQW5hbG9nIERl
dmljZXMgQURBVTcxMTggOCBDaGFubmVsIFBETSB0byBJMlMvVERNIENvbnZlcnRlciBvdmVyIEky
QyBvciBIVworICBzdGFuZGFsb25lIG1vZGUuCisgIGh0dHBzOi8vd3d3LmFuYWxvZy5jb20vbWVk
aWEvZW4vdGVjaG5pY2FsLWRvY3VtZW50YXRpb24vZGF0YS1zaGVldHMvQURBVTcxMTgucGRmCisK
K3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgZW51bToKKyAgICAgIC0gYWRpLGFkYXU3
MTE4CisKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAxCisKKyAgIiNzb3VuZC1kYWktY2VsbHMiOgor
ICAgIGNvbnN0OiAwCisKKyAgSU9WREQtc3VwcGx5OgorICAgIGRlc2NyaXB0aW9uOiBEaWdpdGFs
IElucHV0L091dHB1dCBQb3dlciBTdXBwbHkuCisgICAgJHJlZjogIi9zY2hlbWFzL3R5cGVzLnlh
bWwjL2RlZmluaXRpb25zL3BoYW5kbGUiCisKKyAgRFZERC1zdXBwbHk6CisgICAgZGVzY3JpcHRp
b246IEludGVybmFsIENvcmUgRGlnaXRhbCBQb3dlciBTdXBwbHkuCisgICAgJHJlZjogIi9zY2hl
bWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUiCisKKyAgYWRpLGRlY2ltYXRpb24t
cmF0aW86CisgICAgZGVzY3JpcHRpb246IHwKKyAgICAgIFRoaXMgcHJvcGVydHkgc2V0J3MgdGhl
IGRlY2ltYXRpb24gcmF0aW8gb2YgUERNIHRvIFBDTSBhdWRpbyBkYXRhLgorICAgIGFsbE9mOgor
ICAgICAgLSAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKyAg
ICAgIC0gZW51bTogWzY0LCAzMiwgMTZdCisgICAgICAgIGRlZmF1bHQ6IDY0CisKKyAgYWRpLHBk
bS1jbGstbWFwOgorICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICBUaGUgQURBVTcxMTggaGFzIHR3
byBQRE0gY2xvY2tzIGZvciB0aGUgZm91ciBJbnB1dHMuIEVhY2ggaW5wdXQgbXVzdCBiZQorICAg
ICAgYXNzaWduZWQgdG8gb25lIG9mIHRoZXNlIHR3byBjbG9ja3MuIFRoaXMgcHJvcGVydHkgc2V0
J3MgdGhlIG1hcHBpbmcKKyAgICAgIGJldHdlZW4gdGhlIGNsb2NrcyBhbmQgdGhlIGlucHV0cy4K
KyAgICBhbGxPZjoKKyAgICAgIC0gJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlv
bnMvdWludDMyLWFycmF5CisgICAgICAtIG1pbkl0ZW1zOiA0CisgICAgICAgIG1heEl0ZW1zOiA0
CisgICAgICAgIGl0ZW1zOgorICAgICAgICAgIG1heGltdW06IDEKKyAgICAgICAgZGVmYXVsdDog
WzAsIDAsIDEsIDFdCisKK3JlcXVpcmVkOgorICAtICIjc291bmQtZGFpLWNlbGxzIgorICAtIGNv
bXBhdGlibGUKKworZGVwZW5kZW5jaWVzOgorICBJT1ZERC1zdXBwbHk6IFsgRFZERC1zdXBwbHkg
XQorICBEVkRELXN1cHBseTogWyBJT1ZERC1zdXBwbHkgXQorCitleGFtcGxlczoKKyAgLSB8Cisg
ICAgaTJjMCB7CisgICAgICAgIC8qIGV4YW1wbGUgd2l0aCBpMmMgc3VwcG9ydCAqLworICAgICAg
ICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47CisgICAg
ICAgIHN0YXR1cyA9ICJva2F5IjsKKyAgICAgICAgYWRhdTcxMThfY29kZWM6IGFkYXU3MTE4LWNv
ZGVjQDE0IHsKKyAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFkaSxhZGF1NzExOCI7Cisg
ICAgICAgICAgICAgICAgcmVnID0gPDE0PjsKKyAgICAgICAgICAgICAgICAjc291bmQtZGFpLWNl
bGxzID0gPDA+OworICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsKKyAgICAgICAgICAg
ICAgICBhZGkscGRtLWNsay1tYXAgPSA8MSAxIDAgMD47CisgICAgICAgICAgICAgICAgYWRpLGRl
Y2ltYXRpb24tcmF0aW8gPSA8MTY+OworICAgICAgICB9OworICAgIH07CisKKyAgICAvKiBleGFt
cGxlIHdpdGggaHcgc3RhbmRhbG9uZSBtb2RlICovCisgICAgYWRhdTcxMThfY29kZWNfaHc6IGFk
YXU3MTE4LWNvZGVjLWh3IHsKKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYWRpLGFkYXU3MTE4
IjsKKyAgICAgICAgICAgICNzb3VuZC1kYWktY2VsbHMgPSA8MD47CisgICAgICAgICAgICBzdGF0
dXMgPSAib2theSI7CisgICAgfTsKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5F
UlMKaW5kZXggNzdjOTIwNTU5ZDgyLi44ODE1ODAxMGZiZDcgMTAwNjQ0Ci0tLSBhL01BSU5UQUlO
RVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC05OTYsNiArOTk2LDcgQEAgRjoJc291bmQvc29jL2Nv
ZGVjcy9hZDEqCiBGOglzb3VuZC9zb2MvY29kZWNzL2FkNyoKIEY6CXNvdW5kL3NvYy9jb2RlY3Mv
c3NtKgogRjoJc291bmQvc29jL2NvZGVjcy9zaWdtYWRzcC4qCitGOglEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc291bmQvYWRpLGFkYXUqCiAKIEFOQUxPRyBERVZJQ0VTIElOQyBE
TUEgRFJJVkVSUwogTToJTGFycy1QZXRlciBDbGF1c2VuIDxsYXJzQG1ldGFmb28uZGU+Ci0tIAoy
LjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFs
c2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczov
L21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
