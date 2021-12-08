Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CA846CDE6
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 07:47:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2379B2218;
	Wed,  8 Dec 2021 07:46:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2379B2218
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638946043;
	bh=uypsIkPi6m3Xy1DL9Ex24s/2aWIMTTTWG681RBh5Kgo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D8n93z1KSVHPcCta8ZHAhpRwnRGNRDFJiNJCNjhZFdZTJ1TT+1WkmrKJc9x5fHZmO
	 bvZQpdNFhJJTPbS1/wFwC1/X6/uIwm1SpKDVJC/8iVwQRNO2C30rKxk7mTjjMVujOp
	 rYsXMeLRUN3L2uqpfa1LHl5iUcJFQA2iYB+plQfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D17CF80103;
	Wed,  8 Dec 2021 07:46:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E0ECF804E5; Wed,  8 Dec 2021 07:46:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96D16F800AB
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 07:46:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96D16F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="O/ZqsckT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aD2p7H5fshio5ZtfQCRCh/iCgDjQLgRqhTZ4KVmK4kZ7cX0ba02Ef/35WT1pdowSH+yenQuEDXskhIJxbR09NXcrhFMDnpuyxx0Tjnlfx5w9f4BoDPT9Ne+t1thY98pmAiLx/IdzCN3bJl5SRCr6BCAH56mk2yoM64w4zcJlgXw53uu5TNQzwhL5P4RDyU70XSygOu2q0Q2oqdu8KG+GgOrMyYvHjFZs+HwWgfZsEwqt+7KYqQQQi0fCbkXVVh3tOUD75IeNU5iNWG0nL0D70mPVKtywh3yDOEGrU0EQ9YpWvPYXQDgkTSx+L60PN1eE2mAgPyZC2ugW8u0v9Hcvhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uypsIkPi6m3Xy1DL9Ex24s/2aWIMTTTWG681RBh5Kgo=;
 b=QHnzGWpAyT9V4/tlXn4d0nDvQHwkODFMpXyxhPrPwGo1itsOuvDQWnTjRiLzuNWfDpo3lootM8zoeONwTw5KWnDDTCqEodhIFRD9m7HbSNe2vTulM4MVOAkt9ZCPpJtiOh2c437BTp5HEIWPovOJN6QzRXJgePtWExR4ljenPybOer/HKavHTBZJunns3xXnSShdKlzz806HuJH4D9X7v2YodgIEdDDHhctihNPlBuRQ7we+X9pzfePKFBKLpQrdaLwCAMI0euWuLE5IRUj7MoWrfl0fjoIGV+atS3db/18hlsHuXmwwwMyy+D6PfMxCFJmjKXuFf77DajG6ns9Tgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uypsIkPi6m3Xy1DL9Ex24s/2aWIMTTTWG681RBh5Kgo=;
 b=O/ZqsckTr27ysot/I58FT87ZoB/LZAau1bm/SHf08cbJsZMOA3sMk9TvhnTZ4pQ9HSszl+lDIUgLsH/sAkQ1TZM4nmvHVnkI36TuyayVxTka/skjbmMoBspkMN80lKlPJzf1Jeq6CPrb+oS2hBGF+fP2OP/0Km4C8pEcpYYg5RA=
Received: from TYCPR01MB5581.jpnprd01.prod.outlook.com (2603:1096:400:a::10)
 by TYXPR01MB1856.jpnprd01.prod.outlook.com (2603:1096:403:c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 8 Dec
 2021 06:45:52 +0000
Received: from TYCPR01MB5581.jpnprd01.prod.outlook.com
 ([fe80::3d74:9c2e:e85a:df82]) by TYCPR01MB5581.jpnprd01.prod.outlook.com
 ([fe80::3d74:9c2e:e85a:df82%5]) with mapi id 15.20.4755.023; Wed, 8 Dec 2021
 06:45:52 +0000
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH 1/1] ASoC: dt-bindings: audio-graph-port: enable both
 flag/phandle for bitclock/frame-master
Thread-Topic: [PATCH 1/1] ASoC: dt-bindings: audio-graph-port: enable both
 flag/phandle for bitclock/frame-master
