Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A7680A458
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Dec 2023 14:22:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 252C2209;
	Fri,  8 Dec 2023 14:22:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 252C2209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702041748;
	bh=N+jsBkp8QleY9VxgwP4ibX3XPOPGrBqnXEY3sDdAqlM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qb7Hq8/p5IjMdDnGeVmwTdOqBOjyxIMIJaXE9Pwi+eTJQha5VeotRhkBfchqHuf8E
	 Y/QL8zqGDWx8qz0sxaNhevjYGZfNHtW/xDWDr+hWRrukVYQ8BoXJu0XYxnktdPoXSs
	 +teKMGQ1hBqQySIm/ff0B68nFrGF7+UpmQ6aGrRA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9C67F8057B; Fri,  8 Dec 2023 14:21:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC377F80578;
	Fri,  8 Dec 2023 14:21:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99454F8024E; Fri,  8 Dec 2023 14:21:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C8D9F800D2
	for <alsa-devel@alsa-project.org>; Fri,  8 Dec 2023 14:21:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C8D9F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=O6AKGlpG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702041706; x=1733577706;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N+jsBkp8QleY9VxgwP4ibX3XPOPGrBqnXEY3sDdAqlM=;
  b=O6AKGlpGxS1SBGOPAlnzUPjqjsPkCEjkHp9g7QaoqIvh+PoloCge3FOY
   Fq4bF0JVY+sFJzgF8Pq0w/ma3Gt4gpCV4Q20HsoxmCoETsVtLOBLqYkeq
   i2j8v6bZor91e1lx5oL4Qngv1SXJWQEawmANF3h/ES34FC23w3v6Bb4KW
   Rw9nbkAaBDv14fqxlGJLUpWMF8WKsFrN8OtiuRkAkLgdg08psztEFE3wf
   D0wg2feglP5kgcJnHuKzJBk5f5uyDEMGALpDeAtEYBMIbP7+SVu41e0yW
   YcBMFJukwsqc3C6gK+rIwBgUH3Du+FYSI0iWSCg/mjt62IWiFl02TxhT3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="394141768"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600";
   d="scan'208";a="394141768"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 05:21:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="915948502"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600";
   d="scan'208";a="915948502"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by fmsmga001.fm.intel.com with ESMTP; 08 Dec 2023 05:21:38 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: linux-sound@vger.kernel.org,
	tiwai@suse.de
Cc: kai.vehmanen@linux.intel.com,
	alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ALSA: hda/hdmi: add force-connect quirks
Date: Fri,  8 Dec 2023 15:21:25 +0200
Message-ID: <20231208132127.2438067-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QQELRKQIFGPOANTCCSJQRLT7HJSMH3OP
X-Message-ID-Hash: QQELRKQIFGPOANTCCSJQRLT7HJSMH3OP
X-MailFrom: kai.vehmanen@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QQELRKQIFGPOANTCCSJQRLT7HJSMH3OP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series addresses problems seen on a few older Intel based
systems as found by the DRM i915 CI and the inject-audio test.

The patches in series have been separately tested on top
of drm-tip at:
https://patchwork.freedesktop.org/series/127515/
https://patchwork.freedesktop.org/series/127305/

Kai Vehmanen (2):
  ALSA: hda/hdmi: add force-connect quirk for NUC5CPYB
  ALSA: hda/hdmi: add force-connect quirks for ASUSTeK Z170 variants

 sound/pci/hda/patch_hdmi.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.43.0

