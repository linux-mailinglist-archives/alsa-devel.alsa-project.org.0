Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E0A6E1F7D
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 11:41:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96ECAE74;
	Fri, 14 Apr 2023 11:40:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96ECAE74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681465279;
	bh=wyjwIC3Cy5WU+viRyzdkyHAzNFXM1r3VuLYgpEtI3OQ=;
	h=In-Reply-To:References:Subject:From:To:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rQnNvV7laVD+AdwL2xPw37geSTFbh4iCZnbtDb80LGV58feXsLnocaa0D9oEtxdC2
	 PO9XUfkkLx0Y0WFWo+BD2p65L0NcltG66TIR0Hll4NtCHF8STq0enL3IzA684GwNJJ
	 JYKGlJiSEEnHAqXiXzdZBpoABsOWv/QqNxRJA1Oo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4C48F8049C;
	Fri, 14 Apr 2023 11:39:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6ECFBF8032B; Thu, 13 Apr 2023 23:45:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6495CF800E5
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 23:44:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6495CF800E5
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ACV4dJc7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1954B641D1;
	Thu, 13 Apr 2023 21:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3797CC433EF;
	Thu, 13 Apr 2023 21:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681422293;
	bh=wyjwIC3Cy5WU+viRyzdkyHAzNFXM1r3VuLYgpEtI3OQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ACV4dJc7m/PMzJd0ORQurNYPYOMbHI+ezUMpAoVoLD2TcxTUalLqPPpJtALsZLeJb
	 BEtZnCJtUIXD5CjbK+1ClFdZLc9eYqceaGYzSoahVJ/K6U5Aqf5YdcIP6GD4IilsQy
	 dOy90zE7iEAJsisMRAMzA8TlO0S4VUEDMAW+DQAGiLu6DsW4HfAofVliB7kfC66oXd
	 bbj+fJFaUkhS5O0TxxeJAwkCGx8Ir3/wHoxVeBqkAidrJasFoYZXcdVIM9nFZylroG
	 mG6SePWOiq8owicG2JA4Ofq34WhZ4YzrrwxsaPqUu34tWKggJKtoTrm1XL9ZdW3VFY
	 +M7eEYKNKhrog==
Message-ID: <636b8f855b6009ba068010e00c20e7f5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
Subject: Re: [PATCH v3 00/65] clk: Make determine_rate mandatory for muxes
From: Stephen Boyd <sboyd@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Chen-Yu Tsai <wens@csie.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 David Lechner <david@lechnology.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jaroslav Kysela <perex@perex.cz>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Mark Brown <br
 oonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>,
 Michael Turquette <mturquette@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Orson Zhai <orsonzhai@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Samuel Holland <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sekhar Nori <nsekhar@ti.com>, Shawn Guo <shawnguo@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Vinod Koul <vkoul@kernel.org>
Date: Thu, 13 Apr 2023 14:44:51 -0700
User-Agent: alot/0.10
X-MailFrom: sboyd@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: PWV2CC6PTGUFH2VKINIV4FWHU2RBIHWF
X-Message-ID-Hash: PWV2CC6PTGUFH2VKINIV4FWHU2RBIHWF
X-Mailman-Approved-At: Fri, 14 Apr 2023 09:39:38 +0000
CC: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-mips@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Liam Beguin <liambeguin@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PWV2CC6PTGUFH2VKINIV4FWHU2RBIHWF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Quoting Maxime Ripard (2023-04-04 03:10:50)
> Hi,
>=20
> This is a follow-up to a previous series that was printing a warning
> when a mux has a set_parent implementation but is missing
> determine_rate().
>=20
> The rationale is that set_parent() is very likely to be useful when
> changing the rate, but it's determine_rate() that takes the parenting
> decision. If we're missing it, then the current parent is always going
> to be used, and thus set_parent() will not be used. The only exception
> being a direct call to clk_set_parent(), but those are fairly rare
> compared to clk_set_rate().
>=20
> Stephen then asked to promote the warning to an error, and to fix up all
> the muxes that are in that situation first. So here it is :)
>=20

Thanks for resending.

I was thinking that we apply this patch first and then set
determine_rate clk_ops without setting the clk flag. The function name
is up for debate.

---8<---
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 27c30a533759..057dd3ca8920 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -594,45 +594,57 @@ clk_core_forward_rate_req(struct clk_core *core,
 		req->max_rate =3D old_req->max_rate;
 }
