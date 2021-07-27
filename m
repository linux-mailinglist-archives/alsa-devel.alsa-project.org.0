Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2163D7148
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 10:33:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D1F71EF9;
	Tue, 27 Jul 2021 10:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D1F71EF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627374817;
	bh=SqphorYqLssuSA+v5ya7Ulfj8yq4TpmJETOfiQpdCuA=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Wogg5rBLCaM//jNzwxvt8ke1r3PKKeTr/TZb4NYTc+OBK/WUwDL+YX4a0uBJH1zDa
	 kPKsf/Gk/LrskI0DduTSKaiW8k1yULURx6zk6sINM7ZjjHexUgR6xvvSpQ45wiWUfc
	 frGQKy+gHtZn6cl4AvPvMgqS+kN9AWx+PnLm+E4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C53FBF8050F;
	Tue, 27 Jul 2021 10:29:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD3A8F8026C; Tue, 27 Jul 2021 06:25:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=HTML_MESSAGE,PRX_BODY_135,
 PRX_BODY_78,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mail2.elbitsystems.com (mail2.elbitsystems.com [185.145.28.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B277F80212
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 06:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B277F80212
X-IPAS-Result: =?us-ascii?q?A2A0AwCLif9g/5cKEaxagQkJgVCBI1mBJoFNlh+VNYYuF?=
 =?us-ascii?q?IFoCwEBAQ4BQQQBAYRYgwAmNAkOAgQBAQEBAwIDAQEBAQUBAQYBAQEBAQEFB?=
 =?us-ascii?q?IEOhS86DIZ2RRkBFWsmAQQbgmqBfqlwgTQaAmWEaIU7gTqBZYQIU0iFanuCU?=
 =?us-ascii?q?CaIWAkBEgEoByqFQwSDRAcfDAQNDidwIwgVBzYtERQWkU2MGo06khYHgymDb?=
 =?us-ascii?q?IU2kwKCCisSgTmCKotehiUDkHmWCqAHhQcCBAIEBQIWgWCBJHAzGiODOk8XA?=
 =?us-ascii?q?o9SAQKNJ4ErAgYLAQEDCYoIM14BAQ?=
Received: from unknown (HELO Router1) ([17.10.151]) by mail2.elbitsystems.com
 with ESMTP; 27 Jul 2021 07:25:11 +0300
Received: from DM1 (Not Verified[17.12.52]) by Router1 with Something New
 (v8,2,6,11305)	id <B60ff8aa70000>; Tue, 27 Jul 2021 07:25:11 +0300
Received: from AHHFA01.localdomain (unknown [17.12.7])	(using TLSv1.2 with
 cipher
 DHE-RSA-AES256-SHA256 (256/256 bits))	(No client certificate requested)	by
 Forcepoint Email with ESMTPS id 56B02B9B74E46B6126DA	for
 <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 07:25:11 +0300 (IDT)
Received: from Out1 ([0.50.252])	by AHHFA01.localdomain with ESMTP id
 16R4PBX9009603-16R4PBXA009603	for <alsa-devel@alsa-project.org>;
 Tue, 27 Jul 2021 07:25:11 +0300
Received: from HMX21 (Not Verified[0.54.61]) by Out1 with Something New
 (v8,2,6,11305)	id <B60ff8aa70000>; Tue, 27 Jul 2021 07:25:11 +0300
Received: from HMX13 (0.54.33) by HMX21 (0.54.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 27 Jul 2021 07:25:11 +0300
Received: from HMX13 ([fe80::b177:53d2:424a:6c01]) by HMX13
 ([fe80::b177:53d2:424a:6c01%6]) with mapi id 15.01.2176.012;
 Tue, 27 Jul 2021 07:25:11 +0300
From: Kabaz Shlomo <shlomo.kabaz@elbitsystems.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Writing  a driver for   multiple Codecs with  one mcAsp
Thread-Topic: Writing  a driver for   multiple Codecs with  one mcAsp
Thread-Index: AdeCn1qqMQLDsvMqTw+7a3s//QSikQ==
Date: Tue, 27 Jul 2021 04:25:10 +0000
Message-ID: <6e1aee8cf0de463784c0c9dee2cfb3be@elbitsystems.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.54.230]
MIME-Version: 1.0
X-SEG-SpamProfiler-Score: -1
X-Mailman-Approved-At: Tue, 27 Jul 2021 10:29:07 +0200
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

Hello ,



I am trying to  add to the DM8148  board  functionality  that support  mu=
ltiple Codecs  for One  McAsp  .

The development env is DVRRDK4  of TI .



Does any one know how  can I do it ?

OR what are the concept of adding such support ?



Regards ,

=20 Shlomo Kabaz .


The information in this e-mail transmission contains proprietary and busi=
ness=20
sensitive information.  Unauthorized interception of this e-mail may cons=
titute=20
a violation of law. If you are not the intended recipient, you are hereby=
=20
notified that any review, dissemination, distribution or duplication of t=
his=20
communication is strictly prohibited. You are also asked to contact the s=
ender=20
by reply email and immediately destroy all copies of the original message=
.
