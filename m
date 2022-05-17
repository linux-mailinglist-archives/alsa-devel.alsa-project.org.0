Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5216D529CBC
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 10:40:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E744C1622;
	Tue, 17 May 2022 10:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E744C1622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652776857;
	bh=5kigMlOvX7AaQXSHZ1MTRVc82dgzPtOUCrNr44UuT5A=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QPDwFifAL4gBg0KjhhN09Aq1c+p/PWpjJeQ28maM0QK/V86ua91v0nepzBZmU1dXQ
	 qQYb4vWrhyQ7rwOMUr/NhH4/OC2CA3eQ4sUAKmi9ZnfQ2X40Lrbxz4yIHP5VvtSxXz
	 k3zTFDnrI7wpzfLqEeXTZmMFEXtNfrHQT2CILeXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35876F80310;
	Tue, 17 May 2022 10:39:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DC17F802DB; Tue, 17 May 2022 10:39:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from 7.mo575.mail-out.ovh.net (7.mo575.mail-out.ovh.net
 [46.105.63.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BE41F800F0
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 10:39:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BE41F800F0
Received: from player756.ha.ovh.net (unknown [10.108.4.72])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 0966324118
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 08:39:44 +0000 (UTC)
Received: from mesotic.com (91-162-151-252.subs.proxad.net [91.162.151.252])
 (Authenticated sender: dylan.laduranty@mesotic.com)
 by player756.ha.ovh.net (Postfix) with ESMTPSA id 5187529C17069;
 Tue, 17 May 2022 08:39:43 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002ae77d043-7656-41ca-bd9a-78d978026394,
 1BCD3FF435E24440D4B99C59F4910DCA014FE84C)
 smtp.auth=dylan.laduranty@mesotic.com
X-OVh-ClientIp: 91.162.151.252
From: Dylan Laduranty <dylan.laduranty@mesotic.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Sa,
 Nuno" <Nuno.Sa@analog.com>
Subject: Re: [PATCH 2/2 v3] dt-bindings: ADAU7118: add new entries for pins
 drive strength
Date: Tue, 17 May 2022 10:40:26 +0200
Message-ID: <1816957.tdWV9SEqCh@localhost.localdomain>
Organization: Mesotic SAS
In-Reply-To: <PH0PR03MB6786A29EE38C9FDF74B4F02299CE9@PH0PR03MB6786.namprd03.prod.outlook.com>
References: <20220517054809.8244-1-dylan.laduranty@mesotic.com>
 <20220517054809.8244-2-dylan.laduranty@mesotic.com>
 <PH0PR03MB6786A29EE38C9FDF74B4F02299CE9@PH0PR03MB6786.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Ovh-Tracer-Id: 6867989432417111270
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrheejgddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkohgjfhgggfgtsehtqhertddttddunecuhfhrohhmpeffhihlrghnucfnrgguuhhrrghnthihuceougihlhgrnhdrlhgrughurhgrnhhthiesmhgvshhothhitgdrtghomheqnecuggftrfgrthhtvghrnhepvdfhhedugeetgeffvedufeelfffggeeufeeitdfggeevheetgfefleetffelhfevnecukfhppedtrddtrddtrddtpdeluddrudeivddrudehuddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjeehiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpeguhihlrghnrdhlrgguuhhrrghnthihsehmvghsohhtihgtrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghlshgrqdguvghvvghlsegrlhhsrgdqphhrohhjvggtthdrohhrgh
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

Hi Nuno,

> Hi Dylan,
>=20
> > -----Original Message-----
> > From: Dylan Laduranty <dylan.laduranty@mesotic.com>
> > Sent: Tuesday, May 17, 2022 7:48 AM
> > To: alsa-devel@alsa-project.org
> > Cc: Sa, Nuno <Nuno.Sa@analog.com>; Dylan Laduranty
> > <dylan.laduranty@mesotic.com>
> > Subject: [PATCH 2/2 v3] dt-bindings: ADAU7118: add new entries for
> > pins drive strength
> >=20
> > [External]
> >=20
> > Update driver doc with new entries for managing pins drive strength.
> > Add a table to describe possible values for each entry.
> >=20
> > Signed-off-by: Dylan Laduranty <dylan.laduranty@mesotic.com>
> > ---
>=20
> Just a note for the future. In my previous review I said something
> like:
>=20
> "
> ... With that fixed:
>=20
> Reviewed-by: Nuno S=E1 <nuno.sa@analog.com>
> "
>=20
> Hence, you could/should have included my 'Reviewed-by' tag in v3.
I apologize, this is my first contribution to Linux kernel so I am not=20
comfortable with this yet. I'll resend this serie later today.

>=20
> - Nuno S=E1

Dylan Laduranty




