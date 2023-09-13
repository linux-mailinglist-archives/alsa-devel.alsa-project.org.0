Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7694279E9F2
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 15:44:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11937DED;
	Wed, 13 Sep 2023 15:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11937DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694612696;
	bh=a6eJFMD7UYNieE8ipLLApaS7mzhbB7aFjI27sQ41vYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V7W5U3r42Hazxsu/gjEAY9y1NJyZuxBWM8kWlgWeSaYsi5OCY+nYE3AQhwFUL/MIJ
	 r8vcgFv9mkf/GmSudhOhoKgXBgdyvpgItblGFDYCl0K/ieQLLVgnXjyszvLbzyg9LK
	 QAqzn0zaDX+gvbvt8Dlrmp1AVYJyZpzVCs2SYvYA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D069F80552; Wed, 13 Sep 2023 15:43:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FE22F8055A;
	Wed, 13 Sep 2023 15:43:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2A49F80425; Wed, 13 Sep 2023 15:43:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E6C1F80212
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 15:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E6C1F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IJi+xGH0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 4E5FFCE1F1B;
	Wed, 13 Sep 2023 13:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38425C433C9;
	Wed, 13 Sep 2023 13:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694612584;
	bh=a6eJFMD7UYNieE8ipLLApaS7mzhbB7aFjI27sQ41vYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IJi+xGH0yrj+npciZCHvuvASWqtk4I+kILeKP67P3Q9Di+vGZr3SGaZB12YH6aj0f
	 unXLzNF8vC11jYZncTri1Peu5A48lOmWd02PkhinYT56fObW6hnOLKwVO775t3ycVR
	 dqsmV/XSDlpYDaxBFngOszwFk5974F05Po7xOgaMMI8GfFMq4cUZ/ORh24wT7SyY9T
	 4rrNUMTLayZrnqbMyj3j0F4zjoIEn7o1QuT/KEIZ0zirf2GpnzOllxb+i8DBttOXQt
	 RTGKQXTCXoG8Gdeqxnj4RdDFiAzm+NItzHDwbqnkUeeE26oPkOockb77oUwKOl2FTQ
	 i86CCqZx/Cxbw==
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Walker Chen <walker.chen@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>,
	Maxim Kochetkov <fido_max@inbox.ru>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jose Abreu <joabreu@synopsys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: (subset) [PATCH v2 0/5] Add I2S support for the StarFive JH7110
 SoC
Date: Wed, 13 Sep 2023 14:42:51 +0100
Message-Id: <20230913-duly-ecosystem-523099962151@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
References: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=conor.dooley@microchip.com; h=from:subject:message-id;
 bh=gTDwtdWsXuWMdJzLCtxk+GWpTOa8FGy41bK8MQux3T0=;
 b=owGbwMvMwCFWscWwfUFT0iXG02pJDKmMe6Jmt63vkdN3PNruwzAj8ueZByc8bA+Wdn9RK5tZK
 M7ylLuxo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABNRXsTIsMCPa/OK6Jt/p4Qe
 UbzmUH11/Z5dzG3aHBWLfqqvTzdR9WJkOPNyR9Dk6/cqJpcFJi/7+mPy4x7VL2sb9x7ecLGLTTO
 hnwUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp;
 fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JMXHDUHE6LFIJYDVP2SINJ4Y4R5POTWV
X-Message-ID-Hash: JMXHDUHE6LFIJYDVP2SINJ4Y4R5POTWV
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JMXHDUHE6LFIJYDVP2SINJ4Y4R5POTWV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Conor Dooley <conor.dooley@microchip.com>

On Mon, 21 Aug 2023 22:41:46 +0800, Xingyu Wu wrote:
> This patch series adds I2S support for the StarFive JH7110 RISC-V
> SoC based on Designware I2S controller. There has three I2S channels
> (RX/TX0/TX1) on the JH7110 SoC, one of which is for record(RX) and
> two for playback(TX).
> 
> The first patch adds support for the StarFive JH7110 SoC in the
> Designware I2S bindings.
> The second patch adds the ops to get data from platform bus in the
> I2S driver.
> The third patch adds support for the StarFive JH7110 SoC in
> the Designware I2S driver.
> The fourth patch fixes the name of I2STX1 pinmux.
> The last patch adds device node of I2S RX/TX0/TX1 in JH7110 dts.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[4/5] riscv: dts: starfive: pinfunc: Fix the pins name of I2STX1
      https://git.kernel.org/conor/c/4e1abae5688a
[5/5] riscv: dts: starfive: Add the nodes and pins of I2Srx/I2Stx0/I2Stx1
      https://git.kernel.org/conor/c/92cfc35838b2

Thanks,
Conor.
