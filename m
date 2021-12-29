Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ABE4812CE
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 13:46:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDBE81775;
	Wed, 29 Dec 2021 13:45:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDBE81775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640782006;
	bh=LkEewqSCwwrev2AusiOOu35hCs+738LXbqsq/SHqUzU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FKmcy8muRXdFR1t3dr4WGpk9wfyzsDsh84ieJsE+dT4JguxdfXQEOb/iZK8OydVfS
	 e+Did+3hPSpS27282JowTxYXwGT+YYI8JWxZS9zIKZpW5/8JyEwJb40wXLBEDYY63b
	 yIsVW2mAtKhpi0hWjf0nQ1YJWf2dHxIae435C58g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F12BF800D3;
	Wed, 29 Dec 2021 13:45:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C0BFF801EC; Wed, 29 Dec 2021 13:45:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A9F0F800D3
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 13:45:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A9F0F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U6NiT/FK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 49D31614A9;
 Wed, 29 Dec 2021 12:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C0CC36AE9;
 Wed, 29 Dec 2021 12:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640781932;
 bh=LkEewqSCwwrev2AusiOOu35hCs+738LXbqsq/SHqUzU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U6NiT/FKhGxxPt0mDd/pdVg0y6WonKk8EgHEqSr1h/cZlJLcoMCIxagan8VfLIoG2
 2BZRBH0ARPh76LZBV2RF4bGmrXQVpfDfUw+8prXjeZ1vBxWy3EUVc1Sxh1ckUaD+ou
 0unT2kEthlYKyLoe5BWKUNaUMw82z06GGa7MM4c+D6W2oEemYvPLayEX0G4yKKAiKM
 my/zMHQd4aW+tWYA8BZuwUAIq4k9bavIbirfa/e6JV6N1TzFvS80o0VnazJlXigwVR
 sEmBal1H1DJ6FiTkMXSxoE15MxIbS2mHFieeMvkqO7PdDg83MgZWo3cGg2MOcloyqW
 zMNmzKX8LEk7w==
Date: Wed, 29 Dec 2021 12:45:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Subject: Re: [PATCH] ASoC: nau8821: Add DMIC selections.
Message-ID: <YcxYZqZ6aVh1zfY3@sirena.org.uk>
References: <20211228035101.2973294-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CjW8vPa9drBrBAgB"
Content-Disposition: inline
In-Reply-To: <20211228035101.2973294-1-wtli@nuvoton.com>
X-Cookie: New customers only.
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com, KCHSU0@nuvoton.com,
 lgirdwood@gmail.com, YHCHuang@nuvoton.com, CTLIN0@nuvoton.com,
 dardar923@gmail.com, supercraig0719@gmail.com
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


--CjW8vPa9drBrBAgB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 28, 2021 at 11:51:01AM +0800, Seven Lee wrote:
> Add the following two control options:
> 1. DMIC pin slew rate selection.
> 2. DMIC clock speed selection.

The clock speed seems sensible enough to control from userspace since
it's going to be a power/performance tradeoff but why also expose the
slew rate to userspace - that seems more like something that would come
=66rom the board design?

--CjW8vPa9drBrBAgB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHMWGUACgkQJNaLcl1U
h9DKUgf/e9rULFmpjPs1/pgqn/OuM1nKeGG02a07UlTLidiBNw41IpguW72jRWrC
8R0RFx2FvMauq536Ek4uadcIdK1T5phB7VAzuEd3+UDxTFLroM935weVKj6u+wcx
oPHr+ZpZNQVnJexg4qoUqAjFxFMjJgJMzIviF017h3k6B2a9LVY8mvldVhSQia+V
giFxMPBH7K026fQTSpqi+LWgT6otfmYjPUJjewmHU2cl8VG9OUZ5T687cZDH/uyZ
W5o+0FviSwxlQdf1P/EdCBXCzFvlGG2TRjIrMNSvs27IB7iM03zYiHA9bWdETboy
F7uCjLG9K4B9Kvx154LKmSbkya/Cqw==
=G8uI
-----END PGP SIGNATURE-----

--CjW8vPa9drBrBAgB--
