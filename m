Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3698458285A
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 16:16:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93DFC1637;
	Wed, 27 Jul 2022 16:15:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93DFC1637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658931392;
	bh=FCJBkIeBqxLGwi8tym4TWgvrzE7oI3PcDO3ND5UwEeI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GqVJEKMqjhHovgDFQ2/OiEafXxitVrFrTjPzXVowFYZXOMV7kymxQXDTZcNxD7BJ7
	 IzLZo4ilKQL5j94ipktihWKl07t0/EbNX3C5GzE15MwG2X/vfygoUY6KWmzyCeQOTo
	 ekOEN5evQSoOAqY5K8e+ICrcTLMW2H1yJ/0or2og=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA4D1F800FA;
	Wed, 27 Jul 2022 16:15:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D11A3F8015B; Wed, 27 Jul 2022 16:15:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76671F800FA
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 16:15:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76671F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QPM2aLjD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC802617C1;
 Wed, 27 Jul 2022 14:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BB5C433C1;
 Wed, 27 Jul 2022 14:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658931324;
 bh=FCJBkIeBqxLGwi8tym4TWgvrzE7oI3PcDO3ND5UwEeI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QPM2aLjDBncSEppE/0QAl9rrLPavmD1MoGRcBVtgKrIP310Hm9wDOANEVcrVHTkiq
 4ztw48Ya0FItoymFC6IfzGGw5dcnPwQMxF47TZxpBmY7FlOqHHQByPhiNIyL3qci4e
 aZmInavip/yrbdKNTaiv2M7hk7lYaPHJA33b2z6cEQpgCS66dUrRSkI2vjtPKkKhPN
 Jq9m6CaYJAHOeMBMNdU81YB+tdvgqCQ7OJxGXxKN9s+K148rgDq2im1KnLlJKupwBd
 7RRwsscrL8WNv/TciMRGijRjxGXwCyMAsz6+tEbH77ZcXHCs5PlhgjT260tNnz1b/P
 PIZv51TZY4W6A==
Date: Wed, 27 Jul 2022 15:15:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] ASoC: amd: acp: uninitialized variable in
 i2s_irq_handler()
Message-ID: <YuFIdsE4oeGPt643@sirena.org.uk>
References: <YuFANcpt9Z8X9L5n@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UtxYyFEbV5AN1JMG"
Content-Disposition: inline
In-Reply-To: <YuFANcpt9Z8X9L5n@kili>
X-Cookie: No motorized vehicles allowed.
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Yang Yingliang <yangyingliang@huawei.com>, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
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


--UtxYyFEbV5AN1JMG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 27, 2022 at 04:40:05PM +0300, Dan Carpenter wrote:
> The "ext_intr_stat1" is used without being initialized.

Someone submitted a patch for this yesterday.

--UtxYyFEbV5AN1JMG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLhSHUACgkQJNaLcl1U
h9BhqQf/eALiya7frb/KUEyX0e12KJP+RKUobnMOZXQ+5jlhy+r1H7PGqdXWmB6w
YvhXmxTFysVqLNoVojtDunaQT9+i2Wkr2I/nMoXK8eMLD+gSLSUtXP8W2OSuA88X
KYHHzWyi4KquMsRF6uiNB/761+ckh+PyTJAhMaShMxBrXeZIJM3xPhu1SzJ65Ky2
RMQ23PiRgMwXLUcThngqzn5cgnHOlqEF9BiV43vCuLvz7vqiawwYdfs20+lY9uHC
q7k7e1eS2z+65Uzkvc8jHjASDzntP5WF9SU7u3lzaK/7SKiPIQ3dsgrv3NtxGE7V
EkHLH5RAO9EAVWGz0HqshWqCNhXzKw==
=PAnB
-----END PGP SIGNATURE-----

--UtxYyFEbV5AN1JMG--
