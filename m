Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4A7600DA7
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Oct 2022 13:23:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 104E64D00;
	Mon, 17 Oct 2022 13:22:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 104E64D00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666005805;
	bh=MZQG6BQgUGyVO55xGiIpO8RZsUNQRAJ+LYi6S5d7Ie4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=asE9cu6lugHaym78jLEcbwcKdkZsHKCYfPUziFfZy3FoPwbOv/tturrWWSiSi9RCJ
	 s8mBGXj5UQ45QeGcFH1LV31HF0XAWXdnc6VC36UJd7xxSK52PdP3UKR6TMfQCo4vj+
	 wEu2yyTL6TYN5ICftyoWfiianFPpeFvZrQynYX8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B972F80496;
	Mon, 17 Oct 2022 13:22:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7117F8025E; Mon, 17 Oct 2022 13:22:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A904F800E5
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 13:22:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A904F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="COJCTouV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0EF3D60F90;
 Mon, 17 Oct 2022 11:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91712C433D6;
 Mon, 17 Oct 2022 11:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666005737;
 bh=MZQG6BQgUGyVO55xGiIpO8RZsUNQRAJ+LYi6S5d7Ie4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=COJCTouVO12Iav6h7/DWHILNh+gumBjZiY7NQOzglDnu1HNr8c0J/pFWBZDi3JTKf
 uLF6lpuc+XhqAN4SZ17PWkdS26br1mju/4TKyKu5kqfRY2g14kC2pF4V0GSJJIfcJx
 BOzI5SAxHbNsTt+rh8N1YBcPxy4XAcD+pC74Jlv8DhDKj3J6LrNM/4bf90kJRazWoh
 W29t8ljux7fLJvnLIzjCQq65IkeceLymbR+JpboociPRf1h0r3Mitg9/+iVfKYKbZ9
 l3w3Ji6aEE7ywrc87A43ey4N554Y262j9rYxE1hysjB+E3gudCDylnxLFUdfcChL9f
 I0M0jvwQnajyA==
Date: Mon, 17 Oct 2022 12:22:11 +0100
From: Mark Brown <broonie@kernel.org>
To: wangweidong.a@awinic.com
Subject: Re: Reply to review question [PATCH V2 1/2] ASoc:codes:Add Awinic
 AW883XX audio amplifier driver
Message-ID: <Y0064xZzuOJNHcKt@sirena.org.uk>
References: <004301d8e1ff$c0464390$40d2cab0$@awinic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZDfLN49+riSWWnKT"
Content-Disposition: inline
In-Reply-To: <004301d8e1ff$c0464390$40d2cab0$@awinic.com>
X-Cookie: Real Users hate Real Programmers.
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 liweilei@awinic.com, tiwai@suse.com, zhaolei@awinic.com, cy_huang@richtek.com,
 yijiangtao@awinic.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 quic_potturu@quicinc.com
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


--ZDfLN49+riSWWnKT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2022 at 04:09:12PM +0800, wangweidong.a@awinic.com wrote:
> Hi: Mark Brown
>=20
> Thank you for your suggestion. I will fix the problem you raised in the n=
ext
> patch, but there is still a question here and I want to discuss it with y=
ou
>=20
> This is rather too big to go through in one go so the review here is very
> high level but that's probably a good level for initial review here as th=
ere

Please fix your mail client to clearly identify quoted text, as you can
see above it's very dificult for me to tell where you've replied to my
mail.

> > +	if (mute) {
> > +		aw883xx->pstream =3D AW883XX_STREAM_CLOSE;
> > +		cancel_delayed_work_sync(&aw883xx->start_work);
> > +		mutex_lock(&aw883xx->lock);
> > +		aw883xx_device_stop(aw883xx->aw_pa);
> > +		mutex_unlock(&aw883xx->lock);
> > +	} else {
> > +		aw883xx->pstream =3D AW883XX_STREAM_OPEN;
> > +		mutex_lock(&aw883xx->lock);
> > +		aw883xx_start(aw883xx, AW_ASYNC_START);
> > +		aw883xx_hold_dsp_spin_st(&aw883xx->aw_pa->spin_desc);
> > +		mutex_unlock(&aw883xx->lock);
> > +	}
>=20
> This doesn't look like a mute operation, it looks like it's starting and
> stopping the DSP.
>=20
> Answer: This is a mute operation ,aw883xx_device_stop is called in th
> aw883xx_mute function. This function not only executes the mute function
> aw883xx_dev_mute, but also disables dsp and power down. This is for the
> aw883xx chip low power optimization.

Then it's not a mute function, the goal of the mute function is to run
before all the power management code to minimise glitches during power
management.  Just implement the power management via the standard ASoC
power management APIs.

> > +	aw883xx_dev_set_fade_time(ucontrol->value.integer.value[0], true);
> > +
> > +	aw_pr_dbg("step time %ld", ucontrol->value.integer.value[0]);
> > +	return 0;
> > +}
>=20
> If a control write changes a value it should return 1, you should run the
> mixer-test selftest which will identify this and a number of other issues.

tools/testing/selftests/alsa

> Answer: Could you tell me what is mixer-test selftest? I have checked oth=
er
> drivers, and there is no return 1.

Are you *sure* there's none?  Other drivers being buggy isn't a good
reason to introduce more bugs.

--ZDfLN49+riSWWnKT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNNOuIACgkQJNaLcl1U
h9Amggf/Q+vxBFasWvPkbLmn0fnfU/tG7QNmzPSHqKyiuSrJQU6i2P2WYQ6z3YyN
hARhA9LYT7uYfZtyCQhmBQsK5dRukKQcn2RwWffjQBxxeSydBd56jxpHOkRYhzp1
UDdxeRPqd3KlPBHzaR0lz558nS7wkeQAFXFOGOtaVWhMzYX59Lix1b7disOc2Xgk
xTiU9ALtWP6tnO535nTpGF9WoHiEKCXF0xsuN6ovQxzSTn5nRUlkt4YdhCjeRjzf
xNKmUIraYtV5Px/IbryfN36Zb47LKAemm3KeOcmXM761HSWgPCijCE+RsZ2kE6yx
Cd7VkmlkheWixuRpKXfJgODlx6tjVA==
=T3Op
-----END PGP SIGNATURE-----

--ZDfLN49+riSWWnKT--
