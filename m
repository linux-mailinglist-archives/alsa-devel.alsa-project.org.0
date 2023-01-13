Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB457669D87
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 17:20:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38CBB6601;
	Fri, 13 Jan 2023 17:19:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38CBB6601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673626836;
	bh=7UIrW0U1JEkF4TWjgmyaqPSVRpI/JLtbqkB5o08g/WY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=IqV2JIZL6Urr42PP246uqM+Wn4sgoBd9teUOsQdeyn4IfhckAwGDTEW49uTZA9EbQ
	 zMi5BJz11kHzPXSdEdWE/AXD+IVAuPQJnx/hSvy3WyUnmrhlexFzXfea72wWlTkzYO
	 Cu4g8jJ/ckj00QQwtMvDNJbieAO3TPA+YsNwebvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 415FCF80548;
	Fri, 13 Jan 2023 17:18:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15C34F8053A; Fri, 13 Jan 2023 17:18:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66B1FF80425
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 17:18:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66B1FF80425
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NyQ0NMah
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673626734; x=1705162734;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7UIrW0U1JEkF4TWjgmyaqPSVRpI/JLtbqkB5o08g/WY=;
 b=NyQ0NMah73E1qef1ajM1O3hUBEGn4SqwYpb5sNOJQ/xJBr9s12xQ8d7n
 q1U1j2ejjEY4DQBA8nAx9dECLykRl3RVxG7DO981Wv/Yee7TGXgGVa+DM
 gh8KnDhb3IDuujvOmvQUKgT6TbjAIFmLhICUwSrFjiahglCV4E8HjiSc9
 ZlXNS/FTmAc5XpgQoA24raYUmac0lG8IOPRGh3HBgpm3l+b32GTavzYKa
 t2jgKYjefAjaHjMMdsIPMgpU+NrEkpwM8OrMJgKhhlWIdVNwTy0eNTzW3
 /oN/H72wAq+8LJq46IUl95HJ8i2T1EskSBjhkBKsrpCPKdOnaLp3X7jtK w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="324087549"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="324087549"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 08:18:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="690547406"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="690547406"
Received: from rjmaskel-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.128])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 08:18:40 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 0/3] ASoC: SOF: sof-audio: Fixes for widget prepare and
 unprepare
Date: Fri, 13 Jan 2023 18:18:39 +0200
Message-Id: <20230113161842.22059-1-peter.ujfalusi@linux.intel.com>
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

This series contains one fix (first patch) followed by a nice to have safety
belts in case we get a widget from topology which is not handled by SOF and will
not have corresponding swidget associated with.

I think these can be sent selectively to stable kernels with appropriate
adjustments to apply.

I was not comfortable to add Fixes or Complements tags since the last patch for
sure going to conflict in some stable variants.

Regards,
Peter
---
Bard Liao (2):
  ASoC: SOF: sof-audio: Unprepare when swidget->use_count > 0
  ASoC: SOF: sof-audio: keep prepare/unprepare widgets in sink path

Ranjani Sridharan (1):
  ASoC: SOF: sof-audio: skip prepare/unprepare if swidget is NULL

 sound/soc/sof/sof-audio.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.39.0

