Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D3A157C5C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 14:36:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5E58166F;
	Mon, 10 Feb 2020 14:36:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5E58166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581341814;
	bh=0vvTOrgkb4CfDUhKpiNR82Fl9pO1Shy18Jsge4ZAMSc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KS3pn3siBbpqxbTNpYtGJH5qwhkFwH8yJFqRmfTDMapbHg8HnpWczLGEbbdhuEd+3
	 jdWISUIziXEhqhZhXlr7Di69/Gxh0nB4vnzftiH1uxJ6eitcqRcM9sp6Wro0XVLXdI
	 tlF+2zTjRF44XK68FQ6nwlwE4k1Qzfe1tGZqq/fc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45D97F80228;
	Mon, 10 Feb 2020 14:35:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55AEDF8020B; Mon, 10 Feb 2020 14:35:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 0CE45F8014F
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 14:35:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CE45F8014F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D43951FB;
 Mon, 10 Feb 2020 05:35:49 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A2A63F68E;
 Mon, 10 Feb 2020 05:35:49 -0800 (PST)
Date: Mon, 10 Feb 2020 13:35:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Adam Serbinski <adam@serbinski.com>
Message-ID: <20200210133547.GI7685@sirena.org.uk>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-7-adam@serbinski.com>
MIME-Version: 1.0
In-Reply-To: <20200209154748.3015-7-adam@serbinski.com>
X-Cookie: Avoid gunfire in the bathroom tonight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 6/8] ASoC: qcom/common: Use
 snd-soc-dummy-dai when codec is not specified
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
Content-Type: multipart/mixed; boundary="===============6399594118694723536=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6399594118694723536==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="16qp2B0xu0fRvRD7"
Content-Disposition: inline


--16qp2B0xu0fRvRD7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 09, 2020 at 10:47:46AM -0500, Adam Serbinski wrote:

> When not specifying a codec, use snd-soc-dummy-dai. This supports
> the case where a fixed configuration codec is attached, such as
> bluetooth hfp.

Fixed configuration devices should still have normal drivers that say
what those fixed configurations are.

--16qp2B0xu0fRvRD7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5BXDMACgkQJNaLcl1U
h9CYzgf8DU6Fw+qDimV4Ug1WnuJrwfbSYr1FZoSZ7Cghuqu1iivMC1eRDp2KmIsO
OrabAfutm8A+HH6/daaPn0JePCU+/Z/q2MiCJCsf6Kp6yqLcia2N4qfamVOaoZw0
7TtETvXhLQ5zSqQkV8kqfRlYsyMesAtSD6rGrNBo9nY5ZFh5iJ0dvVCMvwOic/oX
PMIaJ0ih4lvq3CnuGdP/agOdlC+UvqKmrU10Z1lgKxHrWQxynjjRD0ktIoNygZQx
RO6T1jVY3wqz4Y59OL0xJaIHECc7Yx05EBwFoBaCr25Zgci0jjbb2RlfHVHazlo3
gXUz3ap0UdkUw8fp2dxJRiL45BQVyA==
=+Q3I
-----END PGP SIGNATURE-----

--16qp2B0xu0fRvRD7--

--===============6399594118694723536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6399594118694723536==--
