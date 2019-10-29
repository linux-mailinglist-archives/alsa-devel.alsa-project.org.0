Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ED1E8E3E
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 18:37:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B7F02265;
	Tue, 29 Oct 2019 18:36:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B7F02265
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572370620;
	bh=0ql1dxGB2j/qpd27SwcTuyIiTgZ4bM420wg+gQgve28=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=kvX7gAzDltgN4GP+h6pj5JQymBTYGwbQb+sxJiZeMLxeAbO+Bu71VrIAGhRJLpogD
	 U9ubaGKEbFga2LtXADEheVi02938X4M4rCq+9UsMN2BJ9tN1aleuSxPq2bpvBK3LLI
	 LMN4lold1WEq3OcIORxhGf+gf1QM4VzA5jABGAX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4550F803D7;
	Tue, 29 Oct 2019 18:34:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD190F805FD; Tue, 29 Oct 2019 18:34:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_72,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B18EAF8036C
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 18:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B18EAF8036C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="BbrtT2j0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=5a5ZyNrWu/Y3wpzLXPAarsYOelCqTd7udgMdIo7J6Dk=; b=BbrtT2j0AO7b
 U682J1Gw4/dnpMLwRZjRndzcjH2ryYEvsA57bz7UR3crwGrmAut0f2c7BWmxts8HU2jdAhqmjatda
 R1vlaOgB/g95GH40O7+JktgZ+UVn7nA29a3jPeUbsAQPtGAn+gH72SV0GEnzfdY2U1/bdJ2TDQ2am
 YFD/I=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iPVNt-0002kk-JF; Tue, 29 Oct 2019 17:34:21 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 0D65B2742157; Tue, 29 Oct 2019 17:34:20 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20191029134017.18901-2-kai.vehmanen@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191029173421.0D65B2742157@ypsilon.sirena.org.uk>
Date: Tue, 29 Oct 2019 17:34:20 +0000 (GMT)
Cc: libin.yang@intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, tiwai@suse.de,
 pierre-louis.bossart@linux.intel.com, julia.lawall@lip6.fr,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ALSA: hda/hdmi - implement mst_no_extra_pcms
	flag" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ALSA: hda/hdmi - implement mst_no_extra_pcms flag

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 2a2edfbbfee47947dd05f5860c66c0e80ee5e09d Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Tue, 29 Oct 2019 15:40:09 +0200
Subject: [PATCH] ALSA: hda/hdmi - implement mst_no_extra_pcms flag

To support the DP-MST multiple streams via single connector feature,
the HDMI driver was extended with the concept of backup PCMs. See
commit 9152085defb6 ("ALSA: hda - add DP MST audio support").

This implementation works fine with snd_hda_intel.c as PCM topology
is fully managed within the single driver.

When the HDA codec driver is used from ASoC components, the concept
of backup PCMs no longer fits. For ASoC topologies, the physical
HDMI converters are presented as backend DAIs and these should match
with hardware capabilities. The ASoC topology may define arbitrary
PCMs (i.e. frontend DAIs) and have processing elements before eventual
routing to the HDMI BE DAIs. With backup PCMs, the link between
FE and BE DAIs would become dynamic and change when monitors are
(un)plugged. This would lead to modifying the topology every time
hotplug events happen, which is not currently possible in ASoC and
there does not seem to be any obvious benefits from this design.

To overcome above problems and enable the HDMI driver to be used
from ASoC, this patch adds a new mode (mst_no_extra_pcms flags) to
patch_hdmi.c. In this mode, the codec driver does not assume
the backup PCMs to be created.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191029134017.18901-2-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/hda_codec.h  |  1 +
 sound/pci/hda/patch_hdmi.c | 19 ++++++++++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 9a0393cf024c..ac18f428eda6 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -254,6 +254,7 @@ struct hda_codec {
 	unsigned int force_pin_prefix:1; /* Add location prefix */
 	unsigned int link_down_at_suspend:1; /* link down at runtime suspend */
 	unsigned int relaxed_resume:1;	/* don't resume forcibly for jack */
+	unsigned int mst_no_extra_pcms:1; /* no backup PCMs for DP-MST */
 
 #ifdef CONFIG_PM
 	unsigned long power_on_acct;
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index bca5de78e9ad..59aaee4a40fd 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2072,15 +2072,24 @@ static bool is_hdmi_pcm_attached(struct hdac_device *hdac, int pcm_idx)
 static int generic_hdmi_build_pcms(struct hda_codec *codec)
 {
 	struct hdmi_spec *spec = codec->spec;
-	int idx;
+	int idx, pcm_num;
 
 	/*
 	 * for non-mst mode, pcm number is the same as before
-	 * for DP MST mode, pcm number is (nid number + dev_num - 1)
-	 *  dev_num is the device entry number in a pin
-	 *
+	 * for DP MST mode without extra PCM, pcm number is same
+	 * for DP MST mode with extra PCMs, pcm number is
+	 *  (nid number + dev_num - 1)
+	 * dev_num is the device entry number in a pin
 	 */
-	for (idx = 0; idx < spec->num_nids + spec->dev_num - 1; idx++) {
+
+	if (codec->mst_no_extra_pcms)
+		pcm_num = spec->num_nids;
+	else
+		pcm_num = spec->num_nids + spec->dev_num - 1;
+
+	codec_dbg(codec, "hdmi: pcm_num set to %d\n", pcm_num);
+
+	for (idx = 0; idx < pcm_num; idx++) {
 		struct hda_pcm *info;
 		struct hda_pcm_stream *pstr;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
