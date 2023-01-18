Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0C26718B3
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 11:14:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 853F83C00;
	Wed, 18 Jan 2023 11:13:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 853F83C00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674036843;
	bh=E/Hrn79MVAYVPSkjJabKf6qSdGEsFkb7wPe9ge5igM0=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qiMAozG9R235rtn8HNcT0HRI9cksIgjne78nlHMpYRlJgPRbUCgTmD/o7eessDFCd
	 KXI8mUGAJ8A3f3Ucw0qLvnmorsd9V/FxjRFTVKCUDPc8WonwQrjX6i2x5W0mo0U2u2
	 X9XLzfbRwuidBIQWvMkYNmSxJGmB+jSMVWwhE8Yg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 006C0F80495;
	Wed, 18 Jan 2023 11:13:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B8BDF80495; Wed, 18 Jan 2023 11:13:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD869F80083
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 11:12:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD869F80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EhEsYHkQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674036780; x=1705572780;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E/Hrn79MVAYVPSkjJabKf6qSdGEsFkb7wPe9ge5igM0=;
 b=EhEsYHkQX4P37nOvdzy6Qjdr6dVYtdrOVozONm7fGU/7W6QY+8P4PVZT
 UZDQBItdM8RdERIbA/Cph9zlUOpV6wCi+qSXs39PkObsrS2V4GhkiYGtu
 Z52247wz+/UWYzAaPmESyVkesMBK7IGuiKukBTLqpfSY8WQIQBCWA6s4J
 R2Hf7r/r0DgYYf/yD77U96AeEMkjYeu2UUJsaT20vViTYyTBMA4ZtI/Rn
 XWYLj8NE6xQE+Vo2rayJhBE2/hYiY0GHNCTXHUZ/lHKJDKQgdTMqr311J
 leajaBx4eFs7Dkp/Ae9/nvpnisuhgj8AIaPogdlcCLDqJZRl0msP/U2Kd w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="304630434"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="304630434"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 02:12:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="661653791"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="661653791"
Received: from kevinkeo-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.26.150])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 02:12:50 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v3 0/3] ASoC: SOF: sof-audio: Fixes for widget prepare and
 unprepare (for 6.2)
Date: Wed, 18 Jan 2023 12:12:52 +0200
Message-Id: <20230118101255.29139-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

Changes since v2:
- re-based on v6.2-rc4 (and tested)
- tags added from AngeloGioacchino Del Regno for patch 2

Changes since v1:
- patches got re-ordered to make them (hopefully) apply on stable when picked
- Added stable tag for 6.1 for the patches
- Added Fixes tag for the swidget NULL check on unprepare

This series contains one fix (first patch) followed by a nice to have safety
belts in case we get a widget from topology which is not handled by SOF and will
not have corresponding swidget associated with.

Mark: these patches now on top of 6.2-rc4 and will not apply without conflict
on next (patch 2 and 3 will ahve conflict)

Regards,
Peter
---
Bard Liao (2):
  ASoC: SOF: sof-audio: unprepare when swidget->use_count > 0
  ASoC: SOF: keep prepare/unprepare widgets in sink path

Ranjani Sridharan (1):
  ASoC: SOF: sof-audio: skip prepare/unprepare if swidget is NULL

 sound/soc/sof/sof-audio.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.39.0

