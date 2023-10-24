Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ED37D56C3
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 17:43:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD41C84B;
	Tue, 24 Oct 2023 17:42:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD41C84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698162201;
	bh=DE4ZIQnetBwI5RTGeDGHAG7BhQgTl8J6IJwprHrUV5s=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pPylvynqn3w05Z6KEROHr03fFSHZtfMCQm7+bxkDIfqOdcH9ulr7ZcPN3NjPNgt/i
	 wpVxw59f1ApLJ2sB95NsM+t/G48ilsZ2ibtcwea/h1ZwpjYPP8DDcn1bALfZcvf3Kb
	 5EoRtAw+fHyJMXar6UW217NhzsgCPARZpVsj/vVg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 606B5F80580; Tue, 24 Oct 2023 17:41:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3A23F80580;
	Tue, 24 Oct 2023 17:41:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A974F8019B; Tue, 24 Oct 2023 14:30:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31FF4F80152
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 14:30:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31FF4F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mcintoshlabs.com header.i=@mcintoshlabs.com
 header.a=rsa-sha256 header.s=selector2 header.b=ewGNQNPY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuV1NjjkbuNPeoBH6LVzr2kQRf8PJOXRk0/sHCzBeSOBtNwtnzs+b4gHvznDR+luIyKUw6pRX/iGyl/gEboUcW2lffYe0MHDQFhT113CynP91vgbYawPa98iHpsw1ty0wew59ZK5rCTJTEbwbgdUErvjjgeEGDgtYxB9WQk+lYk0qkS7qXH7CXMekd2Equw0PzTopRzgGPkPIM7XEg/ebQyvAgFh19Cdh/nv77l6etGQEND9VjvehATObvNQuv9qZ/Ued4hEv+cYBe+EnLsEQ7+/muaExANoN9V1TwEkSmmQcpLgLvdLHvhpXOap38+QXOv+vn9cj0WUhUlvWQNWNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHsZ9yOEgfoNZUtXPLkpXJoE9EJkkSZ4KuQu+65cC20=;
 b=NhN1ApbxQBb7Yorrb2+yuiGrxxUVDa8mq8SDHMTZf5DH1BAmSK/lwPqjpw+AfgpSpJDdneNj5UI4PJzo8dRKyEbxaBh0vXo6oTnBNEpAF8Xc3LJAgE2UuSD+gEyPCToQ9zIMoB666inNMFXueNU1Rqp69YORl9lJ1s90WZxeDC8EmpnSd1Rk2f/pKKHGF18M95nJHd8kYHGmMWQX5JVT7Oa7ORyeN200Kuu9ccXVIHbbWOxDvU08Odpn07+L9B/8ruaa9xnib36O0jhQcG0fOKwXRGGWf/zXqtdfpdGXyxWp9X6jYGa5pHrYsNQZ9WbzaVJpgbyDutFNAwqWQAgyow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mcintoshlabs.com; dmarc=pass action=none
 header.from=mcintoshlabs.com; dkim=pass header.d=mcintoshlabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mcintoshlabs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHsZ9yOEgfoNZUtXPLkpXJoE9EJkkSZ4KuQu+65cC20=;
 b=ewGNQNPYCyb6GENbNX6LScUOPuN8AWts2K4xyjvSdjC+MoI2KExFKEvSuGCVOPyzqcs+TIiRe0HI1JNfqT2v+XsQ76AsVxrnCzTg4qolPEtg9q6WN84iXkepD0Zl/lcjN84XRNskZksYpKddPtOWED0pyZjcMlHULmnNANB/ZKA=
