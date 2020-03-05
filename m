Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5916E179EF6
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 06:13:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 551F51666;
	Thu,  5 Mar 2020 06:12:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 551F51666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583385223;
	bh=eAI2MeAXiE9WnQxo+kX/OozqRzZbHz7Nrr/fKnhaW6s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vlXQU3BmmbMFNVneJeqeKgazCj4t+2hwDX+ZvSbcMobEMySNrbR43cm9ud/maHI/g
	 SGtTLiHazAq0eaNTtYz5zhATuSCm4aGSBf18scPoHp+xLI4cjJOYjWdwOTwV1Y10Jm
	 AZeo2lvyYd0Fse9RSYumuP4mDWCkIC0SERB+PqgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A909F8012D;
	Thu,  5 Mar 2020 06:12:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE42AF80279; Thu,  5 Mar 2020 06:11:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08119F8025F
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 06:11:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08119F8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="kru9ZJbz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="345myiuv"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4E211138E;
 Thu,  5 Mar 2020 00:11:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 05 Mar 2020 00:11:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ITacILZRfXi1W
 FnSgHO3e+AbMrvYqZjUIygzNGKUI8M=; b=kru9ZJbzmSEd0HOkUHbOCaHM/KrXk
 owS3Tv/eKygS0BziNI+N6jlcpazfsv2sPrwDziHuP1DCEG5cbBgaBXU47GLtxkLc
 rKs2U5Afw1/SvT1addK4zNC4IZrYrys7SIwTtGUbATiGy38RLJzZwYe5pBABisJK
 upNNBDk9QjJPYCEXd0aidIUbXI3kjWjMYcCZIvd2jgvaUoT2dhWo3iXWRGnNo0Wp
 EB/6QIlWSAd9A6BegkuUxuKR1BYdQg++seuMSYHysNNky7Ty5kapxTm9lcr4UiSY
 4WLMfXijooOP6kTY8XM8ajwUCKmy9eYXBs3kdUPnzLxJVx4IkndSr8EIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ITacILZRfXi1WFnSgHO3e+AbMrvYqZjUIygzNGKUI8M=; b=345myiuv
 W3nbnP0mjNxLKVJRGtfaNu/La/F8OLoGpHdmu0GLNpB9sn08dwRlXGDZYoR6uHeC
 85Qv+4NMMP3nB7pF72JeJlW1sh7J9EC6xrXkyRsGJAzjie267JueG/clXeTheoxC
 Ehx87X3B6/j8G7lFeJqjvB6mNDHHWuxR3D1K93pStEJjkwNrD9oXthz+dxKwgvcL
 2tHnNYsBk8OQ6KLlc0cXQL8+jgV+ym7/0CHk/6XaSomW6FeB9DdItPoVZPvBucNv
 n0f55r+dy+YSelrlXvjullUwmsrNlaYMM0e9zvdx7q23OUjNJzv+IFIsoW2LZHpu
 qIFIwHfzVcPElg==
X-ME-Sender: <xms:EIpgXhrI6Jh0wR479KBxWFirWTTN7ASq2GayipL-4Wo0WQq9xJVG_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddtledgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucfkph
 epjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:EIpgXucgFRKV1hyE9EDN9yYvsAfQ2p3xoEN6zeCqYCKuzymx6Drt8w>
 <xmx:EIpgXsdYqif45iUx2b9RORisD4dk71hRuMISIhiXpdUKVD6QfER_8A>
 <xmx:EIpgXsdOpmJpYrUBxyFyAlaVmptKziUaAy6Q4u07mSA8Wdhx5-kiHw>
 <xmx:EopgXgcWR3wmsBbQrKR2HcKWeXRTGxw5vDgEJjn-WhYROkU1atk0Vg>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7710E3280066;
 Thu,  5 Mar 2020 00:11:44 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v4 1/3] ALSA: pcm: Add a standalone version of
 snd_pcm_limit_hw_rates
Date: Wed,  4 Mar 2020 23:11:41 -0600
Message-Id: <20200305051143.60691-2-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200305051143.60691-1-samuel@sholland.org>
References: <20200305051143.60691-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
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

It can be useful to derive min/max rates of a snd_pcm_hardware without
having a snd_pcm_runtime, such as before constructing an ASoC DAI link.

Create a new helper that takes a pointer to a snd_pcm_hardware directly,
and refactor the original function as a wrapper around it, to avoid
needing to update any call sites.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 include/sound/pcm.h   |  9 ++++++++-
 sound/core/pcm_misc.c | 18 +++++++++---------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 2628246b76fa..f7a95b711100 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1127,7 +1127,14 @@ snd_pcm_kernel_readv(struct snd_pcm_substream *substream,
 	return __snd_pcm_lib_xfer(substream, bufs, false, frames, true);
 }
 
-int snd_pcm_limit_hw_rates(struct snd_pcm_runtime *runtime);
+int snd_pcm_hw_limit_rates(struct snd_pcm_hardware *hw);
+
+static inline int
+snd_pcm_limit_hw_rates(struct snd_pcm_runtime *runtime)
+{
+	return snd_pcm_hw_limit_rates(&runtime->hw);
+}
+
 unsigned int snd_pcm_rate_to_rate_bit(unsigned int rate);
 unsigned int snd_pcm_rate_bit_to_rate(unsigned int rate_bit);
 unsigned int snd_pcm_rate_mask_intersect(unsigned int rates_a,
diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
index a6a541511534..5dd2e5335900 100644
--- a/sound/core/pcm_misc.c
+++ b/sound/core/pcm_misc.c
@@ -474,32 +474,32 @@ int snd_pcm_format_set_silence(snd_pcm_format_t format, void *data, unsigned int
 EXPORT_SYMBOL(snd_pcm_format_set_silence);
 
 /**
- * snd_pcm_limit_hw_rates - determine rate_min/rate_max fields
- * @runtime: the runtime instance
+ * snd_pcm_hw_limit_rates - determine rate_min/rate_max fields
+ * @hw: the pcm hw instance
  *
  * Determines the rate_min and rate_max fields from the rates bits of
- * the given runtime->hw.
+ * the given hw.
  *
  * Return: Zero if successful.
  */
-int snd_pcm_limit_hw_rates(struct snd_pcm_runtime *runtime)
+int snd_pcm_hw_limit_rates(struct snd_pcm_hardware *hw)
 {
 	int i;
 	for (i = 0; i < (int)snd_pcm_known_rates.count; i++) {
-		if (runtime->hw.rates & (1 << i)) {
-			runtime->hw.rate_min = snd_pcm_known_rates.list[i];
+		if (hw->rates & (1 << i)) {
+			hw->rate_min = snd_pcm_known_rates.list[i];
 			break;
 		}
 	}
 	for (i = (int)snd_pcm_known_rates.count - 1; i >= 0; i--) {
-		if (runtime->hw.rates & (1 << i)) {
-			runtime->hw.rate_max = snd_pcm_known_rates.list[i];
+		if (hw->rates & (1 << i)) {
+			hw->rate_max = snd_pcm_known_rates.list[i];
 			break;
 		}
 	}
 	return 0;
 }
-EXPORT_SYMBOL(snd_pcm_limit_hw_rates);
+EXPORT_SYMBOL(snd_pcm_hw_limit_rates);
 
 /**
  * snd_pcm_rate_to_rate_bit - converts sample rate to SNDRV_PCM_RATE_xxx bit
-- 
2.24.1

