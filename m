Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8297B074E
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Sep 2023 16:51:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 977DB1F4;
	Wed, 27 Sep 2023 16:50:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 977DB1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695826271;
	bh=S3t6WfkBtrlDPyuQRQNCERHweGiWYZNq6In/oIlqkrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RIuk+VvzFVvam8yrIyyVBjW+Y96g2iGystpxeI29DPPa57oMr5U/uLMNiF/socY3j
	 5bFanUboAgel6t5BDDiB8KljFOWiESlI+yasi+0F4AZ7cE/nTJcccwBfY3bPM07yo+
	 zJXMf6rUoSUQEGbMN9LM131Hv7A6uigICRj49BTM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5ACE1F80552; Wed, 27 Sep 2023 16:50:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5E64F8016A;
	Wed, 27 Sep 2023 16:50:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81010F8016A; Wed, 27 Sep 2023 16:50:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAE72F800AA
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 16:50:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAE72F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Xqxl9Ytf
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 95E3A6157E;
	Wed, 27 Sep 2023 14:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43D4C433C7;
	Wed, 27 Sep 2023 14:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695826212;
	bh=S3t6WfkBtrlDPyuQRQNCERHweGiWYZNq6In/oIlqkrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xqxl9YtfF6gBWEWkIBqKeC00ViFsurxit8aICZyKBgxLkzQoi3sNactgDQgsQQnLv
	 M/g88sOmrJaThi22O6njdm/mYIzheuoxffYc0hYtqL7HMoLB+8XJ9kSLofzNbW8/Oe
	 TycmM4/lWZKFT1/C64CKzRK8G1w/Yr1mjU/BZi3Rj8QECEh+FQ/NTHxeFVnxwpK2E2
	 j6cmNrD0z6R/jlTDbqOSGXX09wxZeq9QU+3IGq6ehOSy+sFAPa9EJ5W9VRJCK3QTFg
	 iuxAe4AmbO4cZA/iEEAacM4CnYJ8D/q9UsycbydPntdakXXnAP+rERnjji24AVVDb7
	 dANP334bOgQEg==
Date: Wed, 27 Sep 2023 16:50:09 +0200
From: Mark Brown <broonie@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, Thinh.Nguyen@synopsys.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 09/33] ASoC: qdsp6: q6afe: Increase APR timeout
Message-ID: <ZRRBIa+bVSqTHprO@finisterre.sirena.org.uk>
References: <20230921214843.18450-1-quic_wcheng@quicinc.com>
 <20230921214843.18450-10-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="68PF2jVZjsLysHnC"
Content-Disposition: inline
In-Reply-To: <20230921214843.18450-10-quic_wcheng@quicinc.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: DWPGID7CWJNEPOVUCGNZMDRFAD3XYBW5
X-Message-ID-Hash: DWPGID7CWJNEPOVUCGNZMDRFAD3XYBW5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DWPGID7CWJNEPOVUCGNZMDRFAD3XYBW5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--68PF2jVZjsLysHnC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 21, 2023 at 02:48:19PM -0700, Wesley Cheng wrote:
> For USB offloading situations, the AFE port start command will result in a
> QMI handshake between the Q6DSP and the main processor.  Depending on if
> the USB bus is suspended, this routine would require more time to complete,
> as resuming the USB bus has some overhead associated with it.  Increase the
> timeout to 3s to allow for sufficient time for the USB QMI stream enable
> handshake to complete.

...

> -#define TIMEOUT_MS 1000
> +#define TIMEOUT_MS 3000

That seems worryingly large but if it's what the hardware/firmware needs
I guess there's nothing doing - even the 1s that's being replaced would
be nasty if we ever actually hit it.

--68PF2jVZjsLysHnC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUUQSAACgkQJNaLcl1U
h9BZgAf/cEFWzCSLaDAf1NhbSXiH8O1hyl3xIAiZQXxybdY1U6/Tveia8sc7xRZq
ZMFhARjaEtXLKPUh5UH3IpUKdSWAo7Tf/4tF5Z6H40kY0j9WYhzeM7ciaxZc8LC9
Ftmj8/TB2CZ+AQj3At+M2lO/LL39vyBdhBntF94GF8jcnti2PbW86dvm9swf01hx
JOKfMH3zsHDKBw9/0SoDVR7Db1ZfXbgzePottCPmleVVNqVT0NTzQmadCVyfsZk0
8dJWSynhbPUGoCy7ujs9wtWPEgNHCqjsj75W+4pDSA1x8fOAyPmRsWEqlwaX7fSr
tKy9Yo3pp0eL9YD7mwrpBHUe4OjDrg==
=SlIC
-----END PGP SIGNATURE-----

--68PF2jVZjsLysHnC--
