Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56375EC762
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Nov 2019 18:20:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B338F2308;
	Fri,  1 Nov 2019 18:20:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B338F2308
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572628853;
	bh=Qhi965NEYGcCEmgwIiIl1JKBgMGxhy2YaYG0OLCHXxc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gAVYtTlYdPG5sZbfkfWirI2QB5/3HyEPCNYl3eNsyhxYUcy1BaeZHJ+VgGSpBYSe1
	 rNlbziuPz5Gzj6beAlTQIVpOD2LcuFyBG8gqhSjahrdDEjcQuX8fgRZZSxsnX9LPuz
	 y8BIfDAaOrsbYDzDnvrcs553rcoc4teGCXsLlOpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AEE4F805AE;
	Fri,  1 Nov 2019 18:19:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89E43F8044A; Fri,  1 Nov 2019 18:19:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11ED3F8015A
 for <alsa-devel@alsa-project.org>; Fri,  1 Nov 2019 18:18:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11ED3F8015A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Nov 2019 10:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,256,1569308400"; d="scan'208";a="226092261"
Received: from ggarreto-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.92.243])
 by fmsmga004.fm.intel.com with ESMTP; 01 Nov 2019 10:18:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  1 Nov 2019 12:18:45 -0500
Message-Id: <20191101171847.26767-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v5 0/2] ASoC: Intel: boards: Add CML M/C for
	RT5682 and RT1011
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The series adds CML m/c driver with RT5682 on SSP0 and
RT1011 on SSP1.
The RT1011 is smart AMP which supports 2 Whoofers and
2 tweeter support.
RT5682 is headset codec supporting playback and record.
The m/c supports HDMI playback and DMIC record.

Changes since v4 (from Kai Vehmanen)
added prefix for series, reformatted changes
fixed bad filename in Makefile
Support for hdmi common codec

Changes since v3
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
repost with more recipients and edits to commit messages

Changes since v2:
re ordered match table to ensure non i2c device matches are at the end

Changes since V1:
Addressed comments on 
ASoC: Intel: boards: Add CML m/c using RT1011 and RT5682 

Naveen Manohar (2):
  ASoC: Intel: Add acpi match for rt1011 based m/c driver
  ASoC: Intel: boards: Add CML m/c using RT1011 and RT5682

 sound/soc/intel/boards/Kconfig                |  14 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/cml_rt1011_rt5682.c    | 487 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-cnl-match.c   |   7 +
 4 files changed, 510 insertions(+)
 create mode 100644 sound/soc/intel/boards/cml_rt1011_rt5682.c

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
