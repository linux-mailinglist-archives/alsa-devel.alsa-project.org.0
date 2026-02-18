Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IsZMgVNqGnUswAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:17:25 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D022026D5
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:17:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 675B960237;
	Wed,  4 Mar 2026 16:17:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 675B960237
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772637441;
	bh=FYj0SBxfGZZNTnkf//ZxlPebRrGKmz05DbhdKpQauMY=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JNsXAy1IPA4Yc3zcUFBT1wgV520QClGtTuSO3QD7uImTSVUUdUJJKRltSWHWrHmop
	 LPuofNei0KS3T2bwTDn8ZFA4xBPpixF01WURVVMznAYS38KWwHbqFzS9OfSXzaJh+Q
	 yJfap0KiitcplTVIMAfhs7txITE5oMuHNwp2tCjY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A16FF80630; Wed,  4 Mar 2026 16:16:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75D56F8061A;
	Wed,  4 Mar 2026 16:16:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8E75F804F2; Wed, 18 Feb 2026 14:59:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,URI_HEX shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazolkn19011037.outbound.protection.outlook.com
 [52.103.33.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3727DF80153
	for <alsa-devel@alsa-project.org>; Wed, 18 Feb 2026 14:59:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3727DF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=LIVE.DK header.i=@LIVE.DK header.a=rsa-sha256
 header.s=selector1 header.b=jKPQzDb8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=diYk/Sq1o+rlxcTXND4mn2qWYOFvbt1oSYohvn0Ei5/W/27JNJJt5Lus926dHGaiEBx0tHvdIYLBqx51+vDD4Vr3tfpJDbao+f03mqz8pi/6BmHJIm1d1LJeFImb7AT0VUd/jd+XxGjCpeaVbCKcvV+E5rPAn3oi3YONI7GHcdDFCgHvr2E0pl0fY0TPkFjhDCYlsDDGcEHyirLlX6Qair6D67vvtsX4NXs/nOPUo0wlUTkYHAAS4BPUhcrLvlh4rwG2S12MUziiiLxRF8qXOInAaesNQSO2Bc5yWQTEtG7LCJyT2w9EcxXooAa4FQnxEx4/a1fVpuMy5Pcy6ngrKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEfvIo0oCnxcp6pC3U+geMuHyHs6vHENH28X14N4FNU=;
 b=TaubRG2qxZbSNs3smerOAhcjNGX+RkI1lsfhmNINROXyy1IMGOuOEBqwZvBmSg6/5lXM7Az43LxTYyh/7pJuVbrWkfHHR2rDRqf8iNrL+b7h5onlJ/OXZvv+QOqa/57t4hrM33Gswkfz3hCZ51hITG3y4eJ9U5PpcHojncebL6ESWSDZweb8k72Mm68KqEMzhDKxnzlsQ9yw7swAcYYq5dYyU6KeNgrD0NrsIv8Z4swStOvZlaV8vZATU6JDKef69A51eQGocNPOWdjYww0VueoFE8c/Gs4R8RpW4QEwwb4zvgJbBlxYIFmbrAccEefkShg2GHjimZXCpueNIRFvXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.DK; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEfvIo0oCnxcp6pC3U+geMuHyHs6vHENH28X14N4FNU=;
 b=jKPQzDb8DfDnTRpDr0DPAHfeoD8yYCxOPYVLsA3A83svGOfHPPczudgO8Ewz0WtiAVNgqg8fzF4pFo6BmeUQrMTKqvnRNgBYd9UFqbRhC+nGB1JMftZNXd6VS+kSoe00Wkx8WWW6HHDVVyMqPE377QHKp2DY4frbfH+mvd4E0rL/FdvmYFiHXPIhCzJsoCNPhNQJE3RiZdiEfrwgdLmr+BeojacO9qxEFvqg+3jukKojtU6vPC/E2L+XpxZhS4cYaE4pd2ds6IpaP4TJNjF3suXJTLnfaaN5oKXOezDZgbJsLXGdjV+HJaWjx84mZ+14QVxCgqlf+ZkONrFHBteqsg==
Received: from AMBP191MB2905.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:6a8::18)
 by PR3P191MB1406.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:97::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 13:59:36 +0000
