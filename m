Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E81449CDDB
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 16:20:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E25291B3A;
	Wed, 26 Jan 2022 16:19:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E25291B3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643210424;
	bh=NQsGPVUyW8Gmh1UoKx8aEE0V9KiJ6RTnLZFIhWUG8aM=;
	h=From:To:References:In-Reply-To:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I+KVC+x/e9sBjncgi0FpSqyZqsjKScyFhz4n5ugz8cHE7LOSzX5jrP/bCjOjuWykM
	 S28HkgwU+ZuGAtn19fo6dNN+d6xrZBfU4upNcmmqAW/tvT0dKYdNKTZQI8pI4fOuE7
	 7t9Yy+YQKRXOLj4xeS86byMPhHOSxCRQuvv9yZVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 642B7F804BC;
	Wed, 26 Jan 2022 16:19:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 562C9F8049C; Wed, 26 Jan 2022 16:19:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15B20F800C8
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 16:19:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15B20F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="YMDBMbTS"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20Q7NhRO002476;
 Wed, 26 Jan 2022 09:19:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 references : in-reply-to : subject : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=9rognJyf05ydfSbJSD21cO4tiWOBbR70eO7/kwhr5Vo=;
 b=YMDBMbTSXa+yrvhseAweeMayD4DFgalHbiFRnhvG1PvBufcU2VNkqvF+w4Qg5louxr74
 GBy+DbxCgFZk5Osl2gnbMXrjuZwicRdAzFm6yXmdf1IZEoP2RL3YirsLSCaZCJddhUTM
 RzmuhXOI1/OcoxlpooLpPeBJuyZy3n7cQ0aSJibGbZq5OUhl/HuF5HyXTM9cps2zokxf
 ANJ6Nrydp66aPCtnBfbQUE5apBr7RWM2SqVhJzWTOA8wRdHigEtERaEjC7Yz+diUQD1t
 RDOpk8FvlqJcSrW4gPcx/67u0UYPNGcY1mvL8Jw1nKl1LZggvpeZVgS9OQOufYHzJktD Rg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3du0dygfeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 26 Jan 2022 09:19:06 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 26 Jan
 2022 15:19:05 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Wed, 26 Jan 2022 15:19:05 +0000
Received: from LONN2DGDQ73 (unknown [198.90.238.118])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E888B7C;
 Wed, 26 Jan 2022 15:19:04 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: "'Rafael J. Wysocki'" <rafael@kernel.org>
References: <20220121143254.6432-1-sbinding@opensource.cirrus.com>
 <20220121143254.6432-8-sbinding@opensource.cirrus.com>
 <CAJZ5v0gK=-SXUDekg_2DtOuMsn6Ls4gS+nymei2Qa9ZEFvqGcA@mail.gmail.com>
 <019901d80ee7$a6bf2a90$f43d7fb0$@opensource.cirrus.com>
 <CAJZ5v0j+DkX+-P1XxZ=HAnUzPjdkNFkXRTjJzhSH27KfDFAGDQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0j+DkX+-P1XxZ=HAnUzPjdkNFkXRTjJzhSH27KfDFAGDQ@mail.gmail.com>
Subject: RE: [PATCH v5 7/9] platform/x86: serial-multi-instantiate: Add SPI
 support
Date: Wed, 26 Jan 2022 15:19:05 +0000
Message-ID: <005d01d812c8$0ea9ae30$2bfd0a90$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIyNEEjz2y1WYLj0c4G0/lJ4TX/RgKST2RJAeKXLR4ByJ9isAInyNRCq338ZGA=
Content-Language: en-gb
X-Proofpoint-ORIG-GUID: e_E2liIVgvLHZqGtSUoNRsjQ3vdAE3CF
X-Proofpoint-GUID: e_E2liIVgvLHZqGtSUoNRsjQ3vdAE3CF
X-Proofpoint-Spam-Reason: safe
Cc: "'moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...'"
 <alsa-devel@alsa-project.org>, 'Hans de Goede' <hdegoede@redhat.com>,
 patches@opensource.cirrus.com, 'linux-spi' <linux-spi@vger.kernel.org>,
 'Takashi Iwai' <tiwai@suse.com>,
 'Linux Kernel Mailing List' <linux-kernel@vger.kernel.org>,
 'Mark Gross' <markgross@kernel.org>,
 'ACPI Devel Maling List' <linux-acpi@vger.kernel.org>,
 'Mark Brown' <broonie@kernel.org>,
 'Platform Driver' <platform-driver-x86@vger.kernel.org>,
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



> -----Original Message-----
> From: Alsa-devel <alsa-devel-bounces@alsa-project.org> On Behalf Of
> Rafael J. Wysocki
> Sent: 21 January 2022 17:15
> To: Stefan Binding <sbinding@opensource.cirrus.com>
> Cc: Platform Driver <platform-driver-x86@vger.kernel.org>; moderated
> list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM... <alsa-
> devel@alsa-project.org>; ACPI Devel Maling List <linux-
> acpi@vger.kernel.org>; Rafael J. Wysocki <rafael@kernel.org>; Linux =
Kernel
> Mailing List <linux-kernel@vger.kernel.org>; Takashi Iwai =
<tiwai@suse.com>;
> Mark Gross <markgross@kernel.org>; Hans de Goede
> <hdegoede@redhat.com>; Mark Brown <broonie@kernel.org>;
> patches@opensource.cirrus.com; linux-spi <linux-spi@vger.kernel.org>; =
Len
> Brown <lenb@kernel.org>
> Subject: Re: [PATCH v5 7/9] platform/x86: serial-multi-instantiate: =
Add SPI
> support


>=20
> > > > @@ -146,7 +247,21 @@ static int smi_probe(struct platform_device
> *pdev)
> > > >
> > > >         platform_set_drvdata(pdev, smi);
> > > >
> > > > -       return smi_i2c_probe(pdev, adev, smi, inst_array);
> > > > +       switch (node->bus_type) {
> > > > +       case SMI_I2C:
> > > > +               return smi_i2c_probe(pdev, adev, smi, =
node->instances);
> > > > +       case SMI_SPI:
> > > > +               return smi_spi_probe(pdev, adev, smi, =
node->instances);
> > > > +       case SMI_AUTO_DETECT:
> > > > +               if (i2c_acpi_client_count(adev) > 0)
> > > > +                       return smi_i2c_probe(pdev, adev, smi, =
node->instances);
> > > > +               else
> > > > +                       return smi_spi_probe(pdev, adev, smi, =
node->instances);
> > > > +       default:
> > > > +               break;
> > >
> > > Why is this needed?
> >
> > This return code is attempting to ensure that we don=E2=80=99t try =
to guess
> whether we
> > expect devices to be I2C or SPI - especially with regards to =
existing devices.
> > We wanted to maintain compatibility with existing devices, which =
would all
> be
> > I2C.
> > For the device for which we are adding, the same HID is used by both =
the
> same
> > chip for both I2C and SPI, so we also needed a way to support both.
>=20
> I meant why was the "default" case needed.  Sorry for the confusion.

I added a default case here purely for static analysis reasons. I =
don=E2=80=99t think it necessarily required, and I can remove it if =
necessary.

Thanks,
Stefan

