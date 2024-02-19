Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DC685ABCA
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Feb 2024 20:11:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8754A4B;
	Mon, 19 Feb 2024 20:11:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8754A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708369888;
	bh=Qgm4yRczBnXgjpxAD+i1bsbP2xXCEc56/SoGjrcpzPo=;
	h=In-Reply-To:References:Subject:From:To:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NI45d0UZUolEfgOVu8J66ZK/3vM/U7lPDR1j2dqnDwIhumZL1AY+RpHlwlG4l3X2n
	 L6GkV8wy3PYKG0amhY21tJ44vaHkVGxcMoc4ilGa6EH83JtPS5gh6fxvqazqq5zW2T
	 Gf9JlAju3xWtTlsPFKTzlZgrMwqL8yumiSlp9WYM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B35F9F80568; Mon, 19 Feb 2024 20:10:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 463A9F805A0;
	Mon, 19 Feb 2024 20:10:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E664CF80496; Mon, 19 Feb 2024 20:09:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8083F8019B
	for <alsa-devel@alsa-project.org>; Mon, 19 Feb 2024 20:08:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8083F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=atM/CvQ3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 314B460F36;
	Mon, 19 Feb 2024 19:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE033C433C7;
	Mon, 19 Feb 2024 19:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708369709;
	bh=Qgm4yRczBnXgjpxAD+i1bsbP2xXCEc56/SoGjrcpzPo=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=atM/CvQ3iM2Anizb1lzybkxvKx4jL0MqzynEc9xfeXYO4jST8XRzcHkXWB1rVSoXm
	 QzyUkIxjMCH9R5YY/PaB5tsF3NM1FDm8ykl4d3vXKA5asaVD7k3T/dyEoh1VZZzkjV
	 kIr74/S+E61h0sUkZdHfsYrdNzab1k3HMtQZRRFEGMUr+2ET8tOcs0ZuNnfT1ZRisK
	 aGWGhy6Ua4SklPFh8q/0UhO+nzJXgQ6wsbcSkaoqa5RFwR1fvwJmxCB+5UNPA+m8me
	 VnACdEWHC3NqCsBvhJZUamXJbuuKbNyTaBxaPGys8l0JPiznLYdaSAmdLDp4bqSWW0
	 hCsk3eP26kWrw==
Message-ID: <e760847bd911671f1e364271888481fd.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <02461595-16b3-4fea-a029-54190e10e6f5@linaro.org>
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
 <38e7e80f61f7c67c984735cf55c3dfb3.sboyd@kernel.org>
 <02461595-16b3-4fea-a029-54190e10e6f5@linaro.org>
Subject: Re: [PATCH] clk: constify the of_phandle_args argument of
 of_clk_provider
From: Stephen Boyd <sboyd@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Nishanth Menon <nm@ti.com>,
 Peng Fan <peng.fan@nxp.com>, Russell King <linux@armlinux.org.uk>,
 Shawn Guo <shawnguo@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
 patches@opensource.cirrus.com
Date: Mon, 19 Feb 2024 11:08:27 -0800
User-Agent: alot/0.10
Message-ID-Hash: KSVZM54WXTPLTE5F2BVEJWZVCRUZZ22Q
X-Message-ID-Hash: KSVZM54WXTPLTE5F2BVEJWZVCRUZZ22Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KSVZM54WXTPLTE5F2BVEJWZVCRUZZ22Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Quoting Krzysztof Kozlowski (2024-02-15 23:12:29)
> On 16/02/2024 00:12, Stephen Boyd wrote:
> > Quoting Krzysztof Kozlowski (2024-02-08 08:37:10)
> >> None of the implementations of the get() and get_hw() callbacks of
> >> "struct of_clk_provider" modify the contents of received of_phandle_ar=
gs
> >> pointer.  They treat it as read-only variable used to find the clock to
> >> return.  Make obvious that implementations are not supposed to modify
> >> the of_phandle_args, by making it a pointer to const.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >=20
> > This will almost certainly break the build once it is merged to
> > linux-next. What's your plan to merge this?
>=20
> First problem is that it might not apply... I prepared it on next to be
> sure all subsystems are updated.
>=20
> The idea is to get reviews and acks and then:
> 1. Maybe it applies cleanly to your tree meaning there will be no
> conflicts with other trees,
> 2. If not, then I can keep rebasing it and it should be applied after rc1.
>=20

