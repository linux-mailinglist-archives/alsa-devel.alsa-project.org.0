Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4F22558CE
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 12:46:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16E9218A8;
	Fri, 28 Aug 2020 12:45:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16E9218A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598611569;
	bh=5S9ola0AinGcOkFe24KtDIJMhhk9eLQmLaq9E6XgUXs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mGeRDQHlDnY3Q9/kJX4yTd17hGukzpWUpO32eo1Bu08CCYzEIV2GCKDRKegXdEwa2
	 AXMJo8ujKxyN8TWZ2JGK7o72yNmNLlygulQwKH6IOlGPReKEJhR1/n6jbHXhFA/dVF
	 pY05pURoPHJornMyk3DWEHEnUzJz3MxpCpbQKYZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F793F801D9;
	Fri, 28 Aug 2020 12:44:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A70EF8016F; Fri, 28 Aug 2020 12:44:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E40BF800EB
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 12:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E40BF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H1SZ8pId"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A97E208CA;
 Fri, 28 Aug 2020 10:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598611451;
 bh=5S9ola0AinGcOkFe24KtDIJMhhk9eLQmLaq9E6XgUXs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H1SZ8pIdHgh8KrhNCIv7382/Hdg4V7nKyYlbwlelggdMqMvEkKGGTyz71aA6EV/Pt
 igbPUl37VD20iTW3GEcfQII9zlGkuZWWzR7/hyLrFynKJxMirTd6oE3MOYKh0v1ex+
 at9Mli2szL9D/zlVhva4qUw2yGdqeocYfi2gklDI=
Date: Fri, 28 Aug 2020 11:43:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-core: add snd_soc_find_dai_with_mutex()
Message-ID: <20200828104334.GB5566@sirena.org.uk>
References: <87blixvuab.wl-kuninori.morimoto.gx@renesas.com>
 <159853660472.29762.4382776935010264742.b4-ty@kernel.org>
 <87y2lzu2t9.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline
In-Reply-To: <87y2lzu2t9.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Your fault -- core dumped
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 28, 2020 at 07:46:41AM +0900, Kuninori Morimoto wrote:

> Thank you for appling this patch.
> I think it is added to for-5.10,
> but is needed to for-5.9.

Moved - the naming here made things unclear.

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9I39UACgkQJNaLcl1U
h9BoXwf/VT+DAZPEDjjHAGUta2f68mX7/yaQmeaGjNOQ0+huKug14FjBUOlg5DbB
XBfR3bigSniLi0rf0S/tcaPseT5RweeVQuraDUUiHnv+xjGTmEMgzcaJV4eWNqeR
AqIW0z3uaov4GKsbyEWRxWyZIArGn2l270KTCBI8NMKmZO2NPfY5V3MejdJay+Vh
lQzgb+aQfTPwhzvPDTDGcZlRpXwXZDmajz4FDRKysA/5JwANgxw7YJj853g5dRZc
UGhNCke8s3yrhTu0Ox2ci4SlpWhuwy0pHHz2u2L4aJxh4QEH0bCRiaAaN/4XxHQV
dTPFOmTMWZajj+o7khKYnqhqGqeEaQ==
=u4MI
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
