Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EFC20B701
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jun 2020 19:28:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 624CD168F;
	Fri, 26 Jun 2020 19:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 624CD168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593192507;
	bh=wUf85Byl/TCWwyzjEZbebtVa7EF6kXDMagDs95ggeVw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Og7i7ZZIosu5ugMYGp3jKSC5/qBolmGV2FfUnl8mCQEzpuqeSeuZ+ly7Fyhg+8V+O
	 XDqlm9RLs3/tG88h8kvchNUCL8WfDx3+F9V/+U5Pjk2lHZ40/xAcLAz0dhMtt10T2l
	 DQWs9YAzHWZt8SpmZrcPeD29vdS9bl9JieXHs76Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CF7AF80096;
	Fri, 26 Jun 2020 19:26:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB3F0F8015B; Fri, 26 Jun 2020 19:26:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 012A2F80137
 for <alsa-devel@alsa-project.org>; Fri, 26 Jun 2020 19:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 012A2F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="shy0mlTf"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47E1B20663;
 Fri, 26 Jun 2020 17:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593192399;
 bh=wUf85Byl/TCWwyzjEZbebtVa7EF6kXDMagDs95ggeVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=shy0mlTf+BRT5yFfhxF95GacKFH+FcRI8/mVD3tshJRpbA0eKFiz7Vb0ULai+afbX
 ILahc5nf1szSRZk7PxiRUC/TsU7gfoIddHvNzbqFwIwsoQaeKhGZPXW8jgFQ7mYRI3
 viCYozq0pp/l2yzAIWbLSWGN/eHO4x9gy6gaasrM=
Date: Fri, 26 Jun 2020 18:26:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 16/17] ASoC: Intel: sdw_max98373: add card_late_probe
 support
Message-ID: <20200626172637.GC31494@sirena.org.uk>
References: <20200625192652.4365-1-pierre-louis.bossart@linux.intel.com>
 <20200626143732.GA34281@sirena.org.uk>
 <2ca5ecb6-8827-458a-4db2-4232818a6841@linux.intel.com>
 <20200626151622.GG5289@sirena.org.uk>
 <b1b812de-b3b2-62fc-9298-1cfd7d0ac839@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5G06lTa6Jq83wMTw"
Content-Disposition: inline
In-Reply-To: <b1b812de-b3b2-62fc-9298-1cfd7d0ac839@linux.intel.com>
X-Cookie: An apple a day makes 365 apples a year.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 randerwang <rander.wang@linux.intel.com>
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


--5G06lTa6Jq83wMTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 26, 2020 at 11:01:30AM -0500, Pierre-Louis Bossart wrote:

> Not sure however if there's a way to recover from this sort of errors. Maybe
> use -in-reply-to=<patch0 id> --nothread ?

Yes, that should do the right thing I think.

--5G06lTa6Jq83wMTw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl72L8wACgkQJNaLcl1U
h9D9Xwf+IC/yp9AZ8KnIQmFyddVMOzO3N9eCYtPzaczvKsnirNMf61XCMnKED8Q7
wPL/QfiOlnP1CgK0Kj/KgEYQCQIy8nxGuWa406JwbKw/e2SBW2bTKx2MWy2ikiER
4jS+U1k8HcTmafRArfJKSaxrl9zWz4O4L4R/gwzkrShijUAJKI2YUKOGgu/s1B9R
Xrru51BCwMb0OlV9pCznl9UpuKmXjdiw8Qq1ghbuBdeOvm0cYyVsJnzqcyN2CXC+
KVDoEkPORET/cPMtlPAq0RlskF8hmGv2gJovi20dPUEvYriTUHxjmhws0HASBxQj
TMApW4JGDrf/jh9Tklvvfq4c22tOKQ==
=bmc0
-----END PGP SIGNATURE-----

--5G06lTa6Jq83wMTw--
