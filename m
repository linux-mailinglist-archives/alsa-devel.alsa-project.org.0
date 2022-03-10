Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 702F54D469A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 13:16:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9BBF1900;
	Thu, 10 Mar 2022 13:15:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9BBF1900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646914569;
	bh=B6BrRQD3ZTTLbmmHSlvJm/hOeyFv+SySQaOcK/p+kto=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kaEta4NQkqJfxscd2lnWx/NO5JtazZfL4AIcq7ynQtFPtGIesEZ9setr7gdjNkb2e
	 iQ9nHuMh6yOSkJR/qzdcuhdFkxHbH3iUEoKPFj+B2Utzvi4faO/T9gKpjBU643j1h8
	 IS9mAZW990i4GzpE9xbICO1TyTm5cjl9+84s6M6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 725FEF8012C;
	Thu, 10 Mar 2022 13:15:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22927F80137; Thu, 10 Mar 2022 13:14:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4F31F8012C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 13:14:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4F31F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZBdaUjWD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 99AC6618C2;
 Thu, 10 Mar 2022 12:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54F1C340E8;
 Thu, 10 Mar 2022 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646914495;
 bh=B6BrRQD3ZTTLbmmHSlvJm/hOeyFv+SySQaOcK/p+kto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZBdaUjWDopJugOHDSHQS0/gLeNX6iShEkyeRrTN6idhfqrrf/4Lom26b565uxuFU8
 drmFj+B211vVjteVkgHqymrn5FnhkZIqMlesjNTrjZkAzFM9LbFP00HmZ81DfwXN+R
 ZdqftweNwRlKpmsiwcORKRhgFWGP0omGhHdYz9xRUyZuD03AK+jN9/xnrzIypixgSa
 tYfRyyyi1Yp0FeM8F3r8CTdUeocxMJUV7w0Skys7hTAVhHcilZfIiAN92HaLBDMJpx
 GCBVGJt4xmSTYq6RRTbdlWoZFtACaMGBJLHavIthcXSRU9oMCY5FTmFxfXQULe3rcT
 qEpvUTM4cLyLA==
Date: Thu, 10 Mar 2022 12:14:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [RFC PATCH 2/3] ASoC: rt5659: Expose internal clock relationships
Message-ID: <YinruZXrpP2bu7lZ@sirena.org.uk>
References: <1646912477-3160-1-git-send-email-spujar@nvidia.com>
 <1646912477-3160-3-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RbIkZj8XkghnrROK"
Content-Disposition: inline
In-Reply-To: <1646912477-3160-3-git-send-email-spujar@nvidia.com>
X-Cookie: Package sold by weight, not volume.
Cc: oder_chiou@realtek.com, robh@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, jonathanh@nvidia.com
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


--RbIkZj8XkghnrROK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 10, 2022 at 05:11:16PM +0530, Sameer Pujar wrote:

> This patch uses standard clock bindings to establish the codec clock
> relationships. Specific configurations can be applied by DT bindings
> from codec device node. The codec driver registers PLL and MUX clocks
> to provide this flexibility.

Doesn't this need a binding document update to document what clocks are
being provided?

--RbIkZj8XkghnrROK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIp67gACgkQJNaLcl1U
h9DL+wf3Z3U8/29vdxWuirNmVvUzPVbbp55Sdn8XMw7blcG1nwBhdFeefVRwHTAz
T6Y0it7q8AhBNOx0SteVUUR+CHQAmo2whuYT2mIRj+c/OQKeESYE5Yid3TJ97XQD
hXh7RoVAZ997G1keyCmJtjXo1wTp/A9zP/Dc+QCfTZ/N1IFNmZN5AXm278Qd3kh0
4gRJefyPTzk4hPYkeYRlI91wssEKgqNjVgX2nxg7JoFTrZ9NDgU6Dw+67yqgRyiO
I1pmyEQ+DQPXUUfkylHlaWmvf6DMxX9mX3TXeKAVOC03FofPnxsM2TIOwIsZoFgb
0cinj4IIRsNnoeIcnRBroMkH/FHy
=Uftl
-----END PGP SIGNATURE-----

--RbIkZj8XkghnrROK--
