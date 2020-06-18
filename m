Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C741FDCE4
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:24:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65BA116AA;
	Thu, 18 Jun 2020 03:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65BA116AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592443449;
	bh=rLZ11fgScO8wU6jQ6dDX9fn8ep+lhLKEB6480JVUFe0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DmwrqmpdF9ag9izfX8gDwCyKHZe8xUd4km3AWXnDkGtuPUy1mToTXjd7ZDJBi9mDT
	 fTAU2WDNonH7OTWZUcioY1RyNn4ExFr8EDDVJU5cJfZNApiuaCFUS97hMP2IkeN1Vz
	 vU1MjiSvqZ7scZUHWrFrRIYJ7tR5HMmaOFeCgeDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6CCFF80377;
	Thu, 18 Jun 2020 03:12:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B84F6F8037D; Thu, 18 Jun 2020 03:12:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A8A6F8036C
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 03:12:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A8A6F8036C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RDxpzp1h"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 19CCA21974;
 Thu, 18 Jun 2020 01:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442738;
 bh=rLZ11fgScO8wU6jQ6dDX9fn8ep+lhLKEB6480JVUFe0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RDxpzp1hl2MWHe0CSzz3mp6vRB3ruu3MdSCo4TqoOo4tlqkR1dAfyJGGhIeeq6y/M
 joFS7vDwYprGd40t5lBZZnHu8NukHGgnfWQdXoNM/z4ctpr97AfUSj38Vd1ZwgWpXi
 Uuy9oKpXFYO9Z1ncpnLfa0ratzjZm7DaCUF80SEU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 193/388] SoC: rsnd: add interrupt support for SSI
 BUSIF buffer
Date: Wed, 17 Jun 2020 21:04:50 -0400
Message-Id: <20200618010805.600873-193-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Chen Li <licheng0822@thundersoft.com>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Yongbo Zhang <giraffesnn123@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Yongbo Zhang <giraffesnn123@gmail.com>

[ Upstream commit 66c705d07d784fb6b4622c6e47b6acae357472db ]

SSI BUSIF buffer is possible to overflow or underflow, especially in a
hypervisor environment. If there is no interrupt support, it will eventually
lead to errors in pcm data.
This patch adds overflow and underflow interrupt support for SSI BUSIF buffer.

Reported-by: Chen Li <licheng0822@thundersoft.com>
Signed-off-by: Yongbo Zhang <giraffesnn123@gmail.com>
Tested-by: Chen Li <licheng0822@thundersoft.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/20200512093003.28332-1-giraffesnn123@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sh/rcar/gen.c  |   8 +++
 sound/soc/sh/rcar/rsnd.h |   9 +++
 sound/soc/sh/rcar/ssi.c  | 145 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 162 insertions(+)

diff --git a/sound/soc/sh/rcar/gen.c b/sound/soc/sh/rcar/gen.c
index af19010b9d88..8bd49c8a9517 100644
--- a/sound/soc/sh/rcar/gen.c
+++ b/sound/soc/sh/rcar/gen.c
@@ -224,6 +224,14 @@ static int rsnd_gen2_probe(struct rsnd_priv *priv)
 		RSND_GEN_S_REG(SSI_SYS_STATUS5,	0x884),
 		RSND_GEN_S_REG(SSI_SYS_STATUS6,	0x888),
 		RSND_GEN_S_REG(SSI_SYS_STATUS7,	0x88c),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE0, 0x850),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE1, 0x854),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE2, 0x858),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE3, 0x85c),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE4, 0x890),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE5, 0x894),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE6, 0x898),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE7, 0x89c),
 		RSND_GEN_S_REG(HDMI0_SEL,	0x9e0),
 		RSND_GEN_S_REG(HDMI1_SEL,	0x9e4),
 
