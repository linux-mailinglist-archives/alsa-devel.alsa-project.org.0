Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E46978AC45
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 12:39:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D678827;
	Mon, 28 Aug 2023 12:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D678827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693219156;
	bh=2ts64y8LqH5nYYTq/1jVUunQHC5XZmZk7YNKwKTenIA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mn/OwBZc1gMlhEMXxA6DCYhvvrlVt+2J4D3NDOjpp2VKSDvt/ZmXrfGIUjEMs6M97
	 QBsAFpyLx6saGzF2ZSMZhKnwtrb3oECSdFEs9hWZMSmFjtPeDQ7zzdDcMzwu8438jn
	 3RDmQNlqy8FJHcMYjMziZdFTw6NRNG4Bdp9tOGz0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C25A3F80094; Mon, 28 Aug 2023 12:38:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45397F80155;
	Mon, 28 Aug 2023 12:38:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08DB4F80158; Mon, 28 Aug 2023 12:38:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B215F80094
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 12:38:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B215F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=K1rkr7vy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Yd0fywNS
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B40231F390;
	Mon, 28 Aug 2023 10:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693219094;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aun9ijiKW2pWwPNha50/w4Gs2UOPquc2drMxis1A4kk=;
	b=K1rkr7vytKx1bUZDV3d+YlkhKmwXOzfuUZZlcoosI+D0RqhVNwMOq2KhNRSdItPFOmLZN0
	sEUjUaj+fd/WjosE032UoapnxT1EQAFFKVKZdsgho6lbTFs/ChBq/O3QvS/su2OvPoUNDj
	YGgNW2/b+PTgcjmTsDOs7Qahpubr+5A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693219094;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aun9ijiKW2pWwPNha50/w4Gs2UOPquc2drMxis1A4kk=;
	b=Yd0fywNSWloOSZ298ONQ/hSg9faMjy62YKqW9kLFhnJQsmeuQM7HC2bvHn/MmjLdYuaR9A
	hsjz9zc1vGg5MWBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9674613A11;
	Mon, 28 Aug 2023 10:38:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id fVrbIxZ57GTVWAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 28 Aug 2023 10:38:14 +0000
Date: Mon, 28 Aug 2023 12:38:14 +0200
Message-ID: <87v8czxxih.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.6
In-Reply-To: <8c4fe69de8214f27e2de1e1c37a70dce.broonie@kernel.org>
References: <8c4fe69de8214f27e2de1e1c37a70dce.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U4735F7BJ2O3FN5OI3M7C5IHS3I2W3ZU
X-Message-ID-Hash: U4735F7BJ2O3FN5OI3M7C5IHS3I2W3ZU
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U4735F7BJ2O3FN5OI3M7C5IHS3I2W3ZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 28 Aug 2023 12:16:49 +0200,
Mark Brown wrote:
> 
> The following changes since commit ab0b5072d184bdb013c9c2419cb21c593fa3802a:
> 
>   ASoC: cs35l56: Update ACPI HID and property (2023-08-17 18:36:28 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.6
> 
> for you to fetch changes up to 199cd64140f222c66b68ebe288a3fcd0570e2e41:
> 
>   ASoC: soc-core.c: Do not error if a DAI link component is not found (2023-08-24 21:10:45 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v6.6
> 
> The rest of the updates for v6.6, some of the highlights include:
> 
>  - A big API cleanup from Morimoto-san, rationalising the places we put
>    functions.
>  - Lots of work on the SOF framework, AMD and Intel drivers, including a
>    lot of cleanup and new device support.
>  - Standardisation of the presentation of jacks from drivers.
>  - Provision of some generic sound card DT properties.
>  - Conversion oof more drivers to the maple tree register cache.
>  - New drivers for AMD Van Gogh, AWInic AW88261, Cirrus Logic cs42l43,
>    various Intel platforms, Mediatek MT7986, RealTek RT1017 and StarFive
>    JH7110.

This resulted in the build error on x86 without CONFIG_OF.

sound/soc/dwc/dwc-i2s.c:908:12: error: ¡jh7110_i2stx0_clk_cfg¢ defined but not used [-Werror=unused-function]
 static int jh7110_i2stx0_clk_cfg(struct i2s_clk_config_data *config)
            ^~~~~~~~~~~~~~~~~~~~~
sound/soc/dwc/dwc-i2s.c:891:12: error: ¡jh7110_i2srx_crg_init¢ defined but not used [-Werror=unused-function]
 static int jh7110_i2srx_crg_init(struct dw_i2s_dev *dev)
            ^~~~~~~~~~~~~~~~~~~~~
sound/soc/dwc/dwc-i2s.c:733:12: error: ¡jh7110_i2s_crg_master_init¢ defined but not used [-Werror=unused-function]
 static int jh7110_i2s_crg_master_init(struct dw_i2s_dev *dev)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~

The fix below seems working.  If you don't mind, I'll apply it (after
submitting properly) on my sound.git tree.  Let me know.

We can put __maybe_unused instead, but there are many functions
involved, so I took ifdef that need smaller changes.


thanks,

Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ASoC: dwc: i2s: Fix unused functions

A few newly added functions aren't built unless CONFIG_OF is set,
which result in the build failure due to defined-but-not-used errors.

Put "#ifdef CONFIG_OF" around those functions to suppress the build
error.

Fixes: 52ea7c0543f8 ("ASoC: dwc: i2s: Add StarFive JH7110 SoC support")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/dwc/dwc-i2s.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 5ab1b3eb2d28..22c004179214 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -729,6 +729,7 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *dev,
 
 }
 
+#ifdef CONFIG_OF
 /* clocks initialization with master mode on JH7110 SoC */
 static int jh7110_i2s_crg_master_init(struct dw_i2s_dev *dev)
 {
@@ -912,6 +913,7 @@ static int jh7110_i2stx0_clk_cfg(struct i2s_clk_config_data *config)
 
 	return clk_set_rate(dev->clk, bclk_rate);
 }
+#endif /* CONFIG_OF */
 
 static int dw_i2s_probe(struct platform_device *pdev)
 {
-- 
2.35.3

