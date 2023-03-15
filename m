Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE906BB9B3
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 17:30:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B20A1325;
	Wed, 15 Mar 2023 17:29:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B20A1325
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678897848;
	bh=jjn5cdVupJ0A22hzLeqblsWGnn86f9oIpQTR3zJXyMs=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tXetSwMwqC0DWtTY+ENpMjtKCJCEsun1HEshkCYkETf0045U5WSdy+65ejKDLDEJV
	 YRmW2lCuTUg2jApH4S3Csd0nNp2kcLDjAPuczL0fk2naSkJLGIXaz43Hk7WDYyJOPZ
	 nqB26LSEcwl0i5XDxCVIyadqbvNqmwZMklgFRoLc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E86C9F8032D;
	Wed, 15 Mar 2023 17:29:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53E7FF80423; Wed, 15 Mar 2023 17:29:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C5CDF8016C
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 17:29:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C5CDF8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SrGZE6Sk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5B40A61DEE;
	Wed, 15 Mar 2023 16:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF974C433EF;
	Wed, 15 Mar 2023 16:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678897783;
	bh=jjn5cdVupJ0A22hzLeqblsWGnn86f9oIpQTR3zJXyMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SrGZE6Sk04Pizzg1tuzcS8CHPA2fWPGLs4KeZnsayQbgSEQA4cnJK0Pfeq0SJeJBK
	 k3vxt0IAld+aKoIhiC1zd5okC/+vL8oWVyyuI6ZfWamyvj388DwIwIYix0jC3bwxmi
	 DkeIXcnQUWjdJXHT/9ZFLPb9Mobk2cNyIzLuPwIw5rsLql0YKamZVRUoXUYTdyODoV
	 Qvri59v7Ipro4ikDj/8KVduqsAhq0rRHgWmjSR1HC0SJWkOuQY5nxeUuemo7vvLdpn
	 GcuwDkUNsFs3zlki+Ro5SvcGO6afswtXZknOUs/tFssFYs5ilBEfvwFoULnPAv3CIu
	 EL6OIvNSFjCYw==
Date: Wed, 15 Mar 2023 16:29:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v3 00/28] Introduce QC USB SND audio offloading support
Message-ID: <e270cffa-d27b-40e0-aed5-104514e4ba94@sirena.org.uk>
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <4f8a66c0-398f-5655-3aa7-a59bc9ba56cc@linux.intel.com>
 <8b2f3ce7-3e0c-bdf0-8d9f-9aeabba09a15@quicinc.com>
 <a211f26d-a045-0729-871f-248d5fce3f3f@linux.intel.com>
 <684daf86-6c3f-7310-eebf-4ebfc3c480ca@quicinc.com>
 <8a37ccd3-f19e-b30d-d736-04e81b49f3a0@linux.intel.com>
 <0810f951-f4a6-a51d-97e3-43691b05f702@quicinc.com>
 <b671e263-5cb8-18e5-dc28-648ab1133c6c@linux.intel.com>
 <14d726a7-6ffc-705c-b012-0c08d7dd7b9b@quicinc.com>
 <6b811766-cd2a-54c0-d090-640812686a45@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z0fuEYQGMv0a0e38"
Content-Disposition: inline
In-Reply-To: <6b811766-cd2a-54c0-d090-640812686a45@linux.intel.com>
X-Cookie: "Speed is subsittute fo accurancy."
Message-ID-Hash: HMC2ZXH5MKOYNBCV52F2IRDVHZKMFYXY
X-Message-ID-Hash: HMC2ZXH5MKOYNBCV52F2IRDVHZKMFYXY
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, lgirdwood@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, andersson@kernel.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HMC2ZXH5MKOYNBCV52F2IRDVHZKMFYXY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Z0fuEYQGMv0a0e38
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 15, 2023 at 09:30:58AM -0500, Pierre-Louis Bossart wrote:

> That's probably ok then, am I getting this right that the the DSP card
> would not expose any USB-related kcontrols then, i.e. the ONLY path to
> change volumes, etc.,  would through the regular USB card kcontrols?

> That would limit the changes in the platform sound card to the addition
> of a PCM USB device.

I'd guess that there might be some volume control in the DSP as part of
the generic routing to the port (eg, if all ports have some output
control) but I'm not sure that's an issue, could even be useful for
normalising the output of DSP algorithms compared to direct PCM
playback.

--Z0fuEYQGMv0a0e38
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQR8m8ACgkQJNaLcl1U
h9Cp3Af/fp7qmzx3dIqaYfXDA3inZKGAJxlBPLnKX7FXrObh2rhSDh/htyeF/xtx
6tpnHQ1zB2RqEeffKTwu9lobnS2+x/SYkDG2vw5ONFKl3U7L3L87l76a67mR5Hk8
d7nCQBAdHetX8yl/6H4iVbQztzwFNbuAfT61GYm+zxd98Psps6JucWS8IXwH8lfd
XGRC/kENH9CPClFzhOCLGnlc+lMRkIGPDH38CN/IGl1GqHr5GgpWlRf6U5dFxpYC
gAAATPlnhXUSp3o2+qT0bmqjEDpeWXUbeAQuayhdQ3fS0TzGBgoynfR7OyKEHPyl
X3poldFU1Joz448CW+mSRjG2W9VTpw==
=+zSv
-----END PGP SIGNATURE-----

--Z0fuEYQGMv0a0e38--
