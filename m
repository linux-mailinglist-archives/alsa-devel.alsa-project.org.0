Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 004A7656BF9
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 15:37:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 913CC75A8;
	Tue, 27 Dec 2022 15:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 913CC75A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672151856;
	bh=/EDm6xhhHpeJLbxbvhfcWbFizxBuWlsdVT/F3n9zhI8=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NFCkQdU7ydeGWl3MNHlCmDPiCsEUpDARoEMdEafz5m0jnMHIQfKVf3a4lb9Eu7vq4
	 WT/eoKhb5kY6qzcYo++CdcUj7/lok0c3gXQukNaYOz4dWMmoqtVD8t+ivNThVCgESl
	 I2QoOohqnNCyg8Ed4L4SF/dnkgIzapZQW6k/3M94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13E08F804E4;
	Tue, 27 Dec 2022 15:36:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7D05F804E4; Tue, 27 Dec 2022 15:36:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00403F8027B
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 15:36:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00403F8027B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CLqf7O8k
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 662A5B81077;
 Tue, 27 Dec 2022 14:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C23DC433D2;
 Tue, 27 Dec 2022 14:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672151788;
 bh=/EDm6xhhHpeJLbxbvhfcWbFizxBuWlsdVT/F3n9zhI8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CLqf7O8kcixh9nFMoanB7/3AjIQ/vkR6JwoLk/VkZpj/dZIOCVMr9XHmbajyDVUkq
 DMynJ4rVrF1rYXU5ED00w18DFAHLR+lj3isG3KzHwRnKfb+7ni3KrBNcn9IxDrteU/
 gQu3GI7S14K+jwCyCR/BjVfJMh5+E0aQXEY3OyyYHW2f8S83HNMNjoYZzXhJh15dlC
 COFEKUOJdwwzauI7le8XIP39UiH+8Pkl+66lQf145BESc9gHJdmFU18qxf3w0anHaO
 mqCBRpcJwFSMHEHsB88PZNbZ6WsPFSIQY2OObZcZ983HjO2Boqe5fGwrW0cSFI1fD/
 HKWrefRYy432g==
Date: Tue, 27 Dec 2022 14:36:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH 00/14] Introduce QC USB SND audio offloading support
Message-ID: <Y6sC5e9Zrd2JWTHU@sirena.org.uk>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <Y6agEsfXKMMXPpmz@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1+ZKSFcDOruBirf+"
Content-Disposition: inline
In-Reply-To: <Y6agEsfXKMMXPpmz@kroah.com>
X-Cookie: If it heals good, say it.
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, bgoswami@quicinc.com, mathias.nyman@intel.com,
 Thinh.Nguyen@synopsys.com, andersson@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, srinivas.kandagatla@linaro.org,
 agross@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, quic_plai@quicinc.com,
 Wesley Cheng <quic_wcheng@quicinc.com>, linux-kernel@vger.kernel.org,
 quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--1+ZKSFcDOruBirf+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 24, 2022 at 07:45:38AM +0100, Greg KH wrote:
> On Fri, Dec 23, 2022 at 03:31:46PM -0800, Wesley Cheng wrote:

> > soc-usb: Intention is to treat a USB port similar to a headphone jack.
> > The port is always present on the device, but cable/pin status can be
> > enabled/disabled.  Expose mechanisms for USB backend ASoC drivers to
> > communicate with USB SND.

> > Create a USB backend for Q6DSP:
> > q6usb: Basic backend driver that will be responsible for maintaining the
> > resources needed to initiate a playback stream using the Q6DSP.  Will

> This looks to duplicate a bunch of the same things that a number of
> different google developers have posted recently.  Please work with them
> to come up with a unified set of patches that you all can agree with,
> AND get them to sign off on the changes before resubmitting them.

> This uncoordinated drip of patches from different people doing the same
> thing is almost impossible to review from our side, as I'm sure you can
> imagine.

I have to say this is the first I've heard of any such patches other
than from the Qualcomm people and I can't immediately see anything that
was on the list either, though I might be missing something since I
don't have the subject or anything.  If other people send things again
it's probably good to suggest they copy in audio people and lists.

--1+ZKSFcDOruBirf+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOrAuQACgkQJNaLcl1U
h9AjZwgAhsVgucuD8v8EbY26CtQPykN5gxWGJ+7ciqU2SrnCmlf+PFa++50wRWOa
pDrX7dQ+fLhgUGMXCKWlY7dRqGjtYicvaKElyZXfKt8vdXifdNur+KBhJW979lbF
X2c3CK0pl7plOpv43L4vYExx5Qlr7B4Jz+sYbdw6ND1CqpW7a5lghIAOL2d0kTxB
yPdeMrE4vmzXcN24/XFrTb0zgfTkh13j6et4DocgNe9UhHjgMzgEfHKmM7W/QBZf
RNE8voHGyXvSb0w92ZyX1AGLIZF0sU2gOSR0tAQwH/5w5emoHj3b+LvGz1ArQVmj
ms5nPnW0UpzZU8QkG6f+w8tJiSQCcw==
=XxVJ
-----END PGP SIGNATURE-----

--1+ZKSFcDOruBirf+--
