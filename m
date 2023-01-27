Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 928C467EBB9
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 17:56:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC5C4EC2;
	Fri, 27 Jan 2023 17:55:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC5C4EC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674838595;
	bh=bTz2eUDKOKZm+oWfhF3ey90BYY+4xCfRxt06V8SDl0E=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WSMs8PymFazfp48H3N+xPAzFyOdfX2JWYy2MFoOkx6BXaho9EOAwxBmJh+euAFI00
	 s/u9N9NWx5nXQRHpVSipwo5nsOIhbrIXNc0ILPl/SaAzLBRFj5PFrYQ5D7RZmDbuKb
	 KMfnVIRfA70CsZDAwwifBInDRDY0aWJl/NcsSqQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0588CF80074;
	Fri, 27 Jan 2023 17:55:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 562E7F80272; Fri, 27 Jan 2023 17:55:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC815F8007C
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 17:55:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC815F8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nayQ+EFK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B939661C1A;
 Fri, 27 Jan 2023 16:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCDDC433D2;
 Fri, 27 Jan 2023 16:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674838530;
 bh=bTz2eUDKOKZm+oWfhF3ey90BYY+4xCfRxt06V8SDl0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nayQ+EFKxpA12DU+e6NZsNGOyeU0JPAhCGn7yYbp3+P1OhGdVJYeUNUH3dLBlhaIY
 eN850QcPoIIb55smPBD4qQ5p2Ly7AtA4bqAdfstWommtFflVZmtajkv8mRIUyFrDzj
 tAEZNHDdDmn4UkGTL7It3lxmufAElC04NOaAUpowUesSwsoyWzHAPbarr9ruZrqRGQ
 PnOjloB3Jz10RI9r4UBDxf6WOYorObHXXYhQ0eJEIplfkbRzbvC7buNAZO/dX0n+rQ
 u4CpFhr/n2nonKb5O1usOJKjdr6Qzzbnpm0VgUslr85ORzwqbrzOaaBCzxYjyfJtG0
 MvpN4IbirrCaQ==
Date: Fri, 27 Jan 2023 16:55:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 2/6] ASoC: amd: yc: Add a module parameter to influence
 pdm_gain
Message-ID: <Y9QB/xT8Wd5lMiLU@sirena.org.uk>
References: <20230127160134.2658-1-mario.limonciello@amd.com>
 <20230127160134.2658-3-mario.limonciello@amd.com>
 <2e9f4301-0211-04f5-5b38-caf2be9f4fd1@perex.cz>
 <MN0PR12MB61014C004C798F7DE8682AAFE2CC9@MN0PR12MB6101.namprd12.prod.outlook.com>
 <e9733e9a-ac70-846f-c3a2-f96a6787b9bc@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bwfZNF5CsTa1dqLU"
Content-Disposition: inline
In-Reply-To: <e9733e9a-ac70-846f-c3a2-f96a6787b9bc@perex.cz>
X-Cookie: Serving suggestion.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Pananchikkal,
 Renjith" <Renjith.Pananchikkal@amd.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, Mark Pearson <mpearson@lenovo.com>,
 "Saba Kareem, Syed" <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--bwfZNF5CsTa1dqLU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 27, 2023 at 05:41:44PM +0100, Jaroslav Kysela wrote:
> On 27. 01. 23 17:25, Limonciello, Mario wrote:

> > > >    	pdm_ctrl = acp6x_readl(acp_base + ACP_WOV_MISC_CTRL);
> > > > -	pdm_ctrl |= ACP_WOV_MISC_CTRL_MASK;
> > > > +	pdm_ctrl |= FIELD_PREP(ACP_WOV_GAIN_CONTROL, pdm_gain);

> > > The bits should be zeroed (AND - &) before OR to make sure that the correct
> > > value is written to the register. More related patches are affected.

> > I had consider this, but the hardware default at reset is 0x0.  Do you think it's
> > still necessary for posterity?

> You're using 0644 permissions for the module parameter, so the value can be
> changed by root using sysfs anytime (between SNDRV_PCM_TRIGGER calls).

Plus even if the value were never changed it just saves anyone
having to wonder if this has been taken care of, and means that
if there's any future hardware using this driver that uses a
different default (or a stale value in the hardware somehow) then
things will just work.

--bwfZNF5CsTa1dqLU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPUAf4ACgkQJNaLcl1U
h9DANgf+PhAveOMDrC3H87sS+njOjlFAcRfbUl7pTy1/E0mocbRvqOIsS/nAcZ5S
wJxj0/thBR2bhcnTiB6EwaurS4AKgRpoSXHy5dmkbQKzgmYSSSUehDji4v/eQy4G
Cejv2N4deKh5TzaexwsCUT8RjaWp+oNKUKKZdx/iEnjXq7QAywg2OZ9RSrau05Ls
b5svIh+XOvEAypxLmSff653PTLNKt4q6XJ4qvq9uX2WNOd0WXcIhPiRBfHF7Rni4
7I7jniMGUKp0fgLF9vGiyCzJt9xGG1cBH33wR5nX3buf91UuaSqblIM2oLQi1QDX
sjsdxWWn85VGOfoMiOlkE2oWTS7Gqg==
=5b/n
-----END PGP SIGNATURE-----

--bwfZNF5CsTa1dqLU--
