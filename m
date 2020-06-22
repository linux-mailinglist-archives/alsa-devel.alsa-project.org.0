Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E61203637
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 13:53:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D609A1689;
	Mon, 22 Jun 2020 13:52:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D609A1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592826801;
	bh=6kI4L4zPUlkblUHtlE0vjkJQynOdD+oESUx6nEDdgtA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WyyuUEwcxwrvNGgAj7JXZzplKDrYU0WBMdSAWC7isgGoI6EEdMjlerrApsyFUCPN4
	 XWrFrbWDvy7Sg4DaiF7OdYZrJzuNKAsBPgJ4iATkd9RhVS8Fe70cbz6UN5u+nOEzhm
	 RvtzsY2oE/DZApsXIPPR4dL0EGuCTYy+eWqe5m1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3B3BF80157;
	Mon, 22 Jun 2020 13:51:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53A06F8015B; Mon, 22 Jun 2020 13:51:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A2E4F80157
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 13:51:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A2E4F80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k5bbji9D"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D93B206EB;
 Mon, 22 Jun 2020 11:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592826691;
 bh=6kI4L4zPUlkblUHtlE0vjkJQynOdD+oESUx6nEDdgtA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k5bbji9DbfRj4tdakCUFG9c0m2fv4xOMhtcICMHdf7aexe0EUGfar7nMd2ujoLGWj
 Zm9fi6pWgwb3HpZxKrRYxjVAtm+/vsWZjURMA/jMuJ7C+ouAEWJT6VL3hBBqWebpCx
 xiZ5uBYb12DAW6k45vIv8bs9j8QJ0quxF2AHCaEQ=
Date: Mon, 22 Jun 2020 12:51:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 1/2] dt-bindings: sound: Device tree bindings for the
 apq8039 sound complex
Message-ID: <20200622115129.GC4560@sirena.org.uk>
References: <20200619193831.12528-1-pantelis.antoniou@linaro.org>
 <20200619193831.12528-2-pantelis.antoniou@linaro.org>
 <20200619214126.GA1251@gerhold.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Content-Disposition: inline
In-Reply-To: <20200619214126.GA1251@gerhold.net>
X-Cookie: laser, n.:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org,
 Pantelis Antoniou <pantelis.antoniou@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matt Porter <mporter@konsulko.com>, Shawn Guo <shawn.guo@linaro.org>
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


--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2020 at 11:41:26PM +0200, Stephan Gerhold wrote:
> Hi Pantelis,
>=20
> On Fri, Jun 19, 2020 at 10:38:30PM +0300, Pantelis Antoniou wrote:
> > Add a yaml device binding for the QCOM apq8039 sound complex driver.
> >=20
>=20
> Nice to see some activity to get sound working on another SoC!
> Thanks for documenting all these properties.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

> > +  function-definition:
> > +    type: object
> > +    description: |
> > +      Functional configuration for the sound complex via a
> > +      simple control. allows fixed and dynamically constructed
> > +      function selection.
> > +
> > +    properties:
> > +      mixer-control:
> > +        $ref: /schemas/types.yaml#/definitions/string
> > +        description: |
> > +          Name of the exported alsa mix control.

This does *not* look like something that should be in a DT binding, it
is quite clearly OS specific.

> > +      system-list:
> > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> > +        description: |
> > +          phandle(s) of the default, init and shutdown functions
> > +          Must be one of the declared ones in the function property.
> > +          The default function is the one selected by default on
> > +          startup (after the init function's sequence is executed).
> > +          On shutdown the shutdown function sequence will be executed.
> > +          Typically init and shutdown are the same and it's purpose
> > +          is to initialize the sound complex mixer controls to the
> > +          all off state, and be ready for a regular function selection.

> This looks much like a replacement for ALSA UCM and userspace audio jack
> detection coded into the device tree.

Very much so.  This is use case configuration and completely
inappropriate for DT.  DT should describe the hardware, the way the OS
intends to use the hardware is up to the OS.

> If you want to discuss ways to integrate mixer enable/disable sequences
> into the device tree, I suggest that you post your ideas separately as
> [RFC] with a more generic subject. That will make it more easy for
> everyone interested to share their thoughts.

> Right now it's quite hidden in a patch set where the subjects suggest
> that it's just a simple machine driver to glue some codecs together.

Indeed, I agree entirely.

--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7wm0AACgkQJNaLcl1U
h9CUhgf/RIFd53orwiMac+A1ik82HDNf5kX/wfvcuhQB6aFkTGuyMHXXcAC/8JJp
XgvvAcZqZpVpGZd+l9FoSp3Ye2iAPJfA4zfM7pQ5MLHoZNjnQG8n5gE04w6JhCZq
fWi4khSCyOej+9u3Wef+37mCCLIT8g1mB34QialxOU/JsFyZEzULz/9q0reposju
yxbv899e+GoUrRdYwhYafXcbsvy2t8UfERlBdoaGb5WDOXpYXJeTbirDhnYCKWtb
ze3jg9a1/OAtqkPjolDJHxHY8AC4WJSYwVyPGjHMPKnf5nhuLa/CKB7J6UMyyEXN
SEQyffj47T49rSpjtvS9FdMTg7nwXw==
=4kwO
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--
