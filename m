Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 637E42806AF
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 20:36:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCD7F1741;
	Thu,  1 Oct 2020 20:35:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCD7F1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601577380;
	bh=74+0FaoZPwdbMeq6HMEEtsbCc4qRDzYRtXPYq1tIzCk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V8XK77CrXc4AlQK11eKD6ydnSO7bm/yBk1rvAwuvXF52VX+7SLXE6AmAU/1KqWNpr
	 V8IPhZ/1BZpCl9yVwMAwYMmEG5X07eKA+HeMG+47ukUlQMOkHCLBzYQK36EyEntHjg
	 zABrUbdvKNQ9Sy6WQcTo5xXb4ahG+S6XeD1pbvd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6BF6F801DB;
	Thu,  1 Oct 2020 20:34:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FBA3F801F5; Thu,  1 Oct 2020 20:34:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3F0CF801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 20:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3F0CF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aheJh9M2"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD3D620754;
 Thu,  1 Oct 2020 18:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601577269;
 bh=74+0FaoZPwdbMeq6HMEEtsbCc4qRDzYRtXPYq1tIzCk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aheJh9M212/o0nbCLM/Zljy5JNhQirgQZzej4+Kb62OR+2nsizi8nXPsP8pMnumXj
 ihPscaRkcs83Hu0K8sDb2igpreSj0mPfbYTaq0Hyx9acXe2LraKZba/YjFRvtuA4z8
 /NiJdyphA1Y2cjuUgl1IJt7pBdvibPrDk2DXET6E=
Date: Thu, 1 Oct 2020 19:33:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v10 14/14] ASoC: Intel: Select catpt and deprecate haswell
Message-ID: <20201001183329.GA41046@sirena.org.uk>
References: <20200929141247.8058-1-cezary.rojewski@intel.com>
 <20200929141247.8058-15-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline
In-Reply-To: <20200929141247.8058-15-cezary.rojewski@intel.com>
X-Cookie: Do you have lysdexia?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, krzysztof.hejmowski@intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com,
 gregkh@linuxfoundation.org, ppapierkowski@habana.ai, marcin.barlik@intel.com,
 zwisler@google.com, pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 filip.proborszcz@intel.com, amadeuszx.slawinski@linux.intel.com,
 michal.wasko@intel.com, tiwai@suse.com, andriy.shevchenko@linux.intel.com,
 cujomalainey@chromium.org, vamshi.krishna.gopal@intel.com
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


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 29, 2020 at 04:12:47PM +0200, Cezary Rojewski wrote:
> Prevent sound/soc/intel/haswell code compile and select catpt instead as
> a recommended solution. Userspace-exposed members are compatible with
> what is exposed by deprecated solution thus no harm is done. The only
> visible difference is the newly added 'Loopback Mute' kcontrol.

This doesn't build against current code with x86 allmodconfig, please
check and resend:

In file included from /mnt/kernel/sound/soc/intel/catpt/core.h:14,
                 from /mnt/kernel/sound/soc/intel/catpt/dsp.c:13:
/mnt/kernel/sound/soc/intel/catpt/dsp.c: In function 'catpt_dsp_set_regs_defaults':
/mnt/kernel/sound/soc/intel/catpt/dsp.c:339:29: error: 'SSCR2' undeclared (first use in this function); did you mean 'SSCR0'?
   catpt_writel_ssp(cdev, i, SSCR2, CATPT_SSCR2_DEFAULT);
                             ^~~~~
/mnt/kernel/sound/soc/intel/catpt/registers.h:152:43: note: in definition of macro 'catpt_writel_ssp'
  writel(val, catpt_ssp_addr(cdev, ssp) + (reg))
                                           ^~~
/mnt/kernel/sound/soc/intel/catpt/dsp.c:339:29: note: each undeclared identifier is reported only once for each function it appears in
   catpt_writel_ssp(cdev, i, SSCR2, CATPT_SSCR2_DEFAULT);
                             ^~~~~
/mnt/kernel/sound/soc/intel/catpt/registers.h:152:43: note: in definition of macro 'catpt_writel_ssp'
  writel(val, catpt_ssp_addr(cdev, ssp) + (reg))
                                           ^~~
/mnt/kernel/sound/soc/intel/catpt/dsp.c:340:29: error: 'SSPSP2' undeclared (first use in this function); did you mean 'SSPSP'?
   catpt_writel_ssp(cdev, i, SSPSP2, CATPT_SSPSP2_DEFAULT);
                             ^~~~~~
/mnt/kernel/sound/soc/intel/catpt/registers.h:152:43: note: in definition of macro 'catpt_writel_ssp'
  writel(val, catpt_ssp_addr(cdev, ssp) + (reg))
                                           ^~~


--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl92IPkACgkQJNaLcl1U
h9D35Af+InRDbk2Bnv3NzWXzdFSzRsyke1c1hSNvtSEgup1Ts8Pxk3a50fc4h41X
wkwNR+CYO4ytGY8ykh/MprqnB07qBtHegLyqt3A/3wbTbsXCaGqiagHPvFTk20ug
q5+6eFOGoXIdMp8QYmza35AQLO2nksoNpBhC3lRAFMDOFMUbGxnKuLY5DEpyL6VG
+rt9SHWVg8aQJZdjvnXxKCHC0A+970jxFkt8bKwQ4ODk4M+PH6WYqzV1vhGSMw0+
XSrvfNxp5tr4snu5t993r3KEctkU5p8CiYSFxyll7/1LgQn5k8ca7QLyjd5k8auI
HmUs8D9/ThSc/S7PcGq0kLYFyG3fuA==
=mw6v
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
