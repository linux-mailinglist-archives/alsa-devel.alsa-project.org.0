Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA2327EAD4
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 16:22:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2EBC1815;
	Wed, 30 Sep 2020 16:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2EBC1815
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601475773;
	bh=+1/4+dyeBa6D/R3gR5U26bTNV5IOq0cpC9OId+aQk5w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZVnKgEr8Zxl0+uPR33StjyMJ47re7qofLXUtZEU+X6cY+wTT1XwnF1Lda1gjCCQn8
	 wC60ZdwrMhpiWW7hNcpjSAcN5oH6TWyu3wwJht0qtsGfQq3ZITTOUtyfR3YFW2NrDQ
	 jNHPJQJTbxnOCK9Y9iGMzct93jnr7AlmhLFEBER0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79EEBF800DF;
	Wed, 30 Sep 2020 16:21:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3B6DF801ED; Wed, 30 Sep 2020 16:21:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65001F80110
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 16:21:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65001F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PPLqR/Co"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0581220709;
 Wed, 30 Sep 2020 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601475660;
 bh=+1/4+dyeBa6D/R3gR5U26bTNV5IOq0cpC9OId+aQk5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PPLqR/Co7uT0HnEhiAWaop5XplOF5fqsmwoBzIIGjEvmQACZdq6Kz1P517JO8+fe2
 z5K3QXKXxESE90q1l2/sDFFwfBbWSGpIEggLOSbcQlY+DzA9oWA+VrY3dA0lNOai0B
 M7dM3++bI6ZRq69v+Ej0o8H2l4PxITr63CeTkA7g=
Date: Wed, 30 Sep 2020 15:20:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH v2 2/2] ASoC: hdac_hda: allow runtime pm at end of probe
Message-ID: <20200930142001.GI4974@sirena.org.uk>
References: <20200930114140.3839617-1-kai.vehmanen@linux.intel.com>
 <20200930114140.3839617-3-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZY5CS28jBCfb727c"
Content-Disposition: inline
In-Reply-To: <20200930114140.3839617-3-kai.vehmanen@linux.intel.com>
X-Cookie: Doing gets it done.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: cezary.rojewski@intel.com, kailang@realtek.com, tiwai@suse.de,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 harshapriya.n@intel.com, ranjani.sridharan@linux.intel.com,
 emmanuel.jillela@intel.com
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


--ZY5CS28jBCfb727c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 30, 2020 at 02:41:40PM +0300, Kai Vehmanen wrote:
> Align with recent change to forbid runtime suspend during codec
> init in snd_hda_codec_device_new(), with matching call to
> allow suspend at end of hdac_hda_codec_probe().

Acked-by: Mark Brown <broonie@kernel.org>

--ZY5CS28jBCfb727c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl90lBAACgkQJNaLcl1U
h9D0dwf/cCfRYrYawT9MsfKDZTKvkADtwsfmIA2/vo/3+iv+XsG15MJUVehFVmLT
/ChTW+rmqGt5NijXqwfgr7SZMeTPzeX/O02wpjbxOJqUsiVZznYilW60vHEfCmZB
HuIO3++Ocz1knOUaQaV4IWxMlDlsbu8okLCVxswUUFXAnsF6Th34MTmaqRiR2buy
9RNsde1pyAcBTSDfc6g1d4VGxINgJlM9DFt7cLuPa4j104pUVmRGNV+EhQdePEuj
7c3AMoRTDyXlM9villQfcSfotbiKtAP+IWGYaQAGRl8VXdM67jefMm13u6OBscuo
Iy/7p/agmhze/zZpSIG8pnwZqoHe4A==
=lA/E
-----END PGP SIGNATURE-----

--ZY5CS28jBCfb727c--
