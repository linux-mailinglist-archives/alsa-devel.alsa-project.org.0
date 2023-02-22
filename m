Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D350D69F4E8
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 13:51:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F7ABEAE;
	Wed, 22 Feb 2023 13:50:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F7ABEAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677070289;
	bh=lXJSnYFpOaH9S5ry7Q34tB4Egx1wpGFAl6NuADLurBM=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uHgxqe6epgPRKN32mSTOMTtFTQh52vdKiyH6+k4H/eneUIUMB1GQPmTpkj9XFLqPd
	 RvdMlMsNp4ivgSoqWQLO8lTbuQDKIP+sYrOV6xWEGUQ+GMRYr9o9cKAM8mqhrCe/9q
	 McRKd9t/HUP4e7FMt/hIXaoYZMwRi49fIojBQKyw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4EA0F8025A;
	Wed, 22 Feb 2023 13:50:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F5CDF80266; Wed, 22 Feb 2023 13:50:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35BC4F800BA
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 13:50:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35BC4F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LFo50uq2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A7F606141C;
	Wed, 22 Feb 2023 12:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2CBDC433D2;
	Wed, 22 Feb 2023 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677070232;
	bh=lXJSnYFpOaH9S5ry7Q34tB4Egx1wpGFAl6NuADLurBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LFo50uq2a2lA9uGWYxtbfavlMVkm3Yw72WJhQ8xxz1mRv6jd9TUTNMIKxGTUysNkr
	 Nb+k0Y2e0731kuVnUNSdhcFr8SgH2tESnmrJMz4MoUT2GiIIpUcWTL4UlSUKj8nza8
	 q5thst7AHxbAJykp867AghZyOOBLmzqb9eyzgr4fLIhilcVBGOO04sckVNohyC+bI9
	 uC8vi0f6X8jbilfirxI6p9QksJ+8VTLFHuRn+oGtnsSuzq/K2Kiojo/UTpmypEemUE
	 ZsgVCUAEnQ/8IGyRxe0mrbXm8CUE5HV2X8yql0QQ7274S66o3maduQP4PZvSGHu7le
	 W4EkztwzvYlHA==
Date: Wed, 22 Feb 2023 12:50:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: wlf,wm8524: Add a property to
 specify power up sequency time
Message-ID: <Y/YPkgOreByREmOz@sirena.org.uk>
References: <20230222113945.3390672-1-chancel.liu@nxp.com>
 <20230222113945.3390672-2-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pnbOLaS+zEft1evo"
Content-Disposition: inline
In-Reply-To: <20230222113945.3390672-2-chancel.liu@nxp.com>
X-Cookie: My LESLIE GORE record is BROKEN ...
Message-ID-Hash: UBSK6VASSAUGUPJYWPITDANXQGH2RKPA
X-Message-ID-Hash: UBSK6VASSAUGUPJYWPITDANXQGH2RKPA
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UBSK6VASSAUGUPJYWPITDANXQGH2RKPA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--pnbOLaS+zEft1evo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 22, 2023 at 07:39:43PM +0800, Chancel Liu wrote:
> This property specifies power up to audio out time. It's necessary
> beacause this device has to wait some time before ready to output audio
> after MCLK, BCLK and MUTE=1 are enabled. For more details about the
> timing constraints, please refer to WTN0302 on
> https://www.cirrus.com/products/wm8524/

According to that the delay is a property of MCLK and the sample rate
rather than a per board constant, it shouldn't be in DT but rather the
driver should figure out the required delay on each startup.

--pnbOLaS+zEft1evo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP2D5EACgkQJNaLcl1U
h9CbBwf+PFUPJ7J2/dmJK6wM+TWjfAtu4keu+9j+lOKo3Pnkd/BlCPx73MZ+DWsZ
9HspBYBZ5wWZLV4CJMusG+v9Th9nB5ojpBW5hLHVlml9+IfdIm3zE9gm72M8pRZa
xP8/dlMRVOwZgA0BO3xsncSJ+2N/WBHEA0A74LUYJlpSMYdSwi0LlFBF/6CilAm+
CzpVBYBJj0/8SgfMv02kV/3BYRepWg/U2BhDJr++vWMs/ELAGs4P+UK95IEDT3ca
Ueu333LU0a2J09wYLIy9UpY9UFZGpKnFTmreetXFBPySKtHUWhgzjtVGvXE+AiRS
fcC4ecoxVBYJmBgSyvhxLef+uHMgFQ==
=HX3c
-----END PGP SIGNATURE-----

--pnbOLaS+zEft1evo--