Thread-Index: AQHX6+3kxOnKp+yLJE2VMnL4RP3HuKwoJkgA
Date: Wed, 8 Dec 2021 06:45:52 +0000
Message-ID: <TYCPR01MB55814B9B0A8EB9AD0193A00ED46F9@TYCPR01MB5581.jpnprd01.prod.outlook.com>
References: <20211208044103.405292-1-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <20211208044103.405292-1-kuninori.morimoto.gx@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67124897-c4b4-45f7-7382-08d9ba1660dc
x-ms-traffictypediagnostic: TYXPR01MB1856:EE_
x-microsoft-antispam-prvs: <TYXPR01MB185631027B9557047BA35DEBD46F9@TYXPR01MB1856.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zeBOE6z1+CXykRW7xyoT+rw2pqUA9BlBa5rt/1i4pMoV4wPaq1IX5DjFVKDfu3kuUbkrYgDeHhJyWlnRP0Ygezs0BXPqyxTc2ca3kouyeikdcRQN6tl2fHK+geNmBfsPhMhnfFSdMeK2zq/KO+eVvhPj22h37UWw3C7hklrdQAvfrpdRNVhqOoqAuHuU9ExNu7E6ILQoxMmlzWfX6gV0SBWfUfpP5lkTtyXvC8Gwih6FOEzht4NvYHlKb93oUMptKkk0Y20biSuX50SQ8ibsPdgWikp3fuzDGvXpX74bS3mq/LIFk9kzAJglZGrC2NJGqZX56bxV1hvJ4H/l/qhSIMwWIswV4wc0poJ9ip9/4hqx36oacBIUbvENVQLXZhAxmZ6V6u1SWRMpP2cUuvHkN7GSfzK3oz76Hh9chIKm0v8dAGLY5N1YG5a4YJEiYMpX1YgY0o6J2qoNgFWRGjjSeqAjG+2Lh5oAFFZHCXZ1YqgD05AqO6gn3WtN+/E66gHzm9JWvmCsEAgJzAYQnIbgSWb/L6SDn1jpVu/TefPDmKhc0wWrpNaQqC9gBP17zTLKXNJ7gCTuW/wU/XOQOtc19umxBLQBiRsacmi6G1lbtzETQ++wN7QuV32shyO1SpbaDQhRTZT4b6ACmL3IyiLFHsUmIo+PzeBUQjC5RXpJCp4nyLoEq7B+0o2MKdVeyRvER1ngQEp0BDcwbwuMJXLqRA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB5581.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(33656002)(38070700005)(83380400001)(55016003)(6506007)(54906003)(26005)(316002)(5660300002)(76116006)(4326008)(66946007)(7696005)(110136005)(508600001)(9686003)(52536014)(38100700002)(122000001)(186003)(66446008)(8676002)(8936002)(66476007)(66556008)(64756008)(71200400001)(4744005)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DUVF/qg8ol32XEhp7J5f3HZsgIminTkU8QwxK7pDHQB+uWa9o04adDjD/hoZ?=
 =?us-ascii?Q?n23GveN0XcKLOW4IQazpdoFN0EZHlg9vR3vIFgTYIL2qVGGE66VUGWfRI+xi?=
 =?us-ascii?Q?GlS+vIFRBvY4fjoc0PO/zoSECf25nW861qqNoeWjcvnGUz+013kOwnXjIaK0?=
 =?us-ascii?Q?ObTPGeA73k7FcFzDh33hyOjQy5MlfeokmdYEQxYCEDTQanBA+lBxauG13ZGQ?=
 =?us-ascii?Q?oiax1EesmFwc596KfciPHhpcIuuPon6oM3prZ8sp9FjSNhHltqpJ5pPBglag?=
 =?us-ascii?Q?8v8h02fdRgNCPRefYPM01NWKz6Wgn18Aq9L00O5MuWOxRHkvlE9R5J4TgUgg?=
 =?us-ascii?Q?/9AS7z93QoWFs3/W32+lu8Ky6OcTFuz3f7k3TxHlcYVmh+P4nmj/3bYrfjop?=
 =?us-ascii?Q?6N6spT/cjcoMW6+leOf5iW3406cEJ9vyK+aWP5dVqd4D+EMZct4MFBTWvsaf?=
 =?us-ascii?Q?mTJyF/SdHj02aDUpWFyiuWiOqeFoS0ADxMcMHh3Qn1pRtST9P8uuiUjjIyKQ?=
 =?us-ascii?Q?OOkpSyuV5Ep4DZd/RhQSksje37zeetII9FTPvsx+1y6PjeFSG20YayMJC7T1?=
 =?us-ascii?Q?ndatIufnqlw1npZ8tcAIfJeB3zvCDhL3S4k64zyz3QTtABWr+BDO53k/6Fno?=
 =?us-ascii?Q?GzH/oZ8PtmkxLfLcPQ75y+sSV0HQszVcTajgoaVZNZnMmoT2nci8DjS2BxeR?=
 =?us-ascii?Q?bDapOXeU7KaKOWHgVO8ijKvlqoPvvEEJsOYxUncxt7wzl7naVHMZl7w2MVFi?=
 =?us-ascii?Q?WIQirLITwNaGbmyBwxdOHsi55cgv8IetttDN0eVxAqAq5a+mTF/W+6qy4tMX?=
 =?us-ascii?Q?wYq/ewzATP23uqdnEzfLspgF0t59koLSokWkbTD/GmAibpQPNMBNlgZKYp6B?=
 =?us-ascii?Q?2pSxDsNke7Gqg6df6kCUrqk5yqqXDR5UJDxp/f1c1Ah61Aei7y4+N27NIJq3?=
 =?us-ascii?Q?G3bJCqqkzE85YtyUJyiV4OTojwHJqWe1T0rVV9utDhWHxR84JmouDYvTy0V4?=
 =?us-ascii?Q?x480ZrtnVTVBfMUqoCJQ9ODnHMooKvhmkG8tMoLW3XWxp3ittjw5ekqFZebD?=
 =?us-ascii?Q?ROz0aKowa4yKPgNcFztyAG2Dq/QusznylPEygqJKczBK0/U0N3Hx1T2FWEaU?=
 =?us-ascii?Q?WPw98oczZT4VBUjxSqBMkUeILThNVsZxFi9BkJpWq4HHgdzUldvb2Pgq0TEv?=
 =?us-ascii?Q?4X7ewuddJ1gxfkmnfa3KnGjAFPcTNpvDfaQeBKFzdTzD+4H2X+EQ9CXtyZvD?=
 =?us-ascii?Q?pXAwiPb0kpYaOjsOMv1hAbpBCuoforSZsqLu+42CkwVHMehOBuIJd1Y6zUYA?=
 =?us-ascii?Q?zQZcVu55nH3Cht7+9zp+ZKF1ptKU7O+pMQjkRueiu9tMecomkL8kzFeFrClI?=
 =?us-ascii?Q?l0O5UB8lZcRKZhXezxsK5CCK1PaMAWHozRQvU3mpvv8bwJyfseSR8QMf3uwk?=
 =?us-ascii?Q?BqqJymganaRwfPUJouu585gADv+cKi6fYmV+XT7OgX6pmhH01sjA2GHILkA0?=
 =?us-ascii?Q?a+dEJdbBFdlf4zKgBrFODiDlkaSeDguxTYCFm5II7iLS6QNgkzv+Qf6/7BoF?=
 =?us-ascii?Q?oYxEiieG7D02g3vewdwoJ46ZWqvp16JYyKKBqNpxUWhCGOG0drtPZUOJM/nh?=
 =?us-ascii?Q?wKR/+M7F/6pNlYbQA8j840PVe4+ojBJcoe3LlQ1hFZ09eLh/nBJTuBGR3ePO?=
 =?us-ascii?Q?1XebwmqIcSEIAs0eo/P8VUUnWPEiRy4wz1ZVb732CHI1Aq92+lTniwbqLBTk?=
 =?us-ascii?Q?30wnMYEKtQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5581.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67124897-c4b4-45f7-7382-08d9ba1660dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 06:45:52.5649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JZxpIO3WOY5VDygSOLkr0nEkE+Hfz4hcotBERAmfThSrnFcBMh9vhzlXP5ymndEC/N8rEj8uRDFhC2AkQv4Lt7+AI/2YDl82GOJVLvAgUJ8MDn0zPFPmfNbxjOO6pV4T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1856
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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


Hi Mark, Rob

> snd_soc_daifmt_parse_clock_provider_raw() is handling both
> bitclock/frame-master, and is supporting both flag/phandle.
> Current DT is assuming it is flag style.
> This patch allows both case.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

It was not good patch.
I will re-post v2 patch. Please drop this.

Best regards
---
Kuninori Morimoto
