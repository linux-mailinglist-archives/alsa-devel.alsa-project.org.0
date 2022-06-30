Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1825618D1
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 13:13:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7934F16CE;
	Thu, 30 Jun 2022 13:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7934F16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656587586;
	bh=gY2GwuIoEENdxG1SB1lnnV49S2t2kuQ/2lN1uJIHe7o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RzjRncLPB4ms59cahMsL+1WAc5tDkF5whuX/pqX0d7Z3dw1BofMhSCNQqMya4wX8w
	 R4PfTEVxLE6CHnQhBdwhEyr05ScXa61ZVkeJkjWltC4rPDSmzmLhxvChtZX9AFKw/4
	 opIyrW99ZbijU44dleHur2LRhxAbTtFym6Ttr3wc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE1EEF8014E;
	Thu, 30 Jun 2022 13:12:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17745F804D8; Thu, 30 Jun 2022 13:12:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A16B3F80107
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 13:11:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A16B3F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fVrcb0+6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C951FB82A2A;
 Thu, 30 Jun 2022 11:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5634C34115;
 Thu, 30 Jun 2022 11:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656587516;
 bh=gY2GwuIoEENdxG1SB1lnnV49S2t2kuQ/2lN1uJIHe7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fVrcb0+6182VKbB5+5bvi1s47yAwFfK8wb6zyFp/VYh39jS8CJX26v7VDJPXvmt6m
 Sq2aO1HVesfnXCRoOn7xIDqeid4zMoKig2AFowAiyxupDRcEhytjTmgOOHIFxtLXlw
 WnQGX/rMorDO05WZfM2GdvgCHMyaE58VmvJkvF/xcXat99lPVXYetwLQ6IeXcy6B6f
 JUK0/znx1WjGYVUCDVrm+wdH0I0gZjJYAJ33E/C25y9dFkfwom6jJpMDF2fXuNb3lL
 IRkA55V7usztN7WA1+/7khpvE/IZDERTGKcml1CeNR8YLLfUFjZrTIDolXBotPH1oW
 I7lLsShPC8ArA==
Date: Thu, 30 Jun 2022 12:11:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 5/5] ASoC: amd: enable machine driver build for Jadeite
 platform
Message-ID: <Yr2E9SQCtk1u6V+i@sirena.org.uk>
References: <20220630031755.1055413-1-Vijendar.Mukunda@amd.com>
 <20220630031755.1055413-6-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KL9cDJfR2Dto7H+U"
Content-Disposition: inline
In-Reply-To: <20220630031755.1055413-6-Vijendar.Mukunda@amd.com>
X-Cookie: Today is what happened to yesterday.
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexander.Deucher@amd.com, zhuning@everest-semi.com,
 Julian Braha <julianbraha@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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


--KL9cDJfR2Dto7H+U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 30, 2022 at 08:47:55AM +0530, Vijendar Mukunda wrote:

> +	depends on SND_SOC_AMD_ACP && I2C && ACPI

The code treated ACPI as optional so you could relax the ACPI dependency
ot be "ACPI || COMPILE_TEST" (I think the same applies to I2C).

--KL9cDJfR2Dto7H+U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK9hPQACgkQJNaLcl1U
h9Dsnwf/ceuWdmQ1YUNUCt6hr1dWc8w8GCz8hT5Wl9l1lyRROuKUldbDQWBk2+Ye
7cCxrDYlIRL09GtZbdu+Ct5uWqDgBEZ6K6RT4eDMrYVTlpRbKe8uCBSQem7NXmqD
jfIU9Z5b1gpqJsSWuFRY3I48SjN5UM6NclGCfUPv+XMr3QWw6jcSzIAvReP/GX/r
3VczbScE+g1wZ2jIzEjAkiIdK53sb2+C0Z4PmrI0B4KvLvCSZOXFLIlydLtsTnsG
OZRUjPW2Lb7mxEksPzmMuUAMQ3bwd4iHK6rqcw1WZ9VvLXJwBcP55U8blR/bNlVE
MvRRSDyctG4b+sAJy5gA+gwjPQYjOg==
=Eu76
-----END PGP SIGNATURE-----

--KL9cDJfR2Dto7H+U--
