Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E3280AC86
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Dec 2023 19:56:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF8A49F6;
	Fri,  8 Dec 2023 19:56:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF8A49F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702061786;
	bh=zH/mDq4ZOeaAVNaDkpZYAJUFG8NeBNcHhSruGzw2UZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Mv68TOszvAguSUWG/uNWDqnz2yO6NRJCjxlCuM6hlSrsvpLL0krTQKFkzcV7nURlM
	 PMOIA8i/5/B4b/P5yO5rsyVxTnNXAg7atkq0WG+JM7+zPdnxyER+L9FXJlkLAPjjYU
	 k8MJuv9PaReXPc//l0eEsSyQ1YN8QflTWGopHV7I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43E62F8057F; Fri,  8 Dec 2023 19:55:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 254E2F80568;
	Fri,  8 Dec 2023 19:55:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9604FF8024E; Fri,  8 Dec 2023 19:55:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DE2CF800F5
	for <alsa-devel@alsa-project.org>; Fri,  8 Dec 2023 19:55:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DE2CF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f+svSqqN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E6361CE2960;
	Fri,  8 Dec 2023 18:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02B4C433C8;
	Fri,  8 Dec 2023 18:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702061741;
	bh=zH/mDq4ZOeaAVNaDkpZYAJUFG8NeBNcHhSruGzw2UZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f+svSqqNyC59FkQ3Di/HGtc7nFA0kGtyLrT7a6g8cYI6h/57bCYyJe5z5btCFhaTQ
	 zhzLpMV4diruDb1wMmPfXYCBN0QYuqKAvV3mQgeuqS8nBZ05NWIkGKShdzr3+r6so0
	 qj1Eww75DDXgbHV2YaY+jWlOKp4dDZHjkI2aF+zA4LtdKbVZlYR9lCAetmghNROjma
	 w7j1uDth5zz6vyU5rUwGFOICX8EoWNVdQbRFUtCkdfjnhVl+1BZuqjXVliYZwJ2QLT
	 Xu864n1kUHJv4AzhxZ2X+yQsAUe7fzY9PhzVxb5V8otkTnfEdaUPU1Fh8CqYAvu3Lh
	 mRWPChkLoiPMg==
Date: Fri, 8 Dec 2023 18:55:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	tiwai@suse.de, vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Message-ID: <ZXNmqaCb+6SsXQDV@finisterre.sirena.org.uk>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <20231208162735.GV14858@ediswmail.ad.cirrus.com>
 <4048c3a3-f694-41c2-b338-57e524544c92@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CVF86aoH4KxUkuhv"
Content-Disposition: inline
In-Reply-To: <4048c3a3-f694-41c2-b338-57e524544c92@linux.intel.com>
X-Cookie: Slow day.  Practice crawling.
Message-ID-Hash: 25S22ZMDYYLOYUEOIM6VRSBW2OL5KSCX
X-Message-ID-Hash: 25S22ZMDYYLOYUEOIM6VRSBW2OL5KSCX
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/25S22ZMDYYLOYUEOIM6VRSBW2OL5KSCX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--CVF86aoH4KxUkuhv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 08, 2023 at 12:45:21PM -0600, Pierre-Louis Bossart wrote:
> On 12/8/23 10:27, Charles Keepax wrote:

> > I think we might have some annoying restrictions on the block
> > size on our hardware as well I will go dig into that and report
> > back.

> That would be very useful indeed, we have to make sure this alignment is
> reasonably supported across hosts and devices.
> If we can't agree we'll have to make the alignment host-dependent, but
> that will make the logic in codec drivers more complicated.

Hopefully even if it's complicated it's something that can be factored
out into library code rather than replicated.

--CVF86aoH4KxUkuhv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVzZqkACgkQJNaLcl1U
h9C2JQf7Bq5jbqQ6iqt8mpE6AqCVorJswEqPHo8EGamnfTLhb8+5leETNjC6fPsn
khC9gqWnhSDVZzwatpBdqhvgKL7pxNpRbITMeCQ7fp8g3CUnWCM1ooN6KgwHj4sI
4HMMSglyYj3/UIjqhoTLtdOzymkx3BTrPFsknBVQcJxzgS7yUlp+BdZxIQhhp3cR
swKSDl3HrcNkPnf9zV13l/SYX2z9wj/zbvcPdAypzHArdLhtk+Cr2HGg/QNWgAOh
KdzGazckFDVxHcx00xPrTGyaZs3MZP5FBUyZIKkcWTnGHJObLESEqTwRkS8qf7Gy
9LQpvKSQejFdX35BbfAVRUtdAoBlwQ==
=yFie
-----END PGP SIGNATURE-----

--CVF86aoH4KxUkuhv--
