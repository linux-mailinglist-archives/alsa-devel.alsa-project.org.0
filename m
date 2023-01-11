Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C38CB665F54
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 16:41:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 567BB18B0;
	Wed, 11 Jan 2023 16:40:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 567BB18B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673451688;
	bh=RR+rWxCapXWCf5VAhLRMluPGOt+VpkuB5+flyMpJTZY=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ABIYH+geEPr7n+ftVByF2+OZqSAcyTPRYUFmslski5T99TlhUrlpGyljRWNfos3iw
	 6MU14ePsnDsWy5rJ6eZ74sitToQtjxMB/pLrmTZZ0nlqf4d1ZXBxL054g85DaJ+Asz
	 MrVY+sVuoD0eF7HhKDhS7d02kE4KCwGjjg8shGAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74A25F8030F;
	Wed, 11 Jan 2023 16:40:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7766F80424; Wed, 11 Jan 2023 16:40:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39130F8016E
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 16:40:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39130F8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q+o9216w
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B16AFE0004;
 Wed, 11 Jan 2023 15:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1673451624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TJ80tI+n7E12DAvDikBDbLVrg9IXgTxZ252Cq+neEbQ=;
 b=Q+o9216wXpyzH4Fmo4XE+A/19Rhli449oB8gxh74cMuVSBe7TmgTWv0NVMgETjHj7ICimI
 2lEldE8luCvEuRzv4wncGEOGkp8+YWnj/gHNVwVIcANGc/i9KFCarw2xI7Zy7ii4mw01BP
 3yh4Y2Qf6FLQR/pCfsBovsMC1nhClDVRgsfz9BsqGrMm8sPNTEXSy366YeN1nX8+aedw2l
 5dU2xzoQw9jeYIRqNq8AjlA436V/DgDKdEL+uikobI8yvJhFeEtymQvw2NPhOwbDD2+MwT
 mU28pFltJe6k53uG/R2oCKCPp6dR2f20BtbgaXKCRweyOUiSP64AKbrgZhfqEA==
Date: Wed, 11 Jan 2023 16:40:18 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 06/10] soc: fsl: qe: Add support for QMC
Message-ID: <20230111164018.676a8ca1@bootlin.com>
In-Reply-To: <f46eb64d-ad4c-7531-60b0-68961f171ed8@csgroup.eu>
References: <20230106163746.439717-1-herve.codina@bootlin.com>
 <20230106163746.439717-7-herve.codina@bootlin.com>
 <f46eb64d-ad4c-7531-60b0-68961f171ed8@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Mark Brown <broonie@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Christophe,
On Wed, 11 Jan 2023 13:58:03 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Le 06/01/2023 =C3=A0 17:37, Herve Codina a =C3=A9crit=C2=A0:
> > The QMC (QUICC Multichannel Controller) is available on some
> > PowerQUICC SoC such as the MPC885 or MPC866. =20
>=20
> Same, that's QMC for CPM for the time being, should that be made clear=20
> in the subject ?

Also same answer:
Will changing the subject be enough or do I need to move it to new
created drivers/soc/fsl/cpm/ directory ?

>=20
> QE also has QMC and this driver might be used for QE QMC as well with=20
> some enhancement, maybe that could be explained here ?

Yes and we plan to have it working on QE too.

What do you think if I add the following:
  The QMC is also available on some Quicc Engine SoC.
  This current version support CPM1 SoC only. Some
  enhancement are needed to support Quicc Engine SoC.

>=20
> I see you are using in_be16(), out_be16() etc ....
> That's specific to powerpc arch, maybe it is better to use ioread16be,=20
> iowrite16be() etc ....
> See commit 3f39f38ea91d ("soc: fsl: qe: replace qe_io{read,write}*=20
> wrappers by generic io{read,write}*") and commit 6ac9b61786cc ("soc:=20
> fsl: qe: introduce qe_io{read,write}* wrappers") for information.

You're right.
I will switch to io{read,write}{16,32}be.

I prefer avoid the use of qe_* wrappers as the driver is not
(yet) compatible with QE.

>=20
> >=20
> > It emulates up to 64 channels within one serial controller
> > using the same TDM physical interface routed from the TSA.
> >=20
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com> =20
>=20
> In some places, you comments use the network style, not the generic style.

I will fix them.

>=20
> Christophe

Thanks for the review,
Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
