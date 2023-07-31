Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6837C76A314
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:40:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA5C3850;
	Mon, 31 Jul 2023 23:39:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA5C3850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690839607;
	bh=Bzebpf+PgboJ9OXM7CKrNmzDFd2cjkZIXNYVnb6RFbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s3ono4+ZI8orq3V4oVnwT0hernYvstx1UAx5bfsS3e7eEAYbvNrWufreeysig0HuU
	 ntwMYJsQARGeGFKwpTwlqCVJ4MPba2mIhcTrxZ/2kArhXgRaV6GZNQ6wr6GoYI5Ssj
	 O2RR4GT3UW8IkQfwyUHpvZr0Vd4gK+Bf1MpgZKSI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B04C6F8055A; Mon, 31 Jul 2023 23:38:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4761BF80535;
	Mon, 31 Jul 2023 23:38:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F526F80564; Mon, 31 Jul 2023 23:38:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B42FEF80551
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:38:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B42FEF80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FlGTKX19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839494; x=1722375494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bzebpf+PgboJ9OXM7CKrNmzDFd2cjkZIXNYVnb6RFbs=;
  b=FlGTKX19sGHj6pEq1v+pal7q4xO2k8cdt5662cFSw3/zRwGv4Cv1iTeb
   oYbO7m4ajibVrOv9Wzu7jXNd3IvEM4ZwQTK09s2R77VFQl0TBr9BHCK7O
   iLTQSK64b9a6CYqejKBFKux7opobjSrYacBigXKm6SzDt9dZ3r8HDwRR3
   og6LWTYG+L3ziNPB2JQV+9opBgpAUUzKRWnyqMn1MxmSSPk81kquatIZD
   W2H0baxADAhFTM38qNCfT1ZAjtW910jzTb1a8t0Jp8dEpB2kivwl+duLt
   /L6SAC8ALPxwQu8sjj+Pm3JmgyMRyaWrCdefxquGVhBNLqVcgbyq3fuZt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="366604126"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="366604126"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:38:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="793880073"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="793880073"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:38:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Yaochun Hung <yc.hung@mediatek.com>
Subject: [PATCH 6/8] ASoC: Intel: bdw_rt286: add checks to avoid static
 analysis warnings
Date: Mon, 31 Jul 2023 16:37:46 -0500
Message-Id: <20230731213748.440285-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731213748.440285-1-pierre-louis.bossart@linux.intel.com>
References: <20230731213748.440285-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TUJ6KIJDQ4QNSIRGLU7NXXCP7E6EG3GA
X-Message-ID-Hash: TUJ6KIJDQ4QNSIRGLU7NXXCP7E6EG3GA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TUJ6KIJDQ4QNSIRGLU7NXXCP7E6EG3GA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_soc_card_get_codec_dai() can return NULL, but that value is not
checked for, leading to false-positive static analysis warnings

sound/soc/intel/boards/bdw_rt286.c:190:16: error: dereference of NULL
‘codec_dai’ [CWE-476] [-Werror=analyzer-null-dereference]

  190 |         return snd_soc_component_set_jack(codec_dai->component, NULL, NULL);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ‘card_suspend_pre’: event 1
    |
    |  190 |         return snd_soc_component_set_jack(codec_dai->component, NULL, NULL);
    |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    |      |                |
    |      |                (1) dereference of NULL ‘codec_dai’

This NULL dereference cannot happen, the codec-dai "rt286-aif1" must exists
otherwise the card would not be created. Static analysis cannot know
that however so we might as well squelch this report.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
---
 sound/soc/intel/boards/bdw_rt286.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index b7687a93a923..036579331d8f 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -187,6 +187,9 @@ static int card_suspend_pre(struct snd_soc_card *card)
 {
 	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, "rt286-aif1");
 
+	if (!codec_dai)
+		return 0;
+
 	return snd_soc_component_set_jack(codec_dai->component, NULL, NULL);
 }
 
@@ -194,6 +197,9 @@ static int card_resume_post(struct snd_soc_card *card)
 {
 	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, "rt286-aif1");
 
+	if (!codec_dai)
+		return 0;
+
 	return snd_soc_component_set_jack(codec_dai->component, &card_headset, NULL);
 }
 
-- 
2.39.2

