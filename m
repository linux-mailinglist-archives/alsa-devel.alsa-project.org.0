Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0581EDCF8
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jun 2020 08:11:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 980E1166E;
	Thu,  4 Jun 2020 08:10:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 980E1166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591251091;
	bh=ldY1mE+QvUO1VBGmaibNyPQm291wFIieZnzk/Lim9hw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XL6cZFjPqWfF/WaHlN9XOvqAmApT3CSU/vw/osR0vkJR/Z3csuQwP/HehZ78JhRZU
	 33EtChY3yx2yuOhVATlx9Mu+DrrnP0d1tdSQmFRbJtXVgxvM4EeW+jvHQak52RuJ1r
	 u4vt/mBv8ZgaFR+8svTmiMTxMKnMeAXbdx9XY+Kc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0CCAF8013C;
	Thu,  4 Jun 2020 08:09:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1243AF8026F; Tue,  2 Jun 2020 20:59:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,HTML_MESSAGE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05olkn2044.outbound.protection.outlook.com [40.92.91.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80195F8013D
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 20:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80195F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="HA+VlhL4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXX/amd0zjSz95ZAuONToz8iRh0ldRcj+RxhYG/VZVdgnkx1M/kpK8vs3R0TmYkzxLRDUzJm8g/WjAAQzagwDOu0o4p87DzghxI6eWQkBDfyLFFnhMmzvf0eTEGIzfmIo3rP7lL+36pLUjgEup3d5RLZfkDNhzEvYVyi238ZgYU+HUkeNcBVnxaEJBy/cPAoozeQpD0RnzMPiWFeMR27dYeiTJAAYB3XEaF1Lj15sQqM+w8hk6GtXwDES+Nyz6VFA/XGSyeuJkpcjfv4Tyx2qYrio1r8sESFudq9bp7qjkQRBYdTwTPaRcllbKXMwLter049f0F+N7sq99DndpASww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrlPRszgZqmhFjHvw5g7k/1YQ/nEXqC9YuIhGXMSbac=;
 b=Z16z88VuWCcarF5mz/M5zfqgTMMobD1NqSAOEPpdCoRD5eFHqu6VyocAjkKWFTjHY/hyY8g1LDMthI0g4cG3VSUHsXotK2+ZMbjjEiQ0QlT2V+tJSg/zX11qfV/iUieul5RK/qHvb+WSa6HtRRPvrClFXDX/jH9hzdc7t/DDFOFMSlnPk+HGyCgdX4XABpNJv+4OGVT0C1EwDVELtbpCUJ3roZaKm7I7dlu8CLf311bGHEO7D7r/X8RU13YnxxolTYsJpqLatA/M2ktKReb6rTsO8wDJ0h7nMZdNb8jOe46tE9PpS9BKMMZPQtaMzvVb4z5OkjEDv0Gb/yWeyQap2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrlPRszgZqmhFjHvw5g7k/1YQ/nEXqC9YuIhGXMSbac=;
 b=HA+VlhL4E7v1l0qlh1yeD9edFKUJHBxrJXi05NStE8dsCDGqhCuOkHkYhYCfGP1LgkZxLAn3+WTTpmArIfXrTTvSaTCjw5FtH90Uio468LOv2n+YF0gLf2n8xBO4LEIMr6368R5hDBLmyFTguR//Yau4lvXQd7hLf+qN7yRdjNmB9U4jRo/klaTyBgGv0C26J9w6lIJ+YLcV7zD/nmAKOhGQ+q74P0qMoLTsx0qVy779Q8Y9qQjaCyIqSjh1AAxdzNOvpotTugVAGgBGizPmUiVDPkplCQYUKIablIy9YbZLpdYyhPkBPo3jZ16rs/OC3ksBhvFtfmtQ0kqe9/AE4A==
Received: from VI1EUR05FT010.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::45) by
 VI1EUR05HT023.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::311)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Tue, 2 Jun
 2020 18:59:30 +0000
Received: from AM0P191MB0643.EURP191.PROD.OUTLOOK.COM (2a01:111:e400:fc12::53)
 by VI1EUR05FT010.mail.protection.outlook.com
 (2a01:111:e400:fc12::159) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Tue, 2 Jun 2020 18:59:30 +0000
Received: from AM0P191MB0643.EURP191.PROD.OUTLOOK.COM
 ([fe80::f17e:9463:b40b:bad4]) by AM0P191MB0643.EURP191.PROD.OUTLOOK.COM
 ([fe80::f17e:9463:b40b:bad4%4]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 18:59:30 +0000
From: Tony Dijksterhuis <tony.dijksterhuis@hotmail.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Cmi8888 iommu fix
Thread-Topic: Cmi8888 iommu fix
Thread-Index: AQHWOQ8REAxcl1+tVEGkvqr+hx8T3Q==
Date: Tue, 2 Jun 2020 18:59:30 +0000
Message-ID: <AM0P191MB06437F8A12EFEB1319324DEFF68B0@AM0P191MB0643.EURP191.PROD.OUTLOOK.COM>
Accept-Language: nl-NL, en-US
Content-Language: nl-NL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:6F962992EF29454D44AC6E6B9A11E3E183E6C2C12BA386ED431CEEA448E9B969;
 UpperCasedChecksum:4B0504AA480587854C18DD4C494A3347E66C35260106482D9C4B028A16DCEB48;
 SizeAsReceived:6660; Count:42
x-tmn: [2j8xYjMqzcdcYrmRC5cLQCv1iu1N+37W]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 60ced9f5-feaa-4d64-b065-08d8072714c5
x-ms-traffictypediagnostic: VI1EUR05HT023:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vhkfEkMCISUMTOR/wbFW36Kb2XFhFrmc6HOvCxpNIEeCLCPBUjUu/3wpdx/KKB010hymT4F2D0ATHoDQMIAv8QcKX/jRY8x6I1il+EiZdTmXVWs8KTGwN+4Bs7RxwZMIZuj1HsWuVFENBgJXbpyyZguWNq8E8kUDXObT/24PJlJ6Zb3olX7EtY4VZ4t+C/V/QT06brxIxQDLb5oYievvfGV0fh0XrI9T7m/ax0TPt1l5ZnhE91adJ7noFkcfnRIo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0P191MB0643.EURP191.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: mrqg5VDe/qWX6OBuXrJ4Ixca4w6i61ezbFa2HAPD8Wk9zJpUXzMXdf8IX2ow+aNwP0X1SK+/XV/zdVMhA3wg8ZD9Iyu9ZehBPjRVGT2F/gzGd0bb70QqZS9wI/jpc/mJ7bu26QJhtRJoWKslOWrzCA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ced9f5-feaa-4d64-b065-08d8072714c5
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2020 18:59:30.6026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT023
X-Mailman-Approved-At: Thu, 04 Jun 2020 08:09:48 +0200
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi everyone.

I am using a pink faun i2s (CMI8888) card with a x470 board and amd ryzen c=
pu.

From the first day using this card i was not able to get or working. Al i g=
ot was stuttering sound.

After many hours searching i found the thread below

https://www.alsa-project.org/pipermail/alsa-devel/2013-December/069753.html

Enabling iommu in my bios fixed indeed this issue. However i'm wondering wa=
s there ever being a kernel patch fixing this?.

Regards Tony Dijksterhuis.

Outlook voor Android downloaden<https://aka.ms/ghei36>
