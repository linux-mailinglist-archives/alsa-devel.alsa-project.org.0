Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAEF9EBE45
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2024 23:53:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 100A0210B;
	Tue, 10 Dec 2024 23:53:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 100A0210B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733871207;
	bh=LssiNIj8oGW6nd7zlyMfCYyCX8QpiqI63Pa2tgrjihE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dybxrX9dLxE/ogf6q7MH6536l5fk6Qzrf/g6rDlx0+km3a3j5iFtvsvm30Fic7vvJ
	 YX69InqRAaoVUAp942QQHgD/r9eNYmbQajDZ/oElSKRSr+KPG98dqjaVeL/Ecv3VPF
	 jTi0e9iAvNmzzYgmOog3Ln0WOV5J0yb7X3a2BwBw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00AE5F80609; Tue, 10 Dec 2024 23:52:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66A28F80603;
	Tue, 10 Dec 2024 23:52:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A688F805F3; Tue, 10 Dec 2024 23:52:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D1C2F805E7
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 23:52:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D1C2F805E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GQKAkUUc
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1E853A41C0C;
	Tue, 10 Dec 2024 22:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19637C4CED6;
	Tue, 10 Dec 2024 22:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733871142;
	bh=LssiNIj8oGW6nd7zlyMfCYyCX8QpiqI63Pa2tgrjihE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GQKAkUUcVf8Xq587TPnxbWz52ZlCgNv2GpEOSLzw4jnMQd52SdKI16QYvsS9VE9gN
	 w/SWlMQ5ikPYdXw1CVNkJ1Yl3aGTu5G+b5XbMlZnwZJH3PyogpwRl/Ouyl1z/ThSYW
	 DoTLxVtBAsl4nhDZPzYdC2Ps5zatUftUJF4gwZUWs/Au0XB8oWACf3SOoYT/heH/gR
	 zU+zEj63ppXxxyNuBR2JQqRjPEjLjrlkkkKTpmfCfqRgONjy1Zb9rHUjuUf1wtGvBk
	 P+MmF07VeGToYtl1EwJ8kjb1gprJHmO8Ug4XEUDQNVowA+hX69z9EbFPq0XoGKUsa5
	 I752WE0y6rezA==
Message-ID: <4b11a074b63c582981454d8d9d64ac0f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241210170953.2936724-4-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
 <20241210170953.2936724-4-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 03/24] clk: versaclock3: Add support for the 5L35023
 variant
From: Stephen Boyd <sboyd@kernel.org>
Cc: claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
To: Claudiu <claudiu.beznea@tuxon.dev>, biju.das.jz@bp.renesas.com,
 broonie@kernel.org, geert+renesas@glider.be, lgirdwood@gmail.com,
 magnus.damm@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de,
 perex@perex.cz, robh+dt@kernel.org, tiwai@suse.com
Date: Tue, 10 Dec 2024 14:52:20 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Message-ID-Hash: 2VKBJUCT2JPLJIFBBBZLO2BG3OTILLRG
X-Message-ID-Hash: 2VKBJUCT2JPLJIFBBBZLO2BG3OTILLRG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2VKBJUCT2JPLJIFBBBZLO2BG3OTILLRG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Quoting Claudiu (2024-12-10 09:09:32)
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Add support for the 5L35023 variant of the Versa 3 clock generator.
>=20
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Applied to clk-next
