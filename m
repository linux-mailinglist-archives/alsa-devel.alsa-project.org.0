Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B6D450563
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 14:27:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B364516C8;
	Mon, 15 Nov 2021 14:27:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B364516C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636982875;
	bh=01qEd32F2rlw3k4pZAVdx7RvmYhVCI9lyIIgKUgvlIU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YcSOhiSfFNQpmVQIfo9Qz3OsXL59tLAFY4kByR4BnKCRAzLTrLWQLme9pjIQEVtOG
	 MLtlQtg5zMDNqJ7KAHugqxuOIruk36UjL/AoZc5QwAwcygNfIvpsP33ldOIi6XRK5m
	 01NB0pwYeXps5n6Zk+dO09N0gpmgkK6iOUmgeyhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CFC0F80134;
	Mon, 15 Nov 2021 14:26:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0714F8028B; Mon, 15 Nov 2021 14:26:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FFA2F801D5
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 14:26:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FFA2F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ftn3mhgY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 653DA61BFA;
 Mon, 15 Nov 2021 13:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636982790;
 bh=01qEd32F2rlw3k4pZAVdx7RvmYhVCI9lyIIgKUgvlIU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ftn3mhgYDDBLaIDTCdnwZr8jaj5+GkPZgYd6xQP7HTdYsCnADRoQN2u8sK0ZxsF8i
 UhedIKjxgOtJk7BezhdjI8B5nhcx1MqG+6aWeiADayUKTtw/cQcwDZKqiEaKyzz0pT
 Sou4nspIKitivAUdUfs8cohLKooWr7tGHNswfyUjOVMMlAIO3mqjRmpF3Hkzc7wepw
 3weF61RVi7zc72VvQDYkrpoHOyI2tmK2QjvJD27A9zjbg1FcaFv7i+2Tfrsv7QQgOL
 vOFoySfTR3pax1Ib5n1H/qZ8w0GIP4HHq7wl6YA8aiBvJJAO+f3yViaCPgAQPXNx3L
 8TQkrkLSSzZTQ==
Date: Mon, 15 Nov 2021 13:26:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [RESEND PATCH 00/10] ASoC: Intel: sof_sdw: Use fixed DAI link id
Message-ID: <YZJgAi9mt/ZhhG2Z@sirena.org.uk>
References: <20211115122241.13242-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KY1PNL1KUwDn5zqs"
Content-Disposition: inline
In-Reply-To: <20211115122241.13242-1-yung-chuan.liao@linux.intel.com>
X-Cookie: Custer committed Siouxicide.
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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


--KY1PNL1KUwDn5zqs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 15, 2021 at 08:22:31PM +0800, Bard Liao wrote:
> This series provides a way to use constant dailink numbers for different
> devices. So that we don't need to renumber them in topologies.
> Some patches with different purpose are sent together in this series
> since they are dependent.

AFAICT this is the same patch series you sent just before the merge
window which hadn't been applied due to the merge window.

--KY1PNL1KUwDn5zqs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGSYAEACgkQJNaLcl1U
h9CtTwf8C5G4cTNpZnlihYeci1xny/SspppVcMb5FQWgNjDe6MRP0lGvPz269xqZ
X2xbO70pccHXRiWP3qrVpuH+NiVIFYda1gL0unbrzhjdCV5X2fYk8YFJrW6hkeZx
1MxvH4anuSCqcLiZG49fMb1E20uYhcpk4Zn3bnRqxo/MGiUSBtUsyoc1qhtyl/0t
Wux8at6eT5npp8wDQisQZSKnVczwvAY19K4AqpuccZBvjMjf7BKY5EtdTQW4zoTy
p6BFA75+Mmo2jOO/bkXp9xG4ZttkJkiUnisKbwTSsgm7GGyCqYVA0NqZdMFgGWqH
TOi9qh26RhKpoCpM8dPHqgbS7YUzUw==
=RJy5
-----END PGP SIGNATURE-----

--KY1PNL1KUwDn5zqs--
