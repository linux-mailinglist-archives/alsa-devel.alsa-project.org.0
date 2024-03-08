Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92727877058
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:20:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B24902343;
	Sat,  9 Mar 2024 11:20:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B24902343
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979648;
	bh=H1pae9I4dPVZlw6CRHdNlnGqt4bwvpSKXKKFd4GTJUI=;
	h=From:Date:To:cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QgCaJhu/yjKSNIgrfDB6vMCYo+7BvnoHSnhfjh3GMkSvkc1zdz8qyCSOpX+bQ6IPl
	 0b/Z0fgTU1A36Q4DpYCJA28T2CTbaZqD2ET2bJfNwxQeGtxeCCVr0GIyUwwUF1hDCF
	 59ag2e4mj8bY2lH+EnMU/143esfzAr7izVB3UF5k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 458D6F8977C; Sat,  9 Mar 2024 11:14:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7BF2F89786;
	Sat,  9 Mar 2024 11:14:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1DA8F8024E; Fri,  8 Mar 2024 15:15:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7964AF80088
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 15:15:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7964AF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ta7VpCx3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709907319; x=1741443319;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nnJa2eJuW3gIneCAKpj1Ao6WHMfBOJS01uvb6VF/qzs=;
  b=Ta7VpCx3Q8tpSSxeAzB+lQHu71325Iwtr2rspxmCNZv0wGhJzDJg4h1O
   h/sHIrzfj0yyKaOk936YNsXE4pgkD1ARMf2B799HS9+y1Upf8ybY0/6AU
   elm7BO/by1SBgE1NEqbaqwigqNRm542MHuxXZBd5A7i0vOJJarV4gCW9W
   IF+cXLyG6x+cPw5Rrfz+lNc438PIJ+gAUk3iVnHKcW+L6yui0BkAIkgz5
   KM9a7lCadRvUXW0EYPyMK5IxhDeKtMfLDq+bzm2HOVkzRM9YkUF21rV3D
   9rS22hs/mEcu2Bushm8wqEvsF3x8R8IqykFMXU4jZTTY3wxEwKQhLnaq+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15765642"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000";
   d="scan'208";a="15765642"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 06:15:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000";
   d="scan'208";a="41450832"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.186])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 06:15:11 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 8 Mar 2024 16:15:08 +0200 (EET)
To: Richard Fitzgerald <rf@opensource.cirrus.com>
cc: broonie@kernel.org, tiwai@suse.com, Hans de Goede <hdegoede@redhat.com>,
    lenb@kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
    linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
    LKML <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com,
    platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
    Simon Trimmer <simont@opensource.cirrus.com>
Subject: Re: [PATCH 3/3] platform/x86: serial-multi-instantiate: Add support
 for CS35L54 and CS35L57
In-Reply-To: <20240308135900.603192-4-rf@opensource.cirrus.com>
Message-ID: <ea3c3230-cdf1-c41f-47fd-8b47667f7c5c@linux.intel.com>
References: <20240308135900.603192-1-rf@opensource.cirrus.com>
 <20240308135900.603192-4-rf@opensource.cirrus.com>
MIME-Version: 1.0
X-MailFrom: ilpo.jarvinen@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YOSC77IWNBKO5SZNLK3OI5FBF2CC4URZ
X-Message-ID-Hash: YOSC77IWNBKO5SZNLK3OI5FBF2CC4URZ
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:12:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=ISO-8859-15
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YOSC77IWNBKO5SZNLK3OI5FBF2CC4URZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 8 Mar 2024, Richard Fitzgerald wrote:

> From: Simon Trimmer <simont@opensource.cirrus.com>
>=20
> Add the ACPI HIDs and smi_node descriptions for the CS35L54 and CS35L57
> Boosted Smart Amplifiers.
>=20
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
> This patch doesn't have any build dependencies on the ASOC/HDA code so
> can be take separately.

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> ---
>  drivers/acpi/scan.c                           |  2 ++
>  .../platform/x86/serial-multi-instantiate.c   | 28 +++++++++++++++++++
>  2 files changed, 30 insertions(+)
>=20
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index e6ed1ba91e5c..091c501bed1f 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1725,7 +1725,9 @@ static bool acpi_device_enumeration_by_parent(struc=
t acpi_device *device)
>  		{"BSG1160", },
>  		{"BSG2150", },
>  		{"CSC3551", },
> +		{"CSC3554", },
>  		{"CSC3556", },
> +		{"CSC3557", },
>  		{"INT33FE", },
>  		{"INT3515", },
>  		/* Non-conforming _HID for Cirrus Logic already released */
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/pl=
atform/x86/serial-multi-instantiate.c
> index 8158e3cf5d6d..97b9c6392230 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -329,6 +329,19 @@ static const struct smi_node cs35l41_hda =3D {
>  	.bus_type =3D SMI_AUTO_DETECT,
>  };
> =20
> +static const struct smi_node cs35l54_hda =3D {
> +	.instances =3D {
> +		{ "cs35l54-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "cs35l54-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "cs35l54-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "cs35l54-hda", IRQ_RESOURCE_AUTO, 0 },
> +		/* a 5th entry is an alias address, not a real device */
> +		{ "cs35l54-hda_dummy_dev" },
> +		{}
> +	},
> +	.bus_type =3D SMI_AUTO_DETECT,
> +};
> +
>  static const struct smi_node cs35l56_hda =3D {
>  	.instances =3D {
>  		{ "cs35l56-hda", IRQ_RESOURCE_AUTO, 0 },
> @@ -342,6 +355,19 @@ static const struct smi_node cs35l56_hda =3D {
>  	.bus_type =3D SMI_AUTO_DETECT,
>  };
> =20
> +static const struct smi_node cs35l57_hda =3D {
> +	.instances =3D {
> +		{ "cs35l57-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "cs35l57-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "cs35l57-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "cs35l57-hda", IRQ_RESOURCE_AUTO, 0 },
> +		/* a 5th entry is an alias address, not a real device */
> +		{ "cs35l57-hda_dummy_dev" },
> +		{}
> +	},
> +	.bus_type =3D SMI_AUTO_DETECT,
> +};
> +
>  /*
>   * Note new device-ids must also be added to ignore_serial_bus_ids in
>   * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
> @@ -350,7 +376,9 @@ static const struct acpi_device_id smi_acpi_ids[] =3D=
 {
>  	{ "BSG1160", (unsigned long)&bsg1160_data },
>  	{ "BSG2150", (unsigned long)&bsg2150_data },
>  	{ "CSC3551", (unsigned long)&cs35l41_hda },
> +	{ "CSC3554", (unsigned long)&cs35l54_hda },
>  	{ "CSC3556", (unsigned long)&cs35l56_hda },
> +	{ "CSC3557", (unsigned long)&cs35l57_hda },
>  	{ "INT3515", (unsigned long)&int3515_data },
>  	/* Non-conforming _HID for Cirrus Logic already released */
>  	{ "CLSA0100", (unsigned long)&cs35l41_hda },
>=20
