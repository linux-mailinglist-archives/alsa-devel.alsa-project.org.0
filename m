Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3AF270298
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 18:52:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4F4D16B9;
	Fri, 18 Sep 2020 18:51:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4F4D16B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600447944;
	bh=ZRBq/AFf+xL+cbEIzVFfXVPsuGT8lQoU5VJ+ElD7XLs=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P3i3Xk+QfgMRCJp6s8dZMQg26WmQ2DaQu52Pua/X1xHhZvkd/JVS9hRM/S5+b/Wm0
	 /1aikRPn5A3hXO1fhUZYwHQfy67DyFNd6Ijiw83jSFgo89D9EmOG84z65Pwa88WW4O
	 EEjG81wob0nWRPHDNB9wI22TNx7Xc3YBqELgw9nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0160F80150;
	Fri, 18 Sep 2020 18:50:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A289AF8015A; Fri, 18 Sep 2020 18:50:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 502CDF8013A
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 18:50:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 502CDF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="S6AMOGih"; 
 dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com
 header.i=@cirrus4.onmicrosoft.com header.b="cJ4cv8DT"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 08IGl2OT001326; Fri, 18 Sep 2020 11:50:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PODMain02222019;
 bh=ZRBq/AFf+xL+cbEIzVFfXVPsuGT8lQoU5VJ+ElD7XLs=;
 b=S6AMOGih3gCbDqwiJ+YfyM/+QuJcMcMmD1u6j5kkHk5RKMSgdJau8EcPN0f51UMPCjed
 NJt9rGdSe6mirlamq2YzYCVN0sfy81FV/um9gCk+YOLIQzR+Iu8lt2w1qwFOoURlYguk
 BIAnVbT12vo4//fohipbI7WwcZs8B3M8ifi9YQKjMivgJYfyylrAOALZVitrFkQOqWDP
 qXdad04kR7QF26AHx9nRHo0j9A1mlwfqyfnXzKovpBwkaXq4z43hsn8wf4F5IFRtWAzY
 ddSpaHOvAzZ3H8fAbEOHyIqd1TR3E+/oV/fWE8K7osQy+EMyTZHdBqxMURYNy8kCSD82 BQ== 
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2055.outbound.protection.outlook.com [104.47.38.55])
 by mx0b-001ae601.pphosted.com with ESMTP id 33k5pgcvq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 11:50:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6JSg5NocnmqoVALSxAb+uz6KMjWDLdVWm2Z+bmRjEuDhMN9TbTQroBEmK0oTSZcBkwa6dXKImRFfjz3xaJFb2PLLay3hAMedun2Pi4BcFBZCAWSBPNY7PTtvlxBBWMEJx+xJa5wKMFQ1rIn4TeTlkjXDlnT+C9GNwYWdBxs/gaPJCz0l3p7T70Fq1/efzSCgRgLlbWgLyNmVSIGKUZd+y6iswFaRT9aiWZBk5qiqYjqBQuDvdadftT4635zq7T4xh8pdiSdYl1udmcjPtbN8UAZv4S8T26YiXnoeWmrYLjRLoBgek9JVLhHg5rrl0fDoh2lA57DKDusx+36HNEYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRBq/AFf+xL+cbEIzVFfXVPsuGT8lQoU5VJ+ElD7XLs=;
 b=eekaReSvAE0glQhUjzOoORt+KYhgD0wvz/gDoYOzjJLg7szAyHtAUAilMwZGiK8QYIvXHe5yzyfOfyzXPwJT/frsSa95o+b880H2UZNA+EP91g8W8yu+lbsWm//jARk/LCJL5dzRINgrROW1McTgmHmvn4k3GCGV9PlX310uQgIgWcYkT2mlnbvpPm4hNg+oB9VLH3ZZUEX57LgpKI4DL6+1Sm5GpKW4+oJf3+BfkIDBu+qww5yQSEDU7v1RS/5c9CEq/K5tn0RZoE9GjrLWQtXhr/wEst5yJM7ui7F+exyzzkWVaNGM+Vpunv3MaxE3pxKa6J0Xc+Dpx2Hoy80SiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRBq/AFf+xL+cbEIzVFfXVPsuGT8lQoU5VJ+ElD7XLs=;
 b=cJ4cv8DTo6h4kGnJowD0NN3OLqOlrJwuLDM5gnY2zemzH1Oh4+hIaWm8TaL70xSkC4IpB9OodvnCxwHo4uAdY2W8vGPGR/917+b14Kcxp8D8p4AX2r7pn9y/p+EukTdNfBG++P03U4yLCZ+1GJ1ibvW1LQqjbDLP0+prI9GIfSE=
