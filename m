Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F41AA9EBE3C
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2024 23:52:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EADB01909;
	Tue, 10 Dec 2024 23:52:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EADB01909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733871174;
	bh=UW5h1XStgrRU6YsQy/UsIAox8gwJWzpospv3WLKNH3g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pr9RkrvjzP6RKY1vGQOiJX46fJsvanB8JoV/E6sJH7qRmbXsCoIo5lkHBzNJzn71S
	 R+pkos8cBGyUNfc6VQwDkZdBT/Opq3gx+Pvcw6X/4hlT46Cdsr12hnv3SzTGU/hLGI
	 c5ZX4U/0l6VYh6wgJs8wefQXT726HYex795XHlBc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A278F805C6; Tue, 10 Dec 2024 23:52:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3F73F80533;
	Tue, 10 Dec 2024 23:52:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35533F80482; Tue, 10 Dec 2024 23:52:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 384A1F8032D
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 23:52:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 384A1F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f3/0Rc7g
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 419605C62FF;
	Tue, 10 Dec 2024 22:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7FF4C4CEF0;
	Tue, 10 Dec 2024 22:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733871122;
	bh=UW5h1XStgrRU6YsQy/UsIAox8gwJWzpospv3WLKNH3g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=f3/0Rc7gaY6QuiNJNlfCdMM97zKiTGNULYd4fAhDMWOogM3HveIf7FBhSPTtYtZao
	 1OPqG+AT0OQ2vK4vQmIaPkTILsD8QAsXnEyC5l4zInzE/CaE9TYK1F9mmwTjvpScl4
	 Z6bYWftxU3eUGwTu2urxJEpza3wrB9cU2N6rER8L8LwZIea4TpH/IanzavrflITXeQ
	 Y0JLZ56Wr4W34uUBDgdZB5lA7uDWnvLZQb0Bx6w24x07lkMpZe+N+E9Tj88sGfWVWu
	 YEiicmEYz48WClP5zbtgGgFe7U61qp4n1NfcCPGrAkhnCQlI/C+lWXvGT1UIJFnvxG
	 XM9bfHI8Jpy7w==
Message-ID: <4190bb148fcba3903821db17b06f7ddd.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241210170953.2936724-2-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
 <20241210170953.2936724-2-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 01/24] clk: versaclock3: Prepare for the addition of
 5L35023 device
From: Stephen Boyd <sboyd@kernel.org>
Cc: claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
To: Claudiu <claudiu.beznea@tuxon.dev>, biju.das.jz@bp.renesas.com,
 broonie@kernel.org, geert+renesas@glider.be, lgirdwood@gmail.com,
 magnus.damm@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de,
 perex@perex.cz, robh+dt@kernel.org, tiwai@suse.com
Date: Tue, 10 Dec 2024 14:51:59 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Message-ID-Hash: Q2ZJ7N7LO545G2SAD746UZS7FT2XIVXP
X-Message-ID-Hash: Q2ZJ7N7LO545G2SAD746UZS7FT2XIVXP
X-MailFrom: sboyd@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q2ZJ7N7LO545G2SAD746UZS7FT2XIVXP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Quoting Claudiu (2024-12-10 09:09:30)
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The 5P35023 and 5L35035 Versa 3 clock generator variants are different but
> the versaclock3 driver could be used with small adjustments. The features
> that are implemented in driver and differs b/w variants are the PLL2 Fvco
> and clock sel bit for SE2 clock. Adjust the driver to prepare for the
> addition of 5L35023 device.
>=20
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Applied to clk-next
