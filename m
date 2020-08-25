Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA69925217A
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:03:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B9F51690;
	Tue, 25 Aug 2020 22:02:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B9F51690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598385804;
	bh=bTc4v+6F/hagCAOCYn0EUdpt19OkZWEAtYQetr9TA/0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MjHhZkoUPSjLwgd6ic3QKJ9OmO94ds9DwjIW0bB2LEyfvtGYAMDE4pTHdIrwdtPpw
	 TCqNi98jrjVtp+0W9vEvh1HkABP/6dWPxeecWbhggwN4T1pCE43sQGNi0tiBSygH1v
	 3mA1bTR0xr7DL/SPdCn/C9srlv8cVui1+fXxVgb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BC37F80143;
	Tue, 25 Aug 2020 22:01:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96170F8025A; Tue, 25 Aug 2020 22:01:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92AEBF800D1
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:01:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92AEBF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MtwFGwk4"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E12A72072D;
 Tue, 25 Aug 2020 20:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598385688;
 bh=bTc4v+6F/hagCAOCYn0EUdpt19OkZWEAtYQetr9TA/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MtwFGwk4OelnWAHsK7KS1KGH506S1PZ3kare4MTUWPq7jCKnwoKgb2o7vCqoNfWs5
 RglzVl485H0m+cP4JfbwfwQ+SKsyLWbPjq91O7pjwYne6HsenZz4wBjJbiq3j/7Las
 Ud8aAq/9a9RtRwSNLbuwHoXPeX8IDt/BSude5F+g=
Date: Tue, 25 Aug 2020 21:00:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao <srivasam@codeaurora.org>
Subject: Re: [PATCH 1/5] dt-bindings: Add sc7180-lpass HDMI header define
Message-ID: <20200825200052.GI5379@sirena.org.uk>
References: <1598375788-1882-1-git-send-email-srivasam@codeaurora.org>
 <1598375788-1882-2-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5uO961YFyoDlzFnP"
Content-Disposition: inline
In-Reply-To: <1598375788-1882-2-git-send-email-srivasam@codeaurora.org>
X-Cookie: Don't get to bragging.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vsujithk <vsujithk@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org, srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-kernel@vger.kernel.org
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


--5uO961YFyoDlzFnP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2020 at 10:46:24PM +0530, Srinivasa Rao wrote:
> From: vsujithk <vsujithk@codeaurora.org>
>=20
> Add header defining HDMI dai-id for SC7180 lpass soc.
>=20
> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
> ---

You haven't provided a signoff for the author "vsujithk" (who presumably
has a more complete name?) - these are important, see
submitting-patches.rst for details on what the signoff means and why
it's needed.

--5uO961YFyoDlzFnP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9FbfQACgkQJNaLcl1U
h9BSlAf/YtTZ0z9aVXnosGU97p0DjhzallSbOSZxFjDNmCb2yZ/ule4Z75XA+5Ga
pzP1MEIbbmmTsPsx7NQVDZuAWMGdMUISlp6rL12clfwjkg/XoJhMS6pQ4aJaCvQF
jP5manaErAltKq3qc3rOpj+4x0/xHnLjfVFyqbmy2AQvhhM/ufJNi2v1rGkn7H2e
vp2EvfC/3BOU7pRa5JjDWfZ1tfHbCIuPuDWvP+pvcJ0fcULucj25U4IKoF+Y8A13
qZ0E+eWvWeDIn2iVUboRvD2Y8rK7br55aTIlMviSb2Ss8eQJ/BpEeE1WhUDuC/1C
UzsYrYs1VQYeyG0d2jSuhyYboKdlHA==
=4xff
-----END PGP SIGNATURE-----

--5uO961YFyoDlzFnP--
