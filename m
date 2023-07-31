Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C23769543
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 13:51:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2A36832;
	Mon, 31 Jul 2023 13:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2A36832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690804316;
	bh=AOWwhYv+t8CDvyhND2LxS4NNrNKJuWikV9QiBFJH92s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ddAtwBGl8ow/BUm9aCm+8WDy6FD1FM4cvEZG23u+HKGjXlQByKrscb/ZsiJHPzbxh
	 LeifcPyLUcQMFRXzNDoOqsnlKfzfjyy9sm/odnanso07YeOghmjrkWdls4XAX6LyBv
	 vKgY2xFj/sPmkEKIRrydwrp0KsuxyWgr8A/IcfSo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D503F8053B; Mon, 31 Jul 2023 13:51:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1C92F80163;
	Mon, 31 Jul 2023 13:51:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8353FF8016D; Mon, 31 Jul 2023 13:51:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07882F8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 13:50:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07882F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uL2XhCM5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C64776105A;
	Mon, 31 Jul 2023 11:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE103C433C8;
	Mon, 31 Jul 2023 11:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690804255;
	bh=AOWwhYv+t8CDvyhND2LxS4NNrNKJuWikV9QiBFJH92s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uL2XhCM5GgiizRO+1NueJqOprVve9jG9ZNiTVFaZmlT0Q/zpwS7OIGkH1wOpYJzo7
	 qRZ3NRfxvT0zTMbGLyJBm8HEDAzDE1VXzpskPjW9Z6koCwUQOj5yZKHR+1uBw6j1rn
	 mqu+TreQdXB+3DlMYLWHSARGlScVJQ5XQf3CG4lN2fqdQjsYkmtsO0n1jAABoOItNk
	 yTG4BJbMlq8NUZhH6CTPE2kfSEIYlVlVwkzKKeY73KOAAHsw1WyQH8K/e84e2ePbqv
	 RtzsDIHhnQ3Ulw1hrtEaBMOf8RZPDpmzuEN04Y89w3ZWgWgoU4pF2vlmlUFYS+g80n
	 kWNXkGQ/y6fjg==
Date: Mon, 31 Jul 2023 12:50:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com,
	kuninori.morimoto.gx@renesas.com,
	angelogioacchino.delregno@collabora.com, nfraprado@collabora.com,
	chunxu.li@mediatek.com, ajye_huang@compal.corp-partner.google.com,
	allen-kh.cheng@mediatek.com, dri-devel@lists.freedesktop.org,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v3 2/3] ASoC: mediatek: mt8186: correct the HDMI widgets
Message-ID: <25e6ab45-ecad-4bc3-bf4d-983243c939ad@sirena.org.uk>
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m510aG4cVtaJEGRZ"
Content-Disposition: inline
In-Reply-To: <20230730180803.22570-3-jiaxin.yu@mediatek.com>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: W2PPN7AKM4IYPHAEAXS3ZXYH535MRJWH
X-Message-ID-Hash: W2PPN7AKM4IYPHAEAXS3ZXYH535MRJWH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W2PPN7AKM4IYPHAEAXS3ZXYH535MRJWH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--m510aG4cVtaJEGRZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 31, 2023 at 02:08:02AM +0800, Jiaxin Yu wrote:

> Use SND_SOC_DAPM_LINE instead of SND_SOC_DAPM_OUTPUT to trigger
> DAPM events to hdmi-codec when userspace control the DPAM pin.

Why?

--m510aG4cVtaJEGRZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTHoBcACgkQJNaLcl1U
h9DXVgf9HxthKv6tquZ80eqHswbBmda73YJgF+PneFtfjX5EUD8siEFTvhlHJOPb
itkNuLs0xwuvU/ocou1TJ3JVkd4SlhXF2AQUB2MKqUJlOMYiEthVhAj2RWNMEMWb
M6hNPAHydcz2O6rmMD0wknYpUUHLE+1Xv3EXeMZEKYLh8qZlrfstrqI1s/fhuQaJ
TmQTCMTZ8AmSRgZ9ENPYon30oN6/7qeEvKbyW+PnOTCqSv/Zhz1pOVf21YoY2nhO
94QnTgSNXrSZINA/rfNDUwEvG2W/OY4N/hb+gKf6qbraNOVxbw1o//Cc2tfTTWlL
P2wCPNxJJXNDAizWmcN9zeH3ZZ4Iqg==
=H16t
-----END PGP SIGNATURE-----

--m510aG4cVtaJEGRZ--
