Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE6ABC3C2
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 10:05:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F23D91688;
	Tue, 24 Sep 2019 10:04:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F23D91688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569312329;
	bh=HH7SWMZWS4uQwXfWMe0yAlEV2t4Ny+W1wph8vpCOuRY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UIIk/A/z6G7+aGR29RzjYszwDCmmE/cRIEo+/HH7cWzDS2CA+CO4kupK8whV/M4Tm
	 P/5o85ZbNoGpk7rWbP1rXFTrhnRjJniCa3tt5JUenjkCLEWt8ncgCx+kYvnZXc2fQ+
	 5lXx9Pgf4Whz3tjZwOq7Ust+TkQEs2A6CF8v8Vm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73C7AF80533;
	Tue, 24 Sep 2019 10:03:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A358F802BD; Tue, 24 Sep 2019 10:03:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D806AF802BD
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 10:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D806AF802BD
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2019 01:03:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; d="scan'208";a="389773634"
Received: from unknown (HELO localhost.localdomain) ([10.223.165.177])
 by fmsmga006.fm.intel.com with ESMTP; 24 Sep 2019 01:03:31 -0700
From: sathya.prakash.m.r@intel.com
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Date: Tue, 24 Sep 2019 13:39:04 +0530
Message-Id: <1569312546-16393-1-git-send-email-sathya.prakash.m.r@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: sathya.prakash.m.r@intel.com, naveen.m@intel.com,
 pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 0/2] Add CML M/C for RT5682 and RT1011
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Sathya Prakash M R <sathya.prakash.m.r@intel.com>

The series adds CML m/c driver with RT5682 on SSP0 and
RT1011 on SSP1.
The RT1011 is smart AMP which supports 2 Whoofers and 
2 tweeter support.
RT5682 is headset codec supporting playback and record.
The m/c supports HDMI playback and DMIC record.

Naveen Manohar (2):
  ASoC: Intel: boards: Add CML m/c using RT1011 and RT5682
  ASoC: Intel: Add acpi match for rt1011 based m/c driver

 sound/soc/intel/boards/Kconfig                    |  18 +
 sound/soc/intel/boards/Makefile                   |   2 +
 sound/soc/intel/boards/cml_rt1011_rt5682.c        | 475 ++++++++++++++++++++++
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c |   7 +
 4 files changed, 502 insertions(+)
 create mode 100644 sound/soc/intel/boards/cml_rt1011_rt5682.c

-- 
V1: Acked-by:pierre-louis.bossart@linux.intel.com
at https://github.com/thesofproject/linux/pull/1161

1.9.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
