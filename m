Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3664496339
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 17:56:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 551FD2A79;
	Fri, 21 Jan 2022 17:55:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 551FD2A79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642784188;
	bh=nA7YzVS4r6cfhPvGGCIVfXAdXfmgViKp4+OFnZSh8BM=;
	h=From:To:References:In-Reply-To:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W139KvYtmLpHWU8cEIaEYzo1GZg+IYAVVu6U2udTxEIJP9TTx5TLS16aBQ7wBoeuY
	 8rNcjBaMFVYImR4L3ZAfKsSzpbHe4cv2B1NYmVBCMUKDKZBGFjqx598ymtR/g2TGue
	 UH4ZKhHiBwNhlzn2L+zNsyKV0O0FA0J62MW0ftvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3D17F80302;
	Fri, 21 Jan 2022 17:55:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 788E7F800F5; Fri, 21 Jan 2022 17:55:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AE5AF800F5
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 17:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AE5AF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ACsTlvSN"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20L5kA6Y005173;
 Fri, 21 Jan 2022 10:55:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 references : in-reply-to : subject : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=ylGyq7sLup9Rxfkgq+dfRN9ellYolkMaBQNzruHzou0=;
 b=ACsTlvSNjKR90Kk1SQZHW/kmzdoABEADjJu5bnXEc7B1k+9ms3TufB1J2GMYZIpe3j5x
 JvKVEpjZROpRbk3LOJV7xwJaqP36Kvw+9lwaW/yQSh2yVtjisyMagGF8PUujSrZVVFTY
 TYoqg3t4hR/LfCxP4m3kUJRaJMFlwm2BVLCXTkfz3KvTgvYye/7X2GmOYFBDXMfAJV0G
 vs0TyI2+zOWZaHxcBx7cdEtSvy4KYAbqc77O9Dqkip3BcOltlaKEZEvTmqk216LsGix/
 VvI2U2ONS/DQpiSJpmJHXTWuuCdBZ9aUlCd9tjW2JDIq+i1ORM7zFqHPy1Ox4Zd8jWVI 8A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dqhynrv2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 21 Jan 2022 10:55:11 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 21 Jan
 2022 16:55:10 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 21 Jan 2022 16:55:10 +0000
Received: from LONN2DGDQ73 (unknown [198.90.238.138])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DF69045D;
 Fri, 21 Jan 2022 16:55:09 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: "'Rafael J. Wysocki'" <rafael@kernel.org>
References: <20220121143254.6432-1-sbinding@opensource.cirrus.com>
 <20220121143254.6432-8-sbinding@opensource.cirrus.com>
 <CAJZ5v0gK=-SXUDekg_2DtOuMsn6Ls4gS+nymei2Qa9ZEFvqGcA@mail.gmail.com>
In-Reply-To: <CAJZ5v0gK=-SXUDekg_2DtOuMsn6Ls4gS+nymei2Qa9ZEFvqGcA@mail.gmail.com>
Subject: RE: [PATCH v5 7/9] platform/x86: serial-multi-instantiate: Add SPI
 support
Date: Fri, 21 Jan 2022 16:55:10 +0000
Message-ID: <019901d80ee7$a6bf2a90$f43d7fb0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIyNEEjz2y1WYLj0c4G0/lJ4TX/RgKST2RJAeKXLR6rlb3VEA==
Content-Language: en-gb
X-Proofpoint-ORIG-GUID: qRemX4_MgGf_MJQAQwN1TSlciwQ0ymrl
X-Proofpoint-GUID: qRemX4_MgGf_MJQAQwN1TSlciwQ0ymrl
X-Proofpoint-Spam-Reason: safe
Cc: 'Platform Driver' <platform-driver-x86@vger.kernel.org>, "'moderated
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...'"
 <alsa-devel@alsa-project.org>,
 'ACPI Devel Maling List' <linux-acpi@vger.kernel.org>,
 'Linux Kernel Mailing List' <linux-kernel@vger.kernel.org>,
 'Takashi Iwai' <tiwai@suse.com>, 'Mark Gross' <markgross@kernel.org>,
 'Hans de Goede' <hdegoede@redhat.com>, 'Mark Brown' <broonie@kernel.org>,
 patches@opensource.cirrus.com, 'linux-spi' <linux-spi@vger.kernel.org>,
 'Len Brown' <lenb@kernel.org>
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
> From: Rafael J. Wysocki <rafael@kernel.org>
> Sent: 21 January 2022 15:31
> To: Stefan Binding <sbinding@opensource.cirrus.com>
> Cc: Mark Brown <broonie@kernel.org>; Rafael J . Wysocki
> <rafael@kernel.org>; Len Brown <lenb@kernel.org>; Hans de Goede
> <hdegoede@redhat.com>; Mark Gross <markgross@kernel.org>; Jaroslav
> Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; moderated
> list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM... <alsa-
> devel@alsa-project.org>; Linux Kernel Mailing List <linux-
> kernel@vger.kernel.org>; linux-spi <linux-spi@vger.kernel.org>; ACPI =
Devel
> Maling List <linux-acpi@vger.kernel.org>; Platform Driver =
<platform-driver-
> x86@vger.kernel.org>; patches@opensource.cirrus.com
> Subject: Re: [PATCH v5 7/9] platform/x86: serial-multi-instantiate: =
Add SPI
> support
>=20


> > diff --git a/drivers/platform/x86/Kconfig =
b/drivers/platform/x86/Kconfig
> > index 5b65d687f046..28f5bbf0f27a 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -991,12 +991,12 @@ config TOPSTAR_LAPTOP
> >           If you have a Topstar laptop, say Y or M here.
> >
> >  config SERIAL_MULTI_INSTANTIATE
> > -       tristate "I2C multi instantiate pseudo device driver"
> > -       depends on I2C && ACPI
> > +       tristate "I2C and SPI multi instantiate pseudo device =
driver"
> > +       depends on I2C && SPI && ACPI
>=20
> Should this be (I2C || SPI) && ACPI ?

We made it dependent on both I2C and SPI because of how interconnected =
the
serial-multi-instantiate driver is with both SPI and I2C. We felt =
attempting to make
the driver compatible with one without the other would end up very =
complicated.

> > @@ -146,7 +247,21 @@ static int smi_probe(struct platform_device =
*pdev)
> >
> >         platform_set_drvdata(pdev, smi);
> >
> > -       return smi_i2c_probe(pdev, adev, smi, inst_array);
> > +       switch (node->bus_type) {
> > +       case SMI_I2C:
> > +               return smi_i2c_probe(pdev, adev, smi, =
node->instances);
> > +       case SMI_SPI:
> > +               return smi_spi_probe(pdev, adev, smi, =
node->instances);
> > +       case SMI_AUTO_DETECT:
> > +               if (i2c_acpi_client_count(adev) > 0)
> > +                       return smi_i2c_probe(pdev, adev, smi, =
node->instances);
> > +               else
> > +                       return smi_spi_probe(pdev, adev, smi, =
node->instances);
> > +       default:
> > +               break;
>=20
> Why is this needed?

This return code is attempting to ensure that we don=E2=80=99t try to =
guess whether we
expect devices to be I2C or SPI - especially with regards to existing =
devices.
We wanted to maintain compatibility with existing devices, which would =
all be
I2C.
For the device for which we are adding, the same HID is used by both the =
same
chip for both I2C and SPI, so we also needed a way to support both.

Thanks,
Stefan

