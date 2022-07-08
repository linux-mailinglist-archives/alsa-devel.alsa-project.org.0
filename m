Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 382B256B9EE
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 14:45:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B273E83A;
	Fri,  8 Jul 2022 14:44:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B273E83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657284316;
	bh=BxRFS74/wPXVWhnRUFG6v6MJTHoa+rf4xlBesuE0Hd8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i57EpLJdmyB4vqgjceJ+G6sry7bCsOHGCpKfZyAUsD6u9AH7Jk1AdGDVthgWXTLks
	 3CQhQ62lEDQkScen7klS4ySac1R2P51Lsur+RR+3SzZXSHIIOM1/cXcK0be0jrxbZG
	 FDHPiyfUpZ7FNP6vEkepYGoaG0xyw/d2PNg7zn5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37C68F8025B;
	Fri,  8 Jul 2022 14:44:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE171F80084; Fri,  8 Jul 2022 14:44:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6799DF80084
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 14:44:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6799DF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M9fd+19F"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 80FB06271C;
 Fri,  8 Jul 2022 12:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E64C341C6;
 Fri,  8 Jul 2022 12:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657284249;
 bh=BxRFS74/wPXVWhnRUFG6v6MJTHoa+rf4xlBesuE0Hd8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M9fd+19FkzNtAqLhIan/U6Be0K9sXFROEBzEgAQTXsaN6Lbn1onla82CqFYdNyH5T
 8RLJy844UNDQmodz/TfLMrq70GztnZ2dq2VZOIiUe6Vy9mIHHG2uGibLGYYcvFxplw
 VuccJADL5kwO9Uu1O1mnOl+CQAHYBjGEDczHF8ucFoKQ72vKNtGplq7yRC9/tEoVtA
 UXcb933U6Xa55bR1sG9YxzP3NEGM5utMyv+d76gxq+AimHs/P17hEVUzISYQdWZ6pp
 BRjQ60Jb/TrQ+FqD1RIA6V4XFyHzYZf8deFPSDIe2unCLn4xNb2tXiS7vPveWuMEui
 vsovH2uBwfU2g==
Date: Fri, 8 Jul 2022 13:44:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Subject: Re: [PATCH v3 04/11] ASoC: jz4740-i2s: Handle independent FIFO flush
 bits
Message-ID: <YsgmkBpk4JBTkjPz@sirena.org.uk>
References: <20220708104304.51415-1-aidanmacdonald.0x0@gmail.com>
 <20220708104304.51415-5-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iMtDllGA45iC7Bq8"
Content-Disposition: inline
In-Reply-To: <20220708104304.51415-5-aidanmacdonald.0x0@gmail.com>
X-Cookie: Baby On Board.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, tiwai@suse.com,
 paul@crapouillou.net
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


--iMtDllGA45iC7Bq8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2022 at 11:42:57AM +0100, Aidan MacDonald wrote:
> On the JZ4740, there is a single bit that flushes (empties) both
> the transmit and receive FIFO. Later SoCs have independent flush
> bits for each FIFO, which allows us to flush the right FIFO when
> starting up a stream.
>=20
> This also fixes a bug: since we were only setting the JZ4740's
> flush bit, which corresponds to the TX FIFO flush bit on other
> SoCs, other SoCs were not having their RX FIFO flushed at all.
>=20
> Fixes: 967beb2e8777 ("ASoC: jz4740: Add jz4780 support")

Fixes should generally be at the start of a patch series so they don't
end up depending on other patches needlessly.

--iMtDllGA45iC7Bq8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLIJo8ACgkQJNaLcl1U
h9B9kgf8CT0MfwU8RkShIGj7UdUEyFOhRfUqIEDavq/R9O1q1FvEygiH0xnSn2G7
YZ0Vez4b0jAt0eRtXGfW87yw5YoX0J489Gb4Cwd1OOHXd1AfN5v6mOuYxccuPzVb
q+tuMq7GCNZCVbqcCgHR+FaBLgbP/3YYLontc0Dl0tx0M6nqGs1/6u2IEY5kv2Gl
f3sP5jb1Q1b8LIyUnF2uLz0GV++dCt0vsQ70Ji6bPyE6dVVTEH8Cf0GVvIsOo4SU
2BjTqZoppM2ZVOhyyZ90au6bjKjrL8frjl7AmRdKTuguAzhi6Q6OHGLrj+Z1ztIb
CCwyurB2OTlUhERrjDewaqU468jK9Q==
=lFdd
-----END PGP SIGNATURE-----

--iMtDllGA45iC7Bq8--
