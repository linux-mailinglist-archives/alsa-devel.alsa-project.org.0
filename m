Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCF8687C80
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 12:43:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99A58E71;
	Thu,  2 Feb 2023 12:42:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99A58E71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675338207;
	bh=8AzNixb4xVs4owedtSG8sTCOfFb8S5iNQAR8r+NfxZ8=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=uqfKYb15D1xPPksQXD3DNohDlKxlbuySGjw8vH+ycC9ONGrP77gMv7a0R4YSg43Ja
	 l8feq9ElLPiP+wF+9LHWn36sqC4JfxHpZxk2WtP45fYptyKBsVyWMjt0gBHmJmm3p3
	 p+V3z0ITjWQaTFFw+SRnc8iQ5zYtLFL9WWsuuw44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6C18F80271;
	Thu,  2 Feb 2023 12:42:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4BFBF804C2; Thu,  2 Feb 2023 12:42:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 412C8F80169
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 12:42:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 412C8F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tQwfYR2N
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 46E57B825AB;
 Thu,  2 Feb 2023 11:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62AD7C433EF;
 Thu,  2 Feb 2023 11:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675338134;
 bh=8AzNixb4xVs4owedtSG8sTCOfFb8S5iNQAR8r+NfxZ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tQwfYR2NPvHwDjeYm403lPhEhb9ha0tflaAzLW3vKknWfhRsVbHBjdjbI+KKCyzhj
 yowzrYBOEB8JS7tabwYrzR9jXZCDu271i9G6UC53JdknMMkz6qQf48OAKALKiIPZnk
 8/gYLpRkA8aUqXTqgVgfJsq9LYVKuDu0f8+137JNd+w5CRDyYacC2eiXf+9wRk49Il
 ODfB+fUmnz7wFG2Qi4SPgYJ3vXVqezF8VITynpsWgmHDFXOEh+iOGhNL5cyJ4ghx/f
 HHYQd3XMGPQfGrOr7AiP0Ze3nCmMgnhRBVy8597FQqyLS0tC64CvlfMeLrriGF+9FG
 l1d8HyTxfBFNA==
Date: Thu, 2 Feb 2023 11:42:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 1/6] ASoC: amd: yc: Adjust the gain for PDM DMIC
Message-ID: <Y9uhkEo9INU0IPEr@sirena.org.uk>
References: <20230131184653.10216-1-mario.limonciello@amd.com>
 <20230131184653.10216-2-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mBPl7DRMq9TEhSTH"
Content-Disposition: inline
In-Reply-To: <20230131184653.10216-2-mario.limonciello@amd.com>
X-Cookie: Swim at your own risk.
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
Cc: alsa-devel@alsa-project.org,
 Pananchikkal Renjith <Renjith.Pananchikkal@amd.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <jkysela@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Saba Kareem Syed <Syed.SabaKareem@amd.com>,
 Mukunda Vijendar <Vijendar.Mukunda@amd.com>,
 Mark Pearson <mpearson@lenovo.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--mBPl7DRMq9TEhSTH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 31, 2023 at 12:46:47PM -0600, Mario Limonciello wrote:
> A number of users for Lenovo Rembrandt based laptops are
> reporting that the microphone is too quiet relative to
> Windows with a dual boot.

If you're sending a cover letter for a series you should send it to the
maintainers as well, not just the patches.

--mBPl7DRMq9TEhSTH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPboY8ACgkQJNaLcl1U
h9CdGAf/dKm9kij8B6NkqCtz4OXZSs3ntNhPZrdHOJRAqAbAYxfOSUW7vn7JxKL4
uj+mDVczOvS88KTVDMyzlLE4wG7aTJbYTITOnapi4DkApEs0h6JwuUIZSLTyljB6
mis7Q8iuG/+jIbEiI5c7AsRZ+d7PcmVpTWT5coMeHgWpb8YoHIVsoUqHVzpBDo8+
1gwr1oIGG5pcf+UbgChgafDjt+SOt7ak2znfZ+bav/UDKz9r93k80F0CUcZhsMg8
KWu2mqzQO5cwMrjA9Y7ghkP+HLRL/6LlqRpOdWyYJVTX281KmwZlwiWbOpHORlqu
AWae882bIQonj9D/ASxEyfx/euaplg==
=4g9a
-----END PGP SIGNATURE-----

--mBPl7DRMq9TEhSTH--
