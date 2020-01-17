Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB331140585
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 09:34:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 629C717C9;
	Fri, 17 Jan 2020 09:33:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 629C717C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579250083;
	bh=ftumhCRVj9BE8C/cJgUv1uvN+AOPt3yMR9L1MdubgwE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H9QCnum7gIFI3EiBJwWxjzSdFYQDJ1G5c5Y4U26zC1+KOzDaUKo507mThU1+dmRsE
	 0LAmlrt74Yl1pef2hbR9xZFD92TscqZbWjindTP7sUantSQrvR087FgA2jK4eB0AQ7
	 x1Xekz1THS3fvXa5JJDm2yySVsWox9cWOXgo2G2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 538D5F801EB;
	Fri, 17 Jan 2020 09:33:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BA19F801EB; Fri, 17 Jan 2020 09:32:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 399A4F800AA
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 09:32:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 399A4F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="L32wOJpY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PvxSGjBtAaXHLyktqaiw4XUYr75qloZYrEvpqSAfOtp3vZRQU4Nbt+UKGgQgV2EaxX1S7PKsaEW26pc9H/XhhYjGXPqKzq8mRVpSgVpSbIxzrimLAmE2L7VheXE8nTQ1Y7sojJNrDqNMLPjzxSkfwSUFW9kfuMv/y1MmQek5q/rgz+Ad9Vz/1zuLFHP8fisnsLARAwnh2X+BzBl3uLFe5RCgODAYrVVlAP3vUzJorJ/gwetVVR75O1nBWgaucfkfmThxC5OcGAjudGmdAnbd5sTJ+jPeGhYdyACMyy3kjnGXEPZRjmcjxDNG6CZck5raRPAlzdTJZk8pnTzqbHrY1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UW+UfMph/ycEJJ4KCxHZtRxX8+udXquxuHfUCqXY+A=;
 b=Z0M8VCUul+luG/lSUgST8iz0IG3JPvFDBZmXLNLOdd5k6Ra0NxcFZ1z6smrjUvGHEm5mfU+O+Pg+KkHzs2ZpQ+YHCCrmJTAKr4EJHKqi4aySnc+A4SfbnyCKPemKRBMfos4QNTlvRtAw5eA8029A4/BgrK2/c76RMGnMhCWqObrymzSjfUUilF7ZFnq/ArWiPJzUNJmbtXm+UG/muE4WnIVkKamxGamtM9J4vDBqz4ArhX3AMAwAdYOgs0ZJrNwHH1B+HWHJRYOYyEb6H3nSSzIh+uVbDqhVrzzDUeeON7ohs3a/XJmS8LCQLj9tnkQaDsC2j8HYT4SQRyZUmOfBMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UW+UfMph/ycEJJ4KCxHZtRxX8+udXquxuHfUCqXY+A=;
 b=L32wOJpYz4uHaAGZzM4/XCB85GM/jepDoucnQbkkardb5OXIb7G2tD1TCOOzas1xTi9Aa9O8yZdiYzsOUBQDpTzNl6J6U9IGAS1cFlcEo+Jd9oUur46dZO2qGxEorBJ/c9KkLZ0OjCyTa3MhJ/Spd9yDUdOegYe+3BRouQo1smo=
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB3584.eurprd04.prod.outlook.com (52.134.5.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Fri, 17 Jan 2020 08:32:50 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1%4]) with mapi id 15.20.2623.018; Fri, 17 Jan 2020
 08:32:50 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Thread-Topic: soc-core: Questions about cpus->name && cpus->of_node
Thread-Index: AQHVzRBzEGrRZE7OyEypH5Ci95j5Gg==
Date: Fri, 17 Jan 2020 08:32:50 +0000
Message-ID: <VI1PR0402MB38390D33CFFE4CC0D6AD59AEF9310@VI1PR0402MB3839.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7a07db83-099d-45b4-e1dd-08d79b27d6bd
x-ms-traffictypediagnostic: VI1PR0402MB3584:
x-microsoft-antispam-prvs: <VI1PR0402MB358428CFEE9B008EF239D5AAF9310@VI1PR0402MB3584.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0285201563
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(199004)(189003)(6916009)(71200400001)(9686003)(55016002)(66476007)(26005)(2906002)(86362001)(66556008)(44832011)(6506007)(186003)(76116006)(66446008)(66946007)(64756008)(7696005)(478600001)(52536014)(4744005)(33656002)(4326008)(81156014)(8676002)(8936002)(5660300002)(316002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3584;
 H:VI1PR0402MB3839.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N3QHKjxJS+ampqj4tdtEgJyvxnPKv7BkE0Q1Mp06yeSnxYQm3motzYUs2dLdTH2aZj4sOTDZi1fvP3ahUg1HfKKN5lF8Uhd1q6T7n1uNr4GIuuTk6fHdQWxHSRORYWWh6HrfRqYMW0xeJJtfvBIVCSorHKVdM+sYNUJ7WTpUgpnOw1PaWofGtzG1nRdw0hT4VcXUCKhq1ev25ITXbRSTe0I49by1/o1GYa79SbinTojMExL63Hckd3t4zh6y+/7hClnosZteUK8xfPTAI8Ht2mbicLmp9G2sfm3pETTKQlzgnKnYYlwrFHnsE2+g7R78JW48Gk4+BnWUBz7K4SPCvnHk3jQGyeVEJAkGZosI9kxeiSgxY1faXLb24mAe78RD+dmLKurclmlOEySbM1gildpHpRm9uC7etm1wVDQ3MtDXTZKBNLJM62lcl+sTNpQV
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a07db83-099d-45b4-e1dd-08d79b27d6bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2020 08:32:50.4223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q9pKyT0h8dmyAg/xiDCm5VdMpnR6FS/Yd8EbK9NmA1EtHnCc/BNafSDF6jGvzqNwZqnBTRnBq2I5vlpEDbRkHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3584
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: [alsa-devel] soc-core: Questions about cpus->name && cpus->of_node
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello Morimoto-san,

I have a question about this snippet from sound/soc/soc-core.c

=BB       /*
=BB        * CPU device may be specified by either name or OF node, but
=BB        * can be left unspecified, and will be matched based on DAI
=BB        * name alone..
=BB        */
=BB       if (link->cpus->name && link->cpus->of_node) {
=BB       =BB       dev_err(card->dev,
=BB       =BB       =BB       "ASoC: Neither/both cpu name/of_node are set =
for %s\n",
=BB       =BB       =BB       link->name);
=BB       =BB       return -EINVAL;
=BB       }

Here either the warning message is wrong OR the if () condition is wrong.

If the link->cpus->name =3D NULL && link->cpus->of_node =3D=3D NULL =

the warning message will be not be printed. =


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