Received: from BL0PR13MB4433.namprd13.prod.outlook.com (2603:10b6:208:1cf::20)
 by BL3PR13MB5164.namprd13.prod.outlook.com (2603:10b6:208:33b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Tue, 24 Oct
 2023 12:30:21 +0000
Received: from BL0PR13MB4433.namprd13.prod.outlook.com
 ([fe80::face:2528:fcd4:1c33]) by BL0PR13MB4433.namprd13.prod.outlook.com
 ([fe80::face:2528:fcd4:1c33%6]) with mapi id 15.20.6907.032; Tue, 24 Oct 2023
 12:30:19 +0000
From: "McCarthy, Max" <mmccarthy@mcintoshlabs.com>
To: "tiwai@suse.com" <tiwai@suse.com>, "perex@perex.cz" <perex@perex.cz>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: [PATCH] sound: add quirk flag to enable native DSD for McIntosh
 devices
Thread-Topic: [PATCH] sound: add quirk flag to enable native DSD for McIntosh
 devices
Thread-Index: AdoF8SPTN8S9b8oYTMO0va+nqK8IpQ==
Date: Tue, 24 Oct 2023 12:30:19 +0000
Message-ID: 
 <BL0PR13MB4433226005162D186A8DFF4AD6DFA@BL0PR13MB4433.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mcintoshlabs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR13MB4433:EE_|BL3PR13MB5164:EE_
x-ms-office365-filtering-correlation-id: eb1971ad-7223-4fc2-ee42-08dbd48cfc09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ejiY9X82vcWmloeom1U83YKTWkKPbs2icnZ8ujnPhrculY6Rmrq8q735RqTdwsT5Ks65Ys8d2igwMnGZ/WjKpHomgNz2LgnwkUF+DScIocgtkJ1e2vQZGlEXMzxe+g1fyWZCYViaJSApVwehYPqhMN/8Y0L9FnCh+kX0+weQrEg8C1Tu3e0lg2mSTXOZHRIJqcIc6doHQ0EmECEKzmkou6mw3vKwI7RZcfpFsKu4uAbGqmCSr7wTVWq7lf/TbL47mQGpp4og7y/GDjHwFfMxCch2XWPQ35Lc4QC2r9H6fJc4ipVcnM1eqllXekkQRM2ymFCELirtHQIbUy+eh5jGhCzSZE7Mv15zQF3pDw3TiaPwIMrgVVhvtJfv6ZvQQn6HmqwmLRWyLUXEx4JsBcwD0d8yaAaS5qQgVe+DrsmW96dpqreZdEFDsIvPBRUR6G+lo9amaCzmHTiz/5JIy/OSfPWk+I8QcKavSiiO0VJlWGUjRbatHvUmTilEp9H+V0EOc9vu/DHKWvbNF3ppiJw4oxMGwwoi7sC1buHdNOv8Q/6tAFhSwjGQlwx8oFZPYWbNJ5Q0cSKlI+v4j+Jm9SA6H+apNbPB4qy9h1E1eBX+14FEX/Zjs4PgM99TZZk3DkRtrk6Owu+Q0j9OK+HK/DDEZSQG2i6Udcnb/4ilb+/tX3M=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR13MB4433.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(6029001)(396003)(366004)(376002)(346002)(136003)(39850400004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(4744005)(55016003)(9686003)(6506007)(7696005)(478600001)(8676002)(26005)(41300700001)(2906002)(71200400001)(8936002)(76116006)(110136005)(66446008)(66946007)(64756008)(66476007)(316002)(66556008)(4326008)(5660300002)(52536014)(86362001)(38100700002)(122000001)(33656002)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?b62l9IkC9zT7azP4xozi9SpmAuldIXk4WmEeXjj6MqOeRG7yuAL0A1ujrh58?=
 =?us-ascii?Q?QWRqMHJ2Ira0YeGXS9SVezCafIGN2H/szgxG+0rUsbhYNzBCO9efuDzXpMyb?=
 =?us-ascii?Q?TzDRqmxhh1PXSep5QSiECURMLU1GSTgYNUuZr0kSaKyEvQ2w2XNo/eBHcnc8?=
 =?us-ascii?Q?Tg/FfsrpteZi70PMLnTlXfVwBFmqoWhwBQHYQf84ydUSxLyA3DeCkXiq3qwz?=
 =?us-ascii?Q?iBC61ssgxnt2scotHimn1L9wjdknxqolxaCPc5iqdoqW3paJ9FGFF+p/r1/v?=
 =?us-ascii?Q?MCgB1MW2RgAqfZ5w8Com7MTqa6xBpARYVOq5mxBRql7Z5JfSUUouhbC9WBiH?=
 =?us-ascii?Q?QZGPcQGmVGS9yBNS3nIsI+mVHN0XfdqJs2z+NLUn5eqaQOYHAGfLiIoDW+t0?=
 =?us-ascii?Q?hK509HL8ZAhGjiyNETl+3Is9CAgqNNJzIL1+t7X+rwrnFROXoqZuohlQoPPL?=
 =?us-ascii?Q?LtPus9KYQriUIgDyDH/X3fPNXr73HhVn6CMJt/s6GKpyZDiIfAY2PZxcvWxc?=
 =?us-ascii?Q?X1hxHiurb0hLsZ9VQevl/7wCv1xQkNKj/tlbSdfYZaCdUGx0gw+DncPJiIX5?=
 =?us-ascii?Q?Fs6//JcW6/OtCB/gAjpZ8BcIt6v2CRUVNvIlZRgT+/3LbIvoFB7CVWqpfWa8?=
 =?us-ascii?Q?Qs64RNfjUuxoOhf5Z+PtZjYSqfT2mtyqwz9MnsI0Uvf4FWplyDYBs4irX/+3?=
 =?us-ascii?Q?pIvoG3Mqdq5aXJ3ds9onsXpJLyNuJexHody3UzDgFmJTXH20xACCs91ArlJj?=
 =?us-ascii?Q?2p7KIdxs3B0D4VkJ06T3yyX7ety7lkXompz+IdV74le1Lif1QHPgSwBalplm?=
 =?us-ascii?Q?ctuAKN75C2sw4RfLXXqz/4DnMULqaQkrEFobp3pYtSdce7ZiRPMNyG15g8tx?=
 =?us-ascii?Q?xkpwbtlzEuPU10vEX7aQGQBdXhkHPlZVk+7dn48iTzAemaZO6eJ/5rvPcT6l?=
 =?us-ascii?Q?av0O+b9jdlGTB1f0AjpuxgVngk3/Jr4N3PxN0Ri18JFb+s7aRg4VE8ZEAuer?=
 =?us-ascii?Q?/0soFXsXfQOIQ7sTXOoXBQ5pJzlQhljtNjMgw6fT73CnJZAheNEHFnZRA5et?=
 =?us-ascii?Q?l3kUsRvTnogm1rn14LaKRtfAM5b9URRiwW67TptZslqf96mRG1ceKvgpm/Fb?=
 =?us-ascii?Q?uXTBOPXm17H1vdkIOAm1e8OCGY0Z7vXA9tMLUxu6yZrH8h7a9acOqof0w6GO?=
 =?us-ascii?Q?tcVP0XREdgclLYjlmWjgTt3edKLnanhQEnNRc8IsJtjmgnsPDlWnYonlJnK6?=
 =?us-ascii?Q?7VwkHDO5bkloBwnNF1S10SMywOwdS/3p0u3tMjF/R9EOvn66eGaXCRw1HI3H?=
 =?us-ascii?Q?m9aKYZDsDxIazSySyNH5pev0mXTjWzeaXAYnxdrmAzy0WdCGXdKLGjvS3/Tx?=
 =?us-ascii?Q?Flr8xc5dfZWSYRwfaupuGPeO1uo5ZXj2qqIcQePxRgfhZYs/gO/B78vFGmmh?=
 =?us-ascii?Q?BprYKU3AMcTv6jrCpgi2V3zjW6LuuWzoq8kWRcuROPjYloh6wKWAXYylVugt?=
 =?us-ascii?Q?Ypoyy2kGW46jXAMX5DKqjnhgy/AouFsbiXRLLpt99LPymrVWy5tLqqstpgn6?=
 =?us-ascii?Q?Y3QUaf4+U8x/LyXEQHsI+dAOPO1ISB1a7deOE9tI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mcintoshlabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR13MB4433.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eb1971ad-7223-4fc2-ee42-08dbd48cfc09
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2023 12:30:19.1621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 868637aa-7959-4e9f-b4fb-8f883db78885
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 nbPwrn4d8SaEfMkfyYfJ0z2UE21xAh2TJIvBSbB6XBI9Om9Vkk58bQdWD5ycR+0rca3uBMj3LdmRwmCsDwiT6wrkkmtCDhR2TaLgm0XgJTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR13MB5164
X-MailFrom: mmccarthy@mcintoshlabs.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AGR3NTRN3Y7M6IFTF5PMOOASTEAWG3UQ
X-Message-ID-Hash: AGR3NTRN3Y7M6IFTF5PMOOASTEAWG3UQ
X-Mailman-Approved-At: Tue, 24 Oct 2023 15:41:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FXO7QGJ3IAH3AO3X6C7PEG2QCPOAB7SV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Max McCarthy <mmccarthy@mcintoshlabs.com>

McIntosh devices supporting native DSD require the feature to be explicitly=
 exposed. Add a flag that fixes an issue where DSD audio was defaulting to =
DSD over PCM instead of delivering raw DSD data.

Signed-off-by: Max McCarthy <mmccarthy@mcintoshlabs.com>
---
sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 4e64842245e1..ab2b938502eb 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2220,6 +2220,8 @@ static const struct usb_audio_quirk_flags_table quirk=
_flags_table[] =3D {
 		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x2ab6, /* T+A devices */
 		   QUIRK_FLAG_DSD_RAW),
+	VENDOR_FLG(0x2afd, /* McIntosh Laboratory, Inc. */
+		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x2d87, /* Cayin device */
 		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x3336, /* HEM devices */
---
