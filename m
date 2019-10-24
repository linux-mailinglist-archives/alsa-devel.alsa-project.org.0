Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF30E3177
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 13:51:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9359616AE;
	Thu, 24 Oct 2019 13:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9359616AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571917908;
	bh=qT8m2zSXyyvDpah96AWGll6/eLvuQ0EABaTMK6E+dfc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F4DXbk8nxXWsJdL1fRxxoe9T0nZUsOiP/zca3K4Z59QxmPtNx8D47D64lFXsD2CUl
	 KW7j2okkkRQK5wBMbim5O7jiHSaDYgCiM+GNjSbk1+YjHITXCqK46FqfC7GQi3dv2y
	 aB/pgAN8N+i0zgKoLPzf4NbyA3+AJkOPJRyZrmbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CFEEF80274;
	Thu, 24 Oct 2019 13:49:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20B10F805FA; Thu, 24 Oct 2019 13:49:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BDDAF80274
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 13:49:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BDDAF80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="cneSG2Bo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hcl2Hu8XF9XYGhk/8iPo/AhKxxmEjYeQUOW775gutF4=; b=cneSG2BoO/0PwIhkJpwBK4aL5
 W8OiORsnQ3iF3Jdwb2XuDjpwb4U3S7JHJGygloWk5tC7750+7jmeLNJX6DvRjZeuhXq8nGfhdEbUC
 J6KwZt8WTRZWkvxqUXXIMpYkvUS2BINrtBkcrqMsOaVI6awMyIyFeDjXUHlhGFbGA1Gmw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNbcd-0003Qm-Mz; Thu, 24 Oct 2019 11:49:43 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3919D274293C; Thu, 24 Oct 2019 12:49:43 +0100 (BST)
Date: Thu, 24 Oct 2019 12:49:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191024114943.GC46373@sirena.co.uk>
References: <20191022193955.21766-1-pierre-louis.bossart@linux.intel.com>
 <20191022193955.21766-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20191022193955.21766-2-pierre-louis.bossart@linux.intel.com>
X-Cookie: Filmed before a live audience.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Jaska Uimonen <jaska.uimonen@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: SOF: define INFO_ flags in
	dsp_ops
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
Content-Type: multipart/mixed; boundary="===============8188292576298223816=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8188292576298223816==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qbvjkv9qwOGw/5Fx"
Content-Disposition: inline


--Qbvjkv9qwOGw/5Fx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 22, 2019 at 02:39:54PM -0500, Pierre-Louis Bossart wrote:
> Currently the INFO_ flags such as PAUSE/NO_PERIOD_WAKEUP are defined
> in the SOF PCM core, which doesn't scale. To account for platform
> variations, these flags need to be set in DSP ops.

This doesn't apply against current code, please check and resend.

--Qbvjkv9qwOGw/5Fx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2xj9YACgkQJNaLcl1U
h9CfVgf/W5s4Mkk+QqbRniadPEMO0i6RW8EaZimIQ7EHEsNwNOdW5L59U4HMsHz3
FXQPfRavjOenyVa2CdKYd+FyhO6lxCx6gR3ANmlkz/aI7d6ivV1TMYFuc4HfTl8r
dhip8W/AHhMk6aeV6j2Z1eLsTLrA+XNH+noSS0tIqOfH7gGM6BlwzbWuPAn3jyhz
betMyiTJtLAF1FwknRh2/bwFeVhaBKMeKX2pj+WEB17r8X+3YJoZIc9jeQssflXf
pZMijaUtLlxJ7isBznd/pkFZJT/GS89kkkTTC6XkRXq0/bESMTwzSE8xrvH/o/Sr
eWz+FMGJ3zAlWVNh/+WZuwBgLyfz9g==
=6nWD
-----END PGP SIGNATURE-----

--Qbvjkv9qwOGw/5Fx--

--===============8188292576298223816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8188292576298223816==--
