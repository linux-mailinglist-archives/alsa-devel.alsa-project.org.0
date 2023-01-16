Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A63166BE57
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 13:56:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11BC554AB;
	Mon, 16 Jan 2023 13:55:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11BC554AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673873787;
	bh=HdL9RiOccpxzccaykQqWjxwE9oAmEHnOTFHQ6a5nmNs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Gv1GFZe5j3njcfw1x3PhuyajehPjZf5C7M9LsSBiiHkZtM/r1ZwW2Wl4vUurfmUmu
	 sCdBLf2cfBOTZqY5VSrCX1CcVO7S5f+ic/Rm7fyYr4ZvaFWj7FkrAuUM9Wa+2+shtz
	 43LElEOasiE5eQwjI7Pa2e4dnNE58UthOcktjYwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0670AF8053C;
	Mon, 16 Jan 2023 13:55:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43969F8053A; Mon, 16 Jan 2023 13:55:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E36EAF80083
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 13:55:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E36EAF80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UbXtSW3S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673873712; x=1705409712;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HdL9RiOccpxzccaykQqWjxwE9oAmEHnOTFHQ6a5nmNs=;
 b=UbXtSW3SbQvxyPnKdUjpZB2H7jSAMGzSnLOnp7XEqCskap/+NqozNWuI
 eiu8q0FgT8Q7B42CN40Vw7W14qILhSzSykHQU5li9hBMDh7aiiEQQqxEg
 YqcijvY6BL6LFaNOvvYLA7i0WDQ0OqQwqW5X3iEyBhAdW1Gcy4Zy3am1/
 WOXRoO5VUDOVk4ZBZfnqnTstjQk0eg2Gorstxsixtwnrx+lbSBEYAHWDJ
 LO4q68ZP0G+4JtafNdzOD7fv3CQJZqpXyWVUEEvDjSEs8hwsGvN2m6DnE
 fr6TTX21z1668oU3VcF5zbXrN+OzeTpW36PLtRHYINz4srtNs1s99PgT/ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="325720823"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="325720823"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:55:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="660972401"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="660972401"
Received: from mmclough-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.13.59])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:55:02 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 0/3] ASoC: SOF: sof-audio: Fixes for widget prepare and
 unprepare
Date: Mon, 16 Jan 2023 14:55:03 +0200
Message-Id: <20230116125506.27989-1-peter.ujfalusi@linux.intel.com>
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

Changes since v1:
- patches got re-ordered to make them (hopefully) apply on stable when picked
- Added stable tag for 6.1 for the patches
- Added Fixes tag for the swidget NULL check on unprepare

This series contains one fix (first patch) followed by a nice to have safety
belts in case we get a widget from topology which is not handled by SOF and will
not have corresponding swidget associated with.

Mark: can these be picked for 6.2?

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

