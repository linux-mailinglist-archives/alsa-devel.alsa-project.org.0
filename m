Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF266BF924
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 20:26:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66BEB1769;
	Thu, 26 Sep 2019 20:25:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66BEB1769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569522401;
	bh=pC5OALv863XzZULEp1TSLdluN0LlKxEc5tOne1oux3A=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fuNKlXXEvckM6CYlyNLmWgv90GZn9ANAFHIx+PGFn0uuHY/H6AxLstGIgoW34rLd1
	 6i4GpzTx8AABmOFTt2M+qWjNTDkoq2id4HELhAxsPSQKaoNZbpkwkpO1fsoewqSFNF
	 /hXfnKRZbRylXu379xWrUkxVGmMKpSR+r3S6IutI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCA55F803F4;
	Thu, 26 Sep 2019 20:24:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01A05F803F4; Thu, 26 Sep 2019 20:24:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE80DF80140
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 20:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE80DF80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="omq5DJJD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AugkIEvD7+r+PFx4d50SUNlVbq4ALnJeABueWXjTypQ=; b=omq5DJJDq8oshEHinGKpmGl9v
 43qb+SBkAaKuYb4Jjqppv08P5rF2yoWgxlK/11R6UGp4EUBN3ZUu/+1AlsAZNnW6a+TGMYpyDbifd
 FnpYGX9M/TwL9BQpq67e8gjBg4Mm8szxbXSxb4OJ1xO7TIYVB2bNwR8RPws3iW0QnrupM=;
Received: from [12.157.10.118] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iDYRe-0004SG-6f; Thu, 26 Sep 2019 18:24:50 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 86FA7D02DD8; Thu, 26 Sep 2019 19:24:48 +0100 (BST)
Date: Thu, 26 Sep 2019 11:24:48 -0700
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20190926182448.GE2036@sirena.org.uk>
References: <1569539290-756-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1569539290-756-4-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
In-Reply-To: <1569539290-756-4-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH 4/5] ASoC: amd: added pmops for pci driver
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
Content-Type: multipart/mixed; boundary="===============1867994345450531591=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1867994345450531591==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JTVzY7YXrWvPVXom"
Content-Disposition: inline


--JTVzY7YXrWvPVXom
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 27, 2019 at 04:37:38AM +0530, Ravulapati Vishnu vardhan rao wrote:

> +static int  snd_acp3x_suspend(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static int  snd_acp3x_resume(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops acp3x_pm = {
> +	.runtime_suspend = snd_acp3x_suspend,
> +	.runtime_resume =  snd_acp3x_resume,
> +	.resume	=	snd_acp3x_resume,
> +
> +};

These operations are empty so they should just be removed.

--JTVzY7YXrWvPVXom
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2NAm8ACgkQJNaLcl1U
h9AjzAf/UH1pDPCNMtAFU1c75tQQ88+9u6FIttYJDSACr7DGvasiGcA09dm6+N4N
+HhIH338G/hCPzq8YLpT0mRv2KPofAecLo9bpMiWTLGU3Lk8j+MNqitNZlhTf/+/
ym4qJajutTJ3uoVnruc7L5YJX8pF2TB9dIkImSd0Nt73y3OQGOUBKgmyhlo7PYuZ
4HZtnnanVCkvOyIYcQxGcFZXRWna+sH/oUnKINuxJeHgRmAG6XrHpu4y1RkYB/EN
Jpvg6NyRKMJDxYGiPSX5gAzPDlVR0qMcp+UFlf7OOqQUot7zwehbxhSYUALk3y9D
UqDxncXlmBrURtifJVn3J8hUPOJJxg==
=Y0dc
-----END PGP SIGNATURE-----

--JTVzY7YXrWvPVXom--

--===============1867994345450531591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1867994345450531591==--
