Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D98619291
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 09:17:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2EE61683;
	Fri,  4 Nov 2022 09:16:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2EE61683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667549844;
	bh=4MVJpdoqdJh+6Z8We6h/gFARiMjljyqDO1SZ2ZSXMjw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=csPVQ2KcgRQyzLhZ/6FK9IYVNVLi5opP+3zM9Vfvstb8J6G3GpjVU91/Ucfs1UGDy
	 tzb3qpRd6vZvViKHd9CXS6ylKeaXWLOXp+c8xM+4LpMU/yyRGJnkfgbyBgnHXajFat
	 SeCt9HIksg3UnmsChp3DQokQLppuv1YsJr48Tm+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53B4FF80506;
	Fri,  4 Nov 2022 09:16:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCFCDF8051E; Thu,  3 Nov 2022 14:03:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, HTML_MESSAGE, PRX_APP_ATTACH, PRX_BODY_135, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mx08-002baa02.pphosted.com (mx08-002baa02.pphosted.com
 [185.183.30.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5C47F80155
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 14:03:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5C47F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmv.com header.i=@gmv.com
 header.b="pKXyAN/j"; 
 dkim=pass (1024-bit key) header.d=gmv0.onmicrosoft.com
 header.i=@gmv0.onmicrosoft.com header.b="EvNNK+ct"
Received: from pps.filterd (m0205082.ppops.net [127.0.0.1])
 by mx08-002baa02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A3ALvdE027087; Thu, 3 Nov 2022 14:03:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmv.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=gmvcom;
 bh=cGzzcOXW4OKB7PzFzOdACKIxoRZ+Z4kRyPFQtBVRCSs=;
 b=pKXyAN/jubLVhZOYrIEaFarQPn7ffpMXL3ZTrVNYdiwOC/LVSDRl/wYOoI4+4gc4ja9J
 9TbGqPozTWQksLdyXyL/Q0Lk7Szb5ArPQJATpfuI/DAg3fJ7xmD1NgcRHA7sR0TbLZ6q
 8HM2lYW2f0POpbm/2BCYj5c7mp0y7NkwxtMTFx8icQ3QwCQYft9QwA1ZTFIoBv/P6j0W
 S0qXHT3fxtm5q/Z2+2CyCpWbFeZzF2yt4Kd8ezkvAJ6+InGaGhVb8JGwiC6Nt55VcCfx
 ELu4n3VcAUmsMMT4+SOyqj+cgim7vMed7LM4ugx0xHPRmZNAcNNZ2kjikiVmpUPqWEya +A== 
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53])
 by mx08-002baa02.pphosted.com (PPS) with ESMTPS id 3kjgvwtreu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 14:03:05 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIhXL9UQq3Qm9Ky2OX463FMuOrY811cmBH82DSfx2bvrZ7arrQMzwwu96fKDsNgtyLSkKrG4+hvRMoC9d/X23qIN1tIVsvW3eQj3XI48XOfnOrf4bRU3CgIVU030Ate5u/ctaftR4nm26XX1BJKEQYafIGzG697WoAxi9/i26NWpVokKfC2j3M1DdkCPRpd+JablOJaCWeavBHnRT/Pn5Waz2fPAZ4erZOkooPPXyVmeIgIrHonii1VJhnCG2IMoPfjPWHaUar3fL1LzTpvvB9RfMxHPjnkno6GcK55cAW53Kt3Qe97WIM9z5143zFccpTSFJJkj9tZSAWsTPEGH4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGzzcOXW4OKB7PzFzOdACKIxoRZ+Z4kRyPFQtBVRCSs=;
 b=c+Y4O1bmhpgQIxOKyRGNIc9DxQ+kTLbpmnR/e7Qy4AbxvZspzvFNURsJsMoib31W8/MNg65Yiym6Dr3KxnQmzeAlk8skKZhbT4Q0XFNN/JQi3OD4/LMPanT8fcdpA8cMw0Ogm7gjQpKUO9cBIxNk4HMNj57eBn2D3WefGG3T1zFlcQrV747xuJD+H2QvO6Xy8kmsUCWkYOrYHuhcH0tNUfpF91dwqdwpnNwGrL7khZsbVamcRdSk1LEGNEuJ9DVtRQWrBjAMF5NVeXg9ZU3GtGjZTzTmdk1tMmeJhqCNskbLv6ZFAthtc0VLkm7FTdrIif9umATxGA2mE5ORCRvccA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gmv.com; dmarc=pass action=none header.from=gmv.com; dkim=pass
 header.d=gmv.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmv0.onmicrosoft.com; 
 s=selector1-gmv0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGzzcOXW4OKB7PzFzOdACKIxoRZ+Z4kRyPFQtBVRCSs=;
 b=EvNNK+ctio+QMhQ/B7G0zmbkorKW21Cn0Ae7wy8N2Tmhfmf2u+HRP2CjB3n8Gh6V7XMvJAGoY5TA+PDDfEfMFvgcbOVE0eAbYWe2ijwq9+ALTsaXFxMMsKQ+mTAtXLP/LvpJxxSv/rS+LcLVCu+ix4kXUWOsKJVbjXeHHynCspM=
