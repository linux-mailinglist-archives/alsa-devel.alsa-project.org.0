Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F247205429
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 16:09:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B30171762;
	Tue, 23 Jun 2020 16:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B30171762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592921383;
	bh=G+y52tRiIoJOAZQvnM4wCKunmhS+JWM67h3Oi+TJxZw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JnH/ki8c4OdAv+bT5UEI2I624c5ghSkO+hy55F6BCUH4ct5lWmZiNBTgjjd/9s4gW
	 6qTtxwMV5GhaUc/GwxPif0LviIRJHGoGege8ZVFQrI41L9eOvhdvde4Hf9p3NC8dJY
	 Uc71rsx/iZaPV6Fueu2JeRmOWRhb4d8A7efEfjiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1521F8023E;
	Tue, 23 Jun 2020 16:08:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7396EF80234; Tue, 23 Jun 2020 16:08:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50110.outbound.protection.outlook.com [40.107.5.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E50BFF8012F
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 16:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E50BFF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=missionembedded.onmicrosoft.com
 header.i=@missionembedded.onmicrosoft.com header.b="FxanwdKJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIt9/ALGNkBMgtZP8TQfLI7zrtv5bY7bp/Rq2nvXg1Zvn9sKfnVJxcsU5qpjW+eVkwwtqucRTITgNPlIs2Sf0nmg6y1lGViQOCgWsNcfjkevZ7CDKknuZqNWru9fBiYUG9BjlMczSIbpxPmb0zD7DiKbsitIfdY8tvYY8vBHKhWSb+nWageAgbzIaqE+WGWxHp5pGHSYYjVXVcs2a038GtpuK7aJTiIVkFrECPdNnRKeb8c8lewxlq9QBMZx6247jZqbBQA/dyxgt72mRXj5IKBm3IZKmNmaPpYQ1vjOYERGVxyJZEmvTlmOajfaRfpwWo90hA74PA9iMKt6f1CxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+y52tRiIoJOAZQvnM4wCKunmhS+JWM67h3Oi+TJxZw=;
 b=KjMCvY6lV4W536ft2MDHC9xt5p3000ibwqlYuT5F+SRrp8Z2H6wRp4KlQlq8ezGX3uzI/YcVQGgmV/pPpW9eHj112bpmV140NmKe0Rlf5sojW/pFtRGSbQEoc+HVEDDAnUO8sGPczSE0jGk2VZgH0mR2UJFMHCrY55Qrnc4VspWBDYHTwn/UgLzDgKgh082iVwILBkE1sytLt0uAuZcpv2mHWOi6NEp4uOyl8ZF0tCaUzgd159WkB8NVpEUTy419GRnB4MlOIGuPiSuxHXEE+CnfGJGqUxzKx57616I51lWYnV7sFBP+yIPLH9hMP7Uyzgjt3i8m/iyidgpIjPS6hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mission-embedded.com; dmarc=pass action=none
 header.from=mission-embedded.com; dkim=pass header.d=mission-embedded.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=missionembedded.onmicrosoft.com;
 s=selector2-missionembedded-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+y52tRiIoJOAZQvnM4wCKunmhS+JWM67h3Oi+TJxZw=;
 b=FxanwdKJ050fTokWiFXJCc2nTfL50wi31kB7el1PzmUcAV9476zyKeVEVuicgY8g0vPIUi6uxa4HxCufozinx9C2WCS1WX50VksCaKjoaBX5KBCxGqhEZwd1HvBtTxppchC+ZhdoAqrpSmdy415iulv3aB+8yZWEBQMYU6dSjLE=
Received: from VI1PR0701MB6734.eurprd07.prod.outlook.com
 (2603:10a6:800:197::8) by VI1PR0702MB3567.eurprd07.prod.outlook.com
 (2603:10a6:803:c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.13; Tue, 23 Jun
 2020 14:07:50 +0000
Received: from VI1PR0701MB6734.eurprd07.prod.outlook.com
 ([fe80::7050:ae22:687c:93c0]) by VI1PR0701MB6734.eurprd07.prod.outlook.com
 ([fe80::7050:ae22:687c:93c0%7]) with mapi id 15.20.3131.009; Tue, 23 Jun 2020
 14:07:50 +0000
From: Roth Richard <rro@mission-embedded.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Plantronics Savi 8200 USB Headset Volume Controls
Thread-Topic: Plantronics Savi 8200 USB Headset Volume Controls
Thread-Index: AdZJZo3IQvmY6IiWTQe7wbOf3bZ6Ng==
Date: Tue, 23 Jun 2020 14:07:50 +0000
Message-ID: <VI1PR0701MB67347F4E32C07870E5BB640095940@VI1PR0701MB6734.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none
 header.from=mission-embedded.com;
x-originating-ip: [2a02:8388:8283:7580:fd57:1e1e:7a24:b30a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35f6afa9-2286-4082-ae22-08d8177ed083
x-ms-traffictypediagnostic: VI1PR0702MB3567:
x-microsoft-antispam-prvs: <VI1PR0702MB356765985BA2B9CC362F38DA95940@VI1PR0702MB3567.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 04433051BF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zpB4J/QUsv24C39jKCF/fQQ+fbur+pKbGYsGccGSRtPMxNilfQGxjoj0RSawwWtvH9Oa34+Y3xSHFNyopAPby9uBXmFP9PxV26zyyFlizrWldapjIq6xOy+pguW0sCBAnXNCblBy2PkJqmQs1uT1/Uuc8bBN1KCqRF1GhGoOgu7wuWT2mKY9IH9xo+rGqU3iBUKNpazRmBp5fca0iHWz4Cuz35r4lLOtTZlHGGLepch8JPCplJJqX7DdS2GocVjX8qdoU0zsrqivNfBaPWcVycMjl2cm8CqXAzhPM8NLCq195nDwpWASXzuolyZZP2or1DyvyojDYgQXUhbjES0CUQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0701MB6734.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39840400004)(396003)(366004)(136003)(376002)(346002)(6916009)(508600001)(4744005)(52536014)(2906002)(5660300002)(186003)(8936002)(316002)(33656002)(66476007)(66556008)(64756008)(66446008)(8676002)(66946007)(76116006)(7696005)(86362001)(9686003)(71200400001)(6506007)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: BtxAiExG6kr7stTLhNIjqnGpGUPSQbF+EQGUxWcG4hqT4qnjFNfxIucBysSInsR1vUcEKGqmbLoGvEpOl/H8W8m+xMbc/ONCndT+MGZORKANwOFX70r7j2oqnYUqefL3mvyACsAuDvlDlkFH/3AL3rDwTLmSaOm/gJr9gTcz2IPHcoWhhZfx4irMx4M17/Cm0NYB2eUgjNHiP7KyyTtugoi6cYJQ4OfQmz3kHf1YZEErclS85P2ynFFLlaIbKaxyKqmuoeLNXoDfo4w/FkEhGS1BLfIsr6q6nl7z0MpUvTNt/k1KE3KTIzOT5rTYJcuu0C2DoVqgzkVvNmPwSsNZWuSTe4pEI1z4IE/zu+KR5FkaX8e6rn79iHFpf6SrNZizVFFtoYRyU+QOWxoKFfpzuDSAAZGAqzGN/GRGEyXX8D3RkDxtMV6ry2WUeNrc5D3rcxVMVZquf2f9S49Ooeuhh1MzX0Ap+wrgl4vUjvVDHswixClfVqw4o5SepuaN0Ph0Zu7iL9Wlt6Yducmj0J4RRpXv3PxQM0Aui5dlibZyKsoK1jYyU6lhLgJ295kEx6CE
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mission-embedded.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0701MB6734.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f6afa9-2286-4082-ae22-08d8177ed083
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2020 14:07:50.2781 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92c2bdd3-74b1-48ec-8a88-3d8c079de812
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rb8L4mVigu09tchj+ngUlua33yAeyqXt/MVk4try3dzXjBbz4hv7LTlFDMCGutO2v2qEtUcDqWMOpJOlLB4sYtu6dOKlQ4JCd7g8QIy/6XI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0702MB3567
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

Hi all,

I'm currently experiencing the following issue with a (usb) Plantronics Sav=
i 8200 Office Series headset

When changing the volume via the buttons on the headset, while the volume c=
hanges on the headset itself, the change is not reflected in 'alsamixer', w=
ith the (PCM) volume level remaining unchanged from its previous value.=20
However, when changing the volume via 'amixer', the change is realized on t=
he headset.=20

Has anyone used this headset with alsa or able to provide some help (maybe =
as simple as a missing module) to get this working?

Yocto Release: Krogoth
Alsa-lib Version: 1.1.0
Headset: Plantronics Savi 8200 Office Series

Best Regards and thank you in advance,=20
Richard

