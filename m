Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7986276F37D
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 21:34:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B67C04E;
	Thu,  3 Aug 2023 21:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B67C04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691091295;
	bh=Na39kC0nP6XiW875V274Re2PU/Nlj2wRY/n4Ot8HLjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jydEFRDZq0Da0I0IoJccJbgoGNw0PnDsK2XRblz/Gw/SyIhq22MZ3fJ3XIFe5hgds
	 3keX8eNyOEVtRjJry8SHhaxsleY6klP5M8AwWGqcx/e7UtBbp9GxRq06WRt4adqw6o
	 t7N1ZwLHqX6Oodsibx4S4CWb+HxqSx9Y6PNrs0xY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EC90F80535; Thu,  3 Aug 2023 21:33:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E92CF801D5;
	Thu,  3 Aug 2023 21:33:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DBB4F8025A; Thu,  3 Aug 2023 21:33:32 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 357C7F8015B
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 21:33:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 357C7F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Vq2BHfXd
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D82FE61E58;
	Thu,  3 Aug 2023 19:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C3AC433C7;
	Thu,  3 Aug 2023 19:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691091202;
	bh=Na39kC0nP6XiW875V274Re2PU/Nlj2wRY/n4Ot8HLjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vq2BHfXd0gAouZIkgnzf1DfzUa8NZDzU1x8y7+3dNLTFUILMcNkIJvKYBfYJQSzW3
	 RYYZmW45VHl7DbGGghUJpfaBpUH7es8pY2cMU1BfFMZQEQ0Iqz4ZnMGRTfEr/XRwBy
	 1bvtHux6jRaWV01Q2gCrU44FeWfqiLUgX1Qmj6zGCNRK+gxK98jY1X++g7wIfP24If
	 a0E9MgRAXWgIB39M4D8d9tda3B8eJkLwYUhbevvI8+k6Nuu8n7GvRO8ULiKUfic2JV
	 G3TZQwTX9hYfUSjPpfhPafGmOTpya0qnfqCkV8UxYslk+fOkc8JquUxObDallXK/R7
	 /lKiMhto7KJrg==
Date: Thu, 3 Aug 2023 20:33:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu =?utf-8?B?KOS/nuWutumRqyk=?= <Jiaxin.Yu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
	Chunxu Li =?utf-8?B?KOadjuaYpeaXrSk=?= <Chunxu.Li@mediatek.com>,
	Allen-KH Cheng =?utf-8?B?KOeoi+WGoOWLsik=?= <Allen-KH.Cheng@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
	"andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
	"linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
	Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"robert.foss@linaro.org" <robert.foss@linaro.org>,
	"Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
	"nfraprado@collabora.com" <nfraprado@collabora.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [v3 2/3] ASoC: mediatek: mt8186: correct the HDMI widgets
Message-ID: <9c90185c-9cd4-4a08-9925-be5d460af54d@sirena.org.uk>
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-3-jiaxin.yu@mediatek.com>
 <25e6ab45-ecad-4bc3-bf4d-983243c939ad@sirena.org.uk>
 <c6ae8630d06138b6d0156c19323afebf0718f522.camel@mediatek.com>
 <089fe457-1c61-4b7b-ad37-a67e7f46cb56@sirena.org.uk>
 <6aa6947865795fc534b61f5b8a80b3c42fd5a0cd.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+mbNnAHmVhFc8DSv"
Content-Disposition: inline
In-Reply-To: <6aa6947865795fc534b61f5b8a80b3c42fd5a0cd.camel@mediatek.com>
X-Cookie: One Bell System - it works.
Message-ID-Hash: X2NWYSUZ7JGUKQ5BDEGRVRQNRXTNT46H
X-Message-ID-Hash: X2NWYSUZ7JGUKQ5BDEGRVRQNRXTNT46H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X2NWYSUZ7JGUKQ5BDEGRVRQNRXTNT46H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--+mbNnAHmVhFc8DSv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 07:20:15AM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=E9=
=91=AB) wrote:

> I agree with you, in fact the speaker is indeed doing this way. But
> about the hdmi that on the board, I did not find a defination link
> snd_soc_dapm_hdmi, so I use snd_soc_dapm_line to replace. The purpose
> is to control it link speaker. Or what do you suggest I should do?=20

I think the sensible thing here is to define a DIGITAL_OUTPUT() which
can be used for HDMI, S/PDIF and anything else that comes up and isn't
clearly wrong like reusing one of the analog descriptions is.

--+mbNnAHmVhFc8DSv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTMAPoACgkQJNaLcl1U
h9CWewf/XtBsII8aM+PvwnIJ4Sr4fN16oOfY1UY32SAMvG5kfv55GzqucnYVEkQW
a1Xs2el6AlSouSelQ12FvpaBAXjHAlQpyUoMwI0BYjncBoJ1aHZEGgwE54710y5H
eRQmJH2oarBgD4MbO5N1pqUVbajjCg4mtU61yWgPhYlniAMILOmzyF5jxcpE7EET
7cd0djgpIZHR/osfIG3EA7WQKjuZyMtB/0YKncA1qRoUP0pqZQfetbeHqtchfqJy
3YvmkidEFoaROm7dSZWbNImhDbRVPNal4iot/8JUghN+yo867eidr/0i1kgzgJ8j
+A+PCUclKZDIDoGbmL2M5hlTe+Ihbg==
=3kqt
-----END PGP SIGNATURE-----

--+mbNnAHmVhFc8DSv--
