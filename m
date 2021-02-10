Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C49DC3170CE
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Feb 2021 21:00:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A78C16F0;
	Wed, 10 Feb 2021 20:59:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A78C16F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612987226;
	bh=yotLEcGqG4o9p/LhknZqAEAAlocilxMM2VuWnnlXcAo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m81wJZ7VHio2qjfDoSXwFS8U7BBYBTB6uhts19ErBRroVRposa3KJrfncUR5JeGHN
	 u5E/P3KNnUNRGFsjWshJiKY90OxUf59ikFCT2NUapiXYGWbM5PuhHRrhr2D56qHazJ
	 CTzaYRIHl28DIjD46FCGTajDxd0/OeJ9fW5Njxbo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B0C9F802A0;
	Wed, 10 Feb 2021 20:59:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D286F80290; Wed, 10 Feb 2021 20:59:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F9A7F8027C
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 20:59:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F9A7F8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VY3Fx8Ax"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01A2464EE8;
 Wed, 10 Feb 2021 19:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612987151;
 bh=yotLEcGqG4o9p/LhknZqAEAAlocilxMM2VuWnnlXcAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VY3Fx8Axy6qYPDQfoT/+5uPBVEJ7OfzNGjWHVLDrFeQ+Lrsf9tog5NgVBnEj3v2zS
 3O9mYB2GZI4YzS1P/C79LyAWNDHqKvXEGB9M6HpwY719sNi0U5t6RJTBTnz2hbGfvX
 VoVe8bWmXxa0kNtLH6n0VLi6TxJiKg9FWbpGxkPCuog5D8y9EjcZcIjzlkmnDPjFII
 uyRPi/f9QfXFduhgkOb+SxbHQ68v4xZfkJ2hfAc0rVIwqc16c8RFpXVSSGACMcfqf8
 V2ViuRebMBtoqZESRIcpdXGufdLZgyNQGVsXOH3vVxizHL+k/beTrdt3rylI841shn
 0fIBW1eqFq8TA==
Date: Wed, 10 Feb 2021 19:58:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [RESEND PATCH v2 0/9] soundwire/regmap: use _no_pm routines
Message-ID: <20210210195818.GH4748@sirena.org.uk>
References: <20210122070634.12825-1-yung-chuan.liao@linux.intel.com>
 <20210206102644.GN2656@vkoul-mobl.Dlink>
 <20210208125032.GF8645@sirena.org.uk>
 <20210208150449.GF879029@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="54u2kuW9sGWg/X+X"
Content-Disposition: inline
In-Reply-To: <20210208150449.GF879029@vkoul-mobl.Dlink>
X-Cookie: Are we live or on tape?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
 bard.liao@intel.com
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


--54u2kuW9sGWg/X+X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 08, 2021 at 08:34:49PM +0530, Vinod Koul wrote:
> On 08-02-21, 12:50, Mark Brown wrote:

> > Is there a tag I can pull the new APIs from?

> Yes, please pull from below:

> git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-5.12-rc1

Ah, that's the entire Soundwire pull request including driver updates -
that's a bit more than is ideal.  Instead if you want to pull in the
regmap bits that might be easier:

Acked-by: Mark Brown <broonie@kernel.org>

--54u2kuW9sGWg/X+X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAkOtkACgkQJNaLcl1U
h9Ch7gf+J3prwtpV3pK+bGdjWYr84An0eWZC4w6aGqSBDE81NkRyrG/sebd9QTNg
KBL484vGu14FNBahCz6dq0G71yaHKw4bjZS5FqG/FX/zEYhKj5iscF7NUUbOeY5N
DPsi9vNxsPH4NHztjSa+vd9/U0liZcvch2rtMa71V3sjmyCQ1xs9OQXZ4GUqTv3L
5ng+TqKTMKHTbpL2ZJEtVFE+sxpi6NxrqSdj2sWdVoSi1oIviorn8P7nvcesboVJ
PS3mx7KrkOiB4Yuwu70YjSeGb5GVuOcOW2M4NaGmLrbOGYbiiFzcxbEvz+Wmjbq8
tv6VwcGIsoPZ1kTtWESzzI4K0eCjRA==
=LVnK
-----END PGP SIGNATURE-----

--54u2kuW9sGWg/X+X--
