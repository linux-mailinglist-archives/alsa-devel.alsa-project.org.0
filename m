Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE01F67F14A
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 23:42:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E9741E7;
	Fri, 27 Jan 2023 23:41:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E9741E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674859364;
	bh=Xu8o9SUYE0MOFc6AyoZrAkbURoocAqE9mPE+RS6SAFE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=oJfyixuunoZhzlkVk3gpDy//EmDK/f8GtHkdPFlIf2IpHeIWEWoxsEzY6Fa9TBgMu
	 0pUWxrFO72kUpJR73BjNOp6/IlLmK3dCXtFztxKOnr5ON9P/q80rZZwg4KMZqO3EbC
	 ozD+Rq9aFi4aGFg8rHf4eKPC14BbYwNGgrfPJSrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A11D7F8028B;
	Fri, 27 Jan 2023 23:41:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 923FEF80272; Fri, 27 Jan 2023 23:41:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE98CF8007C
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 23:41:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE98CF8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=NrN7vxLT
Received: by mail-pj1-x1035.google.com with SMTP id
 nm12-20020a17090b19cc00b0022c2155cc0bso6059078pjb.4
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 14:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hbdmC1vtTeNkMV/JDNk6jpfYAsIwfc685zUxtxSiBBw=;
 b=NrN7vxLTGyvO6uVWeymoBbvSZChgu0wl3/4eS81NaeK5nKnOEwqh7tWUGSFzLTiYoY
 ToqsDJVrkOe6tHI3NMHl4iHOPvIvOslTsEh5lE8QzPg9jf1PhGZ59AMg3TcN9XUPiekX
 84RrrbFSIa/dEB66Ge+4IqrE1gXKvXbKCPJzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hbdmC1vtTeNkMV/JDNk6jpfYAsIwfc685zUxtxSiBBw=;
 b=r1QkyM7yT+iNQYY9I8oiEnvEhrmsOsDH1RBh59SoyTV4o3IzKBpYcnMne5SWpg09iz
 nnZvfN7sL9JBKKNAMQdRq37HQnjH7Ps2fQSurayKC+3wXLVkqsckgbdvH+423b1pGv9b
 8AENAuVNKBJjv+ZWpDMd47s6x1IaMCKzkHvIx2JY9zatfiTi/ZZ39GgXUQL/40yy5drG
 w/ReACYMLkx4sf8qaZgxukdj2ATLoUTp9CvHFuxNHPw3iWsRZHlD+OClYMDiErdlqdAM
 0x616W5JpXtKGq2e3mQfvESVuo6Isp8h5NS9kIBwwv5sFgvmk0bSQJ6CEOVvwGRQMl3P
 htRA==
X-Gm-Message-State: AO0yUKUtlAkAIaNp/iiEbFIBsaTZ/oTcpEXnIotGPOd/V2DQP5oubRWh
 2hIvhMrNexuviRE4yk+Kqxl88OyU1qk3KS2w
X-Google-Smtp-Source: AK7set9LJOkOn4dsUKb0StuHaEgdZ/trComh6kyrxrN3czUiG6SjF/GeYmB55aksjq40ff0ywVthVg==
X-Received: by 2002:a17:903:200a:b0:196:63c8:6aab with SMTP id
 s10-20020a170903200a00b0019663c86aabmr531198pla.40.1674859291321; 
 Fri, 27 Jan 2023 14:41:31 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a170902740b00b0019608291564sm3347808pll.134.2023.01.27.14.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 14:41:30 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: kirkwood: Iterate over array indexes instead of using
 pointer math
Date: Fri, 27 Jan 2023 14:41:29 -0800
Message-Id: <20230127224128.never.410-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1602; h=from:subject:message-id;
 bh=Xu8o9SUYE0MOFc6AyoZrAkbURoocAqE9mPE+RS6SAFE=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBj1FMZvw7JrK+Hre1S3J0c2nerchfvDVjsKmG/daEA
 pKJu5WWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCY9RTGQAKCRCJcvTf3G3AJoe0EA
 CEZJVtR7O3OZgY1TGui2btSTO+vJSmKSXn0g5hN1UTnz3/qSCcE21HjE4yWkAUS6CQZEGm5gEc0d1E
 U4ztzIz9g5wm+u3WnhCWFLNv1/UIE/I/5XDFRgQWnqYrTG3liPv7GUokFPgmT04tdSfNiwMlYI0kMH
 J/PUp1J1sURLT+3mBROpqar0kzR0MN1qV94+RcwEUkLPMHxFzcQtza7WfbKXLvhRo62UdCbDU0YSfX
 n6ShZoREPOPRHLLPiqwcbkyii/Djxc6mrya8BiKRhTFLxExIjiDyUgu99OLnf5JDiSow0+WRCk+wp4
 tA1HSiPXz5kvsYQTMHwawn4A92PehZYWu7k2krTl8Ushlq6ih2jRgBLtPxOjw26j2jsu914Kvro0ad
 fuL/z7hqSoLTExjTdomgGOEhdmcLO5RBA3ZSX5X8K+VJwZBKjk8CMe/9f0ndgwcgCIk0P4DMu7eIJx
 CPMJyQSu+bkQPGM4mPNx2DALfpHd6QJ9bMnJCcwtW30eAfcXvcN9VrIqbad/Lia3nMFslib2Tbt5O6
 33PM0OMcUiGbvz6luZ/agAtGtOI2gN+Ud7DkQafxloBfI1eV3Q6gv7PNWYHcXdRqv1kgIu9X6qO7qz
 HBoOBABUc8IIi0D/LebAFBUx7zCIWndRPt3a7If+2K73mECdg9UQop6Gh7Xw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, linux-hardening@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Walking the dram->cs array was seen as accesses beyond the first array
item by the compiler. Instead, use the array index directly. This allows
for run-time bounds checking under CONFIG_UBSAN_BOUNDS as well. Seen
with GCC 13 with -fstrict-flex-arrays:

../sound/soc/kirkwood/kirkwood-dma.c: In function
'kirkwood_dma_conf_mbus_windows.constprop':
../sound/soc/kirkwood/kirkwood-dma.c:90:24: warning: array subscript 0 is outside array bounds of 'const struct mbus_dram_window[0]' [-Warray-bounds=]
   90 |                 if ((cs->base & 0xffff0000) < (dma & 0xffff0000)) {
      |                      ~~^~~~~~

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 sound/soc/kirkwood/kirkwood-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/kirkwood/kirkwood-dma.c b/sound/soc/kirkwood/kirkwood-dma.c
index 700a18561a94..640cebd2983e 100644
--- a/sound/soc/kirkwood/kirkwood-dma.c
+++ b/sound/soc/kirkwood/kirkwood-dma.c
@@ -86,7 +86,7 @@ kirkwood_dma_conf_mbus_windows(void __iomem *base, int win,
 
 	/* try to find matching cs for current dma address */
 	for (i = 0; i < dram->num_cs; i++) {
-		const struct mbus_dram_window *cs = dram->cs + i;
+		const struct mbus_dram_window *cs = &dram->cs[i];
 		if ((cs->base & 0xffff0000) < (dma & 0xffff0000)) {
 			writel(cs->base & 0xffff0000,
 				base + KIRKWOOD_AUDIO_WIN_BASE_REG(win));
-- 
2.34.1

