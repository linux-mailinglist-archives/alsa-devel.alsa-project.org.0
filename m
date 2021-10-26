Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E58C443B07C
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 12:49:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8000B16AE;
	Tue, 26 Oct 2021 12:48:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8000B16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635245359;
	bh=Ic6dUgfs77UQFujys67aZD+FamcmUe9wKid/CCmWnFs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LQDlakosn5/IK2KXILje8f42U/PA9LISkWK23Ep4EK116n2HssD79zihdI/es+H7M
	 Xm/JUGG4BtdB90ECK5vIwa+ORLvXg8ImrfNsx7hJjCMoMcOV+9QObqu9xvIAc6AOQG
	 c6hrC3QA45vf8QtP0Qci3rvPoHpjBUfl95cQ+WWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03568F802E7;
	Tue, 26 Oct 2021 12:48:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCEB9F802C8; Tue, 26 Oct 2021 12:48:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65408F80105
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 12:47:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65408F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iJAECZYP"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC731604DC;
 Tue, 26 Oct 2021 10:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635245275;
 bh=Ic6dUgfs77UQFujys67aZD+FamcmUe9wKid/CCmWnFs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iJAECZYPFmY08gC10MfILAEzSoyD+IOjq+i6BmZZ3l8ijhwU3Mkt194rY3anuYXAz
 yGaktsW3uLtXNpk9jfcJqpjXFGUtEih7jiOOD6rgABICTfuCvf7C7CynuUXH4bTEgp
 ZO9bYvIi0tgCBs4NkE46aZ7v0/QLN2arww52xJKhGGT9z++wc9TWPxkhmNdske4IiK
 iT6HyAmAh+Zk4N/6uiyLKsSvpUzp1zEFgrQ38zYnb1S1dkkV5kPVdHgaWgF/+XQdog
 1192KU3XzIIfCnDKT6hvJKudFzwekQjEqIQGZLj9aCSnhdRl/jW95tTB0w5N0QBPT/
 CxfnvnB0hqzRg==
Date: Tue, 26 Oct 2021 11:47:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [RESEND PATCH v10 00/17] ASoC: qcom: Add AudioReach support
Message-ID: <YXfc18+fqBNajHX8@sirena.org.uk>
References: <20211026103815.19468-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yx21aV/ZEADWQrmo"
Content-Disposition: inline
In-Reply-To: <20211026103815.19468-1-srinivas.kandagatla@linaro.org>
X-Cookie: Times approximate.
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, lgirdwood@gmail.com,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com,
 bjorn.andersson@linaro.org
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


--yx21aV/ZEADWQrmo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 26, 2021 at 11:37:58AM +0100, Srinivas Kandagatla wrote:

> Am resending this series as I ended up sending incorrect patches for v10.

If you're sending something different it's not just a new version!

--yx21aV/ZEADWQrmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF33NYACgkQJNaLcl1U
h9AHEQf/SJpIgAEmq1U3oU4QdVnlfu499UQq+GdEkAUL8rviRrtPfeOa1Fqu8js7
2fzctA16gimV3skxccNKUYhkHWm8NJuvgVlT9G3txT69CzLwL8qxnWzMavdM1/uD
21/wpSY8ZBvFtka91farXSJm8CUUAYkNk9Hl/2fjr17bKndPs+Ra7Kjn+5k4VNKT
26KwfqHHgLuENAn8Mds/En9qLRg8d0DQuDGF/rOtN00yz5ReAXHSTvOZp/zK1Bl/
fq+OBztFjYSgDsmwl22wY/hoFAaXeaRuP01/eRCgq9JsKVy/XqBj530nmVOKLIc1
ch43I6ikSZuLQLHBlivKpuyPzdDHxQ==
=nQpH
-----END PGP SIGNATURE-----

--yx21aV/ZEADWQrmo--
