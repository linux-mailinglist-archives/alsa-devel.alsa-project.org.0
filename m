Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4718957A8
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 17:02:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D00D62C22;
	Tue,  2 Apr 2024 17:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D00D62C22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712070136;
	bh=XC/KIBuVWENi+nZcHSHtH5poqdXkQwX6utx5Af8jDo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bzjs8136pqG64FEtxSgOt3IJ0gxmqkTrv2v8DB/oajwzcvclHa8YZLxFd1voq0Qc9
	 V8coxZtHxGVpVouQqONvI5aqHK/7EHVMDfozkIqotiPToHIj0p6DD0aME5aoTlN7iF
	 foe7nctZFcktzw89SYdYlmukPrDPXiI0J1CjPzpo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF730F805D6; Tue,  2 Apr 2024 17:01:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFFE3F805BB;
	Tue,  2 Apr 2024 17:01:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C655F8016E; Tue,  2 Apr 2024 17:01:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07F9AF8020D
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 17:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07F9AF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VndpswXJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712070023; x=1743606023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XC/KIBuVWENi+nZcHSHtH5poqdXkQwX6utx5Af8jDo4=;
  b=VndpswXJGxFyaZJlYnh548HuxDTo7WeJko2LAROkJh+Kf6MukjzY5E5L
   BDXqzA94SHOzhFW5P7dxK14qMCHb+6Q6Wc8jwRdtjEbmJfFzAbcwyI2SF
   qcVnvO7XYsOMrpbNriuVYPuy990JBA1UIoxVpI4zNYuEiFi6fy+9TyoIv
   2mOy3IBG1b+AlKuQdjWbfl5X2dHoD7gNj7cWsVo8Ud5QzgxYTkbtThOio
   vhnBJFqqdLVgzRicLCMhRt4O64qdnUB5ONcah88pAyMhHN1xo2/e3/7hp
   khYvrnO3Xtxp1adouVNxH6sFW6fz/g6NaOmFViAOCe6NSqc/QexCyoizu
   Q==;
X-CSE-ConnectionGUID: KlSojDX2TZSzqW/EIyVa5Q==
X-CSE-MsgGUID: dVt8299cSGy9B0TPIk7LOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7433835"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="7433835"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:00:13 -0700
X-CSE-ConnectionGUID: 7E16P8RbQUSCSgoWUteSSw==
X-CSE-MsgGUID: GOPdG6s1RlyM+OvXzqjG8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="22558031"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.212.8.83])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:00:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 4/4] ASoC: SOF: ipc4-topology: remove shadowed variable
Date: Tue,  2 Apr 2024 09:59:59 -0500
Message-Id: <20240402145959.172619-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402145959.172619-1-pierre-louis.bossart@linux.intel.com>
References: <20240402145959.172619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2XPAXZISXEOAGZNFGYLYMDUZ2BNNKXX3
X-Message-ID-Hash: 2XPAXZISXEOAGZNFGYLYMDUZ2BNNKXX3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2XPAXZISXEOAGZNFGYLYMDUZ2BNNKXX3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Cppcheck reports this:

sound/soc/sof/ipc4-topology.c:569:23: style: Local variable 'sdev'
shadows outer variable [shadowVariable]
  struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
                      ^
sound/soc/sof/ipc4-topology.c:512:22: note: Shadowed declaration
 struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
                     ^
sound/soc/sof/ipc4-topology.c:569:23: note: Shadow variable
  struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
                      ^

Remove shadowed variable.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 5cca05842126..427f186ddc11 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -586,7 +586,6 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 	switch (ipc4_copier->dai_type) {
 	case SOF_DAI_INTEL_ALH:
 	{
-		struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 		struct sof_ipc4_alh_configuration_blob *blob;
 		struct snd_soc_dapm_path *p;
 		struct snd_sof_widget *w;
-- 
2.40.1

