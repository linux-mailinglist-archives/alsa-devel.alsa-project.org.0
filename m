Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDD7454901
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 15:40:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0310F1920;
	Wed, 17 Nov 2021 15:39:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0310F1920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637160007;
	bh=+sgGk1MAqqjZjV0T3zcDclmfwLLAWkR2iTA/ErTNlhw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d0xyJmmG33iAsVk6JoHrEyEYkmrCjGGYrRzpz41mDrCGwlkN4paGfhIXtXp4mnVND
	 PWppQzVSykyVkAzebNdllUG9Lc6Kr038fLQPCrpMVFjbiEonmL0xiJ5JULrkgRr6Kd
	 GA9BtQDEi7FHpAeA+bfHSbG1+ZC30SQcQpAYC+sQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CB2CF8020D;
	Wed, 17 Nov 2021 15:38:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FF12F8027D; Wed, 17 Nov 2021 15:38:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB15EF800FA
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 15:38:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB15EF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PgwUzmkV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EE5F613AD;
 Wed, 17 Nov 2021 14:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637159918;
 bh=+sgGk1MAqqjZjV0T3zcDclmfwLLAWkR2iTA/ErTNlhw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PgwUzmkVZnENX4tzSGFGDooaLrt5/UkyuxtbbZXKzWKo0sUbrnrJzzrJ9Gd7QmKQP
 J129HARnzukITzYfC79D7Kuf8LbMnjS2nm0f9rsxsfD5Szute22lWsgJqtZq3hh/Rx
 F+y9eIdpft/DFkGuuWwQ+TQ+LE2RUvVCfB9FFcfpp/9TrQb6QsBxv+u5btwPZPZSAJ
 CO7fJ6p6e0bIViBkz718wSTe8opN/sktvEjJ4+n8pZDLwx+oJi/oJjS8uieXdCPpHy
 t/AcawvxRT1ni+2IXBPMwF6tkr0OC45aYaivlXSIdUoXx7y+gWOAXKjg44x9dw2Qbd
 RdgkJlrGqJMnQ==
Date: Wed, 17 Nov 2021 14:38:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH v4 00/10] Add support for audio on SC7280 based targets
Message-ID: <YZUT6BQKz00jXov9@sirena.org.uk>
References: <1635838265-27346-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eAN7bUExa5adGLjm"
Content-Disposition: inline
In-Reply-To: <1635838265-27346-1-git-send-email-srivasam@codeaurora.org>
X-Cookie: One Bell System - it sometimes works.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, rohitkr@codeaurora.org,
 swboyd@chromium.org, judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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


--eAN7bUExa5adGLjm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 02, 2021 at 01:00:55PM +0530, Srinivasa Rao Mandadapu wrote:

> This patch set depends on:
> 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=570161
> 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=572615
> 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=559677

None of those links seem to show any patches (or errors)?

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--eAN7bUExa5adGLjm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGVE+cACgkQJNaLcl1U
h9As+wf7B+JAOPsfgU0nEW7ON59XP8K/aBZrQ0SjOCL5GE5Azb4/+FDOytGgwgae
HW9ZIlOn+bYqo4VUVSwVoEdL91UnVUBxdTPrHS5pu5ZtT+wa7xYMGKHlQnxv5t80
DUoPNFuQydEa0N51Xq13gUgvhrxnY9iFRx995WKowjXx51glDSuaT0+l4MhZbl29
2ZzgTGyKOJSO3PgjSajop8/zWrOrKfOeSgPpA+NJxZU6HPhjfyEFozTKEieUbjHO
/Ac2XgsD8whOKg/2FC4uycI2txWFGLGP+vuIMqeB/oNEcrVLzQN1eWFWO1YNLwXA
IsonKPo/U83HY4hEFtapz0na0ScuUg==
=NHdC
-----END PGP SIGNATURE-----

--eAN7bUExa5adGLjm--
