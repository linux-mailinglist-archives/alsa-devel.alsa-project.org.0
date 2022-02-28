Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE854C6E0A
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 14:23:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DEB816D0;
	Mon, 28 Feb 2022 14:22:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DEB816D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646054602;
	bh=z8UlMYS9HM8W4/LUvFSvEhzPSuQv09Li2PxhJIdtSmI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X+CutMkKUNsKkOIQYKiKyqUSZnjow6bavEf8DQARgiAItJzbkMwUxVk1ICvb2vGJp
	 ExC9Ki+W2AabnxGNN18B7/AvaOY+654gMo+NbDmbd9idQvPfjp5bDDRJihyN4XYgVx
	 NYUg7G+cUi6loys/PDREDo7eqGiqtbYlLiIXGZKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4FE5F80154;
	Mon, 28 Feb 2022 14:22:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2AD4F80125; Mon, 28 Feb 2022 14:22:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7371CF80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 14:22:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7371CF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ABw/SJbT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD08F6132A;
 Mon, 28 Feb 2022 13:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8BCC340E7;
 Mon, 28 Feb 2022 13:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646054529;
 bh=z8UlMYS9HM8W4/LUvFSvEhzPSuQv09Li2PxhJIdtSmI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ABw/SJbTYZkDTZYNynoLLjkBDE0rUMGhKDO17cEPPQgsWHHlpRIzeX3LU9Ut+tzWC
 /DRw7Ewhgdo1+rMNp3f2m+v3miQUA8KTgIpT1U47jHLTw6xT2Fi9+Vq7eor6JrttlN
 JJ5lBoxtPhwT9JoMm4i9iSug41Vkxfmw6pC5VETJP/BTifpknYd7dADDbRONgdLHwz
 7YVqR3tvjfSkEJkDGEGLGO9Fa+vLcapS8Gj6DSjrX5OJa2fLmT1u3Yss+BOS/GE8PS
 ssuxrvVE5FHVPt+BQ9Otaz9BxpZM78a5TGkgBAxnX6Fnb8yL8bdSDLjvWpS3esH9p3
 prxgA1Ykku92w==
Date: Mon, 28 Feb 2022 13:22:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH] ASoC: qcom: soundwire: Add support for controlling audio
 CGCR from HLOS
Message-ID: <YhzMeoNW7/OUJrMa@sirena.org.uk>
References: <1646035750-25635-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kK4kZyJyOJ4RsEpU"
Content-Disposition: inline
In-Reply-To: <1646035750-25635-1-git-send-email-quic_srivasam@quicinc.com>
X-Cookie: Killing turkeys causes winter.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, yung-chuan.liao@linux.intel.com,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 rohitkr@codeaurora.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 pierre-louis.bossart@linux.intel.com, quic_plai@quicinc.com,
 sanyog.r.kale@intel.com, judyhsiao@chromium.org,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-kernel@vger.kernel.org
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


--kK4kZyJyOJ4RsEpU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 28, 2022 at 01:39:10PM +0530, Srinivasa Rao Mandadapu wrote:

> +	ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
> +	if (IS_ERR(ctrl->audio_cgcr))
> +		dev_err(dev, "Failed to get audio_cgcr reset required for soundwire-v1.6.0\n");

Doesn't this need a DT binding update?

--kK4kZyJyOJ4RsEpU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIczHkACgkQJNaLcl1U
h9B0DQf/eqHBl2NodP/t4MJrv+UXLGpLCOMpY5mt7kVV4OLYSXYUpD5r/sAB/NmG
Mrl9LHy1D/5nXyG0PiUtkjPMuJBlKJv5eaMV3dUDrXDF6oLot3eEDEpamF9pvPL8
8um8g/HemA7ztGH7HXY1Gi8U5TJmt1IhGC/Bll19zCSyZAA5eH/f6WZ5CNJz+TzL
5gSY0ye5Jsu1ybuQ3rMBs+KJW6+dR/6FeMFZUVY3KM5Dcu6IR25mx7wOcrw26XI/
PupAgyOgXtO2uGAbnYYadNXdL262odddF/+2nrYKkOHi0mGqgxhV27IJM+zTOM+n
/2jzjVSC6xmClBcZ44WRiI14PMP0JA==
=flDI
-----END PGP SIGNATURE-----

--kK4kZyJyOJ4RsEpU--
