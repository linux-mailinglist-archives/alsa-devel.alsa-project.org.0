Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80467231092
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 19:10:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 136E01726;
	Tue, 28 Jul 2020 19:09:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 136E01726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595956235;
	bh=a90OpCy7TFx2sKKGQ3oezqRWr0POibUp4tD3huPh+2A=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X23Y5S3c51+V5shHWTmc9/sLoxqk5EIrqyzDqkhFCiddYDy9eP0Gs7gayEjRPJzHv
	 CD0NXYeKmbTplpTfpF4y8ieUGyLFfP+O+UhzLXK1DhhRqIbBzA3G0sOWr5jDdGbpdq
	 idM82B92EVv1FEoDX/E+IZFnPzxjOhTBh87kcK4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DBBBF800AD;
	Tue, 28 Jul 2020 19:08:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57982F8021E; Tue, 28 Jul 2020 19:08:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR06-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur06olkn2038.outbound.protection.outlook.com [40.92.16.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2608EF800AD
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 19:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2608EF800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com
 header.b="kai3xmM9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmcTBy+2tFbRKlkiE7n6ueqtdsNe4k7ATHr4joZfEGHYQSDZnjkFtoj5PntALFnpchkBxT4xTZsftX0SdKUpO17NF/0UrS35mv/Jg2MrK5P4DXfItkr/ie5dwCuRf5comlcohpmJOSr7z+vwCNAP3aCBFK40VrKe3RKaYLMRdElA4O5UGIIK02czo+8jFYyXcTwxg7DJ+fG0VYDQ/4nqMGYhWP3liYbyEiI25bSRkECILGimSUtBLB35bDNa01WPaxq/Q3yav0lRja/WV3jfQDzev5Tr5JXZDmpRDEaDQ/Yz9zCykxlM7Eg3DWSZ3k6QgvIKbA2ydNlmpUNxox1qeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh6Nuo0D2ykONtTao2wFqI4cxQOis8n99sqO4Oj2kjY=;
 b=m3pPAF8hqMcVfuQhG7Tvbp63CgoRPGkP4kD+akrHQsKixJYtVBJbf2M/PhaGEpq9ww0LRFmjyvnGi5Nqm9zBOyDoqK44aBz5owSPX3l7fukgPbVwIOcbquJg0gTshEPc4AiVYhAWfqhBMX1OYgA0QT0D96O/YqV3eEJZLnKcQ+Z98vTYb3+EjbgpV4dnCOR7s68pMXGcshKK0Bsj/IS44HIb2w8u3oRGBlDKpYPoSndEa4qhh7kttXUsoVrMpCpq0zu8VJ0JcR2xeHpxliQuSCVFW7YEOxrdVh1A37+mkIj3WwEApTkTNsEbEC7UIqcc+RQVAI2VesaWL3/BXcdBQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh6Nuo0D2ykONtTao2wFqI4cxQOis8n99sqO4Oj2kjY=;
 b=kai3xmM9zb8InnAgz6nq48iI98aebFH/FM8ouVNoQEEj9BiBX7JJvbDI0QeswRWxAXAbFFzfwrp9xaZcn58tD++H9+ixg29RAT7c5thfDrKRjahcDY/sikp9FgC2uZriDhjMUviy9BjNxvreY3rP5V6/YXqgwXJ5sYxYdvu00Ov4ZJnwtfn/NJpiaf5B44xVa5YhfQ0RBYSNHhPW7RDrS+BhIQWuSXKtHuQATTXdYiEbf1/J2yvfLAQLs3MCp1NSHeDLAhsv2g4QrbUWs9ewopiJBZr5a87sEQkSOZ792+CcIpflMLILPuKzLdgOJVMY1CJSHdC+gnzGqqje3gzZVw==
Received: from VI1EUR06FT021.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc37::4d) by
 VI1EUR06HT099.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc37::497)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.31; Tue, 28 Jul
 2020 17:08:40 +0000
Received: from DB7P191MB0332.EURP191.PROD.OUTLOOK.COM (2a01:111:e400:fc37::4e)
 by VI1EUR06FT021.mail.protection.outlook.com
 (2a01:111:e400:fc37::466) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.10 via Frontend
 Transport; Tue, 28 Jul 2020 17:08:40 +0000
Received: from DB7P191MB0332.EURP191.PROD.OUTLOOK.COM
 ([fe80::a5a5:98a7:8748:f661]) by DB7P191MB0332.EURP191.PROD.OUTLOOK.COM
 ([fe80::a5a5:98a7:8748:f661%5]) with mapi id 15.20.3216.034; Tue, 28 Jul 2020
 17:08:40 +0000
From: Stuart Naylor <stuartiannaylor@outlook.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: USB audio cuts 2-3 secs at start
Thread-Topic: USB audio cuts 2-3 secs at start
Thread-Index: AQHWZQG9kcNnxLiut0KuIZ3DNKabkg==
Date: Tue, 28 Jul 2020 17:08:40 +0000
Message-ID: <DB7P191MB03327F9F65BA389A950607AFA8730@DB7P191MB0332.EURP191.PROD.OUTLOOK.COM>
References: <mailman.12167.1595955329.5591.alsa-devel@alsa-project.org>
In-Reply-To: <mailman.12167.1595955329.5591.alsa-devel@alsa-project.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:547BD77B001EB88194BE0E55D96CE78B24C8A8FC22F005E80FA0AC3B909AE8BA;
 UpperCasedChecksum:702CBDF42CBF174DEE77D44BB5715FC82FF83B1A752AAE9B79574B6C255CD46F;
 SizeAsReceived:6781; Count:43
x-tmn: [Qy2nMr10CaM9mHQuShI193oGqd7z55Wc]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 9e3f7782-f244-439d-f293-08d83318e014
x-ms-traffictypediagnostic: VI1EUR06HT099:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fkFJ3IJWGFtkn4vTFIKfiu46t6OYxSNfXah+D3qgMsqhFfctJPHsGrCCj4+S7yQ7MT5mnk/uwlGa6rhojj9HyWq4Fe9SlUsIXcDOvMn0r0bPW4Gae3gADz03u6jz3+Ds8a4hpJSiIGjmMvUlPnfgSdhTBT+j/kcFsX+LusXPnzxheFDr/Xswkc1Jsd23xuvAVDbi1HFWHSyNvStmrnZJe9OymqBNn9Chru73ZwCv69NntSQo4ZKuqVMF9zKAc90E
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7P191MB0332.EURP191.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: gpoLFl9ljX4x0Q+wTWBgNkWpIFQ8IBk2AKsU1e5iAJVTgTrsGDpAE/IYafeBdLh0bXIc5uHbmvF7kQDy0yGebRc6i9n1x3DMd2eTvZUrpP5YC9lgyhBHtlhFOPlQCUcfh0T8pMd8w2e+8XD8rEY6EQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR06FT021.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3f7782-f244-439d-f293-08d83318e014
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2020 17:08:40.4226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR06HT099
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

http://alsa-project.org/db/?f=3D6b107178c9939f235a390c07cb5c1f71d6a6e0c0

Its an Anker power conf and for some reason the first couple of seconds of =
aplay do not play via USB.

Alsa-info above anyone and tips or ideas?


Stuart

