Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF576C3819
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 18:22:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D96A21F7;
	Tue, 21 Mar 2023 18:21:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D96A21F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679419350;
	bh=zgTHrxXgfF59J+d9taf5zXXMOLYG3apCi7j7rkTOU70=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VFGEvg9JWGqySELrk+c/nVt6cefpiLWkEYl3nCXQ5ihDWg/jJkHlJWosoiOkGqlAr
	 4UVRrzegOykBwmauXuuCl6HCoUncfwXhIM5vSjjGykoSYkrE+OWaAJcbPJUZamt/Oc
	 5NGaCzriNURL4cZ/PqGzDe87CTCSSd/PTvoH2Wiw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A5E1F80254;
	Tue, 21 Mar 2023 18:21:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A172F8027B; Tue, 21 Mar 2023 18:21:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3955DF80105
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 18:21:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3955DF80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Qs9AvSrC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 32A16B81900;
	Tue, 21 Mar 2023 17:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF6AC4339B;
	Tue, 21 Mar 2023 17:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679419288;
	bh=zgTHrxXgfF59J+d9taf5zXXMOLYG3apCi7j7rkTOU70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qs9AvSrCqAMOAWzdXzibR6qQlQlM5EBVg2qvVn719h6FxpNItyMGzoR7jBmZtq1e6
	 9JOXtpAbvfQC8HvXx2h+RqzsCwibxACNZgaZZOvSF70X4ZstqD6hYd7BSQA0Jstvwc
	 NWFtE3a+dx+Jh59l0Xn3zzTwDtY1C6uknFQJBjVSOMRrfY6sqnW3n0DBYThCFVkfAY
	 sstoHuZSF1LVk9ZRr2pzOFW/RDaeqivhPjc6Oqi4GNCoOR1hCjTAIzL8LCV8m0zpfj
	 QGESSGOHBuC50iN/Dy/QXo/LQ48EOI7VJMKNubusHnI2bksRI3uMIP/Ob7DuKOFnf7
	 vvent8cKPRCLw==
Date: Tue, 21 Mar 2023 17:21:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Marian Postevca <posteuca@mutex.one>
Subject: Re: [PATCH 1/4] ASoC: es8316: Enable support for S32 LE format and
 MCLK div by 2
Message-ID: <ab2f5d31-2797-427c-9c4c-1d0166018a2d@sirena.org.uk>
References: <20230320203519.20137-1-posteuca@mutex.one>
 <20230320203519.20137-2-posteuca@mutex.one>
 <6825a54e-f2c0-41c4-981c-fafcd10454fd@sirena.org.uk>
 <87o7omvxns.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/N4FohmuSkAWokHz"
Content-Disposition: inline
In-Reply-To: <87o7omvxns.fsf@mutex.one>
X-Cookie: Will it improve my CASH FLOW?
Message-ID-Hash: 7VIGLP3HZNZTGXY2O7DI5EWKPF27BWNG
X-Message-ID-Hash: 7VIGLP3HZNZTGXY2O7DI5EWKPF27BWNG
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: zhuning@everest-semi.com, yangxiaohua@everest-semi.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7VIGLP3HZNZTGXY2O7DI5EWKPF27BWNG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--/N4FohmuSkAWokHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 21, 2023 at 07:09:43PM +0200, Marian Postevca wrote:
> Mark Brown <broonie@kernel.org> writes:
> > On Mon, Mar 20, 2023 at 10:35:16PM +0200, Marian Postevca wrote:

> > This introduces a DT property but there's no documentation for it, but I
> > don't see why we'd want this in the bindings - the driver should be able
> > to tell from the input clock rate and required output/internal clocks if
> > it needs to divide MCLK.

> The problem here is that I have no knowledge what is the maximum MCLK
> that the codec accepts. According to the datasheet the maximum supported
> frequency of MCLK is 51.2 Mhz. But this doesn't seem to be the case in
> practice since a MCLK of 48Mhz causes noises in the sound output.
> The idea to divide the MCLK by 2 was proposed by a Everest Semiconductor
> engineer.
> So I don't know how to make this generic enough to be activated from the
> codec driver.

The usual constraint would be that MCLK can be at most some multiple of
LRCLK or something similar (are all the other dividers in the chip set
sensibly for the full scale MCLK?).  In any case you're clearly aware of
a specific case where it needs to be divided down which can be
identified even if you're concerned about dividing down for other cases.

--/N4FohmuSkAWokHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQZ55IACgkQJNaLcl1U
h9BRNwf/enfamwGA+bFuLN4JarnDOoeq63H5NfeuP7o4LBw3WpvjiXhv6WkFNYkT
Xm76+yP16XFfTkW/DADzJMydsnD2QY+S0OlFgoRDrBoa/eVXfJC4K7wT66+LHcSx
afreEzw253YAXMiBB1jNwRxv6Tnu9ug9iLlRzGc9tmvzrPZAnS5BqRcS5LnZaH0W
7qAif6zk0rldbnovVW2dtAIZNOxgJ8jYD44nEfz5zHxiyRtQknAVVdALP/L7blTd
AvKzX1s2/mMufD4z/+wBLpZ/GsRsN3rzYd6/nft/7Kvh1jjHe8HiTuzgNj2LKz45
4pMXK/j3SOtXh9p1F90kn7Lz9JYepA==
=qzEz
-----END PGP SIGNATURE-----

--/N4FohmuSkAWokHz--
