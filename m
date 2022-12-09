Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 033746480D1
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 11:20:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9629A2145;
	Fri,  9 Dec 2022 11:19:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9629A2145
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670581216;
	bh=DEPp7qk7GtOL5rnZusjDN4mo4wl+W+Ir8XnO3Rq567w=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=IbH7PUmdRbIL/Reixta4gR4Iq06HBB+iXNkSOsVJqw4dxOefepA/BuBeKKQn2UY3n
	 FrEWNImssflQudW7mgivJ9g2kP+EymGjuJ7r050ZGTH4vdjbmOIFcBfvxkMG3mucAN
	 uSSe9z8N0z7mtqYKCFIkfsP8nb/Jkmxwp/1nfk70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E03E8F80266;
	Fri,  9 Dec 2022 11:18:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F4AAF8022B; Fri,  9 Dec 2022 11:18:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4848F8022B
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 11:18:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4848F8022B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lGKnfr6o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670581130; x=1702117130;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DEPp7qk7GtOL5rnZusjDN4mo4wl+W+Ir8XnO3Rq567w=;
 b=lGKnfr6oYN8ryZfrj4qvV2Z19jMZI/havXiEKxwJa0rhdprUADmlfYOv
 HUOtgOEWcG+AuTdNiAekVKFdcyjg0uuPw+A0JPlLQSY0RMMNiOv9vmWNZ
 KhzzrxvDAoS8g6a0h8KP2/oQO0K8AA+m0HopT9qMrFQyL/meTuQJWyNMT
 NQ7wm/BbKIS8yj/HCr43JF4H/b30BrYf60OkXwP4YcQ7fVmf9ZTNT9WMD
 TWFw1uYbMHk/bZfp9i6rBRIYEZdLrgyJTnoz4Psj7IsDnJRiI9JU1CsZi
 CSQRTE5R3SNLcfeTlhgmBZmfwJ3YyiyXcpYrOyH+Xx6zJaRg46VsIcZIk g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="316135179"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="316135179"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 02:18:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="649510758"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="649510758"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga007.fm.intel.com with ESMTP; 09 Dec 2022 02:18:44 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH v2 0/3] ALSA: hda/hdmi: i915 keepalive fixes
Date: Fri,  9 Dec 2022 12:18:19 +0200
Message-Id: <20221209101822.3893675-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.38.1
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
Cc: intel-gfx@lists.freedesktop.org, kai.vehmanen@linux.intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A series with multiple fixes to i915 keepalive (KAE)
functionality. First patch fixes issue that is hit on
some A750/770 cards:
https://gitlab.freedesktop.org/drm/intel/-/issues/7353

The two other improve behaviour especially with certain
USB-C docks.

Changes in v2:
 - check for errors from pin_id_to_pin_index()
 
Kai Vehmanen (3):
  ALSA: hda/hdmi: fix i915 silent stream programming flow
  ALSA: hda/hdmi: set default audio parameters for KAE silent-stream
  ALSA: hda/hdmi: fix stream-id config keep-alive for rt suspend

 include/sound/hda_codec.h  |   1 +
 sound/pci/hda/hda_codec.c  |   3 +-
 sound/pci/hda/patch_hdmi.c | 119 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 119 insertions(+), 4 deletions(-)


base-commit: 81a2da5a10a6eaa6ae16108eed4e74651cc296bf
-- 
2.38.1
