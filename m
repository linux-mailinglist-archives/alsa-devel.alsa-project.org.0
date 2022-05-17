Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A88C752A94B
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 19:32:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42ABF847;
	Tue, 17 May 2022 19:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42ABF847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652808767;
	bh=zD29DHgdzN12BVxce6xF2P4XGUDqWD6ZhgMapUb23Z0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=brtLNwUYL1xcPgoSlFngUyWbnyEL9R/ZpMJOJKbTWkW33ahZ9XGNmOT4CtE/X9meB
	 qBrOFNh2NQXk1JlWEyRrNS3k7VSnSRY+CaP/92RETJx6uUAPmtpfCf9ts55AlZiGQ1
	 iYjPTXsFCPHX16rTr6TCJoKsPvC2NJCd73o1Kqok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9CF8F800D8;
	Tue, 17 May 2022 19:31:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 709E9F800D8; Tue, 17 May 2022 19:31:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C872F800D8
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 19:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C872F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LIwYIRHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652808704; x=1684344704;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zD29DHgdzN12BVxce6xF2P4XGUDqWD6ZhgMapUb23Z0=;
 b=LIwYIRHOg6l4/ZwReTlsTV+QKQlqbWkgUJm3NA0MAe2oOYRJHQQWsycv
 gnLIod9YD9pGSh/JEvPKMyZvjST9g2jOA14R0/ClGyhwOTHAR5v+2m5M2
 iDb0A8LcGlJp4+QZaIjdbZX37p/kytEB5yWUVlkOteNy1w2erifpJUVHg
 Eepd/e4SjFV+blkdSq5l5YxR81cJgfBklawwlmEmqewQ6Dy19r7eRvUC/
 LDvol6B9QGma/bGBhPR19U09gFBCMyjpeQ8yd/f42x/oLnkKZusJU8nK+
 CS9NBNR5Q8IDBe/k3Sbn5TlolxGoYCemGP9YzeVdU4khuQvsJiv7iWYE2 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="258824298"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="258824298"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 10:31:18 -0700
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="672959364"
Received: from sfilary-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.67.235])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 10:31:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: SOF: mediatek: add debug dump
Date: Tue, 17 May 2022 12:31:07 -0500
Message-Id: <20220517173109.468568-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


YC Hung (2):
  ASoC: SOF: mediatek: Add mediatek common debug dump
  ASoC: SOF: mediatek: Add mt8195 debug dump

 sound/soc/sof/mediatek/Makefile          |  1 +
 sound/soc/sof/mediatek/mt8195/mt8195.c   | 29 ++++++++
 sound/soc/sof/mediatek/mtk-adsp-common.c | 84 ++++++++++++++++++++++++
 sound/soc/sof/mediatek/mtk-adsp-common.h | 10 +++
 4 files changed, 124 insertions(+)
 create mode 100644 sound/soc/sof/mediatek/mtk-adsp-common.c
 create mode 100644 sound/soc/sof/mediatek/mtk-adsp-common.h

-- 
2.30.2

