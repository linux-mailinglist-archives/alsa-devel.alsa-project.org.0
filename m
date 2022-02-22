Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 958554C008C
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 18:55:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F150817B2;
	Tue, 22 Feb 2022 18:55:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F150817B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645552557;
	bh=jSNZ/uxg4Nydk28NmL8vUfhiupf4jKRJIK2seSF10cI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oBfhXdCZw1nTmh6OqT4mNNguwuoPxcDRQmH7mCmm556b+cWDQ841rd32vkVoLs81m
	 7owA7wlLytw3KMVGjKCN/+ALd3JFRBm5WcMohqVhXq1AdUACF/hhbtZWbYQ+fz11xl
	 vZkJNYRnHFZwt674uXYWB9zmGQyyzc0zIP4R9+mU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 539C2F801F5;
	Tue, 22 Feb 2022 18:54:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5545AF801EC; Tue, 22 Feb 2022 18:54:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FA50F800D1
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 18:54:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FA50F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XGFwHTB8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AEC136141D;
 Tue, 22 Feb 2022 17:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6385BC340E8;
 Tue, 22 Feb 2022 17:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645552480;
 bh=jSNZ/uxg4Nydk28NmL8vUfhiupf4jKRJIK2seSF10cI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XGFwHTB84Cb+s32CsOV9C0ujYGvhg4Ob+4hfewnNeYw6fZ9wwjbwO+wWB7tow1RNc
 NH0bJS7d4U2OvgEFKiC30nXfn/udlMndecSOhE2SCaLomwvZfq4fiLN3RFNe5xTkkQ
 gRz3PH1Md3sE+3WXb7rdpvVNahuNXGvRgz9MJC6JZUvLARkICV05Uj84VRL+6gfTWw
 BkT1tOxe9U6Mv/3Zs6icqb6ZXDEW0w5FyJZK7QcShT0zAqaEH4RH6NPyQ96Y5KV3eU
 EisWuUufcUQHv3k9+PllGorjLYzooxO6k4IJ1qm/f/m1ushTyc/HZFzRqkuN4LYFfs
 izguohNcZRS8Q==
Date: Tue, 22 Feb 2022 17:54:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 09/16] ASoC: codecs: wcd934x: fix return value of
 wcd934x_rx_hph_mode_put
Message-ID: <YhUjW6B8LmoEWLRx@sirena.org.uk>
References: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
 <20220222115933.9114-10-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mpa+mWrNm0hr054s"
Content-Disposition: inline
In-Reply-To: <20220222115933.9114-10-srinivas.kandagatla@linaro.org>
X-Cookie: I smell a wumpus.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, quic_srivasam@quicinc.com
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


--mpa+mWrNm0hr054s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 22, 2022 at 11:59:26AM +0000, Srinivas Kandagatla wrote:
> wcd934x_rx_hph_mode_put currently returns zero eventhough it changes the value.
> Fix this, so that change notifications are sent correctly.

> -	return 0;
> +	return 1;

This now has the opposite issue where it will unconditionally flag a
change even if none occurred, that's less bad but still an issue.  It
should check to see if the value written is different to that already
set and report that.

--mpa+mWrNm0hr054s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIVI1oACgkQJNaLcl1U
h9Do7Qf9EZHwn4KoVflO91QHGRDyRPg2k3SZvPgEuaYXy4SxFSPrrxosil+RBxW3
wIoS20OhKfHkF+jirulBOcN3Sw3hV8MEuvpVZRUt9LhfH0EpZKIOytnVd13JBMJK
CUDiZGRUaqKBy0XtSOQ5WxqHqQgXTNYflj8hn6vWkuKqOEC6q3GHLf6UDDBO1B77
7GAiVMvBvYSsn2BrchOzaseSnd0uxHkxTeoUO+w78LeyNPRhg07mjlml4iS+wb4d
YBOQLtM/87JOdVbfvEvzQZSO1vM+Zd/1+lT0xslve4B126/o1Lvw1BZxAtkB9Jhv
ermlPqh8YhuwDuzqhenDhlLLzadmuA==
=Xc7o
-----END PGP SIGNATURE-----

--mpa+mWrNm0hr054s--
