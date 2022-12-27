Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D959656B9A
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 15:12:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7FEC74C6;
	Tue, 27 Dec 2022 15:11:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7FEC74C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672150354;
	bh=w1Tt5KpHeU6LrhFDV3MOo7Ka2OTOJdZOMGYD+HubpdU=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SSPCieDUSSBO5ukwORDLkg4VzbB/CRAMhpmQpKK4BBy7LRREV39edx6h0ty1uwCkp
	 KdKep4U94Bfbly896bi8jMmBEokYiza/KOLzqjyqezMxY8PwG42dm7mqFqZbD2VJXF
	 8wLnFco6MRKG+oDo+460Jqo0530MvW4kUCRVqAhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97AF3F8023B;
	Tue, 27 Dec 2022 15:11:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40BE8F804E4; Tue, 27 Dec 2022 15:11:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97308F8027B
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 15:11:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97308F8027B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MMmr8g6c
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9CAB7B81062;
 Tue, 27 Dec 2022 14:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35E5C433F0;
 Tue, 27 Dec 2022 14:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672150296;
 bh=w1Tt5KpHeU6LrhFDV3MOo7Ka2OTOJdZOMGYD+HubpdU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MMmr8g6crtYz7sD8hp5VXA4d0W4r+qQfith6dYe66hivk1PanPlB8k2INiMFjpziB
 oAL3Rc/zqddnLdjZ8Y7vE1cxxeBjOfHpw8VCiWeFx4RQmfLcQm2IU30imG0SqUiJPQ
 YdiUnzoLNFwQ8nTcuGUozrnsMjEMphQHc8tjPb/32a5crd0tKPb5VcbNhSIN5UxrRA
 Gl9is9ej3XQlw8VUPOU+gTTc5CkQ9EK4km/A9AmWBUBD9Th3RKRGE7GkDz+qxegTJs
 vnTIaa4Zv8kbdnDp+XnezBZKvTDHE8ZeKcb28HR6/t+J0smuj/ZsOKOU7hiGzeA8x7
 0f6c5GSoBEAlQ==
Date: Tue, 27 Dec 2022 14:11:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [RFC PATCH 03/14] ASoC: qcom: Add USB backend ASoC driver for Q6
Message-ID: <Y6r9EKn7WU3eWl8e@sirena.org.uk>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-4-quic_wcheng@quicinc.com>
 <Y6bAQ8hDLkvrvjQQ@kroah.com> <Y6rtdy4NPfi/KOqd@sirena.org.uk>
 <Y6r26VfIfpE8zpPY@kroah.com> <87r0wl0wso.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MoDs+V7j52bwbfqu"
Content-Disposition: inline
In-Reply-To: <87r0wl0wso.wl-tiwai@suse.de>
X-Cookie: There's only one everything.
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
 mathias.nyman@intel.com, Greg KH <gregkh@linuxfoundation.org>,
 andersson@kernel.org, tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Thinh.Nguyen@synopsys.com,
 quic_plai@quicinc.com, Wesley Cheng <quic_wcheng@quicinc.com>,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--MoDs+V7j52bwbfqu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 27, 2022 at 03:02:31PM +0100, Takashi Iwai wrote:
> Greg KH wrote:
> > On Tue, Dec 27, 2022 at 01:04:55PM +0000, Mark Brown wrote:
> > > On Sat, Dec 24, 2022 at 10:02:59AM +0100, Greg KH wrote:

> > > > "be"?  What is that?

> > > Back end.  This is a concept in DPCM which should be reasonably
> > > discoverable to people working on the audio portions of this code.

> > Ok, then how is the reference counting logic handled here?  USB devices
> > can be removed from the system at any point in time...

> The whole picture is fairly complex, and this patch is a part
> belonging to the ASoC machine driver -- that is, it's bound to the
> Qualcomm host, and there can be only one on a system. =20

> OTOH, USB audio devices are still managed by the existing USB audio
> driver as is, and they can be multiple and any devices.  The basic
> idea here is a hijack of the USB data processing in USB audio driver
> with the offloading mechanism by this ASoC driver (only if the
> condition met).

Right.  I haven't even begun to look at the actual code here, just
triaging my inbox, so I've got no thoughts on if things work or not.

--MoDs+V7j52bwbfqu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOq/Q8ACgkQJNaLcl1U
h9AJLwf/TGoSsJdiOtmJ/KDGP2WpqZDVbQqPyJeobJzTd9iQ0WISteeWXhCaQzEP
prsfQuOnpN59pIx92wR1QiQhG1hIfloZm9D0+2GFs6ig70JB/2tR4vrDwyOvpJab
jdL+aAl495L95M2FyBU6iaBTSAkmJTiBro++bgcYRJHtExYiuVM0zSLnHnGXjpY/
Q8VngUTeGebIQnTK/yjDIqCamWLQ1uygyiEexa6irqBZJxAf5E2QXww1573HF1ma
7icaSGlaaDRvIz4f9tKvj7j7y++W8xHSZI/dUvGSQV++tuFVy5BxpysjqNncFT9t
VB0GkLnFBoQ4w00oIOLbYMsqF69weA==
=fyRg
-----END PGP SIGNATURE-----

--MoDs+V7j52bwbfqu--