Received: from DM6PR19MB2284.namprd19.prod.outlook.com (2603:10b6:5:c9::28) by
 DM6PR19MB2282.namprd19.prod.outlook.com (2603:10b6:5:cd::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.19; Fri, 18 Sep 2020 16:50:28 +0000
Received: from DM6PR19MB2284.namprd19.prod.outlook.com
 ([fe80::9cd5:96af:b0b9:2da9]) by DM6PR19MB2284.namprd19.prod.outlook.com
 ([fe80::9cd5:96af:b0b9:2da9%5]) with mapi id 15.20.3348.019; Fri, 18 Sep 2020
 16:50:27 +0000
From: "Rhodes, David" <David.Rhodes@cirrus.com>
To: =?utf-8?B?R3VpbGxlcm1vIFJvZHLDrWd1ZXo=?= <guille.rodriguez@gmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: cs42l51: add additional ADC volume controls
Thread-Topic: [PATCH] ASoC: cs42l51: add additional ADC volume controls
Thread-Index: AQHWjcG3QQWDW6wz0UCK3PLp0DxGQqlulx3w
Date: Fri, 18 Sep 2020 16:50:27 +0000
Message-ID: <DM6PR19MB2284C2BA7A43A3F7E50F83B2EE3F0@DM6PR19MB2284.namprd19.prod.outlook.com>
References: <20200918134317.22574-1-guille.rodriguez@gmail.com>
In-Reply-To: <20200918134317.22574-1-guille.rodriguez@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cirrus.com;
x-originating-ip: [2605:a601:ab15:9500:5966:cc0a:354a:941a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2144e756-5537-4eab-bcaf-08d85bf2f25c
x-ms-traffictypediagnostic: DM6PR19MB2282:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR19MB228264DECACAEF951D11B102EE3F0@DM6PR19MB2282.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:590;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WYn2Rw4/SkJqy9suROxS+B8nsYRCZ8mpZk+FS53mjbMntLvzfr5C9FFEHVw4o9YpPMepkbc527ngkPHRZQFmdaxcmCG1qUptDgVLqeIBpj/iqRSi5o5zQ+A4GYeWNHathLTL1FpjKASM3pjfA+HP+Ij4RzaNpM1xVw7Hk7WVD3J3h6wbEyqQ+uNpzSg3KUPR8GMWzQAHBn3XCq1fI2fJwe/tVBQyKI+8OnKPJqcbrFWc3cZFUgB7AMoE1OtYWLtnC7Q+LhPDgCZ/sF5i8zoJjF107YwE7ZU9are6qrWDNb8vfxo86HzI6jqcD9qAEoBUjQ50bHvaM64eHeHhKeJ0Dw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR19MB2284.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(366004)(39850400004)(53546011)(66946007)(110136005)(54906003)(5660300002)(8676002)(71200400001)(7696005)(86362001)(66476007)(66446008)(478600001)(64756008)(4326008)(76116006)(66556008)(52536014)(6506007)(55016002)(316002)(2906002)(83380400001)(9686003)(8936002)(186003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 0bHWuPGw4CCxZj9IJctRzsdlqTIsWsc16qJ8BxZd/Ey6lQgrWQoXF729tCVn8+d9oDiOsl0t59HDXTzvu87+14qszFUIsNToj1yu4piO9N5yQCi2iiZytlIysKLWN1m3dB+tj0+ytKcTllqJQcE58bSK30EUobz2kXIbfSMveun2qU7kqni7kF/5zZ4Em9fG2/BKQJTokB3Q7fYIXLgavWQdLcv4ASFf0oTrZtveRajfDe29kfBF2EftbeJRY+9STTMsvWtBINq4hyZo7Cl6Ol8N0TBEe+24W8fzVMEL2bRKQmBDId+DeDvt3UXzgUR15qPRinOaQnOelmE+osFlnsWr2pmqJ44zQX7BqG22AjMt5U2vDYsdgII3wrlmWDsydvvCNIuJsYlYRs9Uw2pvt65C0GGVNhCSMJqSpgoSO9qfyF2nLqtVvjdA7pLH6X6h4GgNIV6BhSNuwLhxy1DqnVBBqZPu2ojkyte8vZf+FMYvAtFfMxEj+6ErYUcQ+52lt3ctBNvaHRrOBkM2sKSIkTS1wzk7jNT3+znSpi9BjzCAdXMOTs0ayZ5W81bvsX5K8P2C4An0IdN2G/XcUp2ceOzfqFkeBHrcDXqmITgLA5MPCTbauk7/QIUoIQ8m/jDhx80uG6uhAFxQ1QoqKfB/aWvFVVFP12g4VurXJi/dpHmQNIt6+EJRvEq3zNzFAyGT36oRYPMbB2/bcY5X7d5P7g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cirrus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2284.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2144e756-5537-4eab-bcaf-08d85bf2f25c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2020 16:50:27.7893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ckPKOEFsK+HcyHlgPnLauRm6A614jGT0ibsxPRyEWGx/4E/BQzX8U+AIUOMsz/bUWyLlGG4vAkmi6NruOFfYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB2282
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 priorityscore=1501
 mlxlogscore=999 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009180137
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, "Schulman,
 James" <James.Schulman@cirrus.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWlsbGVybW8gUm9kcsOtZ3Vl
eiA8Z3VpbGxlLnJvZHJpZ3VlekBnbWFpbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVy
IDE4LCAyMDIwIDg6NDMgQU0NCj4gVG86IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZw0KPiBD
YzogR3VpbGxlcm1vIFJvZHLDrWd1ZXogPGd1aWxsZS5yb2RyaWd1ZXpAZ21haWwuY29tPjsgU2No
dWxtYW4sIEphbWVzDQo+IDxKYW1lcy5TY2h1bG1hbkBjaXJydXMuY29tPjsgUmhvZGVzLCBEYXZp
ZCA8RGF2aWQuUmhvZGVzQGNpcnJ1cy5jb20+Ow0KPiBMaWFtIEdpcmR3b29kIDxsZ2lyZHdvb2RA
Z21haWwuY29tPjsgTWFyayBCcm93bg0KPiA8YnJvb25pZUBrZXJuZWwub3JnPjsgSmFyb3NsYXYg
S3lzZWxhIDxwZXJleEBwZXJleC5jej47IFRha2FzaGkgSXdhaQ0KPiA8dGl3YWlAc3VzZS5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSF0gQVNvQzogY3M0Mmw1MTogYWRkIGFkZGl0aW9uYWwgQURDIHZv
bHVtZSBjb250cm9scw0KPiANCj4gQWRkIHZvbHVtZSBjb250cm9scyBmb3I6DQo+IC0gQW5hbG9n
IHByb2dyYW1tYWJsZSBnYWluIGFtcGxpZmllciAoUEdBKSAoLTMgLi4gKzEyIGRCKQ0KPiAtIEFE
QyBhdHRlbnVhdG9yICgwIC4uIC05NiBkQikNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEd1aWxsZXJt
byBSb2Ryw61ndWV6IDxndWlsbGUucm9kcmlndWV6QGdtYWlsLmNvbT4NCj4gLS0tDQo+ICBzb3Vu
ZC9zb2MvY29kZWNzL2NzNDJsNTEuYyB8IDkgKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy9jczQy
bDUxLmMgYi9zb3VuZC9zb2MvY29kZWNzL2NzNDJsNTEuYw0KPiBpbmRleCA3NjRmMmVmOGY1OWQu
LjA5N2M0ZThkOTk1MCAxMDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2NvZGVjcy9jczQybDUxLmMN
Cj4gKysrIGIvc291bmQvc29jL2NvZGVjcy9jczQybDUxLmMNCj4gQEAgLTEyMiw2ICsxMjIsOSBA
QCBzdGF0aWMgY29uc3QgY2hhciAqY2hhbl9taXhbXSA9IHsNCj4gIAkiUiBMIiwNCj4gIH07DQo+
IA0KPiArc3RhdGljIGNvbnN0IERFQ0xBUkVfVExWX0RCX1NDQUxFKHBnYV90bHYsIC0zMDAsIDUw
LCAwKTsNCj4gK3N0YXRpYyBjb25zdCBERUNMQVJFX1RMVl9EQl9TQ0FMRShhZGNfYXR0X3Rsdiwg
LTk2MDAsIDEwMCwgMCk7DQo+ICsNCj4gIHN0YXRpYyBTT0NfRU5VTV9TSU5HTEVfRVhUX0RFQ0wo
Y3M0Mmw1MV9jaGFuX21peCwgY2hhbl9taXgpOw0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
c25kX2tjb250cm9sX25ldyBjczQybDUxX3NuZF9jb250cm9sc1tdID0gew0KPiBAQCAtMTM4LDYg
KzE0MSwxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9rY29udHJvbF9uZXcNCj4gY3M0Mmw1
MV9zbmRfY29udHJvbHNbXSA9IHsNCj4gIAkJCTAsIDB4MTksIDB4N0YsIGFkY19wY21fdGx2KSwN
Cj4gIAlTT0NfRE9VQkxFX1IoIkFEQyBNaXhlciBTd2l0Y2giLA0KPiAgCQkJQ1M0Mkw1MV9BRENB
X1ZPTCwgQ1M0Mkw1MV9BRENCX1ZPTCwgNywgMSwgMSksDQo+ICsJU09DX0RPVUJMRV9SX1NYX1RM
VigiQURDIEF0dGVudWF0b3IgVm9sdW1lIiwNCj4gKwkJCUNTNDJMNTFfQURDQV9BVFQsIENTNDJM
NTFfQURDQl9BVFQsDQo+ICsJCQkwLCAweEEwLCA5NiwgYWRjX2F0dF90bHYpLA0KPiArCVNPQ19E
T1VCTEVfUl9TWF9UTFYoIlBHQSBWb2x1bWUiLA0KPiArCQkJQ1M0Mkw1MV9BTENfUEdBX0NUTCwg
Q1M0Mkw1MV9BTENfUEdCX0NUTCwNCj4gKwkJCTAsIDB4MUEsIDMwLCBwZ2FfdGx2KSwNCj4gIAlT
T0NfU0lOR0xFKCJQbGF5YmFjayBEZWVtcGhhc2lzIFN3aXRjaCIsIENTNDJMNTFfREFDX0NUTCwg
MywgMSwNCj4gMCksDQo+ICAJU09DX1NJTkdMRSgiQXV0by1NdXRlIFN3aXRjaCIsIENTNDJMNTFf
REFDX0NUTCwgMiwgMSwgMCksDQo+ICAJU09DX1NJTkdMRSgiU29mdCBSYW1wIFN3aXRjaCIsIENT
NDJMNTFfREFDX0NUTCwgMSwgMSwgMCksDQo+IC0tDQo+IDIuMjYuMA0KDQpBY2tlZC1ieTogRGF2
aWQgUmhvZGVzIDxEYXZpZC5yaG9kZXNAY2lycnVzLmNvbT4NCg0KVGhhbmtzLA0KRGF2aWQNCg==