=20
-int clk_mux_determine_rate_flags(struct clk_hw *hw,
-				 struct clk_rate_request *req,
-				 unsigned long flags)
+static int
+clk_core_determine_rate_noreparent(struct clk_core *core,
+				   struct clk_rate_request *req)
 {
-	struct clk_core *core =3D hw->core, *parent, *best_parent =3D NULL;
-	int i, num_parents, ret;
+	struct clk_core *parent;
+	int ret;
 	unsigned long best =3D 0;
=20
-	/* if NO_REPARENT flag set, pass through to current parent */
-	if (core->flags & CLK_SET_RATE_NO_REPARENT) {
-		parent =3D core->parent;
-		if (core->flags & CLK_SET_RATE_PARENT) {
-			struct clk_rate_request parent_req;
-
-			if (!parent) {
-				req->rate =3D 0;
-				return 0;
-			}
+	parent =3D core->parent;
+	if (core->flags & CLK_SET_RATE_PARENT) {
+		struct clk_rate_request parent_req;
=20
-			clk_core_forward_rate_req(core, req, parent, &parent_req, req->rate);
+		if (!parent) {
+			req->rate =3D 0;
+			return 0;
+		}
=20
-			trace_clk_rate_request_start(&parent_req);
+		clk_core_forward_rate_req(core, req, parent, &parent_req, req->rate);
=20
-			ret =3D clk_core_round_rate_nolock(parent, &parent_req);
-			if (ret)
-				return ret;
+		trace_clk_rate_request_start(&parent_req);
=20
-			trace_clk_rate_request_done(&parent_req);
+		ret =3D clk_core_round_rate_nolock(parent, &parent_req);
+		if (ret)
+			return ret;
=20
-			best =3D parent_req.rate;
-		} else if (parent) {
-			best =3D clk_core_get_rate_nolock(parent);
-		} else {
-			best =3D clk_core_get_rate_nolock(core);
-		}
+		trace_clk_rate_request_done(&parent_req);
=20
-		goto out;
+		best =3D parent_req.rate;
+	} else if (parent) {
+		best =3D clk_core_get_rate_nolock(parent);
+	} else {
+		best =3D clk_core_get_rate_nolock(core);
 	}
=20
+	req->rate =3D best;
+
+	return 0;
+}
+
+int clk_mux_determine_rate_flags(struct clk_hw *hw,
+				 struct clk_rate_request *req,
+				 unsigned long flags)
+{
+	struct clk_core *core =3D hw->core, *parent, *best_parent =3D NULL;
+	int i, num_parents, ret;
+	unsigned long best =3D 0;
+
+	/* if NO_REPARENT flag set, pass through to current parent */
+	if (core->flags & CLK_SET_RATE_NO_REPARENT)
+		return clk_core_determine_rate_noreparent(core, req);
+
 	/* find the parent that can provide the fastest rate <=3D rate */
 	num_parents =3D core->num_parents;
 	for (i =3D 0; i < num_parents; i++) {
@@ -670,9 +682,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 	if (!best_parent)
 		return -EINVAL;
=20
-out:
-	if (best_parent)
-		req->best_parent_hw =3D best_parent->hw;
+	req->best_parent_hw =3D best_parent->hw;
 	req->best_parent_rate =3D best;
 	req->rate =3D best;
=20
@@ -772,6 +782,24 @@ int __clk_mux_determine_rate_closest(struct clk_hw *hw,
 }
 EXPORT_SYMBOL_GPL(__clk_mux_determine_rate_closest);
=20
+/**
+ * clk_hw_determine_rate_noreparent - clk_ops::determine_rate implementati=
on for a clk that doesn't reparent
+ * @hw: clk to determine rate on
+ * @req: rate request
+ *
+ * Helper for finding best parent rate to provide a given frequency. This =
can
+ * be used directly as a determine_rate callback (e.g. for a mux), or from=
 a
+ * more complex clock that may combine a mux with other operations.
+ *
+ * Returns: 0 on success, -EERROR value on error
+ */
+int clk_hw_determine_rate_noreparent(struct clk_hw *hw,
+				     struct clk_rate_request *req)
+{
+	return clk_core_determine_rate_noreparent(hw->core, req);
+}
+EXPORT_SYMBOL_GPL(clk_hw_determine_rate_noreparent);
+
 /***        clk api        ***/
=20
 static void clk_core_rate_unprotect(struct clk_core *core)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 28ff6f1a6ada..958977231ff7 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1333,6 +1333,8 @@ int __clk_mux_determine_rate_closest(struct clk_hw *h=
w,
 int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags);
+int clk_hw_determine_rate_noreparent(struct clk_hw *hw,
+				     struct clk_rate_request *req);
 void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent);
 void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
 			   unsigned long *max_rate);
--=20
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
