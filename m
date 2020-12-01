Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6762CA65A
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 15:55:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FF2917CB;
	Tue,  1 Dec 2020 15:54:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FF2917CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606834533;
	bh=qf7aGX9gVYdAZTqguqoDkQAl8piUxDoOcWMwnRZ1JdI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hbEyrsCt0ZTxtoNflW/knzvaLnNz3jTnRaSqiSoMkKENANNeM0U+f0IS+pNU3Y/mS
	 WaTcy/eDJ/NbYr7mVSvDeQ0vjiRO2sEEiUyh3BA8cPYHmtVZei3jleklpY3v5Ppyud
	 89sO92cYdRhFcCLhIhCHabVUTDIi1wfbQfSxgIs4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5598BF8016D;
	Tue,  1 Dec 2020 15:53:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FCB1F8016C; Tue,  1 Dec 2020 15:53:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2192FF80139
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 15:53:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2192FF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Pyz5H9tj"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 682D92084C;
 Tue,  1 Dec 2020 14:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606834431;
 bh=qf7aGX9gVYdAZTqguqoDkQAl8piUxDoOcWMwnRZ1JdI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pyz5H9tjiwtuE3hMxgjaeQpKseUdVdTuM07OYBL6nE2M2bwxe4Z4tp2p22rwlQruI
 bhsk0B3Yc9mbZyXZlwEDtIb0DWBFYlw8qDXFyONC/AJe8dGgh4s8j7VL9GzfNDMdH9
 OKVYO15xSUIUNsxJsurjMSxttEOFY1wqOpYMVAZg=
Date: Tue, 1 Dec 2020 14:53:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 0/5] regmap/SoundWire/ASoC: Add SoundWire SDCA support
Message-ID: <20201201145322.GG5239@sirena.org.uk>
References: <20201130144020.19757-1-yung-chuan.liao@linux.intel.com>
 <DM6PR11MB4074311B4E0B70F24383E754FFF40@DM6PR11MB4074.namprd11.prod.outlook.com>
 <20201201041138.GY8403@vkoul-mobl>
 <e9478e45-2a24-05f9-eb56-5905d54ab6a4@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="E69HUUNAyIJqGpVn"
Content-Disposition: inline
In-Reply-To: <e9478e45-2a24-05f9-eb56-5905d54ab6a4@linux.intel.com>
X-Cookie: Who was that masked man?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 Vinod Koul <vkoul@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "jank@cadence.com" <jank@cadence.com>, "Kale,
 Sanyog R" <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "rander.wang@linux.intel.com" <rander.wang@linux.intel.com>, "Liao,
 Bard" <bard.liao@intel.com>
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


--E69HUUNAyIJqGpVn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 01, 2020 at 08:35:42AM -0600, Pierre-Louis Bossart wrote:
> On 11/30/20 10:11 PM, Vinod Koul wrote:

> > I see Mark has already applied 1-3 ..

> Sorry, I thought Mark had reversed the entire series.

Yeah, I just backed out the one change for the driver.

> Vinod, would you mind providing a tag for Mark then? The following commit is
> needed to compile:

> b7cab9be7c161 ('soundwire: SDCA: detect sdca_cascade interrupt')

That'd work, looks like there's only one fix patch it's based off.

--E69HUUNAyIJqGpVn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/GWOEACgkQJNaLcl1U
h9B0Igf9Fzb38TLz0RVIqHyT/CX9u1t8YCBFEH1IJgAGjAkq8z49rjYj49kYtcsW
4QD5eUeFKMmggnVdL4uQLdK5TYkHy3kX+sqn5ajxOFP2fKU5noEDJLMxRCNSoyxX
UhyghvlIObK/EV3B3G20CSBvCCGIMGCIMsEtLCjT9GQ0htvVUgRAATbxCaDXXtT1
UXg6CmASMQfbbnyTJYBy5aphdgPQHujuUWtswz9hR39VyWaGTg6Di4GHoVKFFD3u
HNAbuR9st/tmPx25aGs6bKup1IPh6M9yvQ2I/gJV/44Sh0g/SSvff3HyHx2va0rV
8s6QiPs1PLCwbaB/eLWfW5fs/+1rTw==
=87Ur
-----END PGP SIGNATURE-----

--E69HUUNAyIJqGpVn--
