Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2179924A70C
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 21:42:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99351167C;
	Wed, 19 Aug 2020 21:41:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99351167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597866150;
	bh=4AK5v821zy1PWvts/5ogFBjV+oVDZUgiOW/Z26HFexU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bvDV1VlYDSAjT8OYspNMv+eeSa3ZF89fl5S1tnpnDsgVOBKJCxxoFa3PGsNyaA9cl
	 LjW+73o2Vuge8yZlAQqBeuNhEgmQbolWmprYZ7DOjc6vLNbx+f/Y+BYTB3O1yMH8+/
	 RTquyqLWR9FV4ED9y7EhDLS/lsStwl0r1JpvgfwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1AE0F800D3;
	Wed, 19 Aug 2020 21:40:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D75EF80216; Wed, 19 Aug 2020 21:40:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59483F800D3
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 21:40:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59483F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ua92POSn"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F545207BB;
 Wed, 19 Aug 2020 19:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597866038;
 bh=4AK5v821zy1PWvts/5ogFBjV+oVDZUgiOW/Z26HFexU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ua92POSnqY57JylYmFlW/zoes2kP0GYGQbu4I2NNqI7oKhrS+kId6nciud6UtU/53
 xxjtEqyOGHXub4q0MJZENkMJiLMST98/X3qRGgvZaSsOkDwX/+1iT3sCek7q/zCe9/
 6H3LuAli7CzlhN/nPXo39fhV7mSt1VLrJDKdV/2k=
Date: Wed, 19 Aug 2020 20:40:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: mediatek: mt6359: add codec document
Message-ID: <20200819194005.GC38371@sirena.org.uk>
References: <1597644455-8216-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597644455-8216-3-git-send-email-jiaxin.yu@mediatek.com>
 <CA+Px+wXSbGLb+AZnF8ETRycRUVjqk4xacm5DH6MzuMw0vh6Wzg@mail.gmail.com>
 <CA+Px+wUMXoSL6w0wBduE7obJRWgCteeT8=_=U=8LR34JKTTGZA@mail.gmail.com>
 <20200819103730.GB5441@sirena.org.uk>
 <CA+Px+wUV89KO8JJd3+HpOrgFRSc7sdg-DBW44C31262Qx9NzVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Content-Disposition: inline
In-Reply-To: <CA+Px+wUV89KO8JJd3+HpOrgFRSc7sdg-DBW44C31262Qx9NzVg@mail.gmail.com>
X-Cookie: Absence makes the heart grow frantic.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>, howie.huang@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shane.chien@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, bicycle.tsai@mediatek.com,
 linux-arm-kernel@lists.infradead.org
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


--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 19, 2020 at 11:42:27PM +0800, Tzung-Bi Shih wrote:

> But I found struct mfd_cell also contains member .of_compatible.  What
> is the difference if we use compatible string (as is) for this device
> instead of falling back to use device name to match?

That's for binding the MFD subdevice to an OF node, you don't need to do
that for a device like this - you can just use the of_node of the parent
to get at the properties.

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl89gBUACgkQJNaLcl1U
h9D/+gf/Ux+96dRrUQezVV+5UF/r90Gm5dpzj3qN3D3o9ZNOhCUt2+i9Js4F/YDL
LL4dlrRI1Yg/CpFwunLwTiy3q2xYqUIFODQq/u2fkSDyejrXkt6R3NqxlaG5Jc0K
EpOxKm07grdw9WOWls6UmbeJLTL8jHp2KWUqGL5t2KiVLPAaxXvCOzI5MugAp3W1
B80S4jndViv3IEGEgKqvuS8PxVxmXuNe1gVH6arMvmDmK2NQWEIpit4dpWiuT7UY
EbAJsnABzE8jasbBRLHt5F7VRdU004CyjtsoZswk9b+otbSwvW82CRUQ8oD7t83+
VQcrX/wlkN3yNdkNF4CwrbBmV9d7sA==
=eiwO
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--
