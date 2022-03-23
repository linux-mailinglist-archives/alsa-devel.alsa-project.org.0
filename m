Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B58FC4E4BEB
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 05:31:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DD991710;
	Wed, 23 Mar 2022 05:30:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DD991710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648009877;
	bh=a7NmWRoMjJYjAZeIQkecSvvF/9/HYuyvvJ0lIVrlMmo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ze/+PskbZUmlQWI290PMBsvW8Psu3RHs1O5HF0MOaU/TasU2IR29dHMP52syxzD9H
	 e6vt0SVHwNuG+HneSzeF6HzrPLHqYKj+TkWEk7zhPyUdzeNg4LcWkgUBl7pWxAQEPK
	 qdljFD4GjPHtx6N2vejL9UNMtBlTNDv6njQZ1eUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0675F80310;
	Wed, 23 Mar 2022 05:30:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3123AF80165; Wed, 23 Mar 2022 05:30:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F24C1F802DB
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 05:29:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F24C1F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AwBO2MBV"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22N4TrlD109852;
 Tue, 22 Mar 2022 23:29:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1648009793;
 bh=WUKuGOJiP8l+xCEwluzZlDj5hGRQMUXbd1+yZf7wAJY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=AwBO2MBV0YynY7aWoXAXf0zuy8XPuft6J4I3PEWOGiAcd1UIQbEiiIw+2bZBki6Bo
 1rT6e1FqHaDXbg3QD6JdDbecObqTkZqhS+qA+FjQJOqt3CHfNNux2IdgUdwj3UuOYt
 8hV95+/SKEHSn4XY1gGX/4t3tJ8WMsrIivZaOFH4=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22N4TrI2024631
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 22 Mar 2022 23:29:53 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 23:29:53 -0500
Received: from DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe]) by
 DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe%17]) with mapi id
 15.01.2308.014; Tue, 22 Mar 2022 23:29:53 -0500
From: "Xu, Yang" <raphael-xu@ti.com>
To: Mark Brown <broonie@kernel.org>, Raphael-Xu <13691752556@139.com>
Subject: RE: [EXTERNAL] Re: [PATCH v3 1/2] Rename tas2764 to tas27xx
Thread-Topic: [EXTERNAL] Re: [PATCH v3 1/2] Rename tas2764 to tas27xx
Thread-Index: AQHYPePfwy5UTBeBd0awdchof0HloKzMYO1Q
Date: Wed, 23 Mar 2022 04:29:52 +0000
Message-ID: <a7b58800d053495fb4ea6f8303e25d2e@ti.com>
References: <20220322070438.506-1-13691752556@139.com>
 <Yjm5aMn/i2DgDwG5@sirena.org.uk>
In-Reply-To: <Yjm5aMn/i2DgDwG5@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.136.126]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Navada Kanyana, Mukund" <navada@ti.com>, "Ding, 
 Shenghao" <shenghao-ding@ti.com>
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

Hi Mark,

Just submit the new patchs.Please kindly check them.Thanks.
1.change the Makefile and Kconfig
2.update tas27xx.c
3.update tas27xx.h

Regards
Raphael
-----Original Message-----
From: Mark Brown <broonie@kernel.org>=20
Sent: Tuesday, March 22, 2022 7:56 PM
To: Raphael-Xu <13691752556@139.com>
Cc: alsa-devel@alsa-project.org; Xu, Yang <raphael-xu@ti.com>; Ding, Shengh=
ao <shenghao-ding@ti.com>; Navada Kanyana, Mukund <navada@ti.com>
Subject: [EXTERNAL] Re: [PATCH v3 1/2] Rename tas2764 to tas27xx

On Tue, Mar 22, 2022 at 03:04:37PM +0800, Raphael-Xu wrote:
> Signed-off-by: Raphael-Xu <13691752556@139.com>
> ---
>  sound/soc/codecs/{tas2764.c =3D> tas27xx.c} | 0 =20
> sound/soc/codecs/{tas2764.h =3D> tas27xx.h} | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)  rename=20
> sound/soc/codecs/{tas2764.c =3D> tas27xx.c} (100%)  rename=20
> sound/soc/codecs/{tas2764.h =3D> tas27xx.h} (100%)

This needs a change to the Makefile and Kconfig as well but is otherwise fi=
ne, however I was expecting another patch or two doing the updates that wer=
e in your initial patches so we'd end up with three or four patches.  Sorry=
 if that wasn't clear.
