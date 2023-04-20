Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 211CF6E9B7C
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 20:21:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FDA9EAE;
	Thu, 20 Apr 2023 20:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FDA9EAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682014870;
	bh=5XFSKTlGWTxFI19rXXuk4sccUdqF5R5vVCMDRvNeE6Q=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GYqrn8IeXwGQiWLvnpXfL+gT+HGNN4Eywkt2EhMChh7qTdzLLyC5npRmrYfHrBTl6
	 Ul+9IBwhEnN4wY4+MVCEScpFKNnp57U9t/6dmiL6b62VVjTpEEdPu+Lo1zGnD2E8Kx
	 39J+DoBN3hWGkdcdWi+jsDcjTPdmkQtAGeD/3XP8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10394F80149;
	Thu, 20 Apr 2023 20:20:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64FD7F80155; Thu, 20 Apr 2023 20:20:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60287F800F8
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 20:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60287F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hXSDni+M
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9034464B2F;
	Thu, 20 Apr 2023 18:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E45C433EF;
	Thu, 20 Apr 2023 18:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682014808;
	bh=5XFSKTlGWTxFI19rXXuk4sccUdqF5R5vVCMDRvNeE6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hXSDni+ML7e8GD4VMSSG+NtvkzA74GSINSfWtjPOPnQw86s+isW8m3D3WHXZS8hNw
	 V3485du/yMFHVrV16n53j595kRPpyA2Sm9yjxJ017TbTlzG75lyFUmeoEZJ81YYCOe
	 LMyzVbSYp7Llyw9Wd5UZcJAu0oFZv2OOO5QtnEpHSyixKFiQeQ62s5jywBoSy2VTj7
	 GEOWYPmkZ+QayKydWFMs1Ty3lyZNUvoZZvsL+XDqA9CnDdC8CkrtjAH98yEwndS/vO
	 26Dg3zeRSL6VSjWN3H1w+/IsYp39ysZduFBm3+Wml+vdJevJH5pO8uX2jaTNwKFNra
	 7LrsxWiLa9NXw==
Date: Thu, 20 Apr 2023 19:19:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/6] ASoC: wcd938x: switch to using gpiod API
Message-ID: <a1d797bc-609c-4cb5-a531-9f840f3cf2b7@sirena.org.uk>
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
 <20230420101617.142225-2-krzysztof.kozlowski@linaro.org>
 <6b355201-a957-4fca-a513-d5fa0742fb40@sirena.org.uk>
 <fe6202ee-2552-8b5c-c2d5-f2f7042b901d@linaro.org>
 <d746ee5f-283d-44ce-b72c-18c8955d38b1@sirena.org.uk>
 <3eb0cbb4-f6d9-db8a-031e-92627e70f41e@linaro.org>
 <9942c3a9-51d1-4161-8871-f6ec696cb4db@sirena.org.uk>
 <94bbd608-a90b-605d-a61c-6d6769b60445@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E1XQasTOF4jMIEw6"
Content-Disposition: inline
In-Reply-To: <94bbd608-a90b-605d-a61c-6d6769b60445@linaro.org>
X-Cookie: Above all else -- sky.
Message-ID-Hash: I7MZSUXKLNGJE34JTPWTFB664D7AA3ZJ
X-Message-ID-Hash: I7MZSUXKLNGJE34JTPWTFB664D7AA3ZJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I7MZSUXKLNGJE34JTPWTFB664D7AA3ZJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--E1XQasTOF4jMIEw6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 07:51:27PM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2023 18:28, Mark Brown wrote:
> > On Thu, Apr 20, 2023 at 04:16:59PM +0200, Krzysztof Kozlowski wrote:

> >> Life of downstream. We all know the drill: merge your DTS or suffer. T=
he

> > No, the DT is supposed to be an ABI. =20

> No, the DT bindings are the ABI. We are supposed not to break
> user-space, but out-of-tree users of drivers are not ABI by itself.
> Bindings are. If out-of-tree users make mistakes in their DTS and do not
> want to upstream it, it's their choice but it does not come for free.

This is absolutely not the case, users should be able to ship DTs
without upstreaming them and run multiple operating systems on top of a
single DT - ideally boards would ship with DTs in firmware and people
would be able to install generic OSs onto them with just off the shelf
install media.  This is even a thing that people have actually done,
both non-FDT systems like SPARC and the PowerPC systems from Apple and a
few FDT ones like Synquacer.

The enormous costs of DT would hardly be worth it if it were purely an
in tree thing.

> > The point in having a domain
> > specific language with a compiler is to allow device trees to be
> > distributed independently of the kernel.

> When it is written incorrectly - wrong flag used for GPIO - there is no
> requirement to support it.

If it worked was it ever really wrong (and note that the bindings may
not always be super clear...)?  While there is a point at which things
never worked, can be fixed and we don't need to care about it or where
we know the userbase well enough to know there won't be any issue those
shouldn't be the default and should generally be avoided.  Where there
is a good reason to break compatibility it should be something we're
actively deciding to do for a clear reason having considered the
tradeoffs, not something that gets done on a whim without even
mentioning it.

> > It's not just this individual transition, it's the whole thing with
> > encoding the polarity of the signal at all - it's a layer of abstraction
> > that feels like it introduces at least as many problems as it solves,
> > and requiring configuration on every single system integration doesn't
> > feel like the right choice in general.

> Choosing appropriate flag for GPIO in DTS is not difficult. It was
> skipped because we rarely cared in the drivers, but it should have been
> chosen correctly. The same about interrupt flags. We had many DTS for
> many times marking all possible interrupts as IRQ_TYPE_NONE. Did it
> matter for many drivers and setups? No, was perfectly "fine". Is it
> correct from DTS point of view. Also no.

There's no natural definition of "correct" here though - it's just
picking something in a binding.  If someone for example flips the label
on a signal from reset to enable (perhaps during review) that ends up
changing active high to active low, and really I'm not sure how much
we're really winning compared to just having code in the end consumer
which just directly says what value it wants the physical signal to
have.

My point is not that we haven't defined things such that the user has to
specify if something is active high or active low, it's that it feels
like it's more trouble han it's worth.

--E1XQasTOF4jMIEw6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRBgk8ACgkQJNaLcl1U
h9B+Pgf+MdIbsZc3MSRgo0sDGINgmk7ZlFCYK9G4DzJWb/KN/hDgJqXx/d0NKSEB
css44uv8VRbuEEGyVKvHcqkMyfjkof3REX6VXP05Z9EXJdnGCycYb5A6tynYHrlj
/nYsDcTZUuUNsY+AOJHQ6941BJWKeR6YhBsY7bNQZdq1HCz7BkY88RoTBDlBrzPd
jBX+Uxa1DBDdMvvsKDvsFde4948YwlvgQEQI63afOucmG4Apl+FWEb3jNaMDzwEA
yX0CC5YxrshNo2KrIz3uVy/YapOh/MWGo5siOyu6M5RJqXo4KMhSCH5cVXcGXB3h
UnSazFtwtnMjuBq0MpY7eaJd8bo1kw==
=HNVO
-----END PGP SIGNATURE-----

--E1XQasTOF4jMIEw6--
