Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5618C2E70AB
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Dec 2020 13:42:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D03BD179E;
	Tue, 29 Dec 2020 13:41:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D03BD179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609245757;
	bh=qdL1uB6B1UXV2TxgliugspF/mrGeSPiZnH8ZtIXseis=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cLMd927qYc8fzP4mFLGbnrYNv+FHjvwgSlM5QBnbbQLhbK9w+5wK2+3WGWd/24kVF
	 2gbYzkQKS7XUcc50OJEmMAv/+fH3I0Nt+flrk0DxQu+aG4+ZBlUm8Uf1ZUvJFOq+e3
	 6jNV7/aECqAu5YqlsE3WepwT4FEOsDp/ipI2Jfpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3049AF8022D;
	Tue, 29 Dec 2020 13:41:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2807BF8022B; Tue, 29 Dec 2020 13:41:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42675F80162
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 13:40:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42675F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q5Al3s7p"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2C95207B8;
 Tue, 29 Dec 2020 12:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609245655;
 bh=qdL1uB6B1UXV2TxgliugspF/mrGeSPiZnH8ZtIXseis=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q5Al3s7pH/Q2gOLjsJl5bUsGE93nP8II2zubSheoULmZ7ACPrddQSEXGRysWmfayY
 kiXLjIBOniPt3RCgQTNgCNLmHKjceAk+7iDr1RuApuiFICzA+kJmNbD0GNE3F79puW
 /PRcgr313b2H0BS0vI4UwmCOi+0u+eJVNKQD/8Lrxx4BUugCxc8s9jRXIMuB9aD67M
 CPNH7s525WPl19lVhIAH/juY1Yqrx3ipec8Ps09MyBN0xZcwKoxmKbmijCQKFcXMDZ
 2QCzq0RVKEJzQTjbBVLCIqwIsr9/nJkJ2dMPsezHx/YO4fs84olRzA+IcmoBorRc6t
 lVZ/mh7yR3Ltg==
Date: Tue, 29 Dec 2020 12:40:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Perry Yuan <Perry.Yuan@dell.com>
Subject: Re: [PATCH v2 2/2] ASoC: rt715:add Mic Mute LED control support
Message-ID: <20201229124033.GC4786@sirena.org.uk>
References: <20201228133831.17464-1-Perry_Yuan@Dell.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5G06lTa6Jq83wMTw"
Content-Disposition: inline
In-Reply-To: <20201228133831.17464-1-Perry_Yuan@Dell.com>
X-Cookie: Mother Earth is not flat!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 Limonciello Mario <Mario.Limonciello@dell.com>, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com
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


--5G06lTa6Jq83wMTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 28, 2020 at 09:38:31PM +0800, Perry Yuan wrote:
> From: Perry Yuan <perry_yuan@dell.com>
>=20
> Some new Dell system is going to support audio internal micphone
> privacy setting from hardware level with micmute led state changing

I'm missing patch 1 of this series - what's the story with dependencies
and so on?

--5G06lTa6Jq83wMTw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/rI8EACgkQJNaLcl1U
h9AfVAf9EwDCDp+92vwJSYVphVfeIPziIaQ9i80zg0jLhzFjnxBt8t0xA34rJync
vGk2dgIgwe5mi+E5hTtNx3rpKQ0YjXrCxUPFnrk284ZsiFpufuUVwbixnzYQpth9
mxPp5lgkOChpYf5n6kYm9gGvW8r6Ijt9CI1SbXV/pUvpbrzN4QP2OPymSyGGvXO9
JUx+FTZOXRVnDs3NqFWQW4T1oaipvOkXTqYAJshBaDsNqn+6/2UaRLQtR1yhet3V
78kMpk0/BjBqrkofsIO/3nUzEgOCX5HwUviCAoqrtmhLmrT97luF/eHlV8k9SjA3
Rf02r7CedzVvZrS+zho8fKD2X4btoQ==
=d8Jt
-----END PGP SIGNATURE-----

--5G06lTa6Jq83wMTw--
