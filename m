Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEF14A6277
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 18:29:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFEF3185F;
	Tue,  1 Feb 2022 18:29:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFEF3185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643736596;
	bh=FZOKFU7GBegLb4uus3BN0exobK2r0uvyO3Z3T/HtyNM=;
	h=From:To:References:In-Reply-To:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pn4Z2aHtyn4V64cW3+DOm1wo5n89O53hwNzLZPgRAU5xzF60Qfgrp6pGztZ5ts51d
	 m9rOkth1BXpxqgXu8QZAENEwdv+dOobkhSrNg2CbLhuHFGBS+FjCZTOIEeqQHHsm/e
	 vPL4XTKOcYVC4m7OLrgb+jsFsaaEfACd+soJp3Hs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40A0DF80139;
	Tue,  1 Feb 2022 18:28:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 564BDF80130; Tue,  1 Feb 2022 18:28:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED5D8F800F8
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 18:28:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED5D8F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="LypIW3UK"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2117KbE7014216;
 Tue, 1 Feb 2022 11:28:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 references : in-reply-to : subject : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=952efIhSlZ3TVuH9E0mXPjBSblS+dfL5mu3ba5cMD9c=;
 b=LypIW3UKHaSaflDClwAKMuOmrBFbWx7FwaA/mf7GRUVZQaCskkog4akMbniphWitpqPI
 JXzlHSW6oHCYzNLL5YtO0JiwwwP7LICytuq2vXb6qgVuZvye6rrZBIzry6GpM0EZ5ZAE
 hajDtpcNsBfKNviNCdFu7T0ApG7OjTI/gucRpo213HsKfh8CFsE2SadMWCVP3j2P7kpl
 G2/8VS0FQWPrTbwvtAA/FHykiVtvNcadVyVdLRbyku+tXahG8lr2YLbj0Sqn94ocG8yC
 0BxOizyEh0bvYA3bUEohvDNYz1BoYLzuQsAxVVFz6F84JL0IAkOf0Nb3WQ1wkqQKiI2Y tw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dxksx1xau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 01 Feb 2022 11:28:36 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Feb
 2022 17:28:34 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Tue, 1 Feb 2022 17:28:34 +0000
Received: from LONN2DGDQ73 (unknown [198.90.238.134])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 980C3459;
 Tue,  1 Feb 2022 17:28:34 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: 'Hans de Goede' <hdegoede@redhat.com>, 'Mark Brown' <broonie@kernel.org>, 
 "'Rafael J . Wysocki'" <rafael@kernel.org>,
 'Len Brown' <lenb@kernel.org>, 'Mark Gross' <markgross@kernel.org>,
 'Jaroslav Kysela' <perex@perex.cz>, 'Takashi Iwai' <tiwai@suse.com>
References: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
 <20220121172431.6876-3-sbinding@opensource.cirrus.com>
 <36df02cc-d164-eb6a-4ce7-54d2ee916650@redhat.com>
In-Reply-To: <36df02cc-d164-eb6a-4ce7-54d2ee916650@redhat.com>
Subject: RE: [PATCH v6 2/9] spi: Create helper API to lookup ACPI info for spi
 device
Date: Tue, 1 Feb 2022 17:28:34 +0000
Message-ID: <001101d81791$23f56090$6be021b0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQI3MpywMNCpYcMrzvtt+VeZtzYOngLs94vFAiNmdv6rmDmlEA==
X-Proofpoint-ORIG-GUID: fc1BznT_2vBEkCcSo3Mrt0p79QgZa1GM
X-Proofpoint-GUID: fc1BznT_2vBEkCcSo3Mrt0p79QgZa1GM
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-spi@vger.kernel.org
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

Hi,

