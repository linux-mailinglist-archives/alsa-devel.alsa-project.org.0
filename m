Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9024C6FC896
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 16:13:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29D931FB;
	Tue,  9 May 2023 16:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29D931FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683641636;
	bh=Ia9qR/V+dgyiZQmU96o1UbuUGtZdvdOBtBPw3NwRYJI=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=onY15YMNe6RsixNslrxBLzlUouIOV4qeT9QyNBbz0Fr1y58U4VRE9pMhxnmv/vEhg
	 kBSZB+vTIxUhV9+1kGAudQmdsvuhLZZolIYwoCVm1YfPTsk/IflIO1w7fpub+t87EK
	 Gd5FZoCsfHwqA0C6Gcl6LPcT5HCd93/HsTzhJe7g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61B08F80087;
	Tue,  9 May 2023 16:13:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A5B5F8032D; Tue,  9 May 2023 16:13:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02AD1F80217
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 16:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02AD1F80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=M2bVYeNp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9251661CD4;
	Tue,  9 May 2023 14:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88254C433EF;
	Tue,  9 May 2023 14:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683641569;
	bh=Ia9qR/V+dgyiZQmU96o1UbuUGtZdvdOBtBPw3NwRYJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M2bVYeNp5yBaBNpJrq/lMcqKeH4Eu5ZbakZcYCLu6XMVFkStwkNiHguLEiQlYp1M/
	 NvG480htiNEKhlHXF/+PjVDkqQQEKvRDqaae9WCbeyT658wWE4l86gD3CwjuCcwAyh
	 sGQpMge9V9FLFe035uipI2fh3+USJwv1I+kaVznbbMYjY9eGP+cFguDiDBjzVk1bdo
	 39WZqJSn1pANwyXLM0N/m/sYi4dMV9a8TurXCX4eylD+bVovXGEfnXueVAAmYXF2bu
	 FOd5e1I7g5L+cIJw0KQtPQLzLHd2xS9/OjHNRb2GOb0l4l6wSRnxINxP4V4RTdibr0
	 tUKrCP3fe5dHg==
Date: Tue, 9 May 2023 23:12:46 +0900
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC:codecs: lpass: Fix for KASAN use_after_free out of
 bounds
Message-ID: <ZFpU3iIhoWA4oIhf@finisterre.sirena.org.uk>
References: <20230509103232.20953-1-quic_visr@quicinc.com>
 <bb67f4b0-e96a-3718-f855-80e1d21e9d38@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7MjTQKZ/juz56Sws"
Content-Disposition: inline
In-Reply-To: <bb67f4b0-e96a-3718-f855-80e1d21e9d38@linaro.org>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: 6OB6CLTZKZ7CFBWMSESBYNHM6NFJTV5V
X-Message-ID-Hash: 6OB6CLTZKZ7CFBWMSESBYNHM6NFJTV5V
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 "moderated list:QCOM AUDIO (ASoC) DRIVERS" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6OB6CLTZKZ7CFBWMSESBYNHM6NFJTV5V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--7MjTQKZ/juz56Sws
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 09, 2023 at 01:26:32PM +0100, Srinivas Kandagatla wrote:
> On 09/05/2023 11:32, Ravulapati Vishnu Vardhan Rao wrote:

> >   	val = ucontrol->value.enumerated.item[0];
> > +	if (val < 0 && val > 15)
> > +		return -EINVAL;

> how about

> if (val >= e->items)
> 	return -EINVAL;

The enum value is passed as an int so is signed unfortunately.

> We could get these checks if CONFIG_SND_CTL_INTPUT_VALIDATION  was enabled.

You can't rely on that being set.

--7MjTQKZ/juz56Sws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRaVNsACgkQJNaLcl1U
h9A0Uwf/UvIT8fZeRNOkWNIfq84pL8mhWAPjeWjO0KZMX5qY6ryVzPuDQY3cuv5S
cH0vyKy12IWKEFhMwN+kM1h70iiX+Ai7STIp+6tJWJnXTGlZmpi1qwGy9yDc2Zxz
30c8CyfvhFYm3y6cJGOq/D79DABrDT1xeG1HG4/CAhFagIQBruQ9/2gnHJIhfcfx
UVGfLUmU8srAmBE/o8DyrME67anVAn5jEttqIdetnCyISSF0Svu9xyx7pM9k0WQs
nOcCE+PfRL6owkajRu+pnBpimZXX4zXmUBwcQl+KDIxexpp2eAR35OgK9KXn0kE/
lRZcSZ1/feq8gjoO/Fh6AcJghyasxA==
=qvvD
-----END PGP SIGNATURE-----

--7MjTQKZ/juz56Sws--
