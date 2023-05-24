Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8843670F442
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 12:31:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEA7E1FA;
	Wed, 24 May 2023 12:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEA7E1FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684924315;
	bh=WEZcHPlDfYf7TtWz9LXQxs+qNwVnCMerNu5/zi8CBAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IUnXXPG6Nc4FDqjukusOz0poiAYtp4IFxGMFNoI0TcWXJNSh4yRS8mkA9wVSlY8R6
	 tMWsb8pAkH1TUNm7UwU7l+1NNlodQ7EfohHCIsdDZoh4LNrG5w4tyYunHaB0M2UJeW
	 PYCWOicv5UqRBfZBoftOLIi4S+KV51uGUl0XwR0c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E197AF80549; Wed, 24 May 2023 12:31:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 633F7F8016A;
	Wed, 24 May 2023 12:31:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 579A5F80249; Wed, 24 May 2023 12:31:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51032F8016A
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 12:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51032F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=D4L9oGHJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EB7D563124;
	Wed, 24 May 2023 10:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7ADC4339B;
	Wed, 24 May 2023 10:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684924250;
	bh=WEZcHPlDfYf7TtWz9LXQxs+qNwVnCMerNu5/zi8CBAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D4L9oGHJHghir4insEGgFs9ibzZsVUeZ4vEQf53PekPNNs28AkELJW9lm2CEVyYux
	 HNJiR3cfNgbsRsCm2P+NwQXfT4dlrca3PEHVdVkBo8uyPmjA4qJAPzrYLVVTwDrPlL
	 BGGa43VwuK8rWKRiFgwn95CKqMi4ursGstH/HwN/o9CKuUSNwO5FT0qZ7DgjEhw3GA
	 s0OAZ9iPsT2nBC9kRRRdG0KG8QrFYu7JQ84Pxu5XAX0DPQ8mgLsiqziLUPCtoQJ0re
	 ZDt8xoKyubueuy0YQyc3e6huSH1yESvim1PUOuYbKEShY4S08D22Mx51Nbs9j/8bvp
	 uY0k/F08iShvw==
Date: Wed, 24 May 2023 11:30:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Zhu Ning <zhuning0077@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	David Yang <yangxiaohua@everest-semi.com>,
	Daniel Drake <drake@endlessm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, kernel@collabora.com
Subject: Re: [PATCH 1/3] ASoC: es8316: Increment max value for ALC Capture
 Target Volume control
Message-ID: <5dbcbf84-602a-44de-ad99-268d4d5b4b2f@sirena.org.uk>
References: <20230524074156.147387-1-cristian.ciocaltea@collabora.com>
 <20230524074156.147387-2-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4CLZw5f0knrgRlGR"
Content-Disposition: inline
In-Reply-To: <20230524074156.147387-2-cristian.ciocaltea@collabora.com>
X-Cookie: You will be divorced within a year.
Message-ID-Hash: ESRUZBUNBTUYMNF627XAOUTIK7DHO7P7
X-Message-ID-Hash: ESRUZBUNBTUYMNF627XAOUTIK7DHO7P7
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ESRUZBUNBTUYMNF627XAOUTIK7DHO7P7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--4CLZw5f0knrgRlGR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 24, 2023 at 10:41:54AM +0300, Cristian Ciocaltea wrote:

> This means that either the hardware default is wrongly set to 0xB
> instead of 0xA, or the specs are incorrect and instead of having the
> range 0xA-0xF mapped to -1.5 dB, the single value 0xA should have been
> mapped to -1.5 dB and the remaining range 0xB-0xF to 0 dB.

> Increment the max value allowed for ALC Capture Target Volume control,
> so that it matches the hardware default.

> -	SOC_SINGLE_TLV("ALC Capture Target Volume", ES8316_ADC_ALC3, 4, 10, 0,
> +	SOC_SINGLE_TLV("ALC Capture Target Volume", ES8316_ADC_ALC3, 4, 11, 0,
>  		       alc_target_tlv),

The description above of what the control does doesn't seem to match
what alc_target_tlv specifies - it is:

  static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(alc_target_tlv, -1650, 150, 0);

which is saying that the value goes from -16.5dB up in steps of 1.5dB
but your description above says that 0-10 map to -1.5dB and other values
are 0dB.

Presumably you can check the effects of changing the value?  It seems
plausible that what's written in the code might be accurate and the
higher values might actually change the gain but it'd be better to
check.

--4CLZw5f0knrgRlGR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRt51IACgkQJNaLcl1U
h9BBFAf+K91gpv3OOpIomfDxOtcWJQeELJ8c/CLvL/L7u9SR7wrJxAXP+x0I6m8V
M/Soju79ZHj9rtO8/vf1Qlawdk7CUvthUzBwUEnIal57dR1m1B/CrPWl0gVtY2t+
r8O/SrCF4LVeIazbzm3hEtwnE+d7oKJV6f1R6r08DfB/Yh3pXoMO7CaqaHIMXYZK
OahYu0IBVvCb4KGrNHTOusU22LoPS2A1N+rTiXhtHM3BY4mt0PKH4PcDsgU8izx2
Hc6IZjLTbatLFHGzyUJbCw1gXreoHIkjEmVO1V+TovEBeu/sSabTiIIILOAJUzj4
OL+XGPHyh9TISGyaSPgSt6f8HcnDQA==
=UXce
-----END PGP SIGNATURE-----

--4CLZw5f0knrgRlGR--