diff --git a/sound/soc/sh/rcar/rsnd.h b/sound/soc/sh/rcar/rsnd.h
index ea6cbaa9743e..d47608ff5fac 100644
--- a/sound/soc/sh/rcar/rsnd.h
+++ b/sound/soc/sh/rcar/rsnd.h
@@ -189,6 +189,14 @@ enum rsnd_reg {
 	SSI_SYS_STATUS5,
 	SSI_SYS_STATUS6,
 	SSI_SYS_STATUS7,
+	SSI_SYS_INT_ENABLE0,
+	SSI_SYS_INT_ENABLE1,
+	SSI_SYS_INT_ENABLE2,
+	SSI_SYS_INT_ENABLE3,
+	SSI_SYS_INT_ENABLE4,
+	SSI_SYS_INT_ENABLE5,
+	SSI_SYS_INT_ENABLE6,
+	SSI_SYS_INT_ENABLE7,
 	HDMI0_SEL,
 	HDMI1_SEL,
 	SSI9_BUSIF0_MODE,
@@ -237,6 +245,7 @@ enum rsnd_reg {
 #define SSI9_BUSIF_ADINR(i)	(SSI9_BUSIF0_ADINR + (i))
 #define SSI9_BUSIF_DALIGN(i)	(SSI9_BUSIF0_DALIGN + (i))
 #define SSI_SYS_STATUS(i)	(SSI_SYS_STATUS0 + (i))
+#define SSI_SYS_INT_ENABLE(i) (SSI_SYS_INT_ENABLE0 + (i))
 
 
 struct rsnd_priv;
diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index 4a7d3413917f..47d5ddb526f2 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -372,6 +372,9 @@ static void rsnd_ssi_config_init(struct rsnd_mod *mod,
 	u32 wsr		= ssi->wsr;
 	int width;
 	int is_tdm, is_tdm_split;
+	int id = rsnd_mod_id(mod);
+	int i;
+	u32 sys_int_enable = 0;
 
 	is_tdm		= rsnd_runtime_is_tdm(io);
 	is_tdm_split	= rsnd_runtime_is_tdm_split(io);
@@ -447,6 +450,38 @@ static void rsnd_ssi_config_init(struct rsnd_mod *mod,
 		cr_mode = DIEN;		/* PIO : enable Data interrupt */
 	}
 
+	/* enable busif buffer over/under run interrupt. */
+	if (is_tdm || is_tdm_split) {
+		switch (id) {
+		case 0:
+		case 1:
+		case 2:
+		case 3:
+		case 4:
+			for (i = 0; i < 4; i++) {
+				sys_int_enable = rsnd_mod_read(mod,
+					SSI_SYS_INT_ENABLE(i * 2));
+				sys_int_enable |= 0xf << (id * 4);
+				rsnd_mod_write(mod,
+					       SSI_SYS_INT_ENABLE(i * 2),
+					       sys_int_enable);
+			}
+
+			break;
+		case 9:
+			for (i = 0; i < 4; i++) {
+				sys_int_enable = rsnd_mod_read(mod,
+					SSI_SYS_INT_ENABLE((i * 2) + 1));
+				sys_int_enable |= 0xf << 4;
+				rsnd_mod_write(mod,
+					       SSI_SYS_INT_ENABLE((i * 2) + 1),
+					       sys_int_enable);
+			}
+
+			break;
+		}
+	}
+
 init_end:
 	ssi->cr_own	= cr_own;
 	ssi->cr_mode	= cr_mode;
@@ -496,6 +531,13 @@ static int rsnd_ssi_quit(struct rsnd_mod *mod,
 {
 	struct rsnd_ssi *ssi = rsnd_mod_to_ssi(mod);
 	struct device *dev = rsnd_priv_to_dev(priv);
+	int is_tdm, is_tdm_split;
+	int id = rsnd_mod_id(mod);
+	int i;
+	u32 sys_int_enable = 0;
+
+	is_tdm		= rsnd_runtime_is_tdm(io);
+	is_tdm_split	= rsnd_runtime_is_tdm_split(io);
 
 	if (!rsnd_ssi_is_run_mods(mod, io))
 		return 0;
@@ -517,6 +559,38 @@ static int rsnd_ssi_quit(struct rsnd_mod *mod,
 		ssi->wsr	= 0;
 	}
 
+	/* disable busif buffer over/under run interrupt. */
+	if (is_tdm || is_tdm_split) {
+		switch (id) {
+		case 0:
+		case 1:
+		case 2:
+		case 3:
+		case 4:
+			for (i = 0; i < 4; i++) {
+				sys_int_enable = rsnd_mod_read(mod,
+						SSI_SYS_INT_ENABLE(i * 2));
+				sys_int_enable &= ~(0xf << (id * 4));
+				rsnd_mod_write(mod,
+					       SSI_SYS_INT_ENABLE(i * 2),
+					       sys_int_enable);
+			}
+
+			break;
+		case 9:
+			for (i = 0; i < 4; i++) {
+				sys_int_enable = rsnd_mod_read(mod,
+					SSI_SYS_INT_ENABLE((i * 2) + 1));
+				sys_int_enable &= ~(0xf << 4);
+				rsnd_mod_write(mod,
+					       SSI_SYS_INT_ENABLE((i * 2) + 1),
+					       sys_int_enable);
+			}
+
+			break;
+		}
+	}
+
 	return 0;
 }
 
@@ -622,6 +696,11 @@ static int rsnd_ssi_irq(struct rsnd_mod *mod,
 			int enable)
 {
 	u32 val = 0;
+	int is_tdm, is_tdm_split;
+	int id = rsnd_mod_id(mod);
+
+	is_tdm		= rsnd_runtime_is_tdm(io);
+	is_tdm_split	= rsnd_runtime_is_tdm_split(io);
 
 	if (rsnd_is_gen1(priv))
 		return 0;
@@ -635,6 +714,19 @@ static int rsnd_ssi_irq(struct rsnd_mod *mod,
 	if (enable)
 		val = rsnd_ssi_is_dma_mode(mod) ? 0x0e000000 : 0x0f000000;
 
+	if (is_tdm || is_tdm_split) {
+		switch (id) {
+		case 0:
+		case 1:
+		case 2:
+		case 3:
+		case 4:
+		case 9:
+			val |= 0x0000ff00;
+			break;
+		}
+	}
+
 	rsnd_mod_write(mod, SSI_INT_ENABLE, val);
 
 	return 0;
@@ -651,6 +743,12 @@ static void __rsnd_ssi_interrupt(struct rsnd_mod *mod,
 	u32 status;
 	bool elapsed = false;
 	bool stop = false;
+	int id = rsnd_mod_id(mod);
+	int i;
+	int is_tdm, is_tdm_split;
+
+	is_tdm		= rsnd_runtime_is_tdm(io);
+	is_tdm_split	= rsnd_runtime_is_tdm_split(io);
 
 	spin_lock(&priv->lock);
 
@@ -672,6 +770,53 @@ static void __rsnd_ssi_interrupt(struct rsnd_mod *mod,
 		stop = true;
 	}
 
+	status = 0;
+
+	if (is_tdm || is_tdm_split) {
+		switch (id) {
+		case 0:
+		case 1:
+		case 2:
+		case 3:
+		case 4:
+			for (i = 0; i < 4; i++) {
+				status = rsnd_mod_read(mod,
+						       SSI_SYS_STATUS(i * 2));
+				status &= 0xf << (id * 4);
+
+				if (status) {
+					rsnd_dbg_irq_status(dev,
+						"%s err status : 0x%08x\n",
+						rsnd_mod_name(mod), status);
+					rsnd_mod_write(mod,
+						       SSI_SYS_STATUS(i * 2),
+						       0xf << (id * 4));
+					stop = true;
+					break;
+				}
+			}
+			break;
+		case 9:
+			for (i = 0; i < 4; i++) {
+				status = rsnd_mod_read(mod,
+						SSI_SYS_STATUS((i * 2) + 1));
+				status &= 0xf << 4;
+
+				if (status) {
+					rsnd_dbg_irq_status(dev,
+						"%s err status : 0x%08x\n",
+						rsnd_mod_name(mod), status);
+					rsnd_mod_write(mod,
+						SSI_SYS_STATUS((i * 2) + 1),
+						0xf << 4);
+					stop = true;
+					break;
+				}
+			}
+			break;
+		}
+	}
+
 	rsnd_ssi_status_clear(mod);
 rsnd_ssi_interrupt_out:
 	spin_unlock(&priv->lock);
-- 
2.25.1

