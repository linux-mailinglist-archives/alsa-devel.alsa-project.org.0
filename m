Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A8C40B597
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Sep 2021 19:07:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D157C1856;
	Tue, 14 Sep 2021 19:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D157C1856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631639243;
	bh=cK9jtjS6sGndb/tYO2Wm17SC/1VsCkyUP+bEtwppFPQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KnPWQPztb+hJzwmCr0IkyJtaCqICkBKbW9Hf54Dv9Thsyz4/4ir82peCrIZ3seo63
	 WeJkQ/QyKFPok2wfLArGowYekoSUH/+jZchIK9A+sSvmlGRWyoCGRNtBIDiPXfbvAq
	 oKvLRagvtsdU4gdCgeYpIyt68I03h+Mp4/rhEuOg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24214F80271;
	Tue, 14 Sep 2021 19:06:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28790F8025E; Tue, 14 Sep 2021 19:06:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D48D2F80117
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 19:05:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D48D2F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QCHy3K7h"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 871E9610E6;
 Tue, 14 Sep 2021 17:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631639156;
 bh=cK9jtjS6sGndb/tYO2Wm17SC/1VsCkyUP+bEtwppFPQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QCHy3K7hqUJRnHjHLDdAeKJDSDxQPS5Ivqc9cIXglOKIydm1jTbhb0TbwksK+XgEu
 TTBulmwC2NWmQ5rOVIT9weq8dtMXKYysBPb/usCVRFFY7V4Ic8+EUqje/hYrDtYBzA
 9xwqx8Miv+S3C5CYqlIOQ3Epjenhbfx7mSbQ61V4hNiRarwpvowTZ3zTQZKTM46tK4
 vnPSHVQkeR7lDWM4qgb5ZkRWKNGtpTnH/dij1prUq2ksh89duZ+wNIGepnnL/ZFvSw
 4u0GFE6r9TVHa3rpDZcsy0s+vkvnU6goOuJE/Z56BiWyaIgCC5OEZkq2QHcUYYQY+l
 rf9smhGKaEm8A==
Date: Tue, 14 Sep 2021 18:05:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] ASoC: cs42l42: Minor fix all errors reported by
 checkpatch.pl script
Message-ID: <20210914170516.GG4434@sirena.org.uk>
References: <20210914165220.752498-1-vitalyr@opensource.cirrus.com>
 <20210914165220.752498-2-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GdbWtwDHkcXqP16f"
Content-Disposition: inline
In-Reply-To: <20210914165220.752498-2-vitalyr@opensource.cirrus.com>
X-Cookie: This space intentionally left blank.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, linux-kernel@vger.kernel.org
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


--GdbWtwDHkcXqP16f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 14, 2021 at 05:52:19PM +0100, Vitaly Rodionov wrote:
> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> ---
>  sound/soc/codecs/cs42l42.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

This sort of minor cleanup should go after any fixes so that there's no
dependency created needlessly.

--GdbWtwDHkcXqP16f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFA1ksACgkQJNaLcl1U
h9CgbQf+OuIKym2dMtISggsJRRA2ZOkGY410Vm+jkhqXhNSBIRtiJY2B4hSlx3Yf
qJfA0NLH0p6T9Z5TDptaqRDit7nENLTUxl/sqrioYt9YQAsYUhVTL3y9qG2U8Xxx
sNcqEdK2AbsxmEYE94QMpjsewYD9BwRZJRF2wa4siL4kmIRWLlg72S7eoubDg/ET
gOqKzEVH95AjCFCSB7IMIERJE2LeE0QAyyZi7W4LqCAIe8XokfFIGOrXB05AwIqN
4/CMqir3xjM7MSx6i732GAxGxKcV1qQRT3RfLMADDOxb75Ua/9KVXElZm35s9N9z
zudNb7dDBRQVNiFZ3QTL5ASF6vz2Gw==
=UiJW
-----END PGP SIGNATURE-----

--GdbWtwDHkcXqP16f--
