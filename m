Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BB757C9B1
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 13:23:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7683917DA;
	Thu, 21 Jul 2022 13:22:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7683917DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658402601;
	bh=USJlBh7yL447OVSeuPpyWmX+61phCJ207hQItAmCkN8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r3djVXpierbKDwqHKOeE2lbxy3/ijQZgR2c5Ajw2rs8YbtX0ADJX8XHvDz0dxJ10S
	 /JFqzTjL58rmzyo8ll+g/cFMq6z5HR02W4BcMOLHQ4O4onbt17NJJJTj30HW38P63V
	 minfLrlF5yv8oNNDy8qzei6Z4qVRhlSzuUcu+5Dc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6223F80256;
	Thu, 21 Jul 2022 13:22:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C20B2F8016D; Thu, 21 Jul 2022 13:22:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 139C9F800BA
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 13:22:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 139C9F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZbLg9oWc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EBAC6B82342;
 Thu, 21 Jul 2022 11:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA288C3411E;
 Thu, 21 Jul 2022 11:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658402532;
 bh=USJlBh7yL447OVSeuPpyWmX+61phCJ207hQItAmCkN8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZbLg9oWcnLQyQ0C9hCkzwpBOhmjhpzC9I0W009Eubw+1APUX8+R42Xu6yZ1004G9a
 TOvBun74ReB0F7GvPJwIRTx047jOLzdwY1TMJBOPxSYQoR7UjdqYCRc65GCx8V+k/0
 FURq+URa7d7elSX/vUunP6OkwW3xdEV+tkfzuIkGeTnX0I2UXYUdsAQdEPQE3BeCXg
 dQgpOXHT+bPknKgxKkKepvoW1bNvgGOKYskyGpCCEBhJYmDAqp7h1DUkq8sGz5oJ3n
 S41DaJYzskDVZ7vhowz5DJXyPWcfniiISbr+0/z/9HrEhfBw8BROG4ZIEFKekpvwo6
 andxDqOMNXBBw==
Date: Thu, 21 Jul 2022 12:22:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Subject: Re: [PATCH -next 0/2] ASoC: Cleanup deprecated regmap-irq
 functionality
Message-ID: <Ytk235u8xWD+vEMB@sirena.org.uk>
References: <20220721102558.25457-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KMTdyiBZDjPPqsZY"
Content-Disposition: inline
In-Reply-To: <20220721102558.25457-1-aidanmacdonald.0x0@gmail.com>
X-Cookie: Exercise caution in your daily affairs.
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com
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


--KMTdyiBZDjPPqsZY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 11:25:56AM +0100, Aidan MacDonald wrote:
> Update two ASoC codec drivers to remove uses of regmap-irq type
> registers, which have recently been deprecated by the "regmap-irq
> cleanups and refactoring" series in linux-next.
>=20
> Link: https://lore.kernel.org/lkml/20220623211420.918875-1-aidanmacdonald=
=2E0x0@gmail.com/
>=20
> Aidan MacDonald (2):
>   sound: soc: codecs: wcd9335: Convert irq chip to config regs
>   sound: soc: codecs: wcd938x: Remove spurious type_base from irq chip

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--KMTdyiBZDjPPqsZY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLZNt4ACgkQJNaLcl1U
h9AuIAgAg9Rr7yRd2g/1EHbmeqzhD4cKtfo9RALBDOIpP/Lmap97lADvcEotdFqG
tUiFtFqjLZjgbb8pldkuq56YjsZu/F/AhIeNI8iCRPgtqsKWc15wHN2bUp61EVax
st9M/JdrYOwugRlYZL30W+wugq0Pr+QlUOWax9ZYpz8Va7w62X7UiypHreu/BiQj
B/o7jsZU6BOyHFP2MPdfWFPfdgQ/SMo6oudT7YC7sWqnNBqIXnaa6ZoPvGWWpMcw
j4VSAbUJCHcX7E7vs/oLZUb/xot2aYQdYMMAjEOIY7T3M5CKV7gQRNz3+zpsYGNl
Wb+oALqz8QMsovJqugPmOUhBsudLxw==
=WUQv
-----END PGP SIGNATURE-----

--KMTdyiBZDjPPqsZY--
