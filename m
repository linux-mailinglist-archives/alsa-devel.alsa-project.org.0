Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 161B27F44C9
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 12:18:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B358DED;
	Wed, 22 Nov 2023 12:18:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B358DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700651909;
	bh=ZhuFVPB7+HwOQiw1B+qQaev7x/hYSdRobZwNG6p6FcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UFVHh5Uh6yTqy/DoFeDw/kXQe8mr1RfBtJVz8TRjpYOFA9/TbY4uUq871/39N5f9i
	 wzYRgQZjUo2dp+mIpWd00hksVecm1Y/++ysCgFvIRS27il5Cs5w/yxvFw6qisYHuFM
	 z8V/GfzLA7CEhxvzAV7wU4JQXsko5iD/kKhgcwec=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD050F80579; Wed, 22 Nov 2023 12:17:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB3ACF80578;
	Wed, 22 Nov 2023 12:17:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC054F802E8; Wed, 22 Nov 2023 12:17:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08040F80246
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 12:17:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08040F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HH/YXTWb
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 973B4B80E8D;
	Wed, 22 Nov 2023 11:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650F6C433C7;
	Wed, 22 Nov 2023 11:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700651867;
	bh=ZhuFVPB7+HwOQiw1B+qQaev7x/hYSdRobZwNG6p6FcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HH/YXTWbhn3Q3PHHgJiLLwbGrY/j1XbC1YUo8pN8pyKGEF1JG6jIUzN00H60H92u+
	 JTNW3ZONYV/vKfEySxCJkRy+kOFE486qAG5igWiHXIxeWkGq9tZhHM4G9fXZkFJhtI
	 0aymMoZ0qzg4EYbZ0o+H3ENNW02ww73918bYVfm54ACFbvZY+yKR7msw7EeW7y4Ooc
	 zRDhYltonrEolSOWPyRGNE8Vszk8lOkcVvziNkFDdNVcscYr1KrIMOZnahAFMi/j+i
	 AbfZ/j4MvknTVl3W2oC5fPIlyw+vbBCNk5zEMwmoL7ApoRejUdpPFyzI8yf19p+UXz
	 pY2bmONRIa/uQ==
Date: Wed, 22 Nov 2023 11:17:42 +0000
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, lars@metafoo.de,
	flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com, yuhsuan@google.com
Subject: Re: [PATCH] ASoC: rt5650: add mutex to avoid the jack detection
 failure
Message-ID: <ZV3jVhAID+tWA9fI@finisterre.sirena.org.uk>
References: <20231122100123.2831753-1-shumingf@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dhNdteQ9DR7m59xX"
Content-Disposition: inline
In-Reply-To: <20231122100123.2831753-1-shumingf@realtek.com>
X-Cookie: Slow day.  Practice crawling.
Message-ID-Hash: 3OGUNO46QQBY5JO2W6RU3B5T3IPEZPEL
X-Message-ID-Hash: 3OGUNO46QQBY5JO2W6RU3B5T3IPEZPEL
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3OGUNO46QQBY5JO2W6RU3B5T3IPEZPEL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--dhNdteQ9DR7m59xX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 22, 2023 at 06:01:23PM +0800, shumingf@realtek.com wrote:

> This patch adds the jd_mutex to protect the jack detection control flow.
> And only the headset type could check the button status.

What's the protection here for - as far as I can see the mutex is only
taken in the jack detection work function which should only ever have
one copy running at once by virtue of being a single work function?

--dhNdteQ9DR7m59xX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVd41YACgkQJNaLcl1U
h9C58gf+OL0tZFJjMWUxGapva0wgXlJenDuC0dWFo4gh85OtrkwpCqf2X4f1MVho
YKx/7Y6VLGthVJzE/s7+/zUZuwHgehZ6M3wWx60QA0Le+jp0B3GOb6tqcetlkWEI
Bncs66mGxw78dP7ClSFDgHbp0X+1yFU3351YsBopmmRc8+43mt2MZq65PtJyEts1
tghCb3q0Gux+h79skxOA5riuKXkdtl49gUWiRjzths+Io4u8aPg2d11nEZEOSuGV
DwOZCO/mqhe8FiJH2OSs/OS7ZDl/3Lxt3Cv/T83DZLvdd77+wOEX0kkXwo/0TVgj
PEChNm5QJHoluWZHxl+mk8W3M+2JAA==
=6w81
-----END PGP SIGNATURE-----

--dhNdteQ9DR7m59xX--
