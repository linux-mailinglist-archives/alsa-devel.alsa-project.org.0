Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0A961375C
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 14:06:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88CE11675;
	Mon, 31 Oct 2022 14:05:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88CE11675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667221580;
	bh=oMzkAhlToSQ+y7hnMNN1W88+rvPx+BGTFDdvn0Frk2c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DQWraocwc4zoo5bvJNmMnGQlKAGwgU6WrgAYAzLFt4Ek8ylM9m1cvf4FulWSL+0nz
	 LQ/O0rZmuzFie2qcd6HuSPTpCOWI6rby/ChBLDF3mwFKmllCZi4jb2t+wdyVtyy/yR
	 Dj5CDJyyFZz+EDe2O6tQiWQ675JTSZUUHU2imfLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 049CDF8021D;
	Mon, 31 Oct 2022 14:05:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2E06F80163; Mon, 31 Oct 2022 14:05:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA67DF800F3
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 14:05:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA67DF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="I4xEz5Aw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 75CF9B81610;
 Mon, 31 Oct 2022 13:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD87FC433C1;
 Mon, 31 Oct 2022 13:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667221520;
 bh=oMzkAhlToSQ+y7hnMNN1W88+rvPx+BGTFDdvn0Frk2c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I4xEz5Aw5h799PKIZL/XOZeTwzJdDbxOr50R59iheDHX2LJIg3UCM++8a3SYt84lD
 RGZ1GZh+pAAXfBwKxFnzVvTxOEuCzQKmF0lEIrNNhdzjsMCFZVvFo3fPZMt70TCEiw
 fL/796Durl9Tqq6SHV3Ym++hvGbJwKORu0qvEHvMGLfmxXwH5qqkGxK6VXa+x89uf+
 t5EhDalh9WrUP9lhHku0rXtg4J4clb25yAqlEbM2JHfKOc7jB/1IBa1PPE4amUXJCO
 RWwikSfS0+6DaRCqyoctkH3fwD71g7JMa7Y+sMBnBWPmxGeddxtxuJ7cDZV0GMN91Z
 mpZ6XavmTXnAQ==
Date: Mon, 31 Oct 2022 13:05:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Chen Zhongjin <chenzhongjin@huawei.com>
Subject: Re: [PATCH] ASoC: core: Fix use-after-free in snd_soc_exit()
Message-ID: <Y1/IC1DWcKzvSDb5@sirena.org.uk>
References: <20221028031603.59416-1-chenzhongjin@huawei.com>
 <166697367874.746166.7503879951900455151.b4-ty@kernel.org>
 <b30fa009-9174-da95-5799-149837e199e6@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QZ7hMdAlNIB57gBZ"
Content-Disposition: inline
In-Reply-To: <b30fa009-9174-da95-5799-149837e199e6@huawei.com>
X-Cookie: Sign here without admitting guilt.
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com
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


--QZ7hMdAlNIB57gBZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 29, 2022 at 12:34:19PM +0800, Chen Zhongjin wrote:

> Since snd_soc_util_exit is only used in snd_soc_init() and snd_soc_exit(),
> could you please add this fix to the patch and delete _exit for
> snd_soc_util_exit()?

> Or should I send a v2 version to replace current one?

As the mail you got when the patch was applied said:

| If any updates are required or you are submitting further changes they
| should be sent as incremental updates against current git, existing
| patches will not be replaced.

so please submit another patch on top of what's there currently as
normal.

--QZ7hMdAlNIB57gBZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNfyAoACgkQJNaLcl1U
h9CX2Qf+OpDCwX7t6meJI+8v+yhNft3jsdesFyhf8j8r9cuweHHXsC3nJ08PGC3U
7s6eJbdElx+yhkP3iK1FSWzs66z/FiDm0/+3xy/u2jf5H2vC8AB0MwvIDEkYiE5U
V/FJLvGDVuoAcwMtsoGE8YrHDjIOJfVPpoH/a+Mg0hcuA4kQHoLa1t4783Hz90B3
MxYASdDpZtraau3zs3mFDqzzyLzajH/HQ+EZmkW2KWtdy8mQb8na88QopJmez5J6
8gZc4zHCiOJfL1V/XCTjzgN4ip5TDzw7aBNdRhYIytpywRqeFOabwtXAkNJO3zvP
vHNovgi5bFuljp5XQ8D+wsDdpFVn2g==
=7rVX
-----END PGP SIGNATURE-----

--QZ7hMdAlNIB57gBZ--
