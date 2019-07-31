Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BF87CD1B
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 21:49:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F9F216A0;
	Wed, 31 Jul 2019 21:48:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F9F216A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564602553;
	bh=bOn95StV5cC14oNE3rNK+GbcLL5VgF4UCPWnGCuCt+w=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JIeLOTJdtTF9h5+s/ReY/SwYlMZBFabhNqPVQpjlu0fNKO9ZrE2Zhj4LzJ7bUsxGr
	 mDsMPzV0Nhjuo2YqwuEadmV9vHEaFGkVyxZYmXVsy2i/9JvAaoX2oX+0763b1oJnBy
	 a/uCEr3iKWvwahxzrpVllrHIx5lv0icx2ZuFE+Bw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 979BBF80214;
	Wed, 31 Jul 2019 21:47:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76093F80483; Wed, 31 Jul 2019 21:47:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBED6F80214
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 21:47:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBED6F80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Tat7484s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ywgvJpds6ShwwZJqZzq8qZN2L9l/gFjUWXQjVg0+xMg=; b=Tat7484s4Is7coC0Akt9WpQYv
 eph3Y1ifwxs/7zgbZ1s1+ipensPo32nHGqAzn49uWE9ySs2ZQ0Bodyj007DRKc+VhnC79WoFIjFd/
 cnL2B4HCDdPPdAUfC7qMK0ZnAewHySBtpC0dY/5KyRi/+sTWk92q0NRTlxLBAPQ/o1NvM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsuZF-0003D3-8g; Wed, 31 Jul 2019 19:47:21 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6F8D62742C99; Wed, 31 Jul 2019 20:47:20 +0100 (BST)
Date: Wed, 31 Jul 2019 20:47:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20190731194720.GH4369@sirena.org.uk>
References: <1564402115-5043-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1564402115-5043-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
In-Reply-To: <1564402115-5043-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Cookie: FEELINGS are cascading over me!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Sanju R Mehta <sanju.mehta@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC : amd: reduced period size
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
Content-Type: multipart/mixed; boundary="===============7239048877592432034=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7239048877592432034==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SUk9VBj82R8Xhb8H"
Content-Disposition: inline


--SUk9VBj82R8Xhb8H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 29, 2019 at 05:38:31PM +0530, Ravulapati Vishnu vardhan rao wrote:
> Reduced period size and offsets.

Why?

>  #define PLAYBACK_MAX_NUM_PERIODS    8
> -#define PLAYBACK_MAX_PERIOD_SIZE    16384
> -#define PLAYBACK_MIN_PERIOD_SIZE    4096
> +#define PLAYBACK_MAX_PERIOD_SIZE    8192
> +#define PLAYBACK_MIN_PERIOD_SIZE    1024

Is there a need to also reduce the maximum, the hardware culd support it
before?

--SUk9VBj82R8Xhb8H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1B8EcACgkQJNaLcl1U
h9C6BQf+Oo4ryGKqExrjlr4uVgeaAMIHXAeGfJG+wmHgD6YbMabBcib7q7imVqKk
1npEyRS6jlWFO9jRTVUGfMHhAP51/E/1oNmJB9YllLPq4cuViQUH7ztud3pcN04z
zQ8hm1OtH9YmBfIoABFxYgFd6DI+hn/OdEX4dN4Unv0ppvTQZ0NTCd0Ikok+061U
CacojaF/Z/mrjZir7lXvFuxC9PrG+4/C6FakQC9ApRbewYjxybg+KkG2AuN7CeUK
ZP9ZrbEpe6668ZDm/cpSI4axkP+FCVTKorW6M19AoMbcOWCdCL90D5hhO+1pgv50
CT55tq9iGxYm7D9cLBE0glLW+Ymd0g==
=JOkR
-----END PGP SIGNATURE-----

--SUk9VBj82R8Xhb8H--

--===============7239048877592432034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7239048877592432034==--
