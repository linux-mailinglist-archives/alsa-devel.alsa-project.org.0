Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B61715BF3
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 12:37:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C5506C1;
	Tue, 30 May 2023 12:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C5506C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685443074;
	bh=wkrQ3IlIK4yNRUmaBcT1vxCto+8cJmP60mSI1vVDM/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i18XwZ4EGgZugaGznt+dstoXC2tI52CpvnQOk/vJAPRHRuoMHLQAhHL+HT1d8Sjvd
	 rtUN8VHilH4NTJ+5bFNrglrdSg8hxa9e09+Fc/HIjdEjw+2yemtBQU1cD04cKISuV0
	 VQQob4mWo3lg1OQk2XvozxM+g4+H24V8xEcd/1CA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBB8DF80542; Tue, 30 May 2023 12:36:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C896F8026A;
	Tue, 30 May 2023 12:36:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E6BBF8042F; Tue, 30 May 2023 12:36:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99934F8016B
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 12:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99934F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=j9ePu7KH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 56B8E6215D;
	Tue, 30 May 2023 10:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19424C433D2;
	Tue, 30 May 2023 10:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685442980;
	bh=wkrQ3IlIK4yNRUmaBcT1vxCto+8cJmP60mSI1vVDM/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j9ePu7KHUDodU/8sSY0XQDmDhk1U9eWdjASPU8JNScHV2LXbnntOZCuFTrKUbM3/M
	 7O1GzSORNt6yYTUFodm+YzqGjpet7giH9Cc/TqWgELrtLgqikz6Cm7tFbgzCk76oHu
	 xGtu0uFfZ4N8E4wYpOLK8lsYFpIpK4xorEqspievHUlqfRf55jO7fa+/BnXmVA9LjN
	 /MxG4x4cm8XgJwftzUkWWzwFCd5n4EJreHCaI33j7F8uw/2ItUeFUGytQ5y8M8Zuv8
	 fpn5Z3vJO7WYnmJxM22ZuZs9rQ82ZcOvJ9tOr+aLp3u9pyNS+/GE4pfMkEJ8Vet8wt
	 vuwO2cZk5VJ2Q==
Date: Tue, 30 May 2023 11:36:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, rander.wang@intel.com
Subject: Re: [PATCH 0/3] ASoC: SOF: Intel: mtl: Enable multicore support
Message-ID: <2fe23257-3e81-40e6-9ecb-99951e15d5d6@sirena.org.uk>
References: <20230523103217.20412-1-peter.ujfalusi@linux.intel.com>
 <168487142215.278276.6191766858062306959.b4-ty@kernel.org>
 <145987ea-0706-9bca-dc75-803a0625a8a2@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="trau4cy7XZ4hmSMw"
Content-Disposition: inline
In-Reply-To: <145987ea-0706-9bca-dc75-803a0625a8a2@linux.intel.com>
X-Cookie: I've read SEVEN MILLION books!!
Message-ID-Hash: FSQDUNXZZPU2AZCT6SC5VCVAQA5IERBE
X-Message-ID-Hash: FSQDUNXZZPU2AZCT6SC5VCVAQA5IERBE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FSQDUNXZZPU2AZCT6SC5VCVAQA5IERBE/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--trau4cy7XZ4hmSMw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 26, 2023 at 03:50:49PM -0500, Pierre-Louis Bossart wrote:

> Looks like patch1 was not applied:

> [PATCH 1/3] ASoC: SOF: Intel: mtl: setup primary core info on MeteorLake
> platform

> was there anything wrong with it or is this a b4/script issue?

> Please let us know if we need to resend it or modify it.

I imagine it ended up looking like it was already applied, please
resend.

--trau4cy7XZ4hmSMw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR10Z4ACgkQJNaLcl1U
h9DaSggAhMzRdD0X+sLAOwv2sRGtrjeV+ANKqa5PXWAI9cTDYOc7V9fzjJsVWuwE
jce/PLDxoxYYBzeCPGhdDUgbfb/tFM71WIr9EiH3IH8obs6oRGF0A0Tfxt0K22p2
DWEC6xTO1w8OpOeNBTPWjdkqKTpk1nouwMceA0GqyO1fYPxcP6YZGEz4KKIiwx/j
agWD37CltAX2laLLcJ/+BLR8Ip0JZ53o6vFEN/vNoJnXqGRU+V0MhudB6C7YWc8g
FvXaQxDvqYs5BOXLI0ntPi/YwYbfyhEc0Y4oBVeI2q6JwQ+Pc4wBZPQvArSYndEI
DJ2SsbDQjCn6T7+Bfh4x2GY18NhB+Q==
=tqVy
-----END PGP SIGNATURE-----

--trau4cy7XZ4hmSMw--
