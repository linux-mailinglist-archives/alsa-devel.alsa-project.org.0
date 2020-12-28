Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD502E67BB
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 17:30:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5D3A1753;
	Mon, 28 Dec 2020 17:29:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5D3A1753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609173018;
	bh=VxLb1NE5v3gUQB+uN9sYmxNLNiDC+v0OejAmpaBY2jU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l0rdWRZuLo9ZHceOgZLDIwTGg6l5WtG4K/ggRq3+n3hgJZOuZJTQLajEv/vH6Okkj
	 USshUyFbunr5bvwycgIeAPekbpHiQUQ/Y3ySwPAuNYj9ptMMFOZ/65tZjZ1o42lAgX
	 gkwW7z6Plf+6Rh0b9mE81IsJkpjw84sTMy1dkX50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3CD6F80143;
	Mon, 28 Dec 2020 17:28:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA4FEF801F5; Mon, 28 Dec 2020 17:28:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60ABBF80143
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 17:28:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60ABBF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BxsD43eS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88697221F0;
 Mon, 28 Dec 2020 16:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609172909;
 bh=VxLb1NE5v3gUQB+uN9sYmxNLNiDC+v0OejAmpaBY2jU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BxsD43eSjbT4RSvYseAjen0QXSJvvyGe5XMmO00tHelZvwDBYwKhZGEyE6okn2CLT
 DSOFVu0whrMHOwy6aV2OnxgULNod+u6ADc/2f23hC1O8gYd8fdUjzGKHo701kmMc6t
 qL6vUIbLJEqTkAHsFuf/dhQhhIExQpENU+W9aH65+bxoizh2amiGp7doti9aw/TiCt
 kinZxltZ+xUyXri1L/OOIbPC1xIKm6bTqv6bATeMFyeEPeqRyjn1hwsEXBFxQkBvHk
 cgmcu4aFoVPo/HyCCCxk4pNTD8ozsUsV2o+FALQaBUNvpNRJgqpfqfQ+R3EF5hT7x0
 NqD2cfNioV5EA==
Date: Mon, 28 Dec 2020 16:28:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 01/14] mfd: arizona: Add jack pointer to struct arizona
Message-ID: <20201228162807.GE5352@sirena.org.uk>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-2-hdegoede@redhat.com>
 <20201228122138.GA5352@sirena.org.uk>
 <44f84485-8efc-39f9-d0a7-cb8db2ea3faa@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9l24NVCWtSuIVIod"
Content-Disposition: inline
In-Reply-To: <44f84485-8efc-39f9-d0a7-cb8db2ea3faa@redhat.com>
X-Cookie: To see you is to sympathize.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Lee Jones <lee.jones@linaro.org>
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


--9l24NVCWtSuIVIod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 28, 2020 at 02:16:04PM +0100, Hans de Goede wrote:

> And more in general AFAIK extcon is sort of deprecated and it is
> not advised to use it for new code. I would esp. not expect it to
> be used for new jack-detection code since we already have standard
> uAPI support for that through sound/core/jack.c .

Has Android been fixed to use the ALSA/input layer interfaces?  That's
why that code is there, long term the goal was to have ALSA generate
extcon events too so userspace could fall over to using that.  The basic
thing at the time was that nobody liked any of the existing interfaces
(the input layer thing is a total bodge stemming from it having been
easy to hack in a key for GPIO detection and using ALSA controls means
having to link against alsa-lib which is an awful faff for system level
UI stuff) and there were three separate userspace interfaces used by
different software stacks which needed to be joined together, extcon was
felt to be a bit more designed and is a superset so that was the
direction we were heading in.

--9l24NVCWtSuIVIod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/qB5YACgkQJNaLcl1U
h9DqBwf9HlPB/OmyZntM7voe64geHoxkfPxY7efoEImrcbnYvzdEY/pdORxcLO00
98rT1ezO5jFJHAbH3sO8fz0m/93Yk0z3IDSuLexoQhtP9bK3hDs5u5jWrYlHMOFz
3OFcOctzSUSfOapMPJFQXzxjEiSnNyAdJterGKhHAB+qDkxi29C6iLl7fW7k7ymT
lHgKGSNor058sVZbrajgw2J8iG0aXrEvW9Tau4/pAt1TVF6FmQLj0pQXjo7r/9ga
gkp6C2bsLSeCx3WSujI/MllT94v48jbPZY1801oxseN7c68+gNF2m2lEmvIr03LS
eAdKVMt/V2KU2wSqSn6Z2iWJj7aHvA==
=/OaN
-----END PGP SIGNATURE-----

--9l24NVCWtSuIVIod--
