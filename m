Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBEF75C8A4
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 15:58:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C83F8201;
	Fri, 21 Jul 2023 15:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C83F8201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689947880;
	bh=drF6apj2Xqlsdca/3CHoYQLp4/cf0R6BLagVcKHVxbk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JQu81P0E9L99SdycpQUnj6NJr20JCGBElbuD2BFKJOivGl+dG41od37PzmSH+EFxo
	 5roDBk9WY8smznaFaq0S5jCsvh0bs3ZVuJk/rT/zjHf+SBTZ2a/c1YRE1SvNHosMoF
	 wMCszoicSlrnUKSpmEChdqR9EYM2hnRlNwE6Anxw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29DFDF80551; Fri, 21 Jul 2023 15:56:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3CBAF80548;
	Fri, 21 Jul 2023 15:56:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47EA1F80494; Fri, 21 Jul 2023 15:56:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DDC4F8032D
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 15:56:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DDC4F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UOkfmq0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689947774; x=1721483774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=drF6apj2Xqlsdca/3CHoYQLp4/cf0R6BLagVcKHVxbk=;
  b=UOkfmq0EPjxyicl5o6IK7N5UesQSJm81EtQnCB5WSiPy+2IoT/JGO4sJ
   3FBZK25JE8rUMTp0oZqxq3ErlA7cFYPVVvwVzBydab3+LfID9hpRlh2ct
   +Vxgx22H6GdcVCve0J6RnJwunShHV0GpnKuse8q6YuVU9Ya6PAbMei2XC
   rRFQ9vue3zVMbx7ZQcVoP5+cjcTLtQbxyGu97UwKKkZnmSuGQElEgWs+M
   O+sQUWpKhWwRpB/qVepfaTJKifVmAQPmlszE/C5YG5Kqgjnhst5bhYsco
   XshDO3md4kNiT7Ea5KwD9BlMQShhvEQ/o4FGOrc5LRjtsEVu4SzsiI0yk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="370630904"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="370630904"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 06:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="724877910"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="724877910"
Received: from dhardfel-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.223.78])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 06:56:10 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: hda: add HDMI codec ID for Intel LNL
Date: Fri, 21 Jul 2023 16:57:22 +0300
Message-ID: <20230721135722.31288-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721135722.31288-1-peter.ujfalusi@linux.intel.com>
References: <20230721135722.31288-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IWSPRXG2W2MSWAESBBWEZ75ONPVJ7NFX
X-Message-ID-Hash: IWSPRXG2W2MSWAESBBWEZ75ONPVJ7NFX
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IWSPRXG2W2MSWAESBBWEZ75ONPVJ7NFX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Add HDMI codec ID for Intel Lunar Lake platform.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 5139b6e087b3..1cde2a69bdb4 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4634,6 +4634,7 @@ HDA_CODEC_ENTRY(0x8086281b, "Elkhartlake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x8086281c, "Alderlake-P HDMI", patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x8086281d, "Meteor Lake HDMI",	patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x8086281f, "Raptor Lake P HDMI",	patch_i915_adlp_hdmi),
+HDA_CODEC_ENTRY(0x80862820, "Lunar Lake HDMI",	patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x80862880, "CedarTrail HDMI",	patch_generic_hdmi),
 HDA_CODEC_ENTRY(0x80862882, "Valleyview2 HDMI",	patch_i915_byt_hdmi),
 HDA_CODEC_ENTRY(0x80862883, "Braswell HDMI",	patch_i915_byt_hdmi),
-- 
2.41.0

