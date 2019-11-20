Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26885103522
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 08:24:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8D921692;
	Wed, 20 Nov 2019 08:24:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8D921692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574234697;
	bh=wmbQoTTN8ijoL99BBXKd3U/X+gZLnQckgyLsJJJz9f8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G15lkddVkTibUFH9Gt8APT7ujnhH4Y2PVh1NNASU2OpNFYHBwRxnoDZNh9JRAxt4+
	 5xJM5p1FJ2ombrXPVQnj6b1ua9l9TelhSjgenLKNHf//teb+zfXJm/x5RvX85HODpm
	 I0LzwH+ZMz/qQ/ORuH8niqCC1088tB8YbBCTh5a8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 183F7F800C1;
	Wed, 20 Nov 2019 08:23:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26067F8013D; Wed, 20 Nov 2019 08:23:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800055.outbound.protection.outlook.com [40.107.80.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4E24F800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 08:23:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4E24F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="FgApXMvg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bS0Mc23GTWXKs6JfWSZGgx6dTSe0+yz1I43mb8eIwB9LPzVUg/oA12R04yE7NeEzZDcc3xEZE+ZbyCkdttgnwhQy96VS3c0dmw2hSKtqKJShA5y4V4CxM50HEQB2VAZRGGhPzue9hCbA4uS1Kip7uaqRs6/nkFp3kkqrNwjF1oVfx3SiJ7a63rvS+A2vM/Sg0DxE8y6u0EC9J7ua+/GD3gqK68td9/C9RH8vH8AMpWoNFjlEHIPU6DkjR4bit27BauqlHE279uCls0ldWD7M+CzqAjD45NL/e1oyQRlPWhX3nWm4TXboSfpaXvnRHxveOs/cpsWPEcdxjJAHNlG0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrA6lfHkkSG5JFFMl2zXibCPTy88ZMGIk8qRyfwNvAU=;
 b=b2e9K/fpnyJ0gzeVOYzNEenQ9AX+JT3xKXblRXgOxTDE/NXMJM5DCoU0PFm1cXvJ6WJleekGvTaGzFLBUaWhC0V721LtnwUvubaFkbIpOYJkiu/lnwkDOUkcY22BxhSDOJbXEIYfTy72BAaiYuK4/vi0C6UsemMBG2CAOs/6Sb4YTiTX9GGvnwHzXgCz0cRzoFG3WPNlYsEhNr5NaS5f4Jitfij3eO48mr7Y9D3oQoBIfPsBBQwdF8RWhx2rKtQf4ZNt08vK+49s8PSPzUxXY2hZzX/7wSyOCgByolZe242FdqvEPAfztdlnz92eBDICz9FO3mW9trM7R7XQFpcmnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrA6lfHkkSG5JFFMl2zXibCPTy88ZMGIk8qRyfwNvAU=;
 b=FgApXMvgHTQtxJIExy3/C92El/6Hqgfe+xeO34qG/ETN56piEszLzTlos0XJoblTwFRjTKYOIbbqXLQBzRQUf+qUtfcCIHdOuRyD9ALTwt1WccMKoANbXXzBSWv8vTTkbCxzN6jM7wKehTYvMUZ58kR7XlLgAGKJmqfRph93J1Y=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB3417.namprd12.prod.outlook.com (20.178.30.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.29; Wed, 20 Nov 2019 07:23:03 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::ac0a:4c84:7bb:2843]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::ac0a:4c84:7bb:2843%5]) with mapi id 15.20.2474.015; Wed, 20 Nov 2019
 07:23:02 +0000
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
References: <1574155967-1315-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1574155967-1315-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <0c3d3545-b0ee-4bb3-558a-045633a30e46@linux.intel.com>
From: vishnu <vravulap@amd.com>
Message-ID: <991a1c7a-6f34-caab-132d-5687b1f1bfa0@amd.com>
Date: Wed, 20 Nov 2019 12:51:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <0c3d3545-b0ee-4bb3-558a-045633a30e46@linux.intel.com>
Content-Language: en-US
X-ClientProxiedBy: MAXPR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::18) To DM6PR12MB3868.namprd12.prod.outlook.com
 (2603:10b6:5:1c8::21)
