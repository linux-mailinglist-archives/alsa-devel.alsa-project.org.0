Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E335434E73F
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 14:14:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C8021682;
	Tue, 30 Mar 2021 14:13:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C8021682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617106451;
	bh=wV83M5loS9/1IR+EtJxcBtPYe9NMNPihyogQRcVXKmY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lGsAlsywXfltL2AOsb0dlisWqRt2KPRjn75ylr6MnUjGNEcc6Pfa6roJTD5foyi8u
	 muJrz4UV7otFHdztmkdgi8ajm8r4mUklDpMaVUIiKFKUVI1ivRJjBJnbPJlFrNYwf3
	 iLGHh+1ELbgY5Jqk6Pv4JZ5fwe4L5Yn6+bj9hbNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C6E6F8026B;
	Tue, 30 Mar 2021 14:12:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E6D5F8014E; Tue, 30 Mar 2021 14:12:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0265BF8014E
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 14:12:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0265BF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kIoHAr0c"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0679661927;
 Tue, 30 Mar 2021 12:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617106347;
 bh=wV83M5loS9/1IR+EtJxcBtPYe9NMNPihyogQRcVXKmY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kIoHAr0cNaCPqQ+dnxe+RcHK+5MUmicutbewS9RlxqeEzfxTVji5PYube1FkbEbMd
 vod6jvdSLRZfbYIzFGx1Z3Sif4yA/jKN1IbRvd656/YMgTlDdZ2K7uhx3mYu0jCBxw
 xzdhe5x967PybxqscxEvRIOvKfn1WPotlhhI4w3iSuWJTDhpJP3caVobLuk/BkeARd
 AzK2W6kSG/g7kOJK4jPraP/bayeLpDuByPlrsS23FabPFYrDL0X43wWdfbnHhNOgpe
 ulZomk7rHUPgQ89H5gt/LhTrmT5fGweWyrvrxazwfvAgIJLvtf3Db2E8CHjghVtr5h
 sOgW8yE6XUmpg==
Date: Tue, 30 Mar 2021 13:12:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] ASoC: dt-bindings: nvidia, tegra210-ahub: Add missing
 child nodes
Message-ID: <20210330121216.GA12507@sirena.org.uk>
References: <20210326195003.3756394-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline
In-Reply-To: <20210326195003.3756394-1-robh@kernel.org>
X-Cookie: Earth is a beta site.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
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


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 26, 2021 at 01:50:03PM -0600, Rob Herring wrote:
> The nvidia,tegra210-ahub binding is missing schema for child nodes. This
> results in warnings if 'additionalProperties: false' is set (or when the
> tools implement 'unevaluatedProperties' support). Add the child nodes
> and reference their schema if one exists.

This doesn't apply against current code, please check and resend:

Applying: ASoC: dt-bindings: nvidia, tegra210-ahub: Add missing child nodes
error: sha1 information is lacking or useless (Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml).
error: could not build fake ancestor
Patch failed at 0001 ASoC: dt-bindings: nvidia, tegra210-ahub: Add missing child nodes

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBjFZ8ACgkQJNaLcl1U
h9CHXwf/ePgayQNqRPYIM4d70daAEQGySAe4jmtllPLltZCPeroFEZ5Bme47h9/o
x7ur5JZ7sAEwCclcmMY4ff7LZh5AZP2ucFjqzaBjm8dp+rWq3v4WEtqDYwlYXj2F
Oppx9trwsMqm3RPODTpUoou21oL+ghI5AWA7qqhEQNKQ0ssbEALoKPyroimfCE3s
i3qKiZ/VXZzQbhj+j1k4E/BvlveIvGKeEGlEKl8xWhi9D81RQKvrZGv+G7ExotVH
k7xnHKnYfd1HSVJTIuOiESYXdyTaIDgWUUs/RUo0nLj7dreAWQRSPcF24v8knzR2
4W5kclkcDhA6mujioXtCq/F4NFzGwA==
=BEx1
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