The struct clk based version is probably not going to be used in any new
code. If you split the patch up and converted the struct clk based ones
first then that would probably apply without breaking anything, because
new code should only be using the struct clk_hw version.

The struct clk_hw version could be done in two steps. Introduce another
get_hw callback with the const signature, and then update the world to
use that callback, finally remove the old callback. We could call this
callback 'get_clk_hw'. This is probably more work than it's worth
though, but at least this way we don't have to worry about applying
after rc1.

Or perhaps we need to cast everything and use macros? It would be bad if
the callback actually did something with the clkspec and we cast it to
const, but your patch shows that nobody is doing that. We would get rid
of this macro garbage once everything is converted.

---8<---
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 2253c154a824..8e5ed16a97a0 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4818,7 +4818,7 @@ struct of_clk_provider {
 	struct list_head link;
=20
 	struct device_node *node;
-	struct clk *(*get)(struct of_phandle_args *clkspec, void *data);
+	struct clk *(*get)(const struct of_phandle_args *clkspec, void *data);
 	struct clk_hw *(*get_hw)(struct of_phandle_args *clkspec, void *data);
 	void *data;
 };
@@ -4880,8 +4880,8 @@ EXPORT_SYMBOL_GPL(of_clk_hw_onecell_get);
  *
  * This function is *deprecated*. Use of_clk_add_hw_provider() instead.
  */
-int of_clk_add_provider(struct device_node *np,
-			struct clk *(*clk_src_get)(struct of_phandle_args *clkspec,
+int _of_clk_add_provider(struct device_node *np,
+			struct clk *(*clk_src_get)(const struct of_phandle_args *clkspec,
 						   void *data),
 			void *data)
 {
@@ -4914,7 +4914,7 @@ int of_clk_add_provider(struct device_node *np,
=20
 	return ret;
 }
-EXPORT_SYMBOL_GPL(of_clk_add_provider);
+EXPORT_SYMBOL_GPL(_of_clk_add_provider);
=20
 /**
  * of_clk_add_hw_provider() - Register a clock provider for a node
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 1293c38ddb7f..bfc660fa7c8f 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1531,10 +1531,11 @@ struct clk_hw_onecell_data {
 	}
=20
 #ifdef CONFIG_OF
-int of_clk_add_provider(struct device_node *np,
-			struct clk *(*clk_src_get)(struct of_phandle_args *args,
+int _of_clk_add_provider(struct device_node *np,
+			struct clk *(*clk_src_get)(const struct of_phandle_args *args,
 						   void *data),
 			void *data);
+
 int of_clk_add_hw_provider(struct device_node *np,
 			   struct clk_hw *(*get)(struct of_phandle_args *clkspec,
 						 void *data),
@@ -1559,8 +1560,8 @@ int of_clk_detect_critical(struct device_node *np, in=
t index,
=20
 #else /* !CONFIG_OF */
=20
-static inline int of_clk_add_provider(struct device_node *np,
-			struct clk *(*clk_src_get)(struct of_phandle_args *args,
+static inline int _of_clk_add_provider(struct device_node *np,
+			struct clk *(*clk_src_get)(const struct of_phandle_args *args,
 						   void *data),
 			void *data)
 {
@@ -1614,6 +1615,12 @@ static inline int of_clk_detect_critical(struct devi=
ce_node *np, int index,
 }
 #endif /* CONFIG_OF */
=20
+typedef struct clk *(*clk_src_get_fn)(const struct of_phandle_args *args, =
void *data);
+
+#define of_clk_add_provider(np, get, data) ({				\
+		_of_clk_add_provider(np, (clk_src_get_fn)(get), data);		\
+})
+
 void clk_gate_restore_context(struct clk_hw *hw);
=20
 #endif /* CLK_PROVIDER_H */
