Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4591F3414
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 08:26:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B501167D;
	Tue,  9 Jun 2020 08:25:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B501167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591683965;
	bh=rY+Ov/bPxFQR3fpqLNtOXehRbIIzaym8RuJZyploRj4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VGLddHuJYTqXIUGersF+Zv9Uo5IOYiEQh9GN0A2wsIRiw0XqwP7QuDfvldiy0KcH8
	 dqqRU5QKB0VIrXO4koG01lmP583LgbhApLIqZ9NI21xIlm6QwGWE+mVOkE5ic/5gG0
	 39l2yCtQFh/gr2zFeIR1ht4KPQ+hygvEV1Xzt8J8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A53BF8028D;
	Tue,  9 Jun 2020 08:24:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FE9BF80278; Tue,  9 Jun 2020 08:24:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 371E7F80124
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 08:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 371E7F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="ps3gwVrz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pj+rUOkciJ6gPOch609Qf1dolaB7rLeptr7FYQRcCYKJ6ampKO+DlG4ei9Zxdrd5yPNBiMlnucu5uj9p9pdjWXGiY3wrE14jWQ12lGAqJLioTcKLfUa6vFBwuczUGKvqHnvctMmOwsncS62Yj0vPQjdW5D1ETQEsz3QBvSPrk58eRJn9KUP5qsEB2lZuCqM2CoQiF+oalQxOmYUmmZnhqSwvnCCAdAR5mrcWfE2KN0/4RCiBVtn0n/IrnWtjjZSMWyS4hF2sK8Q+5y+U6fPTMkpE95rpFA1QP/H4HS12JNyoZBLDQRj1zyaUegRIP9fKju9oZpazXrvR9k2HMVpEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1pSMyaqS79YKgRqsbxClkrSE+WKTQ7zsEkZeu/tMqA=;
 b=caJdHE3BNzCluUohvwFWljjS9+ymLNt5EOdiS62LwH0RPGU1t7e9RMULBdMt80U3B4T1mmK7pHaX/b+qjP5e+fzvL9/xhksd9JM/5TVzA2uaZLr2rHW56dQu6Is6Iendati0ENUTlHZFwh2C9g0BBwLOJo7OQegifylfcy1qjQEcGbO5AuL4DRdSdGR1OSORB0ULADC0/rPq4qjVqssqflPk+CoN32p8XjP3v1R2+gG16EZKC8/6a+1Qt+YdG5Yw06huiWASV89LvZJPXbF5qfTCwihLmjJjtIvGAi2dceHYbX1SrsYMlsD9bmhPlYIPmA9z9oi4zIgGW1PnU6+y1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1pSMyaqS79YKgRqsbxClkrSE+WKTQ7zsEkZeu/tMqA=;
 b=ps3gwVrz2g4XrtfbE2xV0GtyDfXA1dG4JP2VM+Y+bs2bvsjxlGo00zAScGvcTlg0C8gCqYI11NFXIAE32R9tr+DMPFL48tnVo37LnzYdMJccP37TxTsNOriQs3Q12j+Oa1Yh+UwGP+TNbNdKB47DXP0h0mTIjTaypYinWQvjVNc=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB3530.namprd12.prod.outlook.com (2603:10b6:5:18a::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18; Tue, 9 Jun 2020 06:24:13 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::f9c2:772:27f4:87e0]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::f9c2:772:27f4:87e0%3]) with mapi id 15.20.3088.018; Tue, 9 Jun 2020
 06:24:12 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Renoir APU - Mic-mute Led status not updated for onboard DMIC 
