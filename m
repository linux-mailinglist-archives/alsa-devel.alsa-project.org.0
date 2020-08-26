Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEDC25379A
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 20:53:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85BA71794;
	Wed, 26 Aug 2020 20:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85BA71794
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598467994;
	bh=u5YL3gJo1LDspCet5eGX7Njt7Er6sUfOnLpX//R3Dw4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L3LnEvTjTL/oti60gF6dHmk9n302VKUqNvL4q/DXlglyP1izNdy3jxWpMSm30uAtE
	 hKhx6hJneJ2okZSG3gbgFTP2TLO2cJ76OQLV9xQzm2iVQyG2JspwC0bhODmyreZnJn
	 Ppwz3WsvKhWZE5kEo0NHLt906vG9ro27vaVgFYPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5EE4F80299;
	Wed, 26 Aug 2020 20:51:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDA9FF80257; Wed, 26 Aug 2020 20:51:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 556DAF801EC
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 20:51:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 556DAF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EfGk7K67"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFA0C2078A;
 Wed, 26 Aug 2020 18:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598467862;
 bh=u5YL3gJo1LDspCet5eGX7Njt7Er6sUfOnLpX//R3Dw4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EfGk7K677aN6IwTqYE7tb9F83mITA/w9AJAOovwB0DXuAr5s8Rq5/8VtX9bMZz/ez
 gpOCTcQZaZ5oBlwb2Oa/SX1PFhaSz8ClM89zxd7dpX8OuBW98VgdbPJushXJvali2k
 6uV311EW6xENriVa4RS1dQSKQ2AFf769uj1katUs=
Date: Wed, 26 Aug 2020 19:50:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 1/8] ALSA: hda: fix VS_LTRC register name
Message-ID: <20200826185025.GR4965@sirena.org.uk>
References: <20200826184532.1612070-1-ranjani.sridharan@linux.intel.com>
 <20200826184532.1612070-2-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZaW/dtY/7oMe/vLp"
Content-Disposition: inline
In-Reply-To: <20200826184532.1612070-2-ranjani.sridharan@linux.intel.com>
X-Cookie: Should I do my BOBBIE VINTON medley?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--ZaW/dtY/7oMe/vLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 26, 2020 at 11:45:25AM -0700, Ranjani Sridharan wrote:
> It should be called VS_LTRP instead.

Takashi, should I just apply this to the ASoC tree?

--ZaW/dtY/7oMe/vLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9GrvEACgkQJNaLcl1U
h9A+CAf/aFODriub8QIe1/8fJHtuyFRYaWk3VPPzDbubMOgKfb3seDkq9Qbe0dgS
zYkoll8G8GmzvFCfy/znjN4Q7uQVSKSzcmid3obiHceWZuum3fSkMMebHvC3TVUy
B5nek3iw9kDZU10hEYMJWeONU770zExTiXaPYlPMnaBgx35q5Dm7pvHaS+Eebwun
IYZ6OcUbSC5EwAFC958owZ9yx6t1czaskRetNqo7ecgmSTqizlRQYnyJJ10ZuEO4
fBGxOrU5OBLsSVsCsyuKOB1iM47ZeiYbCwm1tzrIYEhHlNgzzySt+InHWwOjB5gd
/etpxoov5xpzTeUlqccO6yLZYr2QTg==
=ozve
-----END PGP SIGNATURE-----

--ZaW/dtY/7oMe/vLp--
