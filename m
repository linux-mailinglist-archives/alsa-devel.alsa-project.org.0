Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 238FF7C7699
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:21:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B5ECE85;
	Thu, 12 Oct 2023 21:20:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B5ECE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138481;
	bh=BRnHlyoq7yAJKhSu9/5yVO9C4zmQi49Pg9h69jtLTV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NbrGGVqFf25zm64wEFthUCfmXSkVC5ZvViGgvftmUehNRD5kLvCI5r9oZN9kt68Js
	 ur1/YgwpghwowgK/XX70oMhG+7zOeW7i8hPM9UiX1GvXiSbqVgVjS/77Sw27MyA6N1
	 laVc/reQCoEw6bNc9ZN/8qeh3LY1zTIK7Vx/2HSs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FAF8F805A0; Thu, 12 Oct 2023 21:19:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6804F8057D;
	Thu, 12 Oct 2023 21:19:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF62FF802BE; Thu, 12 Oct 2023 21:19:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8405F8019B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:19:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8405F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Z1sK9QmL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697138356; x=1728674356;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BRnHlyoq7yAJKhSu9/5yVO9C4zmQi49Pg9h69jtLTV0=;
  b=Z1sK9QmL/du0dqHCOseRAOgTlIw69YYprQv5Nwv32K/it3tX1qvglEkP
   qHtTzJG3jvMc9ZEJPA7anyrVhwwTlyhKPk/WCL5JcDDXRU2Esea3b7OsE
   jN1SYGmgUKaXtMXVcxkbdRzjIL+2nRghUfuTJmh80FewNXuhShYBOGIhM
   40BfMwU4uUTeJTNUy3TJKPMgyQhmJh1yjHlsxQjOGJsk/4gteJJrlW8NZ
   BifeF/1rDlC604PuIANfo+AHwec+M7x/yvYUECo/xdNQvrzs3306iFA4s
   qVCOS8hCXWkG6Qz3/xaqwtXx/Zen1o3lUxcneq2X+aQZfAiTMg6KG10Xs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="383875357"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="383875357"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:19:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001628005"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="1001628005"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:19:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 2/4] ASoC: SOF: Intel: hda-dsp: Make sure that no irq handler
 is pending before suspend
Date: Thu, 12 Oct 2023 15:18:48 -0400
Message-Id: <20231012191850.147140-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012191850.147140-1-pierre-louis.bossart@linux.intel.com>
References: <20231012191850.147140-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q7ONY7ZD7LUWC6FPV6ASUZSXEAY53CT5
X-Message-ID-Hash: Q7ONY7ZD7LUWC6FPV6ASUZSXEAY53CT5
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q7ONY7ZD7LUWC6FPV6ASUZSXEAY53CT5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

In the existing IPC support, the reply to each IPC message is handled in
an IRQ thread. The assumption is that the IRQ thread is scheduled without
significant delays.

On an experimental (iow, buggy) kernel, the IRQ thread dealing with the
reply to the last IPC message before powering-down the DSP can be delayed
by several seconds. The IRQ thread will proceed with register accesses
after the DSP is powered-down which results in a kernel crash.

While the bug which causes the delay is not in the audio stack, we must
handle such cases with defensive programming to avoid such crashes.

Call synchronize_irq() before proceeding to power down the DSP to make
sure that no irq thread is pending execution.

Closes: https://github.com/thesofproject/linux/issues/4608
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 44f39a520bb3..2445ae7f6b2e 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -699,6 +699,9 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 	if (ret < 0)
 		return ret;
 
+	/* make sure that no irq handler is pending before shutdown */
+	synchronize_irq(sdev->ipc_irq);
+
 	hda_codec_jack_wake_enable(sdev, runtime_suspend);
 
 	/* power down all hda links */
-- 
2.39.2

