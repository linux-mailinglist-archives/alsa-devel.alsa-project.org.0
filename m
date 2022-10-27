Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9469260F93A
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 15:37:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 366412F88;
	Thu, 27 Oct 2022 15:36:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 366412F88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666877852;
	bh=fcD3i38tih/t450LyEv0RqQmZcGH/IRBhD3dzjW7Ntc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b4+ypWoMIQw4GRuDKjzCrrSP5bvhKi2tIt8hGaF7F4BVZ2vW/tSfHeNCLzwyFfTzp
	 7twzKsIyuzKswd4YUOrONXgm8ODCTQtS5pTHwhxXCW8kVUnc4Si+fXqntMeVBcM8Jk
	 Ko7tFPlur+qE1gGAa+LxznrYTvZ69qZAjGhCcBVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A573BF80095;
	Thu, 27 Oct 2022 15:36:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07B59F8025E; Thu, 27 Oct 2022 15:36:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3B08F8016C
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 15:36:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3B08F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p2dD10/n"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D12B6B82562;
 Thu, 27 Oct 2022 13:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5E3C433D7;
 Thu, 27 Oct 2022 13:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666877791;
 bh=fcD3i38tih/t450LyEv0RqQmZcGH/IRBhD3dzjW7Ntc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p2dD10/n12DRMFyjak+v7jZXOk9zlkcHhT5zkKeAvSDmH4ZNifqdEJowSy4MfCt0R
 +R+qYpZtqVX/LIswpRVepyUp3RNVGFAFuQhHljbBupOFwyludIvqvi6lJ0xnJ225r9
 /zxrKcUw0JG/BX86NeaQ8R5yWoJnWQeHqvJZOQh274ijer8NDA6JIQuCw9qjb45v6p
 LwUZ4zKsKZYf/F/YetfAkco8c+deTpKiXAkkxAwbw62CnTsTB0wy4LHfitNlaEluG/
 GNa0oVV2sc16a/PKbNS0p7TyIPdmAYz1x39DPinXHpqX+pN2l9Sht/I00ngRReQySz
 0S7sXqIps/fEQ==
Date: Thu, 27 Oct 2022 14:36:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/2] ASoC: Intel: sof_rt5682: quirk auto detection
Message-ID: <Y1qJWDXishQ0pWkM@sirena.org.uk>
References: <20221026071409.3235144-1-brent.lu@intel.com>
 <20221026071409.3235144-3-brent.lu@intel.com>
 <6916c126-c710-330a-ffcd-50dd3cdc47d3@linux.intel.com>
 <CY5PR11MB6257D168A60B712088BC7CF797339@CY5PR11MB6257.namprd11.prod.outlook.com>
 <bba5dc19-c0c4-2409-6cd2-c8fa91950444@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aSBYaSpkfMbKyRhv"
Content-Disposition: inline
In-Reply-To: <bba5dc19-c0c4-2409-6cd2-c8fa91950444@linux.intel.com>
X-Cookie: Forgive and forget.
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, "Song,
 Gongjun" <gongjun.song@intel.com>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Chiang,
 Mac" <mac.chiang@intel.com>, "Wang, Rander" <rander.wang@intel.com>, "C,
 Balamurugan" <balamurugan.c@intel.com>, Chao Song <chao.song@linux.intel.com>,
 "Reddy, Muralidhar" <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ajye Huang <ajye.huang@gmail.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 "Lu, Brent" <brent.lu@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhi,
 Yong" <yong.zhi@intel.com>
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


--aSBYaSpkfMbKyRhv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 26, 2022 at 08:30:00PM -0500, Pierre-Louis Bossart wrote:
> On 10/26/22 19:13, Lu, Brent wrote:

> > I'm thinking about using kernel module parameters for those boards which do not
> > use default SSP port allocation. Not sure it's doable for machine driver module.

> That's not a working solution IMHO, the kernel parameters should be used
> by expert developers only for specific and short-term debug. It's not
> possible to add a dependency on kernel parameters, that would prevent a
> kernel update.

Right, and it really doesn't work for distributions.

--aSBYaSpkfMbKyRhv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNaiVcACgkQJNaLcl1U
h9CpWAf9EuU66Nkj3rIR3UHKpodUXBtYkdKdRpjY+l4zDJeggtk6ReDLj3r8Ea/+
JpKpstTYUlLNorsKoXY6E7N396S8hk+JVGJus+V4Xmea5OFBVQfTu41ueUTkDNBT
r0d/QSs9l/UGm++YNyWOIgVoftSLfbFwsqqFPw0opUM3ImbB4CDft52x0Mm6StHQ
riUAV2y+uXmzMK+oE+w8QyegxHttJXkjHcFcM0ok5iAoA7g7bezVVFEE1ndw/T1M
1HxIMVnKbI4xGcaI6w33rguriufF4mATS0lao/vejizB7OUybHtW9gaQfA73xKDA
IQMq7EDowX6yJuFM6BLon8N+QfLQaw==
=spCX
-----END PGP SIGNATURE-----

--aSBYaSpkfMbKyRhv--