Received: from AMBP191MB2905.EURP191.PROD.OUTLOOK.COM
 ([fe80::9c32:9afb:a3a4:fb5e]) by AMBP191MB2905.EURP191.PROD.OUTLOOK.COM
 ([fe80::9c32:9afb:a3a4:fb5e%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 13:59:36 +0000
From: Philip Jensen <philip.jensen@live.dk>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: [BUG] ALC298 (144d:c1ac) Samsung 950QED requires vendor COEF init for
 speakers
Thread-Topic: [BUG] ALC298 (144d:c1ac) Samsung 950QED requires vendor COEF
 init for speakers
Thread-Index: AQHcoN57bRlM/nDLXEmKcseLItINXw==
Date: Wed, 18 Feb 2026 13:59:36 +0000
Message-ID: 
 <AMBP191MB2905B9332B9229500B2D122DFE6AA@AMBP191MB2905.EURP191.PROD.OUTLOOK.COM>
Accept-Language: en-US, da-DK
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBP191MB2905:EE_|PR3P191MB1406:EE_
x-ms-office365-filtering-correlation-id: 7295e260-990d-48d2-73d7-08de6ef5f377
x-ms-exchange-slblob-mailprops: 
 laRBL560oLS7IWERjHonlu/qsKr3Bu1Z2IrXLB4zFmeKaVSwbeMpQ+nB44GizvCVW206a6WDEFGeC7Ff+r6m0Y+YSLlyT18e0RBA/8JAXeES8MPgL/cSMpxsXxObcrVBhEB0Yp0NX5NFjBVQzda9fLFS1K6VIKAZ6INJVHOQxdZ/4bCBBzUyLpEfxukZFx5a13FrD7ZozlKdmd14h9WeAwaEz15IKDKg50jFxlB4aVN7VBleG+Zj2f3y2tW3tDcxMFj0HAN5oYk/QTbwkkzrLOZmXtkOiuniUjfbqWGzo4viXTjK5kWJ+9YnlG/4+EKX8nH1UZW7Dab4nG/0DZPaiTgkQnvpd41Jy/FjkrXtwCCyvQ56DrMsqfXpPUFUvIf/yVpL7ZNdDs2N5QUK58qmRgyGh0eEqwm7G27oW25/qB9uF+9oc7JPpBvbJnouVuT2rpeHSXi6xOOscbPh1v+pRpyfGKg2lkT6Wyu0CXq2r//iTBpOEw4m4+cgLkXE+YS6hGF5OnxdqvTBV3nTJe+2W1361j77Cz57om0Oz9p3kId2z79R1Ryjkzl2kgy6g8wWUlXwSevklw6EaZVw+d1KvloxZrvLButLR8i0L6HS0jsiM8a6geCr6zs6A2GAGac4in5pvAwy3tZmI5GKMGcARcOAtP+IXJLdXS3LD8EpceLryID6b+3no6sfVXuHDgvi+sL+Syru3EbO+ustWbWCQYsloZxC2aLQlP8St6VyUrHLojyWKOGtmUAE1TbwMSWFg41b/BMWHSPfgdSjTqH6XA4ck62l3DpC
x-microsoft-antispam: 
 BCL:0;ARA:14566002|8062599012|15030799006|8060799015|15080799012|19110799012|461199028|31061999003|39105399006|3412199025|440099028|102099032|40105399003;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?p+7LUxlSCeTTVBKled1NOAF/QDUsW9SaBA3J8GUsdaGVPtG85oYQZOklkA?=
 =?iso-8859-1?Q?4xEV+9f5Wt6NRSY9xz93zqe9hbLKaNFInZlmhmaw5iD/vnSuKe5S+DFnU0?=
 =?iso-8859-1?Q?vr2o9m8KFmxc4pIhq5zIYxNrgDJUDRccZ0ExKTRfdXZdIKyZCuxBViW0E+?=
 =?iso-8859-1?Q?LbCXHNI4J04dHuoT5D1J3sPf9nMyJDr2Tag3RxaREpG1zXD/0HNX5VQCY3?=
 =?iso-8859-1?Q?o9X4SPoivZE//N5pTuFxSU5/Rzendr8fFVuJQX6tHZiwYcTixjobwKtcvj?=
 =?iso-8859-1?Q?YcsrleMwbjG1ZZJtJMa/H70K17W/+imJrT91097PUZBwmI9ZnAKEbE29Ip?=
 =?iso-8859-1?Q?SmDDg8aQhBb4MNyCmatWGWKKldJALCnWVmEMVFpNL3owgv6uHP9WySV6WC?=
 =?iso-8859-1?Q?Za5RjN3f32Is21tq/5uwzsRqgSwORlBVxzbV4e2zyzMQgsfbQ8P+UrqZTe?=
 =?iso-8859-1?Q?LHlGCmxjgUaZ/XeamJ8fvb6BhsDOITSV3IGGu9xZRhRhbLLd1NwIJSxHVs?=
 =?iso-8859-1?Q?e/W+iRdz5MM5AzM8ROtu3awxwI/iLimYwxkojXaPLrVCK2dIsimjDPEvgK?=
 =?iso-8859-1?Q?5Ns1hI6Mds8rhlYrUHMMzXbmP5Y1VlX4rC9VpSALdiRKCRapLWgj79nJvN?=
 =?iso-8859-1?Q?zRAUeZ10b4M1xYJPpwJLtc0S2Yc/f9wpoRKW0c7dD0Llq+CEAvdL1MBkQA?=
 =?iso-8859-1?Q?GgLyIDRprIO3MboldNm6gJQG0+dgBXgcx3MoWTV93ynY4KRWsI/Dcn9IST?=
 =?iso-8859-1?Q?hRpfUPt28m2ke0moEzfxpO86rdvseNFqxjUSVlZAzfUvy3q5tlJnx+M9uC?=
 =?iso-8859-1?Q?q8epJyL56yYGAqodj0w4tj88b7ojQFSOmRB0EByy0DUev28Q12t7lI/bjg?=
 =?iso-8859-1?Q?8ij6+EhUqKz3Ft4wsd2qYQG5a59aUZ8Mmovv1EgUnbtkpHYhhlLr4MtUVc?=
 =?iso-8859-1?Q?tQrX/sGHDTKMGwkVBrExEjLSF4urt8hdVvfOCQm9c6OrMRuvU4++2TgHXk?=
 =?iso-8859-1?Q?8MN8zdU/VmkcY6VDpXTtSPP+pZT0OxpAX0wHvF/UFVawLH2wPUuUBGY142?=
 =?iso-8859-1?Q?dhN4WmwYsqJhA4rCGNgbBK5ErJxjykfLZTPuGZPTpls2c+RBP1nEV1iz9g?=
 =?iso-8859-1?Q?bW3516qwAN6jagUyLxSnnxCunJHvM6mrvT04sfs2gB6K/UToEi4DyRKcKH?=
 =?iso-8859-1?Q?hiSPRalTWUPaV86Dx+JKDm5vDRBmaaimVbPTYbfsflVrgFiW+3LfNAPfsD?=
 =?iso-8859-1?Q?bydpJjAe1rcbBcJTgo8Q=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?czEWIQCQWAWVBgYz/yxyRlai+N4LbvvlC6V9voqqeo8Cz72UbV97s51UNA?=
 =?iso-8859-1?Q?rkx5bzuG3tf2ohgz2/gTLPqCXGyfTcqUL/Gp72movT7sPsHw9wLO3cT6VQ?=
 =?iso-8859-1?Q?GFTf1ZE/U8hhlDbnOdSVUrMnukENvLJVVsbDcBuX8kSgPZCVWiad4NZHuM?=
 =?iso-8859-1?Q?QTJf68ZCKCeWaiusA0y1G1+gk67XLYrkRlj/ULLHotmqOlAaVTqyMAXXs2?=
 =?iso-8859-1?Q?7E5DgFl9mHzeDMfTlvS6fDyIYS1YnWZkti6cbMkAgX0qF6pfBNWkosZq7+?=
 =?iso-8859-1?Q?VPvtKi7nHUEyeIfm1LUDeen+3DXNFwYDyxE7FaQqfh7hm7tbI8no6Y9IOP?=
 =?iso-8859-1?Q?YDvI6MKx8i7h+4Qhcc+EmzEWWN1pzUuhuXaDBdBZ52afIpLUa9mWkcD9ab?=
 =?iso-8859-1?Q?wlNz0umbpRfcLvySMOnUPLLPg2M2PFs8RFj9XBmuVjs2ITdYS23iK/xpYy?=
 =?iso-8859-1?Q?WYT8KwB34lMC+gqKwjzdlHI3Z4jds/rFsuObC6rtUC69zaFFIIK9O2gILn?=
 =?iso-8859-1?Q?VZMhvM5uou12FMz2rf+9FBsEIlzHx8Zv9ho/Lht0kmClQUoXjBjzziUcyo?=
 =?iso-8859-1?Q?m3PF0rh7TdjE3Ax/cvr2Iyyo85GdMYw1+8AYnVjyWANWjcIPLv/uSznFI4?=
 =?iso-8859-1?Q?7qmSYa2xklbr80fb/o2PENF1KgDbfyjnmPjrP+WASZTWR/ixuB9PFn/IAF?=
 =?iso-8859-1?Q?Qc5GTPIkZIzf2hNwL2hbF1ILN1pJVkU03L7BRPkkAZz6b6UXbO0ilrQDvn?=
 =?iso-8859-1?Q?F2oCUwQkqBah0copo2wHiLYo5m+NeK1+/gIExbsSNQbk8A6+2osYQLJ+RA?=
 =?iso-8859-1?Q?P12bXtkko+8MZ9Jzje0EY2k/l7CRoxuu6ohDE6M0lNScAAYgDAgRTjbrMW?=
 =?iso-8859-1?Q?3v/MMYeOWXHS6qZUBssYKuEuZwSgWfSLivI9axBNV0EoTUQn0b7K7WVdR4?=
 =?iso-8859-1?Q?7KOWrvkXyczXGtL0GfVi4NcZeYSv1HZUmAORgM7t6oyG/womz0ezWjA3LS?=
 =?iso-8859-1?Q?bTi+Cywusz+RZ/5cUFvY+CMOLkNkWAj42ruft96CJEbTCNwBVcHBHnLLlO?=
 =?iso-8859-1?Q?pJ6Oq3MrV9/XxTn7OlNQUtLaZiAn+xgq6qsGuS4QPaOok/bOwHlSfkwueI?=
 =?iso-8859-1?Q?W8xlNKcevHu5qneQwkxy+eqHiWnE/bKdG4cJq8VqvN2CqGRnBXhnzrqJKo?=
 =?iso-8859-1?Q?hBnipY0RxO71Omf7Wc2dtzeVyA/14JSmi3VWTfL+GY5hSsC7vGeRCHZaar?=
 =?iso-8859-1?Q?R44feC949M5A0JVVBarPCRAfkhKuOz7mJ6syn13T7qN5Tppe/g9Td8wsBj?=
 =?iso-8859-1?Q?6eKTCJ1eBavw5FX3a83M5CjsrbP/rdUA21NJcdu6bZalSd/qaVmj7+U9Ai?=
 =?iso-8859-1?Q?D3mJfrNP0wVBAVrIC2rN/Qp7j4De8j/oJHmJwQqjgkasiK6gVlJGI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-71052.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBP191MB2905.EURP191.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7295e260-990d-48d2-73d7-08de6ef5f377
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 13:59:36.3402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P191MB1406
X-MailFrom: philip.jensen@live.dk
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LELYZDOOPTLAQLE24PVZJSG465W2HR25
X-Message-ID-Hash: LELYZDOOPTLAQLE24PVZJSG465W2HR25
X-Mailman-Approved-At: Wed, 04 Mar 2026 15:16:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Content-Filtered-By: Mailman/MimeDel 3.3.10
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FW3R2J3U6K5YGRPWBDIKWKFZA7J34C25/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 71D022026D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.39 / 15.00];
	DATE_IN_PAST(1.00)[337];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	DMARC_POLICY_SOFTFAIL(0.10)[live.dk : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	R_DKIM_REJECT(0.00)[LIVE.DK:s=selector1];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:dkim,alsa0.perex.cz:rdns,alsa0.perex.cz:helo];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[live.dk];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,LIVE.DK:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FROM_NEQ_ENVFROM(0.00)[philip.jensen@live.dk,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.947];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	TAGGED_RCPT(0.00)[alsa-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

ALC298 (144d:c1ac) on Samsung Galaxy Book 3 Pro (950QED) requires vendor CO=
EF init for internal speakers
________________________________
Hardware

  *
Model: Samsung Galaxy Book 3 Pro (950QED / NP950QED-KH1SE)
  *
BIOS: P11AKK.750.240404.SH
  *
CPU: Intel Alder Lake
  *
Codec: Realtek ALC298
  *
Vendor ID: 0x10ec0298
  *
Subsystem ID: 0x144dc1ac
  *
Kernel: 6.17.0-14-generic
  *
Distro: Ubuntu 24.04 LTS

________________________________
Problem
Internal speakers produce no sound under Linux using the legacy HDA driver.
Headphones and HDMI audio function correctly.
speaker-test runs without error but no sound is emitted from internal speak=
ers.
ALSA reports:

autoconfig for ALC298: line_outs=3D1 (0x17) type:speaker
speaker_outs=3D0
hp_outs=3D1 (0x21)


No Samsung-specific fixup is applied automatically.
________________________________
Root Cause
The internal speakers are behind an external amplifier requiring a vendor-s=
pecific Realtek COEF initialization sequence.
Linux does not apply this sequence for SSID 144d:c1ac.
As a result, the amplifier remains powered down.
________________________________
Working Fix (Userspace)
The following hda-verb sequence restores speaker functionality:

hda-verb /dev/snd/hwC1D0 0x17 SET_PIN_WIDGET_CONTROL 0x40
hda-verb /dev/snd/hwC1D0 0x17 SET_EAPD_BTLENABLE 0x02

hda-verb /dev/snd/hwC1D0 0x20 SET_COEF_INDEX 0x07
hda-verb /dev/snd/hwC1D0 0x20 SET_PROC_COEF 0x3050

hda-verb /dev/snd/hwC1D0 0x20 SET_COEF_INDEX 0x06
hda-verb /dev/snd/hwC1D0 0x20 SET_PROC_COEF 0x0001

hda-verb /dev/snd/hwC1D0 0x20 SET_COEF_INDEX 0x0a
hda-verb /dev/snd/hwC1D0 0x20 SET_PROC_COEF 0x0002


After applying this, internal speakers function normally.
________________________________
Expected Fix
SSID 144d:c1ac should be added to the existing Samsung ALC298 amp fixup tab=
le (similar to other Galaxy Book entries) so the vendor COEF initialization=
 runs automatically during codec init.
This would eliminate the need for userspace scripts.
Best

Philip Jensen


