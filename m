Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA87B1CC95B
	for <lists+alsa-devel@lfdr.de>; Sun, 10 May 2020 10:23:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EE13165E;
	Sun, 10 May 2020 10:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EE13165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589099013;
	bh=vA5Zdj+SbKAsNVPZ/6S9ckKyuXPJRgICv2woPQ2omzQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MOc/zi3IXgrxKhPpU3oVA/6Qf5yAtM5O6aMBNveR4pVGG/2jeE8ja+OQIL1R3ymwx
	 9u6+SKMVOpU7RLwgjNSev/Mb9yYKMdeMH14EZFHGkg1kO6y5WORGwgwPBJynpCtzMg
	 EY0RF5HICPopNM7s/7PLmWvSFlw1SkHRpJfUHzGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5324F80253;
	Sun, 10 May 2020 10:21:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5ED5F80253; Fri,  8 May 2020 09:48:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C337F800E7
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 09:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C337F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="t4KhXPQU"
Received: by mail-pg1-x544.google.com with SMTP id j21so507510pgb.7
 for <alsa-devel@alsa-project.org>; Fri, 08 May 2020 00:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sycLZWZ790LDtVoBr1ohu9VVVzp033xCqlBhhkWLJmI=;
 b=t4KhXPQUd/bKk8UGTivNwFYqXysuCdXlf0SNWeKsnjI/Wkhzs8+N9Gk9P7I/CbcOsw
 QW5VdlEjHKmPBHf4fCbDV68M5sF/B98onqvpP3Bf1xVLjHFLfrNbQarpbmNZ1ODhRf56
 OOpmRUaqO8yoJBPOQGNTETu80kVcRYoAFDG6BfpfzTFAAZsP1+TRsPKUY7dGNIKI5gnx
 B/ghohy9qk1z4CxIN5K7PZ1vpmnfO9LyUZy0xAF70FDokp6Vq//SqW9y9Dh7UiAYX42C
 e9eLktr4biL0eEf+DDmsc7V1yqHpMIqODDMteJqTdacJ4bdjrZrTiGN6MmLj/yPX6eQM
 YnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sycLZWZ790LDtVoBr1ohu9VVVzp033xCqlBhhkWLJmI=;
 b=OX8OXB+8EspTPySpbGjprYazBIo0C0KRzIAZJMjSSaHJnPh6v3/+33qhkEhoPcucIK
 0Dh5iKaYqAHFej0JZJ8U6qv5Eq0bm99Y7gqHKCfXeMgs9h09AE7mjg2IqFYJKwD3Ce4V
 xD5SIOPw3vyX5k6tGvrXeQBEObKmBSYWhm7NlMpL7ZUKnV7weZ0OpIVnQTLTPe7uOCwB
 j8K7s+e298SwZv8kUeeqLROf01Dmgnxby3LFInwyNiKyE2KPhBowdmc8ncLfgKQHtRJx
 hwWqxQk182IiGHe8/WRYCPanhGHNAayi/gV+a2FpoyOTiazxjO8tAliLShZ7RkwX2/Pf
 iQ3w==
X-Gm-Message-State: AGi0Pubf9h988Eyy/ycEtQy8v6KawBpqrXyxKxidaA6cOv0hNjg+fjSc
 gk7xaUY7cl6RZ5SjVb5Mn50mI//bCT4=
X-Google-Smtp-Source: APiQypKDYUwOtckmrxltT6wAV8MFg1eJVOQxM+g7oZqa/mMRn5YBJLrL+Q6HEBeGjnawAtncQ+R3KQ==
X-Received: by 2002:a63:6a82:: with SMTP id f124mr1071205pgc.378.1588924129692; 
 Fri, 08 May 2020 00:48:49 -0700 (PDT)
Received: from localhost.localdomain ([124.156.210.110])
 by smtp.gmail.com with ESMTPSA id m1sm1647378pjg.26.2020.05.08.00.48.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 May 2020 00:48:48 -0700 (PDT)
From: Yongbo Zhang <giraffesnn123@gmail.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Subject: [PATCH] ASoC: rsnd: add interrupt support for SSI BUSIF buffer
Date: Fri,  8 May 2020 15:47:53 +0800
Message-Id: <20200508074753.10362-1-giraffesnn123@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 10 May 2020 10:21:01 +0200
Cc: Chen Li <licheng0822@thundersoft.com>, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Yongbo Zhang <giraffesnn123@gmail.com>
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

SSI BUSIF buffer is possible to overflow or underflow, especially in a
hypervisor environment. If there is no interrupt support, it will eventually
lead to errors in pcm data.
This patch adds overflow and underflow interrupt support for SSI BUSIF buffer.

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reported-by: Chen Li <licheng0822@thundersoft.com>
Signed-off-by: Yongbo Zhang <giraffesnn123@gmail.com>
Tested-by: Chen Li <licheng0822@thundersoft.com>
---
 sound/soc/sh/rcar/gen.c  |   8 +++
 sound/soc/sh/rcar/rsnd.h |   9 +++
 sound/soc/sh/rcar/ssi.c  | 142 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 159 insertions(+)

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
index 4a7d3413917f..178f50a91b3e 100644
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
@@ -517,6 +559,37 @@ static int rsnd_ssi_quit(struct rsnd_mod *mod,
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
+
 	return 0;
 }
 
@@ -622,6 +695,11 @@ static int rsnd_ssi_irq(struct rsnd_mod *mod,
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
@@ -635,6 +713,19 @@ static int rsnd_ssi_irq(struct rsnd_mod *mod,
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
+			val |= 0xff00;
+			break;
+		}
+	}
+
 	rsnd_mod_write(mod, SSI_INT_ENABLE, val);
 
 	return 0;
@@ -651,6 +742,10 @@ static void __rsnd_ssi_interrupt(struct rsnd_mod *mod,
 	u32 status;
 	bool elapsed = false;
 	bool stop = false;
+	int is_tdm, is_tdm_split;
+
+	is_tdm		= rsnd_runtime_is_tdm(io);
+	is_tdm_split	= rsnd_runtime_is_tdm_split(io);
 
 	spin_lock(&priv->lock);
 
@@ -672,6 +767,53 @@ static void __rsnd_ssi_interrupt(struct rsnd_mod *mod,
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
+				status = rsnd_mod_write(mod,
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
2.26.2