MIME-Version: 1.0
X-Originating-IP: [165.204.159.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 167deef1-f8f2-49f7-dec7-08d76d8a7a78
X-MS-TrafficTypeDiagnostic: DM6PR12MB3417:|DM6PR12MB3417:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3417D4084FBE63753EED2AE6E74F0@DM6PR12MB3417.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:605;
X-Forefront-PRVS: 02272225C5
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(199004)(189003)(3846002)(6436002)(186003)(2870700001)(6116002)(4326008)(478600001)(6486002)(2906002)(6512007)(76176011)(52116002)(14454004)(99286004)(2486003)(446003)(486006)(2616005)(476003)(305945005)(81166006)(81156014)(11346002)(23676004)(58126008)(26005)(229853002)(316002)(54906003)(6636002)(53546011)(6506007)(386003)(25786009)(6246003)(8676002)(110136005)(66066001)(50466002)(31696002)(65956001)(14444005)(65806001)(8936002)(5660300002)(36756003)(47776003)(31686004)(6666004)(66476007)(66556008)(66946007)(7736002)(43062003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3417;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y45gXViBWtYARt6vaM1Ngnw761F5CFW+eSea1mnHWSIHB+FUbJqx61RzaTfGigzMUQY3JkqdF5s7+IOte/ggc0x8mJe1pv/vkd5Z8iqukY5Are9eMi6TFAAD68M2cSjlF74Vnwadi9S6u8tQbs0u0d8Ab3kv+Ihdvd/7UktFV5MCSCARFd6mP0pY5w+Hf4z0z9tfActcW9dXy3lXo5jI9YPdxRDlhqtSe9eqGbY0ym9u+e+tznIsjkw5faKuz7bViDPZ7+kmz/tWyykPbDfob1uvwtEnbzAwBavAnntXAW6CXH//7Rxo1mvTkSdGWcMtGINrXacE4aIsUq9J3kubpnVn9+iBcebVDpQ0NU6XmjDGxkbaPrgiiGpLhwxG2DcBbPrQdznRrXb95A1ZvCoIzaKoWRAywG//cTUIYW1OQrec2gMzaioOOR1syI2U1Fcs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 167deef1-f8f2-49f7-dec7-08d76d8a7a78
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2019 07:23:02.4930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fl18ZA590kROyAY1eTu89WoHWtRf9UndQVUkxITU4DsuxnuwNO86yD6WsZB3wnNRRGVaTmSS5yUKsQ1ttbbbGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3417
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Liam Girdwood <lgirdwood@gmail.com>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, open list <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Akshu.Agrawal@amd.com
Subject: Re: [alsa-devel] [PATCH v8 2/6] ASoC: amd: Refactoring of DAI from
 DMA driver
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CgpPbiAxOS8xMS8xOSA3OjIzIFBNLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiAKPiAK
Pj4gK3N0YXRpYyBpbnQgYWNwM3hfZGFpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IHJlc291cmNlICpyZXM7Cj4+ICvCoMKgwqAgc3Ry
dWN0IGkyc19kZXZfZGF0YSAqYWRhdGE7Cj4+ICvCoMKgwqAgaW50IHN0YXR1czsKPj4gKwo+PiAr
wqDCoMKgIGFkYXRhID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZihzdHJ1Y3QgaTJz
X2Rldl9kYXRhKSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0ZQX0tFUk5FTCk7Cj4+ICvC
oMKgwqAgaWYgKCFhZGF0YSkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+PiAr
Cj4+ICvCoMKgwqAgcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0Vf
TUVNLCAwKTsKPj4gK8KgwqDCoCBpZiAoIXJlcykgewo+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2Vy
cigmcGRldi0+ZGV2LCAiSU9SRVNPVVJDRV9NRU0gRkFJTEVEXG4iKTsKPj4gK8KgwqDCoMKgwqDC
oMKgIHJldHVybiAtRU5PTUVNOwo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIGFkYXRhLT5h
Y3AzeF9iYXNlID0gZGV2bV9pb3JlbWFwKCZwZGV2LT5kZXYsIHJlcy0+c3RhcnQsCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJlc291cmNlX3NpemUocmVzKSk7Cj4+ICvCoMKgwqAgaWYgKElT
X0VSUihhZGF0YS0+YWNwM3hfYmFzZSkpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VS
UihhZGF0YS0+YWNwM3hfYmFzZSk7Cj4+ICsKPj4gK8KgwqDCoCBhZGF0YS0+aTJzX2lycSA9IHJl
cy0+c3RhcnQ7Cj4+ICvCoMKgwqAgZGV2X3NldF9kcnZkYXRhKCZwZGV2LT5kZXYsIGFkYXRhKTsK
Pj4gK8KgwqDCoCBzdGF0dXMgPSBkZXZtX3NuZF9zb2NfcmVnaXN0ZXJfY29tcG9uZW50KCZwZGV2
LT5kZXYsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZhY3AzeF9kYWlfY29tcG9uZW50LCAm
YWNwM3hfaTJzX2RhaSwgMSk7Cj4+ICvCoMKgwqAgaWYgKHN0YXR1cykgewo+PiArwqDCoMKgwqDC
oMKgwqAgZGV2X2VycigmcGRldi0+ZGV2LCAiRmFpbCB0byByZWdpc3RlciBhY3AgaTJzIGRhaVxu
Iik7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT0RFVjsKPj4gK8KgwqDCoCB9Cj4+ICvC
oMKgwqAgcG1fcnVudGltZV9zZXRfYXV0b3N1c3BlbmRfZGVsYXkoJnBkZXYtPmRldiwgNTAwMCk7
Cj4+ICvCoMKgwqAgcG1fcnVudGltZV91c2VfYXV0b3N1c3BlbmQoJnBkZXYtPmRldik7Cj4+ICvC
oMKgwqAgcG1fcnVudGltZV9lbmFibGUoJnBkZXYtPmRldik7Cj4gCj4gcXVlc3Rpb246IGhlcmUg
eW91IHdhbnQgdG8gdXNlIHBtX3J1bnRpbWUgZm9yIHRoaXMgcGxhdGZvcm0gZGV2aWNlLi4uCj4g
Cj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQgYWNwM3hfZGFp
X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiArewo+PiArwqDCoMKgIHBt
X3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsKPj4gK8KgwqDCoCByZXR1cm4gMDsKPj4gK30K
Pj4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGFjcDN4X2RhaV9kcml2ZXIgPSB7Cj4+
ICvCoMKgwqAgLnByb2JlID0gYWNwM3hfZGFpX3Byb2JlLAo+PiArwqDCoMKgIC5yZW1vdmUgPSBh
Y3AzeF9kYWlfcmVtb3ZlLAo+PiArwqDCoMKgIC5kcml2ZXIgPSB7Cj4+ICvCoMKgwqDCoMKgwqDC
oCAubmFtZSA9ICJhY3AzeF9pMnNfcGxheWNhcCIsCj4gCj4gLi4uIGJ1dCBoZXJlIHRoZXJlIGlz
IG5vIC5wbSBzdHJ1Y3R1cmUgYW5kIEkgZG9uJ3Qgc2VlIGFueSAKPiBzdXNwZW5kL3Jlc3VtZSBy
b3V0aW5lcyBmb3IgdGhpcyBkcml2ZXIuLi4KPiAKPj4gK8KgwqDCoCB9LAo+PiArfTsKPiAKPj4g
QEAgLTc3NCwxMyArNTg2LDE0IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGFjcDN4
X2RtYV9kcml2ZXIgPSB7Cj4+IMKgwqDCoMKgwqAgLnByb2JlID0gYWNwM3hfYXVkaW9fcHJvYmUs
Cj4+IMKgwqDCoMKgwqAgLnJlbW92ZSA9IGFjcDN4X2F1ZGlvX3JlbW92ZSwKPj4gwqDCoMKgwqDC
oCAuZHJpdmVyID0gewo+PiAtwqDCoMKgwqDCoMKgwqAgLm5hbWUgPSAiYWNwM3hfcnZfaTJzIiwK
Pj4gK8KgwqDCoMKgwqDCoMKgIC5uYW1lID0gImFjcDN4X3J2X2kyc19kbWEiLAo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgLnBtID0gJmFjcDN4X3BtX29wcywKPj4gwqDCoMKgwqDCoCB9LAo+IAo+IC4u
LiBidXQgZm9yIHRoaXMgb3RoZXIgcGxhdGZvcm1fZHJpdmVyIHlvdSBkbyBoYXZlIGEgLnBtIHN0
cnVjdHVyZSBhbmQgCj4gc3VzcGVuZC1yZXN1bWUgaW1wbGVtZW50YXRpb25zLgo+IAo+IFdvbmRl
cmluZyBpZiB0aGlzIGlzIGEgbWlzcyBvciBhIGZlYXR1cmU/Cj4gCgpBcyBwZXIgb3VyIGRlc2ln
biwgQUNQIElQIHNwZWNpZmljIGNoYW5nZXMgbGlrZSBBQ1AgcG93ZXIgb24vb2ZmIHdpbGwgYmUg
CmhhbmRsZWQgaW4gQUNQIHBjaSBkcml2ZXIocGFyZW50IGRldmljZSBmb3IgRE1BIGRldmljZSBh
bmQgSTJTIApjb250cm9sbGVyKG5vdGhpbmcgYnV0IENQVSBEQUkpKQoKV2hlcmUgYXMgSW4gRE1B
IGRyaXZlciBkdXJpbmcgcnVudGltZSBzdXNwZW5kL3Jlc3VtZSBpbnRlcnJ1cHRzIHdpbGwgYmUg
CmRpc2FibGVkIGFuZCBlbmFibGVkLgoKQnV0IGluIERBSSBkcml2ZXIgdGhlcmUgaXMgbm90aGlu
ZyB0byBiZSBkb25lIGluIHN1c3BlbmQgYW5kIHJlc3VtZSBqdXN0IApyZXR1cm5pbmcgemVybyBz
byB3ZSBoYXZlIG5vdCBhZGRlZCBQTSBzdXNwZW5kL3Jlc3VtZSBoZXJlIGluIERBSS4KClNvIGlz
IGl0IGV4cGVjdGVkIHRvIGFkZCB0aGUgc3VzcGVuZCByZXN1bWVzIHdpdGggcmV0dXJuaW5nIHpl
cm8uT3IgaWYgCnBtIHJ1bnRpbWUgaXMgbm90IG5lZWRlZCBpbiBDUFUgREFJIHNoYWxsIHdlIHJl
bW92ZSB0aGUgZXhpc3RpbmcgUE0gCnJlbGF0ZWQgY2FsbHMgaW4gREFJLgoKUGxlYXNlIHN1Z2dl
c3QgdXMuCgoKVGhhbmtzLApWaXNobnUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXBy
b2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYWxzYS1kZXZlbAo=
