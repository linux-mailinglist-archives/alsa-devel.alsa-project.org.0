Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C50CF7027BC
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 10:59:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8C2F820;
	Mon, 15 May 2023 10:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8C2F820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684141182;
	bh=hMsyLAgqduiMwamIfLzaLKeu61ywdWXcxC7+DE2RUok=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lWH7S1ONNTl8DDvxqMRbCF8tP71W4isxMVHH6w5WJrUk6QqLJuMRrpJnbnaChnCeO
	 a9p+HGYr8upr+nTJduN8wF4T7QFwwCnQQEoTNp4wpSbhXLbh578Uob+8kijcUh8zLS
	 8+J08xAk+bq1rwdy3nw2UHOn4tVU08qW8+kaWsdA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 074A6F802E8; Mon, 15 May 2023 10:58:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87318F8025A;
	Mon, 15 May 2023 10:58:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 949E3F80272; Mon, 15 May 2023 10:58:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C16BF8016A
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 10:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C16BF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=f/CDxiuz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684141122; x=1715677122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hMsyLAgqduiMwamIfLzaLKeu61ywdWXcxC7+DE2RUok=;
  b=f/CDxiuzXVKBzOpikpfLH0rOrpU3I9DQ+W++NX2Fxbh7nl3qBLNuTwyt
   Vh+ZnAQ8teEJ0hQv+dK4GsdLcFHe5lxTJneBUwiMwbVbtuXcF8OqAzFpx
   H3hvNJCO3jkL0XtfrI8NZrf1z50OD/6wmF1CJ0BBdDcWtLv6SH8+wLWqh
   8I380VPGl48S3Z0WiipBhcqpPRhRg7YjQMrM3eJNawGFPwpKtjUI1KkD9
   7WbX6wQBIb/KcgckcR/dCBQzCt6OdnQ6f+5INGItNxQxdhx600Opq9eU0
   /XC2T/bgnoGH3NMaLVhS3RI5htS+lRygfFzT379C1ywPi4g9pN99hQkSe
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,276,1677567600";
   d="asc'?scan'208";a="213313694"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 May 2023 01:58:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 15 May 2023 01:58:37 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 15 May 2023 01:58:33 -0700
Date: Mon, 15 May 2023 09:58:12 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Walker Chen <walker.chen@starfivetech.com>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 3/3] riscv: dts: starfive: add the node and pins
 configuration for tdm
Message-ID: <20230515-dragonish-diffuser-48a1c6f4c8ae@wendy>
References: <20230511091549.28003-1-walker.chen@starfivetech.com>
 <20230511091549.28003-4-walker.chen@starfivetech.com>
 <cd7803a2-38a0-c498-467f-1ef802645527@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UHn8PAOuSV97BRQJ"
Content-Disposition: inline
In-Reply-To: <cd7803a2-38a0-c498-467f-1ef802645527@starfivetech.com>
Message-ID-Hash: IBDXV3AU6IGBLNTRSS3XSFDOUT2ZRGP6
X-Message-ID-Hash: IBDXV3AU6IGBLNTRSS3XSFDOUT2ZRGP6
X-MailFrom: Conor.Dooley@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IBDXV3AU6IGBLNTRSS3XSFDOUT2ZRGP6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--UHn8PAOuSV97BRQJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 04:44:54PM +0800, Walker Chen wrote:

> Hi Conor / Emil,
>=20
> Based on our discussion a few days ago, the new version of patch for dts =
looks like this,
> Please help to review and provide your comments if you feel free.

> On 2023/5/11 17:15, Walker Chen wrote:

It's only been 4 days chief, of which 2 were the weekend, you don't need
to bump it yet! You'd be better off asking one of your co-workers to
review the content, instead of me. I'll happily apply the patch, with
appropriate review, once the dt-binding has been applied by Mark. I do
not have the capacity to review the detail of individual patches adding
peripherals unfortunately.
Getting your co-workers to look at your patches, and doing the same for
theirs, is almost always a good idea for speeding up the process

Thanks for dropping the overlay though,
Conor.

--UHn8PAOuSV97BRQJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGH0JAAKCRB4tDGHoIJi
0jLDAQDrt1XJCjQ6JyzG4qMUGcwEUFr+S+UP7zNXLyeoCpvSIAEAjxdzf/onbCjn
NqfHT2twydBb9KiPvxH3Xjj9vO+hnQQ=
=spdl
-----END PGP SIGNATURE-----

--UHn8PAOuSV97BRQJ--
