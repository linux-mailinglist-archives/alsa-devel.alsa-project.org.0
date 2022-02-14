Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B71BC4B5377
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 15:39:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F56A1788;
	Mon, 14 Feb 2022 15:38:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F56A1788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644849542;
	bh=7uGTSlji43xblW8vzuNtXrxrIzg7u5IZDnAHQMRFfy0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g6KhHJft+BYou94p8qdQ89auiYJG0lYXrXEBtO2BzzjdN8S4SKax8kxEbOy24FFbu
	 tSquNWC4IdT+CXdC5HOwWS0ZEQpyxxUr5Y8AK6S3XUX0q4+Ia6N3qI6CXqNAIE3g41
	 hbHq+tffckQtvbURIokuRyFx92CXr+ASwVL3bqaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0625F800C0;
	Mon, 14 Feb 2022 15:37:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A2B2F80310; Mon, 14 Feb 2022 15:37:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1C24F800C0
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 15:37:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1C24F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CuBxlbtW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 64610B80E94;
 Mon, 14 Feb 2022 14:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7992DC340EE;
 Mon, 14 Feb 2022 14:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644849464;
 bh=7uGTSlji43xblW8vzuNtXrxrIzg7u5IZDnAHQMRFfy0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CuBxlbtWemgT9gDaejkAssU7jfN57PVaadz8VR1/p+T1VR2mPKt5001xMXDQWXDoC
 db4C2ADVZuMy61WeD1Ur7v6j88sJfYbDQrnv9jfxFCJYbDKpaPIhXBOrg9c6bUyS2q
 3aDzA/Fg9T+sKtdugn5mCUFPNQeEAUNpgVuMOavckr1EZ6cWAigtfRA9JZuFbrDNHI
 HnivbFqYa4cAnV1y78PtHfeXOfcOdYwPiaxjsz3Nddk96zPbgoBRT1vKNf19fT/Gs2
 2qzj/VHdDYD/7LNt1az7uqKiKvDqeNVfKhtgxzAU2V2hZKLqXfo0WDiXE9mNNPyMro
 a2O+CQ4kijoUw==
Date: Mon, 14 Feb 2022 14:37:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v13 07/10] ASoC: qcom: Add support for codec dma driver
Message-ID: <YgppMcVjs0KuE5y8@sirena.org.uk>
References: <1644832778-16064-1-git-send-email-quic_srivasam@quicinc.com>
 <1644832778-16064-2-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ENCpgcVgsVe4ho/f"
Content-Disposition: inline
In-Reply-To: <1644832778-16064-2-git-send-email-quic_srivasam@quicinc.com>
X-Cookie: Am I in GRADUATE SCHOOL yet?
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 rohitkr@codeaurora.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 quic_plai@quicinc.com, judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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


--ENCpgcVgsVe4ho/f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2022 at 03:29:38PM +0530, Srinivasa Rao Mandadapu wrote:
> Upadate lpass cpu and platform driver to support audio over codec dma
> in ADSP bypass use case.

I only have this patch from both v12 and v13, which were sent very close
together.  Please check what's going on here.

--ENCpgcVgsVe4ho/f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIKaTAACgkQJNaLcl1U
h9Cwdwf8CJGx4PtC4wR4ufOx84pwuwbbYynp2DcpVJFjC76NcVBhaEqx19667vck
WsmU8Jp4CNLYKBy05Vg4iKOpEH55eT28aHvN0AmgM3UiYylekQz2Z2gj+4LJ83bS
KFdPwNtMOsAO0sqmvhm3UZTw5kN7vGvyTzUkox1IXyLe+xRvaEDvX6gOYsjPwXo9
v8K/ibp00fXbkeLM7XhPMqfOYUtincOOFKv2naoBer3Uw24NO2xcXV3TYFg7lsNo
Fsc0Z1xxrwkEqBWNm1zT3X3i0hc2ElKbqZvF0GkMVoqPEFH0dGUw4Bfb+EaLyAM6
YtCrzLveyRc73XEAOFVPoz6S4aq+Hg==
=8TpA
-----END PGP SIGNATURE-----

--ENCpgcVgsVe4ho/f--
