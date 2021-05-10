Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A71379164
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 16:52:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E303176F;
	Mon, 10 May 2021 16:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E303176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620658358;
	bh=W7iAKST7BRDMlEttXNNjJ33EX76A4qp8I6GEgdSMv7U=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LqhSO+Pge5faQxLzNPVJEleob+lqcSJIEha4W9NM7Cgcc4XTSzpGcSEzyOSg0gGPE
	 8ZKKeRaTJHlJNbiB3Be5j/mZ2ASWiY24/Lu433CL5UFrf1yqU2Hj4cVIoHochMK2Cg
	 Xnea53ZoYcVHGNNTyp8pkuL5AA65xrLqy9j5LOHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFF0BF800E9;
	Mon, 10 May 2021 16:50:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 793A4F800EA; Mon, 10 May 2021 13:20:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64821F800E9
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 13:20:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64821F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gmDmb0dM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC8EA6101E;
 Mon, 10 May 2021 11:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620645601;
 bh=W7iAKST7BRDMlEttXNNjJ33EX76A4qp8I6GEgdSMv7U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gmDmb0dM5IcZQ9rSlubjtF+K7WR5CTuBYzK7hGG8NgJ6VoZl1xWTpOcwkH/5/0zA/
 vlx1VxEGYzpDqoIrEOS4Gq4vleDywsH/Tbkz7KjwQOxa0gHoTz3ZfhQBobu6oYwUNn
 Apktwvurhr0XmVvzqYbUbTW3FMnBkgNdhIrbGi6F2SzZTvdCwG1IcEdUG7Tg53VOjZ
 rsHYuTEPmzH2qPOyCxJC2wx/q7V+K8nhKe4JHOwCkQGI9ADck3Kw17WLNRkmbFOBip
 a9pcqsOJVVBc05NJGVPFoJfSO03eP8zjvIV4wRYaZYLrBIVfbDQLgQs1bXlcp7w7lK
 9KVTRb7Ve04dg==
Date: Mon, 10 May 2021 13:19:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
Message-ID: <20210510131950.063f0608@coco.lan>
In-Reply-To: <c4479ced-f4d8-1a1e-ee54-9abc55344187@leemhuis.info>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <c4479ced-f4d8-1a1e-ee54-9abc55344187@leemhuis.info>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 10 May 2021 16:50:04 +0200
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, x86@kernel.org, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-sgx@vger.kernel.org, coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org
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

Em Mon, 10 May 2021 12:52:44 +0200
Thorsten Leemhuis <linux@leemhuis.info> escreveu:

> On 10.05.21 12:26, Mauro Carvalho Chehab wrote:
> >
> > As Linux developers are all around the globe, and not everybody has UTF=
-8
> > as their default charset, better to use UTF-8 only on cases where it is=
 really
> > needed.
> > [=E2=80=A6]
> > The remaining patches on series address such cases on *.rst files and=20
> > inside the Documentation/ABI, using this perl map table in order to do =
the
> > charset conversion:
> >=20
> > my %char_map =3D (
> > [=E2=80=A6]
> > 	0x2013 =3D> '-',		# EN DASH
> > 	0x2014 =3D> '-',		# EM DASH =20


> I might be performing bike shedding here, but wouldn't it be better to
> replace those two with "--", as explained in
> https://en.wikipedia.org/wiki/Dash#Approximating_the_em_dash_with_two_or_=
three_hyphens
>=20
> For EM DASH there seems to be even "---", but I'd say that is a bit too
> much.

Yeah, we can do, instead:

 	0x2013 =3D> '--',		# EN DASH
 	0x2014 =3D> '---',	# EM DASH =20

I was actually in doubt about those ;-)

Btw, when producing HTML documentation,  Sphinx should convert:
	-- into EN DASH
and:
	--- into EM DASH

So, the resulting html will be identical.

> Or do you fear the extra work as some lines then might break the
> 80-character limit then?

No, I suspect that the line size won't be an issue. Some care should
taken when EN DASH and EM DASH are used inside tables.

Thanks,
Mauro
