Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4E5593414
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 19:35:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7138E163F;
	Mon, 15 Aug 2022 19:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7138E163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660584915;
	bh=aEDCzx9MLrKU8fuOM9E3qwn8DN9miUx+B2bRPqDnZKg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H5eWfG5xAKqJk9G1QztisDQ0c6QhfWbINsrqmoNQpxvbIkYXguX58lvPu6fxb0wPF
	 9rF7s2/W/JkDs9/UebYAj1OhAUKqheMWU8v0yzyYcQ/ENwI3DUTOwN28PX0U9akJn6
	 XUkGtvf4bkg0rrf84riVWfNZ57fabiID+gcpkb4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3899F80551;
	Mon, 15 Aug 2022 19:33:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C56AF80548; Mon, 15 Aug 2022 19:33:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76EBCF80245
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 19:33:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76EBCF80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="id6f9eOq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660584808; x=1692120808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aEDCzx9MLrKU8fuOM9E3qwn8DN9miUx+B2bRPqDnZKg=;
 b=id6f9eOqoi6SItZtQUPw3Q5m0sqaXYn0NCeWtZPkbfp7LuO1vaFyfmFp
 DIhHzjz2Um/99uguRA+Ocfs2SlcbWnD77t6PW5D/zuqVKK2oaxveQoWjB
 T1Of0bROIh7vQe3VVOKnqh8VFoNh0dv4aMZjrNGsoX3WfdqnM3mWBactI
 zJko6I7yjMyz4G8kHsPiEnXe0LecEtJzd5JF5OPuFfTOnMQuShuf0nWG6
 3qV6Tqn5yuqhi7X0SIrT/4ZFDBJNXT62T52pjUUJY6Jp6Y/8DKGucFbam
 AwgQnm66rDA/T0EmvUhg+BxTI+KwZVRn3zsqq8rJiBPT3M4UTiy8c343K A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="356024282"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="356024282"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 10:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="696049366"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Aug 2022 10:33:24 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	tiwai@suse.com
Subject: [PATCH v2 4/6] ALSA: hda: Always free codec on the device release
Date: Mon, 15 Aug 2022 19:42:25 +0200
Message-Id: <20220815174227.3071323-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815174227.3071323-1-cezary.rojewski@intel.com>
References: <20220815174227.3071323-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

With all HDAudio drivers aligned to make use of the same constructor,
have codec freed on the device release regardless of its type.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/pci/hda/hda_codec.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 384426d7e9dd..aa7a362be290 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -883,13 +883,7 @@ static void snd_hda_codec_dev_release(struct device *dev)
 	snd_hda_sysfs_clear(codec);
 	kfree(codec->modelname);
 	kfree(codec->wcaps);
-
-	/*
-	 * In the case of ASoC HD-audio, hda_codec is device managed.
-	 * It will be freed when the ASoC device is removed.
-	 */
-	if (codec->core.type == HDA_DEV_LEGACY)
-		kfree(codec);
+	kfree(codec);
 }
 
 #define DEV_NAME_LEN 31
-- 
2.25.1

