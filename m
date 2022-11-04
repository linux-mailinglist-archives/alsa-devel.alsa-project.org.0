Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E856192AC
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 09:21:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1ABC164D;
	Fri,  4 Nov 2022 09:20:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1ABC164D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667550075;
	bh=E10l8dXv+0yVdFm4e++fGKowhChM1uVgz1Vw83/Y2cg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j/5yvoorAkfBGzKiUvLVVitwlBwsTi0vwojjMCuXFUuQt5WO2v4R75gf/arxCQclX
	 I35tlk5CpBdEG4gmnjc/VDQjq0XXfIdqTGxu7FWEtf9aDtQ/k3d2FjQLF6QBpH1mWL
	 VSZCPGj+dr81hFy4NXkfg+7//V4gQgjiHXGbsxMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DBA6F805D9;
	Fri,  4 Nov 2022 09:16:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82A63F805E0; Fri,  4 Nov 2022 09:16:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_93,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BD37F805DF
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 09:16:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BD37F805DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ol95pFIR"
Received: by mail-pj1-x1030.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso7579370pjc.0
 for <alsa-devel@alsa-project.org>; Fri, 04 Nov 2022 01:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E10l8dXv+0yVdFm4e++fGKowhChM1uVgz1Vw83/Y2cg=;
 b=ol95pFIRx0tYNNaY+NNILw/xN4ySwCeTdxC68wx492BaHbgyLSqUrsvf3NpH38iQUg
 Zx7iD+35Px8hdlSrlQucqnbWLcMNaUx+50xOb2Ie20JDo1WtjkXEiv1zahOJGQ7T8/jg
 cpyc1YqSqGsbSJOhcMEUHVans4zad6F/TH7eUoVqJRBIhPslv/m9gbDzndYR9wOZq6Ch
 ENMJ3Bfmi9xvUEun7CA9/3uYf/elXBBIHIBt993RXprs91Vp67cqg5haroMY4G01L+0h
 Erg22nRGNOCkODO8ARp6bNOM697JFyFy7djPWCtGJQmsE6kkeMaJZBHn0SCA0LUM70fI
 /0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E10l8dXv+0yVdFm4e++fGKowhChM1uVgz1Vw83/Y2cg=;
 b=TLCD+quNa92jYo6fhZSfnR2+L7DIarMKwKgU7LrLL3xi6wgtkv2iVVYwHcA0uuwhXy
 tQ5mVH9Mjo/KSr/kJcy0Z+/DyyDGdq77mM/PpfIXHNPQ3MtoGf3KQokF6ar+AJdr9XOs
 AyMShoTXtVTu98PKIkonwnxxcpN9Y32RuQ3Yq6Eyxv44NHKrVF86Q3N4SZ/hc3eKTarG
 NsEPqeCZSbi/ygwmPaWKr34PE41MfnYonFRpmtZIasefHtx+r3G9ts/H6OWsZv1VYkkf
 qDYScBcBtRh/91uE/Y5CAR28ZaKGZPumQUrMGdcflvga2ASD9BEIm9211zmQAQN3t346
 WJfQ==
X-Gm-Message-State: ACrzQf3tec71xytchJnXk9xvCaQze3FMBPO3vLed2OpPI+4gM6MzxNy4
 8AC37rZvgPGnuLF/YCuJkMfqKkZxQQOQwA==
X-Google-Smtp-Source: AMsMyM6VXD1w4yOU5o5rPc+Zy5uksryVOKxaPPSdQXbe5FLZuI1n8TxOgBi3w6BmwflaHME5uqdHHw==
X-Received: by 2002:a17:903:2285:b0:187:3679:b3b0 with SMTP id
 b5-20020a170903228500b001873679b3b0mr19339855plh.121.1667549782836; 
 Fri, 04 Nov 2022 01:16:22 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-15.three.co.id. [180.214.232.15])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a62d10f000000b0056bee23a80bsm2052626pfg.137.2022.11.04.01.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 01:16:22 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id D62EC103D98; Fri,  4 Nov 2022 15:16:19 +0700 (WIB)
Date: Fri, 4 Nov 2022 15:16:19 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>
Subject: Re: [PATCH] ASoC: amd: fix ACP version typo mistake
Message-ID: <Y2TKUxKENsaAB3V8@debian.me>
References: <20221104121001.207992-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZTMYTwyazIsoR/Ma"
Content-Disposition: inline
In-Reply-To: <20221104121001.207992-1-Syed.SabaKareem@amd.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Randy Dunlap <rdunlap@infradead.org>,
 Takashi Iwai <tiwai@suse.com>, broonie@kernel.org, mario.limonciello@amd.com,
 Vijendar.Mukunda@amd.com, Daniel Baluta <daniel.baluta@nxp.com>
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


--ZTMYTwyazIsoR/Ma
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 04, 2022 at 05:39:07PM +0530, Syed Saba Kareem wrote:
> From: syed saba kareem <syed.sabakareem@amd.com>

Is your name capitalization correct? I assume from From: mail header
(Title Case).

>=20
> Pink Sardine is based on ACP6.3 architecture.
> This patch fixes the typo mistake acp6.2 -> acp6.3

Please write the description in imperative mood instead (e.g. "make foo
do bar"). "This patch" phrase is redundant.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--ZTMYTwyazIsoR/Ma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY2TKUAAKCRD2uYlJVVFO
o/fAAQD3rmfSByMHUHkKVpOJ6Ah3M+M3DKsLXB6nUzB3lzPbewEAilx/goxqiaWO
hj9+2GDGqIQF5yWcjgxfnKYZ0LFlAg4=
=IoKO
-----END PGP SIGNATURE-----

--ZTMYTwyazIsoR/Ma--
