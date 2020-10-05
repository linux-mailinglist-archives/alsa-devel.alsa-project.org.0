Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D58E283428
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 12:47:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25C0017EE;
	Mon,  5 Oct 2020 12:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25C0017EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601894822;
	bh=lkng/i8tI+e14rJtzP4dBacXfMVUIrCuYChUoHpV6f4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dxpNlH2xOJlCandLhHqCCQayZkE1HAXZpvrgUETmvoI0QueLVYBAqTffqREDIPqti
	 locnalpqc/aQ3OkoXTnLOGIBKHM/ztIESb9TCwg1wLZUZvpnc8aGUW5WvCpeJvihg4
	 adLfqmXQ181O+maMjW9zffQlMs6KFhn4Cd9eTEZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43B6FF800C9;
	Mon,  5 Oct 2020 12:45:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 223E2F8025A; Mon,  5 Oct 2020 12:45:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A085EF800C9
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 12:45:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A085EF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RQ6ZPe8z"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9FD372078D;
 Mon,  5 Oct 2020 10:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601894713;
 bh=lkng/i8tI+e14rJtzP4dBacXfMVUIrCuYChUoHpV6f4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RQ6ZPe8zWyyzFtnYvrxWLKJq5zXlJLtQC4lsGf7csP83g3ZNXzldLgJ8+8fMOF2nd
 4ZIoctkQOM3kOp3V0sP6U2y8/bq49YmOnD4pQgwIThajfej8+j5plWpGlTB+DV9tOh
 BMrClWmCkoY8DQjL8Rd0crX5uc0R1ejDc16rOlSE=
Date: Mon, 5 Oct 2020 11:44:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH v8 5/7] ASoC: qcom: Add support for lpass hdmi driver
Message-ID: <20201005104409.GA5139@sirena.org.uk>
References: <1601447977-18115-1-git-send-email-srivasam@codeaurora.org>
 <1601447977-18115-6-git-send-email-srivasam@codeaurora.org>
 <c94cf74d-03f6-999e-012f-5d9ef2316d61@linaro.org>
 <925e2586-39dd-b1d9-174a-bda3367ab668@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <925e2586-39dd-b1d9-174a-bda3367ab668@codeaurora.org>
X-Cookie: Most of your faults are not your fault.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 rohitkr@codeaurora.org, linux-kernel@vger.kernel.org
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


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 03, 2020 at 05:06:06PM +0530, Srinivasa Rao Mandadapu wrote:
> On 9/30/2020 8:57 PM, Srinivas Kandagatla wrote:

> > I did ask this question in multiple reviews, but never got an answer!
> > Are all the dp/hdmi port register range really volatile!?

> Sorry for incomplete response in last review comment reply.
> With making only specific DMA registers and interrupts registers true, aplay
> was stuck.

> Now we identified issue causing register and made it volatile.
> With that change it seems working fine. After doing all the tests we will
> share v9 series patch.

That sounds like the problem hasn't fully been understood yet and there
might be more going on?

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl96+PkACgkQJNaLcl1U
h9CtFwf9HLMbUICJl61lY3f7S4Lrbw0Ud//67rf9LdOlVvBMsc/lIUthb3aCy4uj
/DLWYw+3RgJtVZk87Z6LTduHcEABfTPEgg0AiIRzE4uFFAT7QmFOKU/m+jynGHka
MEWS2WQ2d+ttBmQImAA4Srrplq9Tx4DhLaSab+j9uVE8to/K/pOcOWt7OrenqPIK
RqySIfB8Q+TYBUJMLk7cIVr4v3AVsb/VC4rroX7+D54eiNGVQWuEO9wFq/P72qEh
GbmKbmpVakl/Ho1IxxNvJ5svxlwDYG7wBFFWodltyDs6OCnLDhDMLc+t0a/KycSs
Ud6mYHX+kMu0GA9mXnNEtcwvjO1nBQ==
=1TAI
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
