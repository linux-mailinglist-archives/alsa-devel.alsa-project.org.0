Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FB9525C1C
	for <lists+alsa-devel@lfdr.de>; Fri, 13 May 2022 09:15:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02A871AD8;
	Fri, 13 May 2022 09:14:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02A871AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652426116;
	bh=EebHJP8tPaUkFcPsVWI8XVzwTtZHH1PpoiEQUkOBZkU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VZfLIWJu8JV9qcYGrJKz6XzIga4K3YiRUjKSfOG/C+MerhmSKNJkiS2dndFf2elZc
	 zTDUlvhYu+z1qeUrIg7ynJJsToSmnv45CEdpcD5+NGF38Bdoad7TKI2vVcYAZkHz6E
	 8gg0kEg4rhT4lfvdQlXOBxo0Qv2ElMRTA1DsKbzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70F99F8025E;
	Fri, 13 May 2022 09:14:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD24AF80236; Fri, 13 May 2022 09:14:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from 7.mo550.mail-out.ovh.net (7.mo550.mail-out.ovh.net
 [87.98.158.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19B2CF800BB
 for <alsa-devel@alsa-project.org>; Fri, 13 May 2022 09:14:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19B2CF800BB
Received: from player731.ha.ovh.net (unknown [10.108.1.170])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 65F292080E
 for <alsa-devel@alsa-project.org>; Fri, 13 May 2022 07:14:07 +0000 (UTC)
Received: from mesotic.com (91-162-151-252.subs.proxad.net [91.162.151.252])
 (Authenticated sender: dylan.laduranty@mesotic.com)
 by player731.ha.ovh.net (Postfix) with ESMTPSA id B90002A2DF80B;
 Fri, 13 May 2022 07:14:05 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006c9217707-13a4-4a6a-b93a-1aafb9ecd8ce,
 9B7B54CD2EC34646E16E928FCA3A171E58FB120D)
 smtp.auth=dylan.laduranty@mesotic.com
X-OVh-ClientIp: 91.162.151.252
From: Dylan Laduranty <dylan.laduranty@mesotic.com>
To: "Sa, Nuno" <Nuno.Sa@analog.com>
Subject: Re: [PATCH 2/2] dt-bindings: ADAU7118: add new entries for pins drive
 strength
Date: Fri, 13 May 2022 09:14:44 +0200
Message-ID: <44674800.fMDQidcC6G@localhost.localdomain>
Organization: Mesotic SAS
In-Reply-To: <PH0PR03MB678668768F86C5AEDE3146EE99CA9@PH0PR03MB6786.namprd03.prod.outlook.com>
References: <20220512191352.15602-1-dylan.laduranty@mesotic.com>
 <20220512191352.15602-2-dylan.laduranty@mesotic.com>
 <PH0PR03MB678668768F86C5AEDE3146EE99CA9@PH0PR03MB6786.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Ovh-Tracer-Id: 378020894727982272
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgeekgdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkohgjfhgggfgtsehtqhertddttddunecuhfhrohhmpeffhihlrghnucfnrgguuhhrrghnthihuceougihlhgrnhdrlhgrughurhgrnhhthiesmhgvshhothhitgdrtghomheqnecuggftrfgrthhtvghrnhepudehheeffffhvdelhfdufefffeehkeetfedvfeekfeejhfduhefgveettdeiteehnecukfhppedtrddtrddtrddtpdeluddrudeivddrudehuddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjeefuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpeguhihlrghnrdhlrgguuhhrrghnthihsehmvghsohhtihgtrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghlshgrqdguvghvvghlsegrlhhsrgdqphhrohhjvggtthdrohhrgh
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

Le vendredi 13 mai 2022, 09:08:13 CEST Sa, Nuno a =E9crit :
> > -----Original Message-----
> > From: Dylan Laduranty <dylan.laduranty@mesotic.com>
> > Sent: Thursday, May 12, 2022 9:14 PM
> > To: alsa-devel@alsa-project.org
> > Cc: Sa, Nuno <Nuno.Sa@analog.com>; Dylan Laduranty
> > <dylan.laduranty@mesotic.com>
> > Subject: [PATCH 2/2] dt-bindings: ADAU7118: add new entries for pins
> > drive strength
> >=20
> > [External]
> >=20
> > Signed-off-by: Dylan Laduranty <dylan.laduranty@mesotic.com>
> > ---
>=20
> checkpatch will complain about not having a commit message.
> With that fixed:

Oops sorry about that. Should I resend a V2 with a proper commit message fo=
r=20
this patch (or both patches ?)  Or maybe prepare a V3 with more description=
=20
(and a commit message for this one) ?

>=20
> Reviewed-by: Nuno S=E1 <nuno.sa@analog.com>

Dylan Laduranty




