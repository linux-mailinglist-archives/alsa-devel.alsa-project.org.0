Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 307094B0F71
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 14:56:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56202192E;
	Thu, 10 Feb 2022 14:55:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56202192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644501381;
	bh=4T5GxSxlHHWGyyYwn7ZFv0DAVMPMJFjG9l8aHaQ2gB8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BSJ2OMCXi7QsPhB3gfLT5oO2lT1TUtLZRMgbGm00hSm2cWmoPyJsHUOnaLFHJjQDX
	 lg+WwSuVTyYa8f7TaX793s41Y04oYYXkx5p8cyOq/89Bk5UIiCAQLCIZtt4tH41Bv5
	 m97SO/2+H7wun851sdXPIR+gpj4eO2IzC3jUhlno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68895F800A7;
	Thu, 10 Feb 2022 14:55:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37506F8028B; Thu, 10 Feb 2022 14:55:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6729F80054
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 14:54:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6729F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X7sbkJhH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5F087B8255C;
 Thu, 10 Feb 2022 13:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD615C004E1;
 Thu, 10 Feb 2022 13:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644501296;
 bh=4T5GxSxlHHWGyyYwn7ZFv0DAVMPMJFjG9l8aHaQ2gB8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X7sbkJhHzVrU26hiKYcg+Ezd64u/+3cu4op9Bwj15hVpVamwFX5sYdvPTkjd8P2f6
 6liB3Qw3YkisZX7fIICk7joeUad9bkIX+fhLVMj4HRn5b/dwLC+lSPTrMh4VzvhxBV
 ZvyCXGqNIwahvMgFqEob7xR229BuYL8G0fqePNnBdNJDr3WC44KwFCKb/6HeLvZXsq
 BWFrSRpkdKShh3/FfXaKgA/WxvYTp8YPu6VJcYftZnMfKKCOq8/V8LikIT9nV6Tg7g
 c2Lwx0VZDn53tHlVcFm7MCx1GMY3mVR2wF83K8uvr4oua/vepMqyrnet6D7AjShkCf
 3uscYbY4zIbYA==
Date: Thu, 10 Feb 2022 13:54:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 9/9] ASoC: SOF: Convert the generic probe support to SOF
 client
Message-ID: <YgUZKgPacRNrFk/e@sirena.org.uk>
References: <20220210105519.19795-1-peter.ujfalusi@linux.intel.com>
 <20220210105519.19795-10-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QMm/tXeGvkQp+EWG"
Content-Disposition: inline
In-Reply-To: <20220210105519.19795-10-peter.ujfalusi@linux.intel.com>
X-Cookie: I want a WESSON OIL lease!!
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com,
 fred.oh@linux.intel.com, daniel.baluta@nxp.com
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


--QMm/tXeGvkQp+EWG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 10, 2022 at 12:55:19PM +0200, Peter Ujfalusi wrote:
> Add a new client driver for probes support and move
> all the probes-related code from the core to the
> client driver.

This breaks an x86 allmodconfig build:

/mnt/kernel/sound/soc/sof/compress.c: In function 'create_page_table':
/mnt/kernel/sound/soc/sof/compress.c:87:9: error: implicit declaration of function 'snd_sof_create_page_table'; did you mean 'create_page_table'? [-Werror=implicit-function-declaration]
   87 |  return snd_sof_create_page_table(component->dev, dmab,
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
      |         create_page_table

--QMm/tXeGvkQp+EWG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIFGSoACgkQJNaLcl1U
h9CW0Qf/Q4GQ+DKEP1CNG0ioomd5kKN5fZu16CQ8wlQPl9Cp+h5flqb5dQnZNJGe
JuyktYDqCZxyJxGdzgHhBSnQ6lCtTW/b6KhBs08lij3PypAVXFyFIuEtbLM4N405
6mUuoGmoB7HcihCODnDZ+QAhbh7DtPkoN1SoOQO15N4EwYVkL4NuGFkJYD2Am57q
tr1V/YsYSYlyyuUemcfTQxOr8H5E0c3A7Zm8klJGhM7tIhDldAsoDZUKdh6l6747
PCe6LSvQ5EyTGj4YxAqYzLPghly8eXCgeRV1Xc4wnjBSn3zZmeal7/klX+p47HPj
8QMNhdXpErMJbT7SKZr7IPC3bzNOUw==
=nbVs
-----END PGP SIGNATURE-----

--QMm/tXeGvkQp+EWG--
