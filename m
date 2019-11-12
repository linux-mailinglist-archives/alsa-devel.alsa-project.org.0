Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 911A0F9670
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 18:00:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 164A81607;
	Tue, 12 Nov 2019 17:59:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 164A81607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573578041;
	bh=7Mf03mEZ/6nbwry4SVq4sSL8MynGg7XgnLv/lHrNBrw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=co26/PfkzN4Jt1HbHPy/V2GqiRO41UcntJFaAbHyCW0qZjbE4I9NWbAGNUbbJn0CM
	 EdfsRwekOQUTU2tsYljn2bbIt4wQVKPXCGQ8VRAax3ues4jccfvV1O4r+SCbnRD7Ol
	 8gBQThqZjqOBPXXcbpJOkH7lzfb9tknw8n4s6jlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C694F80483;
	Tue, 12 Nov 2019 17:58:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7F14F80483; Tue, 12 Nov 2019 17:58:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 883B8F80275
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 17:58:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 883B8F80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jHKdcLx0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0oFanHzvRKjHtSffMmTBvtzgldwVkwNTRsjU7YGLOJo=; b=jHKdcLx0GiMlDV/Rekrrc7/2L
 kNwJCF4PhwI6JqS4K0PSmP1cs6+zoC3L3mP6AVvNdaku45Lo2bZSggel/I/Y8nsjs2FAkI6zrtON/
 yw+tMxnc0m0joDHNC6rrdRMv4CGzziLNxWU9OIqWzV0yA+Z/4AuhxCVYtYEuVCBjNdrf4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUZVC-0008Gh-TW; Tue, 12 Nov 2019 16:58:50 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 44080274299F; Tue, 12 Nov 2019 16:58:50 +0000 (GMT)
Date: Tue, 12 Nov 2019 16:58:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Message-ID: <20191112165850.GE5195@sirena.co.uk>
References: <20191108174843.11227-1-sebastian.reichel@collabora.com>
 <20191108174843.11227-2-sebastian.reichel@collabora.com>
 <AM5PR1001MB09942731970692EE42BE9CB180740@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191112152411.d626b34wmvkzpqjf@earth.universe>
MIME-Version: 1.0
In-Reply-To: <20191112152411.d626b34wmvkzpqjf@earth.universe>
X-Cookie: As famous as the unknown soldier.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [alsa-devel] [PATCHv1 1/5] ASoC: da7213: Add regulator support
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
Content-Type: multipart/mixed; boundary="===============1520272151729853833=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1520272151729853833==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Uwl7UQhJk99r8jnw"
Content-Disposition: inline


--Uwl7UQhJk99r8jnw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 12, 2019 at 04:24:11PM +0100, Sebastian Reichel wrote:
> On Mon, Nov 11, 2019 at 02:07:46PM +0000, Adam Thomson wrote:

> > Having spoken with our HW team, this will cause a POR in the device so we can't
> > just enable/disable VDD_A supply. Needs to present at all times. How are you
> > verifying this?

> Ok. The system, that I used for testing shared a regulator
> for VDDIO and VDDA. I suppose this needs to be moved next
> to enabling VDDIO then.

regulator_bulk_enable() might be handy here.

--Uwl7UQhJk99r8jnw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3K5MkACgkQJNaLcl1U
h9C6TwgAhsGHpb6UsZh0hRdSvQrMRjsrI6Ehz5Ij8M6Ngr2O6RoBOD7dVHLHm5xh
YOj1zRVI3ytgajOb4UkFgMXiMTAk00lvTninl/JPtR46HAZ/M3RUhwFcUByz6iZb
AHzSsNM56dO6rrwhmIlcO2cpQP15pP+ctCsWtgL+1HK3937f54d5LuaFyiP4EZRz
KVBPTfKWBdhOH1j/KzQWrttlhfkKZJYfy8T1lJRxQC2AT4RSME99g1gAEp9B/ING
bz8TrjkcW/3fzbU1FawD5AV5vcbiTiNkVapVh75sHcunN44xug13jf+BHgCwYmYo
wVDuoCE212CxXnb5oB+7AEiEruIbVg==
=igeR
-----END PGP SIGNATURE-----

--Uwl7UQhJk99r8jnw--

--===============1520272151729853833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1520272151729853833==--
