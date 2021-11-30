Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B176A463C82
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 18:06:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3524A2373;
	Tue, 30 Nov 2021 18:06:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3524A2373
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638292019;
	bh=hphnhkSHJqskZN4ZuF98O5+cfuFGJ6VcXrVGP19KjW0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TsGNTd5QKotVPKRVJD2jItZYOgDOuff6IoxFGW5mV6PS8MrXZlKdtTAOtRELmZnJ+
	 vpAyJQQKZqC8EpRxDXfopJSRknYvy93qNoXrZbrPe4n7Uvyh+Ue83ksj0Edi+aRJuU
	 vDiVqjPqkDKdmmFiuz2P29tRlFY9+w3sarC8wTrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EBF4F802A0;
	Tue, 30 Nov 2021 18:05:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA9E7F80290; Tue, 30 Nov 2021 18:05:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E0F0F800EE
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 18:05:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E0F0F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="raSMytiy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id CA1C3CE1759;
 Tue, 30 Nov 2021 17:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99524C53FC7;
 Tue, 30 Nov 2021 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638291924;
 bh=hphnhkSHJqskZN4ZuF98O5+cfuFGJ6VcXrVGP19KjW0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=raSMytiymPsDF37jsefWpuEssrdKGFTnkc0xVsXg5OUDGyOTJmH108r+um0Y0ZLj2
 9J/4f2tVEDqbeGQw9MCJZDX+EuYKv8Napdelblosb4Plmhw9Yo/YvGA/qtK++xXjTS
 xeOiO/8xtYrDXHcRft8KyDrl37gbrIr2bUPUO1vsCRDqYp6otMcP0aecuFT+tbcvVX
 yf3xGtGLgC1KW9Ze4j2MJcfW/5MhaWWqwjMElX/w60CiVmkkCyoq0ggk92TxA1eIM3
 MLV8VvkyhfRAhrMJuCa2+FLEm1LIMzion8nkwMEkkWerTAzv7I4wh7w57PiETRADPu
 HKJN7VUvrn9Eg==
Date: Tue, 30 Nov 2021 17:05:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 07/21] ASoC: amd: Add module to determine ACP configuration
Message-ID: <YaZZzSPQDz0vHRQY@sirena.org.uk>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
 <20211117093734.17407-8-daniel.baluta@oss.nxp.com>
 <CAMuHMdVV6Os8Gzc9JVjD2CAtN38=7KFn9GqosnWvByQc-7uA=Q@mail.gmail.com>
 <bdbea252-09e4-eb60-acf8-4ea8a1d924c4@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="W5Gh1d/V7Wj5vuMq"
Content-Disposition: inline
In-Reply-To: <bdbea252-09e4-eb60-acf8-4ea8a1d924c4@linux.intel.com>
X-Cookie: Check your local listings.
Cc: daniel.baluta@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 AjitKumar.Pandey@amd.com, Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Balakishore.pati@amd.com, Geert Uytterhoeven <geert@linux-m68k.org>,
 Bard Liao <bard.liao@intel.com>, Julian.Schroeder@amd.com,
 yc.hung@mediatek.com, vishnuvardhanrao.ravulapati@amd.com,
 linux-mediatek@lists.infradead.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 daniel.baluta@nxp.com, vsreddy@amd.com
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


--W5Gh1d/V7Wj5vuMq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 30, 2021 at 10:49:30AM -0600, Pierre-Louis Bossart wrote:

> To Geert's point, there may be an additional need to add a

> depends on SND_SOC_AMD_ACP

> There are also a set of

> SND_SOC_AMD_ACPyx options, not sure if any applies as a dependency here?

Or put them in an if block (IIRC I thought they were which was why the
dependency wasn't needed but I don't know what I was looking at if I did
check that).

--W5Gh1d/V7Wj5vuMq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGmWcwACgkQJNaLcl1U
h9D5uQgAgM41glVdyKm2UPfvCs9Az0pVc/MIJufe1A5vkcXTuQx9PDfAr4gjWNHD
nIKNoikwGdj3FKLiM6jVSJuRMe5o/q63tokDrrNGBkwGyXN8jHNnlJL8ZuEDt2Y1
E2BlZaZPiVfO1K96M3xaRzEAivY52k1wp6k5EbtTGRQpW7X+TkGmF3v+ybdknZR8
Z84uqU6c60huQpTPHL9HQ5UOXLqKf5Ew/OJlEWkDRqziihmpgu/PLpNDqQDq/+tE
/bbHLPgrBs6GkGKGppCmGBgq0Bv55QXBPWeG76OFqKUGrkzCFQ5NVRNj0lL9c1hN
x2pXo3PKtOUT7+o1wcpmg5dAZmys8g==
=jZMX
-----END PGP SIGNATURE-----

--W5Gh1d/V7Wj5vuMq--
