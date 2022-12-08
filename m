Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9129764738F
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Dec 2022 16:52:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DF54192D;
	Thu,  8 Dec 2022 16:51:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DF54192D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670514732;
	bh=0+xD+0bD9DOaOg1NSyp7YcykpSy+JSFBnSb0TpKDmKw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e42WfkCv9JFuYc4HekVEFoV9XaTOQtshNGVn0hudmVrhAan09zBmKtBUGfmDrg2EZ
	 DESe773eaY6FgEFUP8nUTZIY3Jb7p8b9y+mS7Gxvkz0UPDBngun6k/AawLCXBQIPmi
	 zRXo7eecBvnKOghi36hDj+KEcr6cy8pVzZFNKaXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F03C6F800F8;
	Thu,  8 Dec 2022 16:51:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88DC2F80121; Thu,  8 Dec 2022 16:51:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6457F80121
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 16:51:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6457F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HTBzvNSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670514673; x=1702050673;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0+xD+0bD9DOaOg1NSyp7YcykpSy+JSFBnSb0TpKDmKw=;
 b=HTBzvNSYthNGOQypKE1zEySzCLe2Ntadnnydy3EQHkQmPSRFmEfer+/J
 eIOKcgpPW5UXETru5FMNiM68U+jMJNO8kPBCcl5pm6+DB5HfyUE2rSlHd
 r9J97Ods+r1hoWxVkbWsnb755E5XzJcLbTSBYyTa1hMlusshvHddgCo+V
 4dxjgevkb1lwUC785SXVpzvEaBhkjhwVtOQzM0YOuT2kezA6o7j41lS/g
 11MrTaP2v3yz46oV0l5H08HmHRQZ2q/tcN5wWEQ+Ll1y6J1gXpiAP0aHI
 2GV5CSj5MC4mObHQn/5PPhx+lf63wAUUns/6NG42btlCzagzo/Whw1kej Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="304856902"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="304856902"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 07:44:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="710514660"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="710514660"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 08 Dec 2022 07:44:21 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH 0/3] ALSA: hda/hdmi: i915 keepalive fixes
Date: Thu,  8 Dec 2022 17:43:55 +0200
Message-Id: <20221208154358.3848764-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: intel-gfx@lists.freedesktop.org, kai.vehmanen@linux.intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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

A series with multiple fixes to i915 keepalive (KAE)
functionality. First patch fixes issue that is hit on
some A750/770 cards:
https://gitlab.freedesktop.org/drm/intel/-/issues/7353

The two other improve behaviour especially with certain
USB-C docks.

Kai Vehmanen (3):
  ALSA: hda/hdmi: fix i915 silent stream programming flow
  ALSA: hda/hdmi: set default audio parameters for KAE silent-stream
  ALSA: hda/hdmi: fix stream-id config keep-alive for rt suspend

 include/sound/hda_codec.h  |   1 +
 sound/pci/hda/hda_codec.c  |   3 +-
 sound/pci/hda/patch_hdmi.c | 114 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 114 insertions(+), 4 deletions(-)


base-commit: 81a2da5a10a6eaa6ae16108eed4e74651cc296bf
-- 
2.38.1

