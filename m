Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C19663373C8
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 14:25:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5143D17ED;
	Thu, 11 Mar 2021 14:24:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5143D17ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615469113;
	bh=xzwPI5JQtjn9+7GZC/fdahrb74yKvS/0GBNKLNERVog=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JSvM8pMCvqZSnxQvZaIZ3ssu1k7cXURLhw+aX7JviOtsRYjqFeV3OkacQDtm0PGD6
	 +4Tyie9R+HEK3RJ9jO6jxVGGAqBLfBGu6a19QWEb1ohykaAKbinEhmhAczKxceV9cC
	 512vz1bFFdQS6mC5eFWfrRfI95yt2+hBztb3StMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5638AF8025A;
	Thu, 11 Mar 2021 14:24:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD863F80275; Thu, 11 Mar 2021 14:24:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AF21F8019B
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 14:24:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AF21F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P5E69wx4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6BBA64E68;
 Thu, 11 Mar 2021 13:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615469043;
 bh=xzwPI5JQtjn9+7GZC/fdahrb74yKvS/0GBNKLNERVog=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P5E69wx4H/HQaP9IQntG+GLU/dcUn1WinkdK4P6pRqu8cEN8fpco3cIkjgtBLDOE/
 v2eGVExuK3ptdJ4hS8bQGnh8S7frkABUTmn+CMWvwgPHfKqhf0XMT/XEz1N3rLgOYv
 Gt4nasZWfYj8+x6R5Nsqtb+ZNbR2gmhDV257GjHddNwvTFFDwFTfV45oaTnYsAJ6D9
 N296W4Z5vSvP2SD06gyeuWP09bELyjN3XV9jdktBJzbZ4rEHupD9l1cNP05rW/AFqk
 3LlCMK79gO13coX3grZiC/19pPKYsXk03mrEDqj4aQdKdHQa/gAvrlc0ZqFRAM9gDW
 M+Sa3yhHSpWyg==
Date: Thu, 11 Mar 2021 13:22:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: Fix lpass dai ids parse
Message-ID: <20210311132250.GA14183@sirena.org.uk>
References: <20210311081805.20424-1-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <20210311081805.20424-1-srivasam@codeaurora.org>
X-Cookie: innovate, v.:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 rohitkr@codeaurora.org, swboyd@chromium.org, judyhsiao@chromium.org,
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


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 01:48:05PM +0530, Srinivasa Rao Mandadapu wrote:
> The max boundary check while parsing dai ids makes
> sound card registration fail after common up dai ids.
>=20
> Fixes: cd3484f7f1386 (ASoC: dt-bindings: lpass: Fix and common up lpass d=
ai ids)

Commit: 43e2ca64db47 ("ASoC: qcom: lpass-cpu: Fix lpass dai ids parse")
	Fixes tag: Fixes: cd3484f7f1386 (ASoC: dt-bindings: lpass: Fix and common =
up lpass dai ids)
	Has these problem(s):
		- Subject does not match target commit subject
		  Just use
			git log -1 --format=3D'Fixes: %h ("%s")'

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBKGaoACgkQJNaLcl1U
h9Aotwf9H3YJMXqgVqMpFF8abbKcwn2Y9/R0MP/2J5YhR+xupIqDeGHGNC/gOtSS
ROOzaJZacTkOE/sqjGRKMeg+wrqIZYL05zoLNHx9T2tJyy5dibQmQBpmSSkF2z9j
Ad9/7hnDLy+5oTlsz1UV1Iv53b1on49md2+2eY88MSi3wNniqmug2QxzAKh5Sccd
qQ6e41aYPVQBBMABQLVufZ5mMl9KuKxq9r1y24pTTqzcXyPPt0NVOxEsc6hi6H+K
D92+fEs254c11G+sq/U9RRY0/iMAmsRlWFIdvdt3NWoMqHS3lCdpHHH7eGjfXpSr
d/Wz9SkL7LuMRuIMOsXTQ9m1pf32DA==
=+anN
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
