Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7A4A1D71
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:44:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1897216B1;
	Thu, 29 Aug 2019 16:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1897216B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567089848;
	bh=qpIBBdt/QXz0/Uh65wNcP7sQh4bUW3kmCyAw8lb2uh0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dmf0RETnNu2Rg3VnLHJqCRNH/JddT3/vZL3k/pYPuK2laJJLR4ccPvcW5XTSwnI32
	 aE0EkHrDu4dQZqCiuJ8CH4HoAkxJe6rc6S7e5LApgSkSBeS9V3DH/nO6qBYIrTe8G+
	 lKWUMaRPrVAKR8AXEB8WL/K32j2p2NjXfhgVIwgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C00C4F8975E;
	Wed, 28 Aug 2019 14:07:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8F6AF8975E; Wed, 28 Aug 2019 14:07:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0CFDF8975C
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 14:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0CFDF8975C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="OCKJ3T0i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VSZbGWN5MQrsUgb/oDIeuGL9IgSSsqbikqgQPGC9ons=; b=OCKJ3T0iN6MMEaA6L4mdJh/2e
 Em9bByYmf83Mt0X4Nk3K7ZXc41hTFfPb0KbF5DihDg0r/tDp5HoPEpgVHzHBa7tKLvXQ/dJ7/P131
 eyK7NOu26fpiCXyB/ZGMvoemKIVGgGrpbwKCX9XmQlgNBPmp6BOz85PotWDTBOD5IXWn8=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i2wiz-0003r8-Cz; Wed, 28 Aug 2019 12:06:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 8DE1F2742A55; Wed, 28 Aug 2019 13:06:51 +0100 (BST)
Date: Wed, 28 Aug 2019 13:06:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190828120651.GG4298@sirena.co.uk>
References: <87pnlhahr6.wl-kuninori.morimoto.gx@renesas.com>
 <87y305932s.wl-kuninori.morimoto.gx@renesas.com>
 <f3ead090-8c2c-6be5-70b8-c6530239302a@intel.com>
 <20190808111417.7033df42@xxx>
 <87blwk1n9m.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <87blwk1n9m.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Oatmeal raisin.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 19/25] ASoC: soc-core: don't call
 snd_soc_component_set_jack()
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
Content-Type: multipart/mixed; boundary="===============7663648602407168528=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7663648602407168528==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sw7tCqrGA+HQ0/zt"
Content-Disposition: inline


--Sw7tCqrGA+HQ0/zt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 20, 2019 at 01:24:11PM +0900, Kuninori Morimoto wrote:

> > We can of course add handler to our driver to do this, first version of
> > patch actually did this, before we decided on global option.

> I double-checked framework.
> *All* drivers which are using snd_soc_component_set_jack()
> doesn't care reset jack.
> I think it should be done under driver, not framework,
> but this patch seems have big effect.
> OK, let's skip it.

Yes, I think the current code is better for robustness - we've got a few
things like this where the core will do cleanup even if it's neater to
do it in the driver since it makes it harder for there to be mistakes.

--Sw7tCqrGA+HQ0/zt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1mbloACgkQJNaLcl1U
h9Bfawf+MCg4tpUR27zw/69E3SEpK5R6ysf4t9bKaD7td6Fx3dF4BQHA0QXcDVF/
yG+51doNueX8WkcoWZzYdbn5rm290frRL3oy2lyBVBK78gEsjkhfkbCjmMLM5MFd
3A4++r4CTHoMd+xMANJrbwWzCPM1g14uU04KvvARUndbqfTMZrfSRKbmg481xM4Q
V4DPmWDABJ3vSdlWrjQHTZ4DwHLdKz64Px9Ou3qfbDnJMrWbzGpS815X9vUa8yKo
LVNnYmhon/n3Jalg66IpD4a4VKU89GEEq9M1d2cz8HhLlL4wLoV/AjDZq5llt2uZ
InpC/rHoQDU/R+m89mrTEN9kXwnJjw==
=/O0s
-----END PGP SIGNATURE-----

--Sw7tCqrGA+HQ0/zt--

--===============7663648602407168528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7663648602407168528==--
