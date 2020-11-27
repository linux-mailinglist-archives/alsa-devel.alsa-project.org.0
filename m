Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2630C2C65CE
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 13:41:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4C6B184B;
	Fri, 27 Nov 2020 13:40:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4C6B184B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606480863;
	bh=uitY12qTzJ6CCv8Sff1HVoEyGCJ5WaJc3uh+EFJw428=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XozPHF9QAvgiClZepO4JUUT48AfAtMYRFb7fgK3tjfFnZfC7hsK5nTsPBxg0T+gQf
	 BzJBX5ibshgi8XZxs87+39k/+ewzlFA1ZMslHJFs+C7aIak+G/qYnM53KnRO2d0hmf
	 k+UOobSYeqaueHFXPY5cMpZtHNFXYZA/RVjACe4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 413CDF8019D;
	Fri, 27 Nov 2020 13:39:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1135EF8019D; Fri, 27 Nov 2020 13:39:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98362F8015A
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 13:39:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98362F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kjFojvRH"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2A0322240;
 Fri, 27 Nov 2020 12:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606480762;
 bh=uitY12qTzJ6CCv8Sff1HVoEyGCJ5WaJc3uh+EFJw428=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kjFojvRH5W2864LJMjgV8LXoFhjHdTqCBxc64tYibo7aT9tPtIENd2Ja4CWpa4a4W
 IPG0FUzwTPM9bFCAUIVq7rWxHoBH8l3UVC2DTZlBPfvdy/KptFKTB/tbqlBE6RuV4h
 xaa6D5AHgV65Ab1gaN4BSiafN5cRy5AsZCzVEGbE=
Date: Fri, 27 Nov 2020 12:38:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH] Asoc: qcom: Fix for problem in resume with CRAS
Message-ID: <20201127123856.GA4845@sirena.org.uk>
References: <1606450323-21641-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
In-Reply-To: <1606450323-21641-1-git-send-email-srivasam@codeaurora.org>
X-Cookie: All work and no pay makes a housewife.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org, srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
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


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 27, 2020 at 09:42:03AM +0530, Srinivasa Rao Mandadapu wrote:
> To support playback continuation after resume problem in chrome
> audio server:
> Prepare device in  platform trigger callback.
> Make I2s and DMA control registers as non volatile.

What is the actual issue this is fixing?

As I have previously said please submit patches using subject lines
reflecting the style for the subsystem, this makes it easier for people
to identify relevant patches.  Look at what existing commits in the area
you're changing are doing and make sure your subject lines visually
resemble what they're doing.  There's no need to resubmit to fix this
alone.

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/A82AACgkQJNaLcl1U
h9A/7Qf/c6x/s5ZWRfoB7c+m1pakjVu2TQcvsEdS0xLz2/SldOq2hhGP0dW6gXca
4brb3HK8lDaIwnlbk3N27mGDUObmzte/41ZJ/Gx0HNIqN8oU7dEgO+AEU+XJ+bnO
cFBy1NhWu2ZnC33hkVxeyJSzDg0hT2pTE+rOoCRog0cgWXlsGfQW/OJONyTdVfeX
g+LnVrLafbO4ERJRlYICy1Ibj8ongorQVPPGU3OoB1fq4cMXvO18NMi7pg/dFH/q
YqzP2l5jrH+jiugbzniHHcvnkqVFta8BfKcxZqeXfDKT6Cv3vtT6c/k++/Guzq0V
J67riGm4jZB7+pEneGlM4ZSQr/mmng==
=YJfA
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
