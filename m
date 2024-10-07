Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A8699269B
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2024 10:06:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0E46822;
	Mon,  7 Oct 2024 10:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0E46822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728288384;
	bh=waUV4a7mutxzrLnl05aUF1spDLiYo3LFIffRAYq+buw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T+Ga0YD9hL8IgeZOZeewXBWa7CrYyu/PiEDqArRCZQ71oJj4YG9P3nn2JsdRPfGEK
	 opI3c2Uko31zhEHhmxYu0zHvMCfatoUec4KZRXv6xTLkztlyw56n2GHzL2M6W+Xt1C
	 pR67OKxBjKLOl/WZ7792fEdfa3sS17IkLmpYcO34=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F166EF805B5; Mon,  7 Oct 2024 10:05:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19360F8001E;
	Mon,  7 Oct 2024 10:05:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B623F80528; Mon,  7 Oct 2024 10:05:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_PASS,T_SPF_HELO_TEMPERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BF9FF8001E
	for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2024 10:05:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BF9FF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256
 header.s=gloria202408 header.b=G/k1s40U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZkOxRoRypHAVQgVjyqb7heF/q9DLPK8SmPxFVAuphQI=; b=G/k1s40Ulb10wWe2CvPP9H8zku
	QyoRAgzReOYMUcvY1lT5FklGPJb9trwS8HWM5iKC2m2ws7E5TBIouShElZ6rUqd7aL1NY7tFFpVKE
	wqInKhrzG35pjz7jHf4OdIyFp3xZtpyrQXwDcYsiY6x/GxEZc2Jw5mZA5rcEBBcKbM2WHNg1Fdfs2
	kNbk1NVQV/19IsFaacmsHaoCamjIA1H2jsOPU65USw0roLxH03+ZCKnQBXaVtJ7nLQr2BB8WSp9q/
	pK0Qc7UupO3XNZW14pv9HT2V5bQRXcSXjTwLYdsqnGept/bPGsRtLZYkPMGkRaEsXJw7YIF5kf8hC
	Rg1jWntw==;
Received: from i5e860d18.versanet.de ([94.134.13.24] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sxik7-0004Pv-F9; Mon, 07 Oct 2024 10:05:23 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Mark Brown <broonie@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: (subset) [PATCH treewide 00/11] ASoC: Clean up {hp,mic}-det-gpio
 handling
Date: Mon,  7 Oct 2024 10:05:20 +0200
Message-ID: <172814935870.2376693.17979672250689687487.b4-ty@sntech.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1727438777.git.geert+renesas@glider.be>
References: <cover.1727438777.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SS6PQDVZVZRDOUIN7W34FI2JRYMACHXE
X-Message-ID-Hash: SS6PQDVZVZRDOUIN7W34FI2JRYMACHXE
X-MailFrom: heiko@sntech.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SS6PQDVZVZRDOUIN7W34FI2JRYMACHXE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 27 Sep 2024 14:42:15 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The "gpio" suffix for GPIO consumers was deprecated a while ago, in
> favor of the "gpios" suffix.  However, there are still several users of
> the "hp-det-gpio" and "mic-det-gpio" properties, in DT bindings,
> drivers, and DT source files.
> 
> [...]

Applied, thanks!

[06/11] arm64: dts: rockchip: Switch to simple-audio-card,hp-det-gpios
        commit: 7ac5c0a592f73fdc52393f6469ce8211ff3e771f
[07/11] arm64: dts: rockchip: Switch to hp-det-gpios
        commit: 3ca743f8a5b568dc5e5d5f1bab0298a4a43c2360

after the binding change from patch 02 got merged into the sound tree

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
