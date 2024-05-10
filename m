Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6528C1DEF
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2024 08:14:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BED7E0F;
	Fri, 10 May 2024 08:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BED7E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715321648;
	bh=tVmNsvP0F79RlUZxEG/LA65KskpKIapcIo/v8yoB4ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sJqbvH3F9cjp+GJzbxT0E9nXU/IxWhKAk0xene+6GB2K5TeIHdNCUXEzpQpLkJ2Ot
	 /5XenxCsGqQbp//gSYqNYtWfz7tnqaC2RKhpmHDIcXWMY8yyfJsUnOYabWxzx9fTpV
	 3OL2SKUXJ6ryy30jaivRxU18MZhWyPZDh9ASnXOQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25C3DF8059F; Fri, 10 May 2024 08:13:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CB9DF8057E;
	Fri, 10 May 2024 08:13:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AC57F8049C; Fri, 10 May 2024 08:11:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99C56F8024C
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 08:11:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99C56F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jKIkVsf1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 90118CE1BA5;
	Fri, 10 May 2024 06:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F38C113CC;
	Fri, 10 May 2024 06:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715321490;
	bh=tVmNsvP0F79RlUZxEG/LA65KskpKIapcIo/v8yoB4ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jKIkVsf1od6aPk7MnyWPjHXMFynzPXSzitJyehux5ITdgempS7Ky/BGauZ1LFfr4q
	 u48+U1egGclO8lOKUPkEgr3ZTGLNo8Wiqbin0UlmczIbxjbgfqPh5sdlEFcjWRhMDq
	 3vF3AWWbTz6kh7d5Q21DwCRwnFmNo16Kde9vF5A2GSPKfZu+9XTXYgE3r3JFnWvYCd
	 wX7ECcY52y6b7haB1rNgqUHT9uJgVZPuNYigZwD1N+2viHnTTWV4HadJgtSL2hGJc4
	 DcrHbLCrjSszwUsRy4Iy1y058wBu57KGjOOuSIZeHRgW9FvOXDemw0Yycz/3FDYfKK
	 H6eArB6YW8+0A==
Date: Fri, 10 May 2024 07:11:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, bard.liao@intel.com,
	yung-chuan.liao@linux.intel.com, kevin-lu@ti.com,
	cameron.berkenpas@gmail.com, tiwai@suse.de, baojun.xu@ti.com,
	soyer@irl.hu, Baojun.Xu@fpt.com
Subject: Re: [PATCH v4 1/3] ALSA: ASoc/tas2781: Fix wrong loading calibrated
 data sequence
Message-ID: <Zj26j5CrWA9PZI3l@finisterre.sirena.org.uk>
References: <20240510034123.1181-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IBGLJYrAp7PURpSa"
Content-Disposition: inline
In-Reply-To: <20240510034123.1181-1-shenghao-ding@ti.com>
X-Cookie: Did I SELL OUT yet??
Message-ID-Hash: 2HP3JSKWOYADU7UHY4BK72OQPRRTR2Y6
X-Message-ID-Hash: 2HP3JSKWOYADU7UHY4BK72OQPRRTR2Y6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2HP3JSKWOYADU7UHY4BK72OQPRRTR2Y6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--IBGLJYrAp7PURpSa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 11:41:19AM +0800, Shenghao Ding wrote:

> Calibrated data will be set to default after loading DSP config params,
> which will cause speaker protection work abnormally. Reload calibrated
> data after loading DSP config params.

This changelog...

> -#ifndef __TASDEVICE_DSP_H__
> -#define __TASDEVICE_DSP_H__
> +#ifndef __TAS2781_DSP_H__
> +#define __TAS2781_DSP_H__
> =20
>  #define MAIN_ALL_DEVICES			0x0d
>  #define MAIN_DEVICE_A				0x01
> @@ -180,7 +180,6 @@ void tasdevice_calbin_remove(void *context);
>  int tasdevice_select_tuningprm_cfg(void *context, int prm,
>  	int cfg_no, int rca_conf_no);
>  int tasdevice_prmg_load(void *context, int prm_no);
> -int tasdevice_prmg_calibdata_load(void *context, int prm_no);
>  void tasdevice_tuning_switch(void *context, int state);
>  int tas2781_load_calibration(void *context, char *file_name,
>  	unsigned short i);

=2E..doesn't seem to have much relationship with the change?

--IBGLJYrAp7PURpSa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmY9uo4ACgkQJNaLcl1U
h9D4agf+I0bZ1B3cEZzcn8kwAbokayZK3bWdqamWTuNLb3Vcx2uhyC4/bvRK5qQn
J6hS0j9LlmPaTipkl0Y7ztNShtj4T1VRNBY9RN3zRg9WuGh6ruQNGjFZO5gLMlr6
pg6e0ZfZ1Ja76r2kTsr4VzmBuhuoaDSpemsDCbCHHj3ibiHVobR7k2T0YnBoOGyQ
je4perE+5AwpAYiUrQUJklo14YYepi+ofoALKisnmpHva6wKFeq6L3l3IacPFBvM
cmODN8eF+LcZWc9GEd7SRIkmW9esFWti/G84NItQC2V6v9JaIDG4APXcFYPAWn1N
9s0AEBIhbb8SzQnWR1ajUfJH6zQR3A==
=r0T+
-----END PGP SIGNATURE-----

--IBGLJYrAp7PURpSa--
