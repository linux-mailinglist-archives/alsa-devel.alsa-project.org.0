Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E02D64F939F
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 13:18:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60B9E18F6;
	Fri,  8 Apr 2022 13:17:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60B9E18F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649416690;
	bh=XjK6FPW7Vc8NpPd20O6mbJ9q6qAq8yXw2kBKcolbZJk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KX5yK2Iug4PiVEPX9qTZ05ftxfnCQpcBwc2NlDWsofAXkRBFl2XGAOxIu+fUXMIK7
	 XMlDrdEVAmFq3mafor+Z//xxet9NrIqcCRTUoF3862j7iHJChp4OBnnv7SB5lNRSOw
	 44eG+qU/nXYHULNqfYTfah0bx0LaIJFSUOB9QAFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D75C1F80311;
	Fri,  8 Apr 2022 13:17:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA808F80311; Fri,  8 Apr 2022 13:17:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C7BBF80128
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 13:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C7BBF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QuCxh3M/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5349BB82A26;
 Fri,  8 Apr 2022 11:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFF5C385A3;
 Fri,  8 Apr 2022 11:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649416622;
 bh=XjK6FPW7Vc8NpPd20O6mbJ9q6qAq8yXw2kBKcolbZJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QuCxh3M/xC87SmDX834tHwuwAnd9hwPduk15Afq4eCgQJ8SjB6M5AIdac6GEo2ppG
 TZ569RXr/+DO2NqC44USCtxZKZCpksM73vhVd7JcenKqwQ1lxOMiq/IKy+fUm+9/14
 aV8Q7G+pb3xlgQDwY8uiNgEdw1BT8LSXQWtWxK/B2KK2ySxBZuPt4rNsXzI28iXE8X
 efpIGn2sRhnppoUTVNH6vm+exiW/TXbNfn9mXSCEfdA6AqjE0cMu3AaIOGUUrkLl+Z
 2ALpOZY2tsJBgjTShog87s7NfFLucoIOXyWxTcEbw5ZVYApdn+MmyDA7YYL+dAy4Qw
 yEwmzvnQRNXVw==
Date: Fri, 8 Apr 2022 12:16:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 00/14] ASoC: Intel: avs: Topology and path management
Message-ID: <YlAZqC4TQTn2xYRY@sirena.org.uk>
References: <20220331135246.993089-1-cezary.rojewski@intel.com>
 <6d7a64b4-9b5f-2fc9-e53b-603cdda6cecf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="M7vTjtv3RgO4IF9L"
Content-Disposition: inline
In-Reply-To: <6d7a64b4-9b5f-2fc9-e53b-603cdda6cecf@intel.com>
X-Cookie: Look ere ye leap.
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 rad@semihalf.com, pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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


--M7vTjtv3RgO4IF9L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 08, 2022 at 12:54:11PM +0200, Cezary Rojewski wrote:

> Should I resend this one? Would like to move forward with the follow up
> series so the skylake-driver can be finally replaced :)

No need to resend but let's wait a bit more in case there's some review
comments from people.

--M7vTjtv3RgO4IF9L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJQGacACgkQJNaLcl1U
h9Daegf/baKpqbr8ML4CG+h4B1SA0lmtmxyECr1AfEOXxf+/hBd1dIHJZlW7pniT
yEogrFvAGvP5CH3rCWkfyRURyMroufXswS/1jp2lFE0bohfNap+VB16fNfFJTegM
loqt9KzROkLjd2F8O7HQZEIayYWo65QnDWHmjPBbudNTR3uaWT4m2duxx3HmQpV0
2Rkew1MCCnwnE7Mii/YUd2esicwzk7QoseMIKr8ngURyFVyUiPRM0v3wJ1Y7Na43
3g2S0uUCp14Q44stLKEzlhC1vPVxdoVzRCVaASK/01iRVa3L/bA02tDuSNqvWWDr
G+lxBhVqq/WGZZJ5QP6T7KEu1JfPKg==
=DjVe
-----END PGP SIGNATURE-----

--M7vTjtv3RgO4IF9L--