> -----Original Message-----
> From: Hans de Goede <hdegoede@redhat.com>
> Sent: 01 February 2022 14:28
> To: Stefan Binding <sbinding@opensource.cirrus.com>; Mark Brown
> <broonie@kernel.org>; Rafael J . Wysocki <rafael@kernel.org>; Len =
Brown
> <lenb@kernel.org>; Mark Gross <markgross@kernel.org>; Jaroslav Kysela
> <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>
> Cc: alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; linux-
> spi@vger.kernel.org; linux-acpi@vger.kernel.org; platform-driver-
> x86@vger.kernel.org; patches@opensource.cirrus.com
> Subject: Re: [PATCH v6 2/9] spi: Create helper API to lookup ACPI info =
for spi
> device
>=20
> Hi,
>=20
> On 1/21/22 18:24, Stefan Binding wrote:
> > This can then be used to find a spi resource inside an
> > ACPI node, and allocate a spi device.
> >
> > Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> > ---
> >  drivers/spi/spi.c       | 46 =
++++++++++++++++++++++++++++++++---------
> >  include/linux/spi/spi.h |  6 ++++++
> >  2 files changed, 42 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> > index 1eb84101c4ad..13f4701f0694 100644
> > --- a/drivers/spi/spi.c
> > +++ b/drivers/spi/spi.c
> > @@ -2410,8 +2410,18 @@ static int acpi_spi_add_resource(struct
> acpi_resource *ares, void *data)
> >  	return 1;
> >  }
> >
> > -static acpi_status acpi_register_spi_device(struct spi_controller =
*ctlr,
> > -					    struct acpi_device *adev)
> > +/**
> > + * acpi_spi_device_alloc - Allocate a spi device, and fill it in =
with ACPI
> information
> > + * @ctlr: controller to which the spi device belongs
> > + * @adev: ACPI Device for the spi device
> > + *
> > + * This should be used to allocate a new spi device from and ACPI =
Node.
> > + * The caller is responsible for calling spi_add_device to register =
the spi
> device.
> > + *
> > + * Return: a pointer to the new device, or ERR_PTR on error.
> > + */
> > +struct spi_device *acpi_spi_device_alloc(struct spi_controller =
*ctlr,
> > +					 struct acpi_device *adev)
> >  {
> >  	acpi_handle parent_handle =3D NULL;
> >  	struct list_head resource_list;
> > @@ -2419,10 +2429,6 @@ static acpi_status
> acpi_register_spi_device(struct spi_controller *ctlr,
> >  	struct spi_device *spi;
> >  	int ret;
> >
> > -	if (acpi_bus_get_status(adev) || !adev->status.present ||
> > -	    acpi_device_enumerated(adev))
> > -		return AE_OK;
> > -
> >  	lookup.ctlr		=3D ctlr;
> >  	lookup.irq		=3D -1;
> >
> > @@ -2433,7 +2439,7 @@ static acpi_status =
acpi_register_spi_device(struct
> spi_controller *ctlr,
> >
> >  	if (ret < 0)
> >  		/* found SPI in _CRS but it points to another controller */
> > -		return AE_OK;
> > +		return ERR_PTR(-ENODEV);
> >
> >  	if (!lookup.max_speed_hz &&
> >  	    ACPI_SUCCESS(acpi_get_parent(adev->handle, &parent_handle))
> &&
> > @@ -2443,16 +2449,15 @@ static acpi_status
> acpi_register_spi_device(struct spi_controller *ctlr,
> >  	}
> >
> >  	if (!lookup.max_speed_hz)
> > -		return AE_OK;
> > +		return ERR_PTR(-ENODEV);
> >
> >  	spi =3D spi_alloc_device(ctlr);
> >  	if (!spi) {
> >  		dev_err(&ctlr->dev, "failed to allocate SPI device for %s\n",
> >  			dev_name(&adev->dev));
> > -		return AE_NO_MEMORY;
> > +		return ERR_PTR(-ENOMEM);
> >  	}
> >
> > -
> >  	ACPI_COMPANION_SET(&spi->dev, adev);
> >  	spi->max_speed_hz	=3D lookup.max_speed_hz;
> >  	spi->mode		|=3D lookup.mode;
> > @@ -2460,6 +2465,27 @@ static acpi_status
> acpi_register_spi_device(struct spi_controller *ctlr,
> >  	spi->bits_per_word	=3D lookup.bits_per_word;
> >  	spi->chip_select	=3D lookup.chip_select;
> >
> > +	return spi;
> > +}
> > +EXPORT_SYMBOL_GPL(acpi_spi_device_alloc);
> > +
> > +static acpi_status acpi_register_spi_device(struct spi_controller =
*ctlr,
> > +					    struct acpi_device *adev)
> > +{
> > +	struct spi_device *spi;
> > +
> > +	if (acpi_bus_get_status(adev) || !adev->status.present ||
> > +	    acpi_device_enumerated(adev))
> > +		return AE_OK;
> > +
> > +	spi =3D acpi_spi_device_alloc(ctlr, adev);
> > +	if (IS_ERR(spi)) {
> > +		if (PTR_ERR(spi) =3D=3D -ENOMEM)
> > +			return AE_NO_MEMORY;
> > +		else
> > +			return AE_OK;
> > +	}
> > +
> >  	acpi_set_modalias(adev, acpi_device_hid(adev), spi->modalias,
> >  			  sizeof(spi->modalias));
> >
> > diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> > index 0346a3ff27fd..d159cef12f1a 100644
> > --- a/include/linux/spi/spi.h
> > +++ b/include/linux/spi/spi.h
> > @@ -16,6 +16,7 @@
> >  #include <linux/gpio/consumer.h>
> >
> >  #include <uapi/linux/spi/spi.h>
> > +#include <linux/acpi.h>
> >
> >  struct dma_chan;
> >  struct software_node;
> > @@ -759,6 +760,11 @@ extern int devm_spi_register_controller(struct
> device *dev,
> >  					struct spi_controller *ctlr);
> >  extern void spi_unregister_controller(struct spi_controller *ctlr);
> >
> > +#if IS_ENABLED(CONFIG_ACPI)
> > +extern struct spi_device *acpi_spi_device_alloc(struct =
spi_controller *ctlr,
> > +						struct acpi_device *adev);
> > +#endif
> > +
>=20
> There is no need to add a #ifdef about something which is just a
> function prototype. Having this declared when CONFIG_ACPI is not set =
is
> harmless, please drop the #ifdef.
>=20
> With that fixed, please add my R-b to the next version:
>=20
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>=20
> Regards,
>=20
> Hans

I was just fixing this, however, I just noticed that a subset of this =
chain - including
this patch - just got applied. Do you want me to fix this in a separate =
patch?

Thanks,
Stefan

>=20
>=20
>=20
> >  /*
> >   * SPI resource management while processing a SPI message
> >   */
> >


