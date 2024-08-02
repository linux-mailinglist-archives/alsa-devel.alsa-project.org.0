Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 398AA945E14
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 14:47:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A437D4619;
	Fri,  2 Aug 2024 14:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A437D4619
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722602851;
	bh=fpxs6tDpDWLpeRh4dVFvDcdkPptt+K5RS8hhS8lBskk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kKaACgWsEyrf25ETKe78N+K7mEA8T+RxKdo7+GE4J1zuBntqQGE/cOWEeQFWVU+HO
	 VH/vamWM1JAIyj74PCqZplPHSxmhjHTBV0HlN3L2QblJUvJu9UseaCvAEL7q7u5fIa
	 7Qk6V7EuXOPuXDQenGDgKHL1NmlT9OdsKvu7iMvc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 473CCF805FC; Fri,  2 Aug 2024 14:46:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63A82F805FD;
	Fri,  2 Aug 2024 14:46:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E492F8026A; Fri,  2 Aug 2024 14:46:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 575F1F800E3
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 14:46:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 575F1F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=feCCQgh5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722602789; x=1754138789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fpxs6tDpDWLpeRh4dVFvDcdkPptt+K5RS8hhS8lBskk=;
  b=feCCQgh5weatGsnwYXzt20c9HM++RLA4i8QuPwhSOBjNXEu5UlUQ9LTg
   WZAFm47eKPL1Ii9hTbDOCSxJaO10NdTKb+/X6kBR21WxhNVK1fUZbY0X4
   l2LzfLr3klY2f0Lo4/Od1jpEaB/xU6Uub0gLk9nGViQem14Oh+61rEDCu
   ftndPs5Tqca5UVjS+QGccFMjeMcZkYat6jy/URNWVL9k5hsOINfeyuW3H
   Pp+hMpXWMA2W05AITMY0OduYYqDqpmWUhUeIzk5OmEFASqaaQCrU1UAk3
   Jnjd/3Ww8KGi409jPgCKFVji3BylZUp/SWDSwczKhFaHvSi1TxlQd2k9q
   A==;
X-CSE-ConnectionGUID: O0BXqcSPQjS6brWCEbYyaw==
X-CSE-MsgGUID: tD4WlcfxSKyDYVZoHI0UsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20199384"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800";
   d="scan'208";a="20199384"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:46:26 -0700
X-CSE-ConnectionGUID: PhUPz21JQ7SWHBluGA8WtQ==
X-CSE-MsgGUID: dSMUo1SuSQaG1MLr/Onh+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800";
   d="scan'208";a="60407872"
Received: from ltuz-desk.ger.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.245.246.89])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:46:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 2/4] ASoC: SOF: sof-priv.h: optimize snd_sof_mailbox
Date: Fri,  2 Aug 2024 14:46:07 +0200
Message-ID: <20240802124609.188954-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240802124609.188954-1-pierre-louis.bossart@linux.intel.com>
References: <20240802124609.188954-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZVJ5NTTCEYDTQG2BDIKAUEPQTGCIS225
X-Message-ID-Hash: ZVJ5NTTCEYDTQG2BDIKAUEPQTGCIS225
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZVJ5NTTCEYDTQG2BDIKAUEPQTGCIS225/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reverse the two members to remove a hole.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 28179a573762..6ecc58e11592 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -412,8 +412,8 @@ struct snd_sof_debugfs_map {
 
 /* mailbox descriptor, used for host <-> DSP IPC */
 struct snd_sof_mailbox {
-	u32 offset;
 	size_t size;
+	u32 offset;
 };
 
 /* IPC message descriptor for host <-> DSP IO */
-- 
2.43.0

