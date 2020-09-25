Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDC5279181
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 21:31:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B657C18FE;
	Fri, 25 Sep 2020 21:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B657C18FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601062296;
	bh=Qnb4GmVJK+KSCmaIF8ewnftUKFwuL9MIqaQIMNr/Qzw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LYOmBXYzK9UV8n6yR9wUZYIYN8FqxZbNsyRCCECsKOzYgz9qyQQ0tGuNMs586phYH
	 a3b6B0itozM+jlK7nIEY8wdP0I4I7XBCAY6gnCb945jOW/8guhX7o3/WUTIJOR26QR
	 thFJ63iOoTUsps/KL6pVkvqQ0AWdeQ+BJDNBgyZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDAFCF800F6;
	Fri, 25 Sep 2020 21:29:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F3F7F801EB; Fri, 25 Sep 2020 21:29:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1874DF80162
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 21:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1874DF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TPLPzGJr"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97E2A2344C;
 Fri, 25 Sep 2020 19:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601062179;
 bh=Qnb4GmVJK+KSCmaIF8ewnftUKFwuL9MIqaQIMNr/Qzw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TPLPzGJrSwQ0wxzHBcU6TR3tcD6MY9WSGBpePQIRe5XEDzKYOeVVrfPb4kAL62Wap
 xXlF4cGDV5hJPlr4h72d1KC5PnVzMWTnK9RE9dT3Sny6+xFHB6WvNzz2B506eBw26s
 o8N6VSV5tPwW5UVDzEiRnc1iHxdHX3k0LtJFBOqw=
Date: Fri, 25 Sep 2020 20:28:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Tuo Li <t-li20@mails.tsinghua.edu.cn>
Subject: Re: [PATCH] ASoC: rockchip: fix a possible divide-by-zero bug in
 rockchip_i2s_hw_params()
Message-ID: <20200925192844.GA10127@sirena.org.uk>
References: <20200830095106.4412-1-t-li20@mails.tsinghua.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <20200830095106.4412-1-t-li20@mails.tsinghua.edu.cn>
X-Cookie: Dime is money.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, heiko@sntech.de, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, linux-rockchip@lists.infradead.org,
 baijiaju1990@gmail.com, linux-arm-kernel@lists.infradead.org
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


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 30, 2020 at 05:51:06PM +0800, Tuo Li wrote:
> The variable bclk_rate is checked in:
>   if (bclk_rate && mclk_rate % bclk_rate)

This doesn't apply against current code, please check and resend:

HEAD is now at bbd59df075ab Merge series "ASoC: Intel: sdw machine driver updates for 5.10" from Kai Vehmanen <kai.vehmanen@linux.intel.com>:
Applying: ASoC: rockchip: fix a possible divide-by-zero bug in rockchip_i2s_hw_params()
Using index info to reconstruct a base tree...
M	sound/soc/rockchip/rockchip_i2s.c
Falling back to patching base and 3-way merge...
Auto-merging sound/soc/rockchip/rockchip_i2s.c
CONFLICT (content): Merge conflict in sou

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9uROsACgkQJNaLcl1U
h9C92gf/RsB/lEQG1UKkloEDE1VbvFPSaiYS79/aMhlVUBUW116VogCV7sq/mQ10
WEG6ygMD4mUoU9PAYXPpn8+boQJ9fVNNYF76UmKpMHm6ZjopJ6gZZ/ARj3jBje4H
QgtJEYhcYFodqFs5LP5sVswlq06rguAH1cYrHgM9YYYZtWimsqfD2SD63QZaog8m
eBgk0duJ4ys5HzfPUhpfRgXjH8r6LNHCLRQy8UW1vHHYG3yfpUA9YNLITMHWbyq0
eDUZJzcpnErjHj3FaHoxjm4ohvOnlVMz+U9+LEjuz0Z8VfBk3SE7C6Rj1dN3JpdA
vR+WgSZG2A7qGkMp20/0IX+qKdILbA==
=cION
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
