Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F6E230995
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 14:08:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DCD616A4;
	Tue, 28 Jul 2020 14:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DCD616A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595938131;
	bh=i89zf4KrxMnYTcBcBgNPBorSV2YMDEBMg4rupQdyRL8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TrmcCgMY1T0U5SoDGFwiSqDGO97OfEjjmFP1EDXSyMimNocRtJ49mUL+N11+g42ky
	 UMYj3jBtTe24scc7kDL760oQfh5kUqaX/UftQf9JCYTDi8noGGJziMk/gUGKE+00/c
	 Qg+DGmiaasK6UA9VJONK+3IL10mHQpZRHbHBYccA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98AC2F80254;
	Tue, 28 Jul 2020 14:07:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D54DF80240; Tue, 28 Jul 2020 14:07:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA691F8021C
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 14:07:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA691F8021C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eKgH0oek"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A8C50206D8;
 Tue, 28 Jul 2020 12:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595938038;
 bh=i89zf4KrxMnYTcBcBgNPBorSV2YMDEBMg4rupQdyRL8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eKgH0oek/9Y50A7XqRXtGZQ2NizOut7eUI8p5yAoOEpXYWI0XjTmaNiJmjMfcWQ/k
 +MSyAvroMBPUccgaO1tUqLwGWOewX9YnI4zTNGFnHl0AGFawDFteSLLnn3DHfUvZ6h
 nc4CZYw8XpSE7a7x7ncby8oZ37mpJtekV0ChJfpo=
Date: Tue, 28 Jul 2020 13:07:00 +0100
From: Mark Brown <broonie@kernel.org>
To: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
Subject: Re: [PATCH 3/6] ASoC: amd: SND_SOC_RT5682_I2C does not build rt5682
Message-ID: <20200728120700.GA5055@sirena.org.uk>
References: <20200727145840.25142-1-Vishnuvardhanrao.Ravulapati@amd.com>
 <20200727145840.25142-3-Vishnuvardhanrao.Ravulapati@amd.com>
 <c467e2ee-727d-4bf5-8ceb-90c784245a43@linux.intel.com>
 <20200727160941.GE6275@sirena.org.uk>
 <DM5PR1201MB01393D93D69F1552408BFE79E7730@DM5PR1201MB0139.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline
In-Reply-To: <DM5PR1201MB01393D93D69F1552408BFE79E7730@DM5PR1201MB0139.namprd12.prod.outlook.com>
X-Cookie: Death to all fanatics!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, "Agrawal,
 Akshu" <Akshu.Agrawal@amd.com>
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


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 28, 2020 at 06:59:50AM +0000, RAVULAPATI, VISHNU VARDHAN RAO wrote:

> So Actually for rt5682 codec Now in 5.8 there are three flags :
> SND_SOC_RT5682
> SND_SOC_RT5682_I2C
> SND_SOC_RT5682_SDW

> But till 5.7.8 we have
> SND_SOC_RT5682
> SND_SOC_RT5682_SDW

> So in our design we were using SND_SOC_RT5682 which build snd_soc_rt5682.ko
> Creates the respective codec_dais as defined in that .ko

> If we use SND_SOC_RT5682_I2C we get snd_soc_rt5682_I2c.ko , it is not creating the expected codec_dai links.

Could you be more specific about the way in which "it is not creating
the expected codec_dai links" please?  What are you expecting to happen
and what happens instead?  Do you see any error messages for example?

> As there are three flags defined in codecs, I expect that previous one which we were using(SND_SOC_RT5682) is not a wrong flag and I expect to use
> SND_SOC_RT5682 as it is still available.

Given that the core module does not register with any bus it is
difficult to see how that could possibly work - the core module doesn't
contain a driver at all.  Have you tested this change?

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8gFOMACgkQJNaLcl1U
h9BcBQf/evND4lv/np/6IuxKAr9CDwXqhYJaiRLCi4mRBWhP9tAa96ymV1cks6xu
gLwbaJfqBhYS/hqy1/A382ZnR4exFn7dCuOOwlAG8KSn5IN1K7LLxhghrOpd6rK6
2Lgkn+dS08eyJbJIzMrSPb8t4rHGiN/h8PeXViV+SVI6aYbfmANP8AZWvBCdTAR8
TqjFEUShb8gzGg+vlKeMcfmvJsJilitZYCb4HG6h9QWBvmZJsrNCsdN3MKI93eJw
YCt5YSkDt6C5e+h//rJy1TB++UkHdQ4/KusVOflJ0KGMQTwvwXM5j7RrME056sKu
5HXys5w3c0ZOsPa66tNPGBowUw7SjQ==
=wiz1
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
