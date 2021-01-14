Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4986A2F5B42
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 08:26:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C35AD1684;
	Thu, 14 Jan 2021 08:25:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C35AD1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610609204;
	bh=ZbqcPK3H8xKq0PXjq+fjqbzKBvYGhlIHeOXRFkeD7QE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NXd5Kp00lZ/8Ak/WequqNb31L4FCZlqBhQzJw6Llms/z9titsdpYBaHVD3P8TFM+M
	 xZpVuPtLlj7/BxhMer7YIQkv02G/AcppVyhKqSgCTtCs/iBIeNAVFjyLh8gbYCBRke
	 cup9VogVq8+jFP3jb8qQGxhm5drt6BJefJ9E1SK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FB8FF8026F;
	Thu, 14 Jan 2021 08:25:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 156F7F8025E; Thu, 14 Jan 2021 08:25:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A939F80113
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 08:24:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A939F80113
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 445A9AB7A
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 07:24:55 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/via: Add minimum mute flag
Date: Thu, 14 Jan 2021 08:24:53 +0100
Message-Id: <20210114072453.11379-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

It turned out that VIA codecs also mute the sound in the lowest mixer
level.  Turn on the dac_min_mute flag to indicate the mute-as-minimum
in TLV like already done in Conexant and IDT codecs.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=210559
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_via.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_via.c b/sound/pci/hda/patch_via.c
index 0ab40a8a68fb..834367dd54e1 100644
--- a/sound/pci/hda/patch_via.c
+++ b/sound/pci/hda/patch_via.c
@@ -113,6 +113,7 @@ static struct via_spec *via_new_spec(struct hda_codec *codec)
 		spec->codec_type = VT1708S;
 	spec->gen.indep_hp = 1;
 	spec->gen.keep_eapd_on = 1;
+	spec->gen.dac_min_mute = 1;
 	spec->gen.pcm_playback_hook = via_playback_pcm_hook;
 	spec->gen.add_stereo_mix_input = HDA_HINT_STEREO_MIX_AUTO;
 	codec->power_save_node = 1;
-- 
2.26.2

