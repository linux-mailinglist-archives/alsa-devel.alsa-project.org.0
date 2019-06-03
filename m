Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E2733503
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 18:33:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2395316E0;
	Mon,  3 Jun 2019 18:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2395316E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559579582;
	bh=l803VwXZ1rGyRMuz3OenN7cuFH++ymfpIu6dahf9Ox8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iylSWjpmXp+HiASx6Y/kleni4PjiZMABksa2e9YO6KrNHGFu7di97wyy0JpP8fv5J
	 x00qyz5iCGJsUMChWM70T3sQoSnrdShnQYMULzrZKWWW+cQBlYGstNFv93cUjUGdhB
	 8MT7oDdzdHnPtFGgpaYCNWoX1HbUspPdVCk67SQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85E20F896EE;
	Mon,  3 Jun 2019 18:27:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81CF5F896DE; Mon,  3 Jun 2019 18:27:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCE33F896CE
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 18:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCE33F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="huL5RTDI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AIR15ZXdX0dwQTL+oBJecBGKpuGPcqrXXfd8lFVSV+w=; b=huL5RTDIxvXqBbbaVZiyF8lqp
 DRBJSNW4l/0F0yglYE0lW6c3VpCM94WJ3Q9SeLndCHOTPdygY9D7e3RzTnBy5NEMSzLyf+mrrbiVz
 MTqZfJc5ALxRHjHRmrHMv2ntGAPxFR38oaDNUcpwt/J13J9gkGm3TYo05+Gm2DJWXXkTc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hXpoG-0002MC-JG; Mon, 03 Jun 2019 16:27:44 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 46A2F440046; Mon,  3 Jun 2019 17:27:43 +0100 (BST)
Date: Mon, 3 Jun 2019 17:27:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190603162743.GZ2456@sirena.org.uk>
References: <20190603161821.7486-1-pierre-louis.bossart@linux.intel.com>
 <20190603161821.7486-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190603161821.7486-2-pierre-louis.bossart@linux.intel.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 1/9] ASoC: SOF: uapi: mirror firmware
	changes
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
Content-Type: multipart/mixed; boundary="===============0417947329364843004=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0417947329364843004==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LmcuB6YxSMQAV95c"
Content-Disposition: inline


--LmcuB6YxSMQAV95c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 03, 2019 at 11:18:13AM -0500, Pierre-Louis Bossart wrote:
> We missed these two definitions for GDB support and component
> notifications, they are defined for the SOF firmware. Since they are
> not used by the kernel so far, we can still add them without any ABI
> change.

Adding stuff is generally not an ABI break in and of itself (though
requiring new stuff can be).

--LmcuB6YxSMQAV95c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz1Sn4ACgkQJNaLcl1U
h9Du3Qf9H0V+Vetf32dkzHrxtqz899sW7+vIMmG9WnFbinxUZTpZpPOV3T2cqu/i
aFB8ZPFt7ifX2hDhNwOAhZvmSJBR0XbcceWKOFwRe9D/sJp0ylBHQofjWMmmzSjn
83zZRFgCKyolgnHCrXNpFqE4Iecb9KIbx2L6WNptxRRgx9xXNl9FL1PW8hk3ddqq
3hFA6Bz4tXFcAV55ncLYtuKmm2Vb/BC1vTnluTPWyKJ6fwz8sswemV4uDcfIsYtI
xBktS5a+b4TK01KqDgsrTduZxaynLlF8XbYpac87Ju+l6lLS0qwuECXZS4kt+nYn
ka6kjye8MeqdBDRWwGfwxUtY/hHKVQ==
=2h30
-----END PGP SIGNATURE-----

--LmcuB6YxSMQAV95c--

--===============0417947329364843004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0417947329364843004==--
