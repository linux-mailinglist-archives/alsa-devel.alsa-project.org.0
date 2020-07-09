Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37216219DF9
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 12:36:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C87801614;
	Thu,  9 Jul 2020 12:35:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C87801614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594290999;
	bh=Ve16z8d0/OmeosfL6WB4kROdn8JZr9L6Cq+RoMEYqsc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BitImagD6DJlimQREi98nPL+vpUCYB/Yu55Gk4Lpl+WtCqO3rUbMU8LWegZyfthQF
	 yr+x4Z0A5Qtw9DaYXKHBvEjOP7pcHudQkllzV/Oqyl9t0J9aZdGBgVAzZzEUKjIznW
	 /rAXlR3hm4xKj87oxt/eHGzJBNq07C9bgH2nus3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F10DEF80255;
	Thu,  9 Jul 2020 12:34:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88CA6F80216; Thu,  9 Jul 2020 12:34:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36627F800AE
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 12:34:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36627F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aVwvYBUw"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02AD7206DF;
 Thu,  9 Jul 2020 10:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594290890;
 bh=Ve16z8d0/OmeosfL6WB4kROdn8JZr9L6Cq+RoMEYqsc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aVwvYBUwBUuEW0pkIHTrs9bE3A4h2qeVhqqez6sjtu2k5HzziDf3u5+O3IDo3PWMl
 P60+jIRnglEr37wZtmpDJTj0VQ4BN8AG3boz+joAmCDx943/KIvU+mkDgy17J+lJdB
 0D+MKW4LdlmlWtN9ZR+T7XdnLPKPQD20C+isnMkI=
Date: Thu, 9 Jul 2020 11:34:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Rohit Kumar <rohitkr@codeaurora.org>
Subject: Re: [PATCH v3 6/8] dt-bindings: sound: lpass-cpu: Add sc7180 lpass
 cpu node
Message-ID: <20200709103444.GA4960@sirena.org.uk>
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-7-git-send-email-rohitkr@codeaurora.org>
 <6b6b0e38-9c04-e065-8a43-ccfec260d60c@linaro.org>
 <430e0d24-c5c2-84ec-fe7b-b6b27192666d@codeaurora.org>
 <de07f84b-40bc-d9ae-932d-623a5e8341e2@linaro.org>
 <40ca93fe-5bf0-ace3-4f95-90624d29a409@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
In-Reply-To: <40ca93fe-5bf0-ace3-4f95-90624d29a409@codeaurora.org>
X-Cookie: You will be married within a year.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
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


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2020 at 03:42:38PM +0530, Rohit Kumar wrote:
> On 7/9/2020 3:38 PM, Srinivas Kandagatla wrote:

> > May be reverse the order, Convert to Yaml first and then add sc7180!

> Actually Mark suggested to keep yaml change at the end of patch series as
> there

Right, there's a huge backlog on YAML reviews so they lead to all the
other work getting held up waiting for them.

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8G8sQACgkQJNaLcl1U
h9AnEAf/YHvrShAx1/pj+fdRXz49S71JBPuvSBgRcSqt4qlyV3PrDCkwNro0KXYy
IWTh+2YJGdiJ9yNIvnrKIpIg1g0Lu96uSCKTa+uKHA8obTEFV/ko5+t6KrhJXv6B
6ISMw+pInNBvj7moHWn+px9+JZw6ygIxro9okvk7pCu9PA4nkpHWvCrzNzlwMVna
yElISmNvkpgWsg1eqlpOu78MD37akxzqPm9mrPzrq/ge2ktcM+ivm4qOJmBdnc23
dIES/kgmWtEq6jnuzwZ2cdDn/1FDbKpllkPtj4Q3Ymvz4sGxdlgE8SlyQXrzl/iU
l0vuLU8mntAPLdpRb9s4neWhCYl7cA==
=bZZZ
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
