Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DC12976EA
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Oct 2020 20:28:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7ADE183C;
	Fri, 23 Oct 2020 20:28:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7ADE183C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603477734;
	bh=SHsWHdBUCccwANbOdMKh6BI+Xq8sH14n3v81RpJpzcs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HJA/Lj46NnEmulhbKIgC+r7iIdEydQ7Chl2awcF1tZhhYKff5C6QLMiYesxaFVT9C
	 1St3OMjsLNslX3J8vtnmBl9c34+CBag94hkeZOkJtlXgaLcGsNZFkBCwccSkt/i5fr
	 kjaQwGhgkmq20bisI2rurmS0U7RWurY5DZHc7hng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82476F80264;
	Fri, 23 Oct 2020 20:27:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 087FEF80253; Fri, 23 Oct 2020 20:27:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 555E8F80247
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 20:27:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 555E8F80247
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hHBq93VI"
Received: from localhost (cpc102338-sgyl38-2-0-cust404.18-2.cable.virginm.net
 [77.102.33.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 69E61208FE;
 Fri, 23 Oct 2020 18:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603477631;
 bh=SHsWHdBUCccwANbOdMKh6BI+Xq8sH14n3v81RpJpzcs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hHBq93VIB0psvOkcGOAESIUQKob826qkWXtHD3mIpwBtV6DVsicZvDLxw7ubUUoNF
 LOlqCJtBWn5D00dAF2sliKQy678OT3kb5pod4RTx6x9iRHj1q09qMh8XZ+VAZwZmAZ
 IbBaksxQFgvwb6VjbSEzrTA0ECjYkfBWPZ4lQCkU=
Date: Fri, 23 Oct 2020 19:26:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v3 48/56] sound: fix kernel-doc markups
Message-ID: <20201023182658.GB5582@sirena.org.uk>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
 <535182d6f55d7a7de293dda9676df68f5f60afc6.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline
In-Reply-To: <535182d6f55d7a7de293dda9676df68f5f60afc6.1603469755.git.mchehab+huawei@kernel.org>
X-Cookie: Kleeneness is next to Godelness.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Baolin Wang <baolin.wang@linaro.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Vinod Koul <vkoul@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 paulhsia <paulhsia@chromium.org>, Dan Carpenter <dan.carpenter@oracle.com>
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


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 23, 2020 at 06:33:35PM +0200, Mauro Carvalho Chehab wrote:
> Kernel-doc markups should use this format:
>         identifier - description

Acked-by: Mark Brown <broonie@kernel.org>

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+TIHIACgkQJNaLcl1U
h9DZzwf/Zs3YIMTz+2DCrNUXLtzpAbvLLDsdBDOev3DuZWyEftdLOcoIHNmL7nDL
ejx5PybpTjacNq8eH+dEUotHDdfpNd0Ul/1A2BCXwm4AT5H2WZJS8tuMkCIwDq9v
zEM2HhZvUCH/OhOrDTMqSr6P8PcIC6A4++4+8p6T67OaPPzU1p6Rb/08F3O5RnU/
0HSRVflv8ECJxMq9Zkg7GTi1UdTLARnabYNzGWJ8dYYCG0COFRbDGk51q4uA7P2h
HtdItUw/+qKgD21DxLmrdTzibgI8WhbdQ/pwzgfkT8XLKflR5tWb5vGKEKBR34w0
jVbNXPVnxqob45rcezJIEIR7pDNYew==
=uqAN
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
