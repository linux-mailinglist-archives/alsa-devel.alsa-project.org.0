Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E4321EF56
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 13:33:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56A461662;
	Tue, 14 Jul 2020 13:32:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56A461662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594726405;
	bh=ByDfIhzyLIF+vxT7O3HCwTlGfVoDr8iCeDZjjO1kjSE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eQqP12Pr7HdRXRGpBH39xZzmdqL4SME9BiqHa4cdSSzRZVe2t8H7s/+xocsXlhPfu
	 wa8caUbEnSqAqqu/PdFb4tAjfpUyc7aw7ohBVF4ZTJ5oa2REtFDmKqdLSlLuQxm7qF
	 WGdZYd53f93ZKA8DYPUSmbyIW04uty5Imml9YA4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E4F4F800E5;
	Tue, 14 Jul 2020 13:31:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C95DFF8019B; Tue, 14 Jul 2020 13:31:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61A7CF800E5
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 13:31:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61A7CF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2ojMGVQN"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D16D22203;
 Tue, 14 Jul 2020 11:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594726293;
 bh=ByDfIhzyLIF+vxT7O3HCwTlGfVoDr8iCeDZjjO1kjSE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2ojMGVQNRvCT1i+Lq3g27M788fPIs2mQipsfzj6Dbax+imQP17p2RvPs07Esdj3KN
 n1zxv+Et6cLRWsHjPxZpKuvxqlQNRjw7H7qfiCMSh1OYaWtxm310M2qTiG+P0e2U6Z
 pMUbCrTHeYLX0E9UkKbQZVMoKLSSdzUCdQHlBb0E=
Date: Tue, 14 Jul 2020 12:31:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: ASoC: Convert UniPhier EVEA codec to
 json-schema
Message-ID: <20200714113124.GD4900@sirena.org.uk>
References: <20200623114005.791643-1-yamada.masahiro@socionext.com>
 <20200714022252.GA1151466@bogus>
 <CAK7LNAQrdqztMrHtAHnbMkxeaDLLyBS68WVovev+zytHdD7RVQ@mail.gmail.com>
 <20200714095259.GB4900@sirena.org.uk>
 <CAK7LNARUwPRtG0uMZ4rwr7=+3wa9X1B70AXbnFL-CF1_wMvevw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oj4kGyHlBMXGt3Le"
Content-Disposition: inline
In-Reply-To: <CAK7LNARUwPRtG0uMZ4rwr7=+3wa9X1B70AXbnFL-CF1_wMvevw@mail.gmail.com>
X-Cookie: Your password is pitifully obvious.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Rob Herring <robh@kernel.org>, - <alsa-devel@alsa-project.org>,
 DTML <devicetree@vger.kernel.org>, Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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


--oj4kGyHlBMXGt3Le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 14, 2020 at 08:08:45PM +0900, Masahiro Yamada wrote:
> On Tue, Jul 14, 2020 at 6:53 PM Mark Brown <broonie@kernel.org> wrote:

> > No, bindings changes usually go through the subsystem - if there's any
> > other work on the binding then it'll usually also involve driver
> > changes.

> OK, then please apply the following two if they look good.

> https://lore.kernel.org/patchwork/patch/1261568/
> https://lore.kernel.org/patchwork/patch/1261569/

> Both got Rob's Reviewed-by.

Only today...

--oj4kGyHlBMXGt3Le
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8Nl4sACgkQJNaLcl1U
h9DDjQf+ICe/5B7o/Oiyd40Fde/y+G/XbqI09gtp9WstNujmZycGh1Ay9lDK6mWE
l0GU3797amc+EOUhRKxHBvwwVnqKzNw6cDzDvskzKMzZfOW3d4OIRUF/lhy5RZiV
9JMRdrwfadw8Wuw8wtVVN0y61xM7HsdKTFCdCIJOZnvm5fWeVweBu99fNxooHQKP
yFIfSlOyAvA4ASbhLOyNr1ZLfKQIgpTqn3JYP2YsxSlwujGXTD2X4CrKMIcn5IES
KSv8q4XKLlNf9rirc9U3K2ikaw3hJSbTSy55+cMsTgoy7WwjJUgBCLC4/zqyvOc6
RDbGRwjDz/WsYtex4W5gNBgzxstL6g==
=UlzO
-----END PGP SIGNATURE-----

--oj4kGyHlBMXGt3Le--
