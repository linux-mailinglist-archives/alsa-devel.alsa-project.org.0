Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 555FE835BD9
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 08:42:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8445F826;
	Mon, 22 Jan 2024 08:42:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8445F826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705909371;
	bh=bNCnQp0ND/Bhd8jsEriViBmV+pDcacpd6HBwU8PIoQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q/XPx1MR2EAabFSC7Kg6+8/rETKQbR9Z1HTqWhmAPRTNxsCLpqU8/2mGnDkGzq/eN
	 BmP5Ql511fgToiPPZoriGl9OAxxE4zEsHqJTK9OOcGM0RY7IvqMgSabweLh9f5wch5
	 ++1ftzuJ9NrDyvZORjhl6Jmz8FMjsS5o4EPYwY0E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92011F8058C; Mon, 22 Jan 2024 08:42:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B21B3F80579;
	Mon, 22 Jan 2024 08:42:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96498F8028D; Mon, 22 Jan 2024 08:42:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CCFDF8022B
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 08:41:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CCFDF8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=N1uaOB34
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1C4ABCE28C6;
	Mon, 22 Jan 2024 07:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D970C43390;
	Mon, 22 Jan 2024 07:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705909309;
	bh=bNCnQp0ND/Bhd8jsEriViBmV+pDcacpd6HBwU8PIoQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N1uaOB34gDFPl5VgCSojvtB3kJLoAuXALTXH8M8PXB48+q0RzPXLgeiOZWpGlithi
	 qkFsXXxAmmVdkaObyI1c5dBA0XZvmGmQS5ZjOmsdELsxbqFHd/o1fgSu21/Qub1xzc
	 4QWHiAXJlV+pgMtIWN7G/5uSZUkb79z6lK7eWfIQ2XLpScPtr6nsBxmRU7CgsiM53k
	 7/JBW3HKmwzdTRZl5desoUu2GpDNwD1xNn8OXJWdeTOI5RU0VtPYgjRbAhIK/8fPR+
	 VZs5/t9m/cS8yIQPJlHnAK9sS/D2ASIRHn2Oa9MbSZScGYOJOxE26iu3WP369JHIxT
	 NEsU/yw3Jvv/w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rRowR-0000000071i-3V5n;
	Mon, 22 Jan 2024 08:41:59 +0100
Date: Mon, 22 Jan 2024 08:41:59 +0100
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 2/4] ASoC: qcom: sc8280xp: limit speaker volumes
Message-ID: <Za4cR90XoAaATq8X@hovoldconsulting.com>
References: <20240119112420.7446-1-johan+linaro@kernel.org>
 <20240119112420.7446-3-johan+linaro@kernel.org>
 <d54d3640-49bf-4a2f-903b-4beeb0ebd56c@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6hBlhn91CWqsWzU0"
Content-Disposition: inline
In-Reply-To: <d54d3640-49bf-4a2f-903b-4beeb0ebd56c@sirena.org.uk>
Message-ID-Hash: WSE6KINRSEX3E4BNCAY4G6WWPHIYPV2Z
X-Message-ID-Hash: WSE6KINRSEX3E4BNCAY4G6WWPHIYPV2Z
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WSE6KINRSEX3E4BNCAY4G6WWPHIYPV2Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--6hBlhn91CWqsWzU0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 12:03:55AM +0000, Mark Brown wrote:
> On Fri, Jan 19, 2024 at 12:24:18PM +0100, Johan Hovold wrote:
> > The UCM configuration for the Lenovo ThinkPad X13s has up until now
> > been setting the speaker PA volume to the minimum -3 dB when enabling
> > the speakers, but this does not prevent the user from increasing the
> > volume further.
>=20
> This doesn't apply against current code, please check and resend.

These patches are based on Linus's tree after merging the sound updates
and I just verified that they apply cleanly to 6.8-rc1.

I couldn't find anything related in either linux-next or your ASoC tree
that should interfere.

Could you please try again or let me know which branch to rebase on?

Johan

--6hBlhn91CWqsWzU0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCZa4cQwAKCRALxc3C7H1l
CIxuAP40ZX5S3hcjEvbXjMLdYeKr/Nckfcn4BA2prKLZ4aqX+wD+Nete6gxhBX0l
Ms5y+h/uAsuqbIqbgFwhpapBjxXd+w0=
=Ejix
-----END PGP SIGNATURE-----

--6hBlhn91CWqsWzU0--
