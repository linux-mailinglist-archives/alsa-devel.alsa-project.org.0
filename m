Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B8866E22E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 16:31:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EF6116D4;
	Tue, 17 Jan 2023 16:30:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EF6116D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673969483;
	bh=BTIe1uXK51tM1G7ZRLRvTBRWLkbvsFuGUQE5gbEMWDM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=hIbifkaxEszlblG8axTOpEqRnvS0Ac57mJXhn/fI3IYrfUpjUzq8GrhWQktbHbZAr
	 1LSB8OZOHqcdsHH/jGS7wXNo58afyu+hGbky1vEPNZRIu1UOTmXrkklnOhhpIoyxbp
	 jD7RE2N+JOZzptH5KHSAznkpCX+mGeyjMFmHf20w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24B7AF8022D;
	Tue, 17 Jan 2023 16:30:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4989F8026D; Tue, 17 Jan 2023 16:30:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24FEDF8022D
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 16:30:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24FEDF8022D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=figjkR5T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673969414; x=1705505414;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BTIe1uXK51tM1G7ZRLRvTBRWLkbvsFuGUQE5gbEMWDM=;
 b=figjkR5TuVYyLWi7EARAMFDE6Vzqsx9sxTC76RITICGo8RMpS8TPALeI
 i7G1vQAQBsXHIpsz9Dam7UYRRtTphdRDN+3AKcV5kefsd0lkI+0hQbiq9
 zoun+qLnassD+WIhymMVfVXPBdmuL8uyYXxW+XGYK36TJ1dxZSn7vhumY
 jZFW3RcB9ZdjZcAGcDKXWEDucbMoytaMmNoiRB0tMdxa/yHiSfaGQuM/W
 BFpqmz+WnVRavmbmWEN6jCki92lTAAS62xbaOz6TFlN+8XTnu4x65B9+P
 fmEjNuWUR6mQgkYNksb5JGLvfuyhqMykvFnqSPTcyjTXlBbFmSnOPqMoR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="387068427"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="387068427"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 07:30:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="767321232"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="767321232"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 17 Jan 2023 07:30:08 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.com
Subject: [PATCH] ALSA: hda: Do not unset preset when cleaning up codec
Date: Tue, 17 Jan 2023 16:47:34 +0100
Message-Id: <20230117154734.950487-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Several functions that take part in codec's initialization and removal
are re-used by ASoC codec drivers implementations. Drivers mimic the
behavior of hda_codec_driver_probe/remove() found in
sound/pci/hda/hda_bind.c with their component->probe/remove() instead.

One of the reasons for that is the expectation of
snd_hda_codec_device_new() to receive a valid struct snd_card pointer
what cannot be fulfilled on ASoC side until a card is attempted to be
bound and its component probing is triggered.

As ASoC sound card may be unbound without codec device being actually
removed from the system, unsetting ->preset in 
snd_hda_codec_cleanup_for_unbind() interferes with module unload -> load
scenario causing null-ptr-deref. Preset is assigned only once, during
device/driver matching whereas ASoC codec driver's module reloading may
occur several times throughout the lifetime of an audio stack.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

This is a continuation of a discussion that begun in the middle of 2022
[1] and was part of a larger series addressing several HDAudio topics.

Single rmmod on ASoC's codec driver module is enough to cause a panic.
Given our results, no regression shows up with modprobe/rmmod on
snd_hda_intel side with this patch applied.

[1]: https://lore.kernel.org/alsa-devel/20220706120230.427296-2-cezary.rojewski@intel.com/

 sound/pci/hda/hda_codec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index edd653ece70d..ac1cc7c5290e 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -795,7 +795,6 @@ void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec)
 	snd_array_free(&codec->cvt_setups);
 	snd_array_free(&codec->spdif_out);
 	snd_array_free(&codec->verbs);
-	codec->preset = NULL;
 	codec->follower_dig_outs = NULL;
 	codec->spdif_status_reset = 0;
 	snd_array_free(&codec->mixers);
-- 
2.25.1

