Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B830F91DF80
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:38:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6FFD2C1F;
	Mon,  1 Jul 2024 14:38:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6FFD2C1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837529;
	bh=Kk7hKCQ0rQ+4DfET7z3nKVAwpR0YpyaypAt5Z4/yygU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vA3vSAkgcKQd4gW5ni6F/469x/XoT9gK2fqy8JUYHqLi+g6l4MOPGLSTFfDR15oqQ
	 McGbvF4QEiqWWAXt7BEfb402OcasV9ZueXI9nKsu9CQpNdaWbHl+As9K3zxzyrGe2B
	 iSSl+vePqeSkJc1QwDn5V2MSyyA2O/QWCL7u+pB8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7AC8F80C1E; Mon,  1 Jul 2024 14:24:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D46AF89B08;
	Mon,  1 Jul 2024 14:24:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5834BF89B17; Mon,  1 Jul 2024 14:24:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99451F89A4C
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 14:23:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99451F89A4C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RYTfgAP+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EE48C61286;
	Mon,  1 Jul 2024 12:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2C4C116B1;
	Mon,  1 Jul 2024 12:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719836617;
	bh=Kk7hKCQ0rQ+4DfET7z3nKVAwpR0YpyaypAt5Z4/yygU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RYTfgAP+PnpdcDvOiS6uYiXMxnWqyUy7iLWgwdJFh19XyfL1qVPmyEE0Dk30LvsiE
	 MOzQdka3sE0v7NxV9dM3OJ9nyLKvjvq7H9DRcqRdMReMAUq/tsD0zjJHysna6E8wMX
	 ehhzIOT039uU9Fk/B9AVhrg3p0tYYNamVa43fFFHS2cHC0LunA1TY13DDeROhtGh8P
	 7hnmDSfyQ57ma4p7IGwNgii10cHwBgIKWjuhOah5KGsgbDsjarUxD+2SES8r53WO6g
	 +fkEgdgkVBOg8q7sqrju1riU8sqwcSuBRG/MIyDCPwZlIZ5kKwcfXdHXLWom90ZhV+
	 nxawNl1MEnFTA==
Date: Mon, 1 Jul 2024 13:23:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
	linux-kernel@vger.kernel.org, j-chadha@ti.com,
	liam.r.girdwood@intel.com, jaden-yue@ti.com,
	yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
	henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com, soyer@irl.hu,
	Baojun.Xu@fpt.com, judyhsiao@google.com, navada@ti.com,
	cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
	savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com,
	jesse-ji@ti.com, darren.ye@mediatek.com
Subject: Re: [PATCH v1] ASoc: tas2781: Add name_prefix as the prefix name of
 DSP firmwares and calibrated data files
Message-ID: <8245d8e7-3ff0-4f05-9f99-666e9693603f@sirena.org.uk>
References: <20240629101112.628-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oDtmPYbAjS8IMFoF"
Content-Disposition: inline
In-Reply-To: <20240629101112.628-1-shenghao-ding@ti.com>
X-Cookie: Microwaves frizz your heir.
Message-ID-Hash: 5XQJFMQ6SJHJMMAWIBDOLNDYTGQAT2P6
X-Message-ID-Hash: 5XQJFMQ6SJHJMMAWIBDOLNDYTGQAT2P6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5XQJFMQ6SJHJMMAWIBDOLNDYTGQAT2P6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--oDtmPYbAjS8IMFoF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 29, 2024 at 06:11:10PM +0800, Shenghao Ding wrote:

>  	tas_priv->fw_state = TASDEVICE_RCA_FW_OK;
> -	scnprintf(tas_priv->coef_binaryname, 64, "%s_coef.bin",
> -		tas_priv->dev_name);
> +	if (tas_priv->name_prefix)
> +		scnprintf(tas_priv->rca_binaryname, 64, "%s-%s_coef.bin",
> +			tas_priv->name_prefix, tas_priv->dev_name);
> +	else
> +		scnprintf(tas_priv->coef_binaryname, 64, "%s_coef.bin",
> +			tas_priv->dev_name);

I'll apply this but I do wonder if it's worth falling back to trying to
load the unprefixed name if we fail to load the prefixed one.

--oDtmPYbAjS8IMFoF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaCn8AACgkQJNaLcl1U
h9AjwAf+J1+DRZh2rLJitmV5riPW1tq3dorqJvTbAeR/1xGl1WZ7R2aHDVOroOTb
mZSHnVpCNk1L1+rU61q2Os1+rxCLgVfTlWOWWaqWcmRak15vDsvF875AT5GAy9I6
pYxsqfFkAWsQEhXL+4FnWu63CF1AR1x5nAclAwz86n263fH7aI0xpBlwzWyAAilA
SoGUTcqDCylt7Y1YFPqGYbfwmEVYOikhb8tjk07UdJ9pUwO1J/c7zTr3jbZvu8eU
BNv/g94BlUAugDDUGUdu7vhaalk9kT79H1PLFnc9LGpMruTr3CzomQU+YG9yRRHf
JJ7Y/N2M2KyS12GA3oZksRxkg9sepg==
=bwuW
-----END PGP SIGNATURE-----

--oDtmPYbAjS8IMFoF--
