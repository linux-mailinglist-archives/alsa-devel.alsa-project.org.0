Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFFA48D627
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 11:56:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CA451F17;
	Thu, 13 Jan 2022 11:55:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CA451F17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642071399;
	bh=R3MYWlXynIaGjskSt5vMg9we9n9h7ANzXPm+IB8MvMI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HQ0/nYLvwVnQMK0v5NiDUx9/Hbc0oMFI8GB+fHw0gbNMtx1krIOlq42YtGAcYN5AK
	 V+JnjmIy25mL5VXhdTNCF1E/OH9gcqkAOT7ESqg+rrhV3PAb1TjN1r970CmOb/v8P8
	 ClafWTdBaU8R+m3D1G3JM4oKTIp0hyjr8lsge3Tg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C24ACF80088;
	Thu, 13 Jan 2022 11:55:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1254EF8019B; Thu, 13 Jan 2022 11:55:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01554F80088
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 11:55:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01554F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RTSlMO+o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642071324; x=1673607324;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R3MYWlXynIaGjskSt5vMg9we9n9h7ANzXPm+IB8MvMI=;
 b=RTSlMO+oyc+IbrCA0w0UtNfCH+lXWntjAs1/hGyOXHnMVGUfNydT6/Bd
 t94uxH8Eq+M3UgtHiKFVuWVaIsZWW/HXB3OPos4AQ/IOQywerMzS4NhY3
 8QOPX1IVtdYFB9KBcIVoP6Gu3t4HVSBWZAJBBY/C5ie+A6Z2GQ9Kf6t70
 W3yaAovAyCp8NM7e8uMe/a/55IvrX9KDmi8NS2Efv79kP7XDiadkqLnAI
 oATrjxTS4W+YOgI/1dXMyDmt46Wc+MEeOHsRuUUDHTW4l1/Dx834ws/2B
 JjuThgT24KVUItR7sxNCLsVa6TALqE8nRVMGjEpx7Il+BPyX6biwRWvSF Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="330332917"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="330332917"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 02:55:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="475267030"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.25])
 by orsmga006.jf.intel.com with ESMTP; 13 Jan 2022 02:55:17 -0800
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/2] ALSA: hda: intel-dsp-config: add JasperLake support
Date: Thu, 13 Jan 2022 18:52:18 +0800
Message-Id: <20220113105220.1114694-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Bard Liao <bard.liao@intel.com>
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

Support JasperLake Chromebooks and fix a order issue in config table.

v2:
  - rebase to Takashi's tree
  - add a fix for config table

*** BLURB HERE ***

Brent Lu (2):
  ALSA: hda: intel-dsp-config: add JasperLake support
  ALSA: hda: intel-dsp-config: reorder the config table

 sound/hda/intel-dsp-config.c | 43 +++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 13 deletions(-)

-- 
2.25.1

