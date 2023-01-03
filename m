Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD49265C54A
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 18:45:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F90B29F7;
	Tue,  3 Jan 2023 18:44:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F90B29F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672767931;
	bh=LckIA+Gz2HvlJFTUCOOcP66kxq0hG8yz1WKdpVjE/xw=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XZqA5rev5jDzglZ6sslK3maPnqjzIXVdDhMk27VYZvaeJenqduzimHWl3dypv5K3r
	 6V+gKqOKaVWl2bbxjZKbpdllQk5BXEUgaXKCOO9rDoJ1QRIYKLkx7Gy5p2oatugbzH
	 f9FuNzLGOae3xtrjx8anc0krWt95IC1orchaO2yE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8B1DF804AA;
	Tue,  3 Jan 2023 18:44:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39CC8F803DC; Tue,  3 Jan 2023 18:44:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40CC6F803DC
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 18:44:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40CC6F803DC
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rLEnW9wG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0BCED614AB;
 Tue,  3 Jan 2023 17:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D47C433D2;
 Tue,  3 Jan 2023 17:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672767864;
 bh=LckIA+Gz2HvlJFTUCOOcP66kxq0hG8yz1WKdpVjE/xw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rLEnW9wGp3Z6Q59S+JwrZph3YhZJJVqowPqSQECJuDE53pVqR/Sj0YqQz83zB2pUZ
 ZbkfXfocDWExQhS3inMdUczLRARUe1uRPhv1pTUPdSRnG8TsIAUtUywxr3sr4YHHlw
 lyxc4zcrcw9ngl/94/71H4KNflC5V3CAQIWzX9D+SXYgLoQgLiCtHHyUxMQf5VRkg+
 +U+1wOq7+laGbKtBvXTanpclz8SXgPneLrrqey3/x/j26PvxByRzmp9y321SFi5dz4
 WO5Xt28gURXGYgIhhCFMgvTjhUDWKbDu+Ub6HuavuP8YYAIPK/THmyS1asBEZ+2lNC
 fMf8njjTLVF9w==
Date: Tue, 3 Jan 2023 17:44:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [RFC PATCH 12/14] sound: soc: qcom: qusb6: Ensure PCM format is
 supported by USB audio device
Message-ID: <Y7RpcfWG5yrd6J3X@sirena.org.uk>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-13-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hij50yuqfbUKxTCY"
Content-Disposition: inline
In-Reply-To: <20221223233200.26089-13-quic_wcheng@quicinc.com>
X-Cookie: So many men
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org, bgoswami@quicinc.com,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Thinh.Nguyen@synopsys.com,
 quic_plai@quicinc.com, linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--hij50yuqfbUKxTCY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 23, 2022 at 03:31:58PM -0800, Wesley Cheng wrote:

> Check for if the PCM format is supported during the hw_params callback.  If
> the profile is not supported then the userspace ALSA entity will receive an
> error, and can take further action.

Ideally we'd wire up constraints for this but that gets complicated with
DPCM so it's probably disproportionate effort.  Otherwise other than the
subject lines not using ASoC on this and the previous change I don't
have any issues that other people didn't raise, but then most of the
complication is in the USB bits.

--hij50yuqfbUKxTCY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO0aXAACgkQJNaLcl1U
h9D1xQf+LwgGcwM55I9NHiwQ3ebZ4m7VhjDLgWvKR107h7Duq8GctdogaoB5LvTP
O9xWQH1QhvotKZf1j+Wn0NoYxROayG9QPwht4tIGzQmAhgq72kfiSZ6IiETIW+IP
K58dG61EXGWBLniqpXQNpxnqL1XeW9wHfSwuVOqN1Or0XoOCyjGupDURXP4Uau6z
AJ5cGhqW3cd2xobybkD7asnAvDniZokvV0sreSFRYy4a/vNm4cVe5WRhibUh+S7K
K7akWpFDvsOAobbQvGkEkeCvltQMkZxYbtm6av1vQBI6j7kQ5WXw9G72a2AX8VbR
I8ILJBI6jfDXIjH8Fnc/L23TEnwfPw==
=p0V6
-----END PGP SIGNATURE-----

--hij50yuqfbUKxTCY--
