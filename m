Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D78257AF99
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 05:49:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDBF2173D;
	Wed, 20 Jul 2022 05:48:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDBF2173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658288971;
	bh=iKGG8bOhKyb/MLOCgkySMoMHn1ZucH3grTkxJIq2VjE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AAz+9OI4mK0W9X5YrgX1af0U7zQM5qmgE7Hddq+etW7ubreySgVAOI7SAJBVZwgZD
	 btgkG9J78Qz5WDxfVYgMzuVBuplmruxmMy2rS17IwZfoyeRdPkvhJHJjo/bj2voGff
	 d3gj6UsF3Hlhac0cGkD9MsECZ97d0UR8ZCDRF6yg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BCCDF800BA;
	Wed, 20 Jul 2022 05:48:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29988F80169; Wed, 20 Jul 2022 05:48:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D94D8F800BA
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 05:48:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D94D8F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LWlmQjb+"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26K3mGRW011897;
 Tue, 19 Jul 2022 22:48:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1658288896;
 bh=JAsPtIJihoBVjFYSJptM9RbWBZAVavbRi895ayV5Hj8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=LWlmQjb++232ICBu2t8QHk0cXg/0oajWtJ2Kldu80lB257KqhD21cwQoH98jn/5LR
 K2mV2EqHcT+uU6Iz/ADq8gEpTgVxawDHQqFuwVpW2LRsZAqn4KbJOEHw0mTd+pv98o
 OzQDRoeAsv8mp5D52ooZg+UvOk6v/uNknIN9v7YU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26K3mG4t017704
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 Jul 2022 22:48:16 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Jul 2022 22:48:16 -0500
Received: from DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe]) by
 DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe%17]) with mapi id
 15.01.2308.014; Tue, 19 Jul 2022 22:48:16 -0500
From: "Xu, Yang" <raphael-xu@ti.com>
To: Rob Herring <robh@kernel.org>, Raphael-Xu <13691752556@139.com>
Subject: RE: [EXTERNAL] Re: [PATCH v5] update tas2780.yaml
Thread-Topic: [EXTERNAL] Re: [PATCH v5] update tas2780.yaml
Thread-Index: AQHYlsgLbEuTckvewU2/Fc9LiQomRq2GqCzA
Date: Wed, 20 Jul 2022 03:48:15 +0000
Message-ID: <e5e2f84c407a4480a5f6c7f56c8e05f4@ti.com>
References: <20220712050857.267-1-13691752556@139.com>
 <20220713145130.GA3909157-robh@kernel.org>
In-Reply-To: <20220713145130.GA3909157-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.136.126]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Syrus,
 Andy" <asyrus@ti.com>, "broonie@kernel.org" <broonie@kernel.org>,
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

Hi Rob,

Please see my reply.

-----Original Message-----
From: Rob Herring <robh@kernel.org>=20
Sent: Wednesday, July 13, 2022 10:52 PM
To: Raphael-Xu <13691752556@139.com>
Cc: alsa-devel@alsa-project.org; Xu, Yang <raphael-xu@ti.com>; Ding, Shengh=
ao <shenghao-ding@ti.com>; Navada Kanyana, Mukund <navada@ti.com>; Syrus, A=
ndy <asyrus@ti.com>; broonie@kernel.org; devicetree@vger.kernel.org
Subject: [EXTERNAL] Re: [PATCH v5] update tas2780.yaml

On Tue, Jul 12, 2022 at 01:08:57PM +0800, Raphael-Xu wrote:
> 1.remove unused item in DT 2.revise the format

Again, fix your subject. Run 'git log --oneline Documentation/devicetree/bi=
ndings/sound/' for inspiration of the format of the subject.
[RX]:just submit new patch
However, there's a bigger issue here. We already have a binding for this de=
vice. It's in tas27xx.yaml. And you added 2780 to it, so why did you add an=
other schema? (All the same issues in that patch too. wrong subject, broken=
 schema. So you haven't learned.)
[RX]:We will follow tas2780 patch format and submit separate patch if you t=
hink tas2780 patch is acceptable.
And then there is also tas2770.yaml which appears to be about the same as w=
ell.
[RX]:We will follow tas2780 patch format and submit separate patch if you t=
hink tas2780 patch is acceptable.
>=20
> Signed-off-by: Raphael-Xu <13691752556@139.com>
> ---
>  .../devicetree/bindings/sound/tas2780.yaml    | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