Received: from VI1PR07MB5839.eurprd07.prod.outlook.com (2603:10a6:803:ca::15)
 by DBBPR07MB7404.eurprd07.prod.outlook.com (2603:10a6:10:1ed::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 13:03:02 +0000
Received: from VI1PR07MB5839.eurprd07.prod.outlook.com
 ([fe80::4dc5:a2c4:279f:fdcd]) by VI1PR07MB5839.eurprd07.prod.outlook.com
 ([fe80::4dc5:a2c4:279f:fdcd%4]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 13:03:01 +0000
From: Juan Alfonso Reyes Ajenjo <jareyes@gmv.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 =?iso-8859-2?Q?=22Martin_Povi=B9er=22?= <povik+lin@cutebit.org>, Charles
 Keepax <ckeepax@opensource.cirrus.com>, Fabio Estevam <festevam@denx.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] Fix tas2562 volume table values
Thread-Topic: [PATCH] Fix tas2562 volume table values
Thread-Index: AdjvhFHMhYr2+umyTwml7qloa11uJg==
Date: Thu, 3 Nov 2022 13:03:01 +0000
Message-ID: <VI1PR07MB5839C95198DD090316E87B78BA389@VI1PR07MB5839.eurprd07.prod.outlook.com>
Accept-Language: es-ES, en-US
Content-Language: es-ES
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR07MB5839:EE_|DBBPR07MB7404:EE_
x-ms-office365-filtering-correlation-id: c0e2bc97-8a5e-45f7-6805-08dabd9bbcd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KYl2RO0ClZ4OimSJ43kB5UaCwik7pEvNPRp7CiBlFKaAvrnTFCwLn9IoLXeDpctTSh3Knp97tVHTJNPORNtargVsad5RAQ9tutx5Ddls1MolnOcJgSoAzSaFuS/MOinecNGzSO0LLktI4BaDVdnXuT9KaObuRefkDmjb5rG3KK0igiOYiM0dp2scqtRWkJsSeF+VpHUqgioeuNAB6mAt/a8o8aZI46RfPCIQ0GjlFfBS3/7tf8U1nsCzAVmv9zXm7JH+bqmKiiEze5DB9FfRdycpj3ER8z4kI7ow0UeZgEBVwlvkbFpIXJBLOAcFZQq1S/PPKNFnN8c52x9jIR4ARBbxBu7OjvUsASF51+ZfnIl83xaJdYt8exuFwF1IiTmCZXKmyEZaa+n9wzsDZwLdTCu/t0rcGTUMipY0sNo8eDCJq21DiAkho3b6U2JRaIqzxxgNduaixpteaO85h012k+XpO6gm+UmxlhS4YTlE8LTWwugvEy2m1ZUVaPhxaSm/sn/dS7b1ofvF1AGfSZbrTNo46UnIrFbmj6OFaQxFDh2oImUTYA1xqlrBRUzi+0gJl9ZDSDkG+35lXsDg5r05KeFKNCPzoHkkOYlbdc2oFVZffVLgy6ug4m0rsYpWAIlu6Q7u7HFs3Bz21jEdgOdcBnwQjlEi4gXMf2fMaJiHR3wShnHB0zTztWJ6cj2BfRmj7TbZV3PSQwwbDQCTFv5VcSaXSDKy0LQtCk9Ys2OEzX3xRCYsOvC21uocnuBSquePAdxWbmLsZUn1KgaAaG4rs1cdGhvSoB0e7m/0prZ8aDSu2osql9H2e7585XgaeK1I
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR07MB5839.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(396003)(376002)(136003)(39850400004)(451199015)(6506007)(7696005)(26005)(9686003)(86362001)(186003)(38100700002)(8676002)(8936002)(66476007)(66446008)(66556008)(110136005)(64756008)(478600001)(52536014)(5660300002)(71200400001)(33656002)(38070700005)(4326008)(76116006)(19627235002)(41300700001)(83380400001)(66946007)(99936003)(55016003)(316002)(122000001)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?/wiCQek0WTGtahWElqB0KSpzjbOfgpKEtqcYKCZEszyYEtK05PtYGY7FIg?=
 =?iso-8859-2?Q?XL2VCDlDHFBhDW8lCAIok+9ki0guyjnNdJ4rFJ2cTNOxXTgFoQ3hco+KVd?=
 =?iso-8859-2?Q?bf476TZFux2v5y/DXzVaDnIUcMN6mKieajBDrQID6SEhNghDTBgFa60ken?=
 =?iso-8859-2?Q?BIiGvljysRGqVwTyxwMWEBVZlNVhg1wHxawq+VPIPqD9tWeS/pCJ1jslXR?=
 =?iso-8859-2?Q?+nFdIRJWdT39SJbGt/OshHXKCuh6HB7tTCHpR1FRjTyDQiifgG9EZP8Brx?=
 =?iso-8859-2?Q?HByEntzvfx63gfNU+u4xHt5PpFFrw7OTLbGUiRU8Pl6cUblRJwObRaiVIP?=
 =?iso-8859-2?Q?S7kd7FaXO+uE7HQnB+M+w9WCarcWZ9vUwsgQQmcykszcY6etK4NvDfOSGZ?=
 =?iso-8859-2?Q?gtzPoZoVtSoy/MuguU//ft7rMR8kxttvVwlChsfFv/5akAIlMtdhLhHExa?=
 =?iso-8859-2?Q?VF1Stft+s+T0eB97HGFfOWumCbZlAn3pYPVZilwoIAN7/HFfQnGkEc3ZjM?=
 =?iso-8859-2?Q?vPUY2m7DJG9eN329Q6I5Z3U8OXdRk7Zi/GFCg4FMsOqm0zG+Gm6B4uvEW7?=
 =?iso-8859-2?Q?isOdWAob8uGiEjGjdGBnhNPWfNELnThoBgJMPGN0WiIBC5SxX8x3xAUDzY?=
 =?iso-8859-2?Q?asocg551fJbui7JAXmXuQH4NTNZE7SD3t5ZepSJX1tgRQ/AZ9wGacXfQq6?=
 =?iso-8859-2?Q?wnJtfAoJWFz9T5BEJfPj0I0pkmR5NvREb0rzR2zL8oOWGzOk7COO/uhzI9?=
 =?iso-8859-2?Q?bRv1/1XVIuC2exmvxQ89qxAKlT/YiF/etTheTfLhzE+nUhSVFaV0r80Yn7?=
 =?iso-8859-2?Q?jSIBnzyx7hdl0+dFEzuYa4KZ3h2beRPlj2J22M4INal0MZ7rg8Oyfd50Ed?=
 =?iso-8859-2?Q?xq9Yy3FrLHlXNEF2SF6bswKKbKV+AWEwb9kvcqI/zNLqgJ8h2609APWUHr?=
 =?iso-8859-2?Q?1VkbIxWlqj19/zi9J9TRZ2wkzsywJ8Kf/f1uXEuOACDwxp4m3u+dqZpKQ8?=
 =?iso-8859-2?Q?c/8qh+szod8hHh8Nt1KcqQMsgoBCHzfIQzYi4lqRXEO/UN/oUQwChjpkai?=
 =?iso-8859-2?Q?XcUSIbm5Uh5DzNdTu/xsvwsG8aoIzZx7OKCBMK4MNmZ/8t+kr+IspagdZ0?=
 =?iso-8859-2?Q?lOG1V6xFATdIqFkiAsNo0LpzxGADrmo7pI6HDKxFFGkNBOvjt1nRBQcjYT?=
 =?iso-8859-2?Q?IScu4DE4fD9bclSVnfMbVxYEFwemSNDuaRvZ726QWc1d90EU7RhANW0QSJ?=
 =?iso-8859-2?Q?GJQtYp8gB5a48mjmR9FPADs4pBOEtBZcfKJdb6I9nKZWK27VNgLLQREF1D?=
 =?iso-8859-2?Q?IbLkvqcXkwWoYZF7XwbN0PwwmNOQCV26VK2PdvJtPm4AF+K9K9K6uaACIg?=
 =?iso-8859-2?Q?byJOeKJaHkYDZjygNB9gZU4tLTv1ntQBfNjS6sQ9R/Z3jRUcx+wjuumBfc?=
 =?iso-8859-2?Q?i/EJalBzg/z86FpyP8cb+qcIVNAuvwMX8aQFzX9rzBX3O+EPVRolhGwc8Z?=
 =?iso-8859-2?Q?PII/VVRgsO4csIoiNfDnbhvS9w1bovpRge1C1tTiKJCqkCpR+8Q1wxoaE2?=
 =?iso-8859-2?Q?BGkS2pdRrOIAqZIfRXyNB6yUH3E5n8eykxDE1kWDUrxv8kKtnDO71F80y+?=
 =?iso-8859-2?Q?dVdtXVk97YUVA=3D?=
Content-Type: multipart/mixed;
 boundary="_004_VI1PR07MB5839C95198DD090316E87B78BA389VI1PR07MB5839eurp_"
MIME-Version: 1.0
X-OriginatorOrg: gmv.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR07MB5839.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e2bc97-8a5e-45f7-6805-08dabd9bbcd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 13:03:01.1979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a91f586d-1511-4f1f-988d-fd1461dd5916
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I9YidLkW1Lugmoz4E4VVHlr/WiJLnqvILLdUarPoNso5iyJSxrBfUThkzNdEbmA6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR07MB7404
X-Proofpoint-GUID: pVngJmo0VHzrU4MXjLItN0enfZ5JDOHT
X-Proofpoint-ORIG-GUID: pVngJmo0VHzrU4MXjLItN0enfZ5JDOHT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Fri, 04 Nov 2022 09:16:02 +0100
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Gustavo Plaza Roma <gplaza@gmv.com>
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

--_004_VI1PR07MB5839C95198DD090316E87B78BA389VI1PR07MB5839eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

This patch fixes -90dB value (0x84a3 instead of 0x695b)
This patch adds missing -20dB value (0x06666666)
float_vol_db_lookup must have 56 values as volume is from 0 to 55 (0-110dB)

Signed-off-by: Juan Alfonso Reyes Ajenjo jareyes@gmv.com<mailto:jareyes@gmv=
.com>
Signed-off-by: Gustavo Plaza Roma gplaza@gmv.com<mailto:gplaza@gmv.com>
---
sound/soc/codecs/tas2562.c | 7 ++++---
1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index b486d0b..acbdf77 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -33,15 +33,16 @@
static const unsigned int float_vol_db_lookup[] =3D {
0x00000d43, 0x000010b2, 0x00001505, 0x00001a67, 0x00002151,
0x000029f1, 0x000034cd, 0x00004279, 0x000053af, 0x0000695b,
-0x0000695b, 0x0000a6fa, 0x0000d236, 0x000108a4, 0x00014d2a,
+0x000084a3, 0x0000a6fa, 0x0000d236, 0x000108a4, 0x00014d2a,
0x0001a36e, 0x00021008, 0x000298c0, 0x000344df, 0x00041d8f,
0x00052e5a, 0x000685c8, 0x00083621, 0x000a566d, 0x000d03a7,
0x0010624d, 0x0014a050, 0x0019f786, 0x0020b0bc, 0x0029279d,
0x0033cf8d, 0x004139d3, 0x00521d50, 0x00676044, 0x0082248a,
0x00a3d70a, 0x00ce4328, 0x0103ab3d, 0x0146e75d, 0x019b8c27,
0x02061b89, 0x028c423f, 0x03352529, 0x0409c2b0, 0x05156d68,
-0x080e9f96, 0x0a24b062, 0x0cc509ab, 0x10137987, 0x143d1362,
-0x197a967f, 0x2013739e, 0x28619ae9, 0x32d64617, 0x40000000
+0x06666666, 0x080e9f96, 0x0a24b062, 0x0cc509ab, 0x10137987,
+0x143d1362, 0x197a967f, 0x2013739e, 0x28619ae9, 0x32d64617,
+0x40000000
};

struct tas2562_data {
--
2.7.4

--_004_VI1PR07MB5839C95198DD090316E87B78BA389VI1PR07MB5839eurp_
Content-Type: application/octet-stream;
	name="0001-Fix-tas2562-volume-table-values.patch"
Content-Description: 0001-Fix-tas2562-volume-table-values.patch
Content-Disposition: attachment;
	filename="0001-Fix-tas2562-volume-table-values.patch"; size=1737;
	creation-date="Thu, 03 Nov 2022 13:01:00 GMT";
	modification-date="Thu, 03 Nov 2022 13:03:01 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlZmRiZDFkM2FiMzNhZjU3YTAxYWI4OTVjNzNhYWRiMjBlNTc0YmM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKdWFuIEFsZm9uc28gUmV5ZXMgQWplbmpvIDxqYXJleWVzQGdt
di5jb20+CkRhdGU6IFRodSwgMyBOb3YgMjAyMiAxMzowMTo0MCArMDEwMApTdWJqZWN0OiBbUEFU
Q0hdIEZpeCB0YXMyNTYyIHZvbHVtZSB0YWJsZSB2YWx1ZXMKClRoaXMgcGF0Y2ggZml4ZXMgLTkw
ZEIgdmFsdWUgKDB4ODRhMyBpbnN0ZWFkIG9mIDB4Njk1YikKVGhpcyBwYXRjaCBhZGRzIG1pc3Np
bmcgLTIwZEIgdmFsdWUgKDB4MDY2NjY2NjYpCmZsb2F0X3ZvbF9kYl9sb29rdXAgbXVzdCBoYXZl
IDU2IHZhbHVlcyBhcyB2b2x1bWUgaXMgZnJvbSAwIHRvIDU1ICgwLTExMGRCKQoKU2lnbmVkLW9m
Zi1ieTogSnVhbiBBbGZvbnNvIFJleWVzIEFqZW5qbyA8amFyZXllc0BnbXYuY29tPgpTaWduZWQt
b2ZmLWJ5OiBHdXN0YXZvIFBsYXphIFJvbWEgPGdwbGF6YUBnbXYuY29tPgotLS0KIHNvdW5kL3Nv
Yy9jb2RlY3MvdGFzMjU2Mi5jIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvdGFz
MjU2Mi5jIGIvc291bmQvc29jL2NvZGVjcy90YXMyNTYyLmMKaW5kZXggYjQ4NmQwYi4uYWNiZGY3
NyAxMDA2NDQKLS0tIGEvc291bmQvc29jL2NvZGVjcy90YXMyNTYyLmMKKysrIGIvc291bmQvc29j
L2NvZGVjcy90YXMyNTYyLmMKQEAgLTMzLDE1ICszMywxNiBAQAogc3RhdGljIGNvbnN0IHVuc2ln
bmVkIGludCBmbG9hdF92b2xfZGJfbG9va3VwW10gPSB7CiAweDAwMDAwZDQzLCAweDAwMDAxMGIy
LCAweDAwMDAxNTA1LCAweDAwMDAxYTY3LCAweDAwMDAyMTUxLAogMHgwMDAwMjlmMSwgMHgwMDAw
MzRjZCwgMHgwMDAwNDI3OSwgMHgwMDAwNTNhZiwgMHgwMDAwNjk1YiwKLTB4MDAwMDY5NWIsIDB4
MDAwMGE2ZmEsIDB4MDAwMGQyMzYsIDB4MDAwMTA4YTQsIDB4MDAwMTRkMmEsCisweDAwMDA4NGEz
LCAweDAwMDBhNmZhLCAweDAwMDBkMjM2LCAweDAwMDEwOGE0LCAweDAwMDE0ZDJhLAogMHgwMDAx
YTM2ZSwgMHgwMDAyMTAwOCwgMHgwMDAyOThjMCwgMHgwMDAzNDRkZiwgMHgwMDA0MWQ4ZiwKIDB4
MDAwNTJlNWEsIDB4MDAwNjg1YzgsIDB4MDAwODM2MjEsIDB4MDAwYTU2NmQsIDB4MDAwZDAzYTcs
CiAweDAwMTA2MjRkLCAweDAwMTRhMDUwLCAweDAwMTlmNzg2LCAweDAwMjBiMGJjLCAweDAwMjky
NzlkLAogMHgwMDMzY2Y4ZCwgMHgwMDQxMzlkMywgMHgwMDUyMWQ1MCwgMHgwMDY3NjA0NCwgMHgw
MDgyMjQ4YSwKIDB4MDBhM2Q3MGEsIDB4MDBjZTQzMjgsIDB4MDEwM2FiM2QsIDB4MDE0NmU3NWQs
IDB4MDE5YjhjMjcsCiAweDAyMDYxYjg5LCAweDAyOGM0MjNmLCAweDAzMzUyNTI5LCAweDA0MDlj
MmIwLCAweDA1MTU2ZDY4LAotMHgwODBlOWY5NiwgMHgwYTI0YjA2MiwgMHgwY2M1MDlhYiwgMHgx
MDEzNzk4NywgMHgxNDNkMTM2MiwKLTB4MTk3YTk2N2YsIDB4MjAxMzczOWUsIDB4Mjg2MTlhZTks
IDB4MzJkNjQ2MTcsIDB4NDAwMDAwMDAKKzB4MDY2NjY2NjYsIDB4MDgwZTlmOTYsIDB4MGEyNGIw
NjIsIDB4MGNjNTA5YWIsIDB4MTAxMzc5ODcsCisweDE0M2QxMzYyLCAweDE5N2E5NjdmLCAweDIw
MTM3MzllLCAweDI4NjE5YWU5LCAweDMyZDY0NjE3LAorMHg0MDAwMDAwMAogfTsKIAogc3RydWN0
IHRhczI1NjJfZGF0YSB7Ci0tIAoyLjcuNAoK

--_004_VI1PR07MB5839C95198DD090316E87B78BA389VI1PR07MB5839eurp_--