Thread-Topic: Renoir APU - Mic-mute Led status not updated for onboard DMIC 
Thread-Index: AdY+I7KVQlmAUTlQT2aNI7VNkj7QCQ==
Date: Tue, 9 Jun 2020 06:24:12 +0000
Message-ID: <DM6PR12MB2633A800A99CA9EF62CDAF9997820@DM6PR12MB2633.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Enabled=true;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SetDate=2020-06-09T05:31:59Z; 
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Method=Privileged;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Name=Non-Business;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ActionId=ee123313-329a-442c-9c4b-000084e83a0f;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ContentBits=0
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-06-09T05:31:51Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 8700e525-6137-4433-af4a-00006f17d6a3
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_enabled: true
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_setdate: 2020-06-09T06:24:08Z
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_method: Privileged
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_name: Non-Business
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_actionid: b2beb3c3-b8b7-4e5c-a014-00009859353a
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_contentbits: 0
authentication-results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1b2efe76-eb94-455a-4b9a-08d80c3dba04
x-ms-traffictypediagnostic: DM6PR12MB3530:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3530FE3E550F0755FFAE9CEA97820@DM6PR12MB3530.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TXNM0eOk27rInNMBVnDlEYylSAfD6f0oo11C8pi1vmW8LCt+JjLsU4bXq3JNsjt8bfJNvixWjg/jaN5Iagqmv4fET5u4zgPZv+UyJXNZPvgpWd8DTxJQaCh2C0YM2Qe50DhkTBg6bz/TZwPjO67hfwBhWQ2nGoIxlMJXvOtkHrL5ILsFPlJM44xVGu4yE+8jDekbPkT0wiyaf5odZp15pNpZwMJ/Ps8AE+HqXcVrsHIwywNkLTiugHEn2HC1QAyDXDh9mC3MK/Yb3UuJ71izT49opBotNXeRcifoRfClndCHiymNH6TxwFO0nLqsUYYvIu57dKChbbNBVuU6GEa5zELQKmvJ3OCPxFZDAAHjxaaAbIgS5kx/SamgZl07H3iM6K3ibEU/Q1SCOl+SbGHIYQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(55016002)(6506007)(186003)(6916009)(4744005)(7696005)(9686003)(5660300002)(4326008)(71200400001)(86362001)(33656002)(4743002)(83380400001)(15650500001)(66946007)(8936002)(26005)(966005)(8676002)(66556008)(66446008)(54906003)(66476007)(478600001)(64756008)(52536014)(316002)(76116006)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: xjyWBRl3/cmEyMUlZHhBj0RZGyvrslcMUhxYrqjFpgNkgA+rvaPpIZ+mcPxpKY9c4+W4Fg4m/J3NewIjv55KMV8raHmIoNMLifUkI0FPSV/cYUfPh6FyDtUb8GFIzjHSMou7Xt1psevo/u4x9nei+VOiucxDEf+QVsbOi/CJoQFZHzFh5sUYE/TQ7RMPsrv/w3SgEThOEEGI8c95QOs9XZAjPPLxN2vXrthXuLyjgNPWsozRkLI1Feo/rccAAwaWCI5PqFEaZC04LId3NKa5ZV4XSMK3hVq03B0DaMDOMYnY4NdlytZWK51d1gtQ6gOiRIN9DhkUnsPnkEluWO9uZL8RLE7fC6zs78rThiqp1R1lXlIh5JA4DGKi2RaCmgJ4rjxEIC9wPxyIg9OSeCWgfu4sbNvU9kP5nDnss5M7BRL8Zz02UIHeGnpZQDA2amjWfDhrReC42ZUAuh2KjSXCU+g7e5Hs98c35eYKAXVa2nJ3XNtgEdvuTyjAMWLI7hfa
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2efe76-eb94-455a-4b9a-08d80c3dba04
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 06:24:12.1579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a7y2CbN9EcFVbQTaygEzrv/SmcS36xR1OEzebm7ariEYCJ4Nr/QkS2XpBsm0lb9r+kE4tfMK54jO+PPw1pV+WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3530
Cc: Hui Wang <hui.wang@canonical.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
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

Renoir APU has on board DMIC and HD Audio Endpoint combination.=20

Mic-mute LED status not updated for On board DMIC i.e internal Mic when Mut=
e=20
is applied from OS in Ubuntu.
When External Mic is connected(HD Audio Endpoint) ,  ACPI event got updated
based on Mic mute status , able to toggle the Mic Led status in Ubuntu.

We have found a thread which explains toggling Mic Led status for Lenovo th=
inkpads.
Below is the link.
https://askubuntu.com/questions/125367/enabling-mic-mute-button-and-light-o=
n-lenovo-thinkpads

In case of Internal Mic(DMIC), Mic-mute Led status is not updated as onboar=
d
DMIC doesn't have any volume control.
We are not really sure how to update Mic mute status in this case.
Help us in resolving this issue.

Alsa info link: https://pastebin.ubuntu.com/p/4kprhDZYbg/

Thanks,
Vijendar



