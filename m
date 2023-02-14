Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D61D6960D5
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 11:34:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53406827;
	Tue, 14 Feb 2023 11:33:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53406827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676370880;
	bh=YbzeGrESJLA9SWin6T9qoaLi5YwF2SuE136dttXDStw=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MilypT7ZxSOUX5lKcwfsLBVPFkx/rKqCvPwYLWxJ05xU9PyGuzYWE2ULcmOC+bB48
	 fOd7Ex++slI4S+BmyyA7HhWgKr2ehRIGSSebz6De9MgKHWTMwM+AaNpU42i5dTLVw6
	 evGi/BfAK95DlKO+vV1BinNpdideBccMGDxlnOjs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2841FF800F0;
	Tue, 14 Feb 2023 11:33:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1757F80496; Tue, 14 Feb 2023 11:33:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47B5DF8001E
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 11:33:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47B5DF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DJnP7QFj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676370818; x=1707906818;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YbzeGrESJLA9SWin6T9qoaLi5YwF2SuE136dttXDStw=;
  b=DJnP7QFjfWgdOtZEGODYewyAfg7MCoIgATy1Yp2cEcbrgMb/Vo3VHqf7
   NETS22bd/bHXlEejqr6t3rhn794gtmROEZJ3WaxkT74UqZtMbFq4Ejk3z
   lwmuH/tnJq7ItH4AXGXmB2AWoiH6GWt5w8+JTh2NhDvXFxgGYU9lvwtVa
   R9ib2ew6Ktc8GZjce4mrwO3el42wyx872ilShOIxX7GbUTsvDVzUn2iPA
   Qpl1+crqaYMVPZ7hmSpSpGkyQlrLKQi7HZFEJSzXYCb5jDjm1UIbVH1pa
   Ms+4FOZZ/ee+vsgbwdDwnUq6nhDr75f+6I2T/vxM/sZmTFj94oapeqFyB
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="395745404"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000";
   d="scan'208";a="395745404"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 02:33:34 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="811971886"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000";
   d="scan'208";a="811971886"
Received: from unknown (HELO pujfalus-desk.ger.corp.intel.com)
 ([10.252.18.43])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 02:33:32 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 0/5] ASoC: SOF: Intel/ipc4: Support for low power playback
 (d0i3)
Date: Tue, 14 Feb 2023 12:33:40 +0200
Message-Id: <20230214103345.30669-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2L75XZTUW5MXT2DQRUF5TPKETAKCHEBX
X-Message-ID-Hash: 2L75XZTUW5MXT2DQRUF5TPKETAKCHEBX
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2L75XZTUW5MXT2DQRUF5TPKETAKCHEBX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

The following series will enable the the Low Power Audio (LPA) playback on Intel
platforms when using IPC4.

The support is closely follows how IPC3 supports similar use case.

All depending patches are upstream and our CI have been testing this feature for
some time without issues.

Regards,
Peter
---
Rander Wang (5):
  ASoC: SOF: Introduce a new set_pm_gate() IPC PM op
  ASoC: SOF: Intel: hda-dsp: use set_pm_gate according to ipc version
  ASoC: SOF: ipc4: Wake up dsp core before sending ipc msg
  ASoC: SOF: Intel: Enable d0i3 work for ipc4
  ASoC: SOF: Intel: hda-dsp: Set streaming flag for d0i3

 sound/soc/sof/intel/cnl.c     |  2 ++
 sound/soc/sof/intel/hda-dsp.c | 46 ++++++++++++++++++++++++++---------
 sound/soc/sof/intel/hda-ipc.c | 28 +++++++++++++++++++++
 sound/soc/sof/intel/hda.h     |  2 ++
 sound/soc/sof/intel/mtl.c     |  2 ++
 sound/soc/sof/ipc3.c          | 18 ++++++++++++++
 sound/soc/sof/ipc4.c          | 24 ++++++++++++++++++
 sound/soc/sof/sof-priv.h      |  2 ++
 8 files changed, 113 insertions(+), 11 deletions(-)

-- 
2.39.1

