Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7F34330B0
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 10:05:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 899FC16A4;
	Tue, 19 Oct 2021 10:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 899FC16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634630749;
	bh=PsLA8LveBjaxqNdvHnA1SDoQiO+SsyfdoT4pGQvL8+Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ALAifrMkLC784fw0jYRGiFpeCmYJUjd2Dw9u+GTt76uhbSlNyhBV3lti3FAM2oh4+
	 qEIdjSuU437bZp7fqTVO1ikfr3R7gqPsiAckpBcJGxcq7MQlxaBLwnI/xXq5Jcw4s1
	 IbXRXkSvq1aqo2FibMXrerxvAwesOyE9LUgt+9hk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96B6AF804FA;
	Tue, 19 Oct 2021 10:03:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA308F804F3; Tue, 19 Oct 2021 10:03:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E2B6F804CA
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 10:03:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E2B6F804CA
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="215374064"
X-IronPort-AV: E=Sophos;i="5.85,383,1624345200"; d="scan'208";a="215374064"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 01:02:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,383,1624345200"; d="scan'208";a="493984187"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.56])
 by orsmga008.jf.intel.com with ESMTP; 19 Oct 2021 01:02:33 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 0/6] Multiple headphone codec driver support
Date: Tue, 19 Oct 2021 15:59:35 +0800
Message-Id: <20211019075941.2037787-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Rander Wang <rander.wang@intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Gongjun Song <gongjun.song@intel.com>,
 Bard Liao <bard.liao@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Paul Olaru <paul.olaru@oss.nxp.com>, Brent Lu <brent.lu@intel.com>,
 Libin Yang <libin.yang@intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>
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

Support multiple headphone drivers in same machine driver. In this
case, both rt5682 and rt5682s are supported and enumerated by different
ACPI HID "10EC5682" and "RTL5682".

V2 Changes:
- remove useless 'NULL', 'false' in if-condition
- can use 'comp_ids' field alone to enumerate driver
- add comma to the end of entry in structure initialization
- keep the table of byt/cht/cml/icl untouched

V3 Changes:
- upstreamd from SOF github, PR#3200
- use new compatiable IDs to shrink the enumerate table of BYT and CHT
- add 'const' to snd_soc_acpi_codecs structures

Brent Lu (3):
  ASoC: soc-acpi: add comp_ids field for machine driver matching
  ASoC: Intel: sof_rt5682: detect codec variant in probe function
  ASoC: Intel: sof_rt5682: use comp_ids to enumerate rt5682s

Pierre-Louis Bossart (3):
  ASoC: Intel: soc-acpi-byt: shrink tables using compatible IDs
  ASoC: Intel: soc-acpi-cht: shrink tables using compatible IDs
  ASoC: Intel: soc-acpi: use const for all uses of snd_soc_acpi_codecs

 include/sound/soc-acpi.h                      |  3 +
 sound/soc/intel/boards/sof_rt5682.c           | 34 ++-------
 .../intel/common/soc-acpi-intel-adl-match.c   | 11 ++-
 .../intel/common/soc-acpi-intel-bxt-match.c   |  2 +-
 .../intel/common/soc-acpi-intel-byt-match.c   | 68 +++++++-----------
 .../intel/common/soc-acpi-intel-cht-match.c   | 69 +++++++------------
 .../intel/common/soc-acpi-intel-cml-match.c   |  8 +--
 .../intel/common/soc-acpi-intel-glk-match.c   |  2 +-
 .../intel/common/soc-acpi-intel-jsl-match.c   | 43 ++++--------
 .../intel/common/soc-acpi-intel-kbl-match.c   | 12 ++--
 .../intel/common/soc-acpi-intel-skl-match.c   |  2 +-
 .../intel/common/soc-acpi-intel-tgl-match.c   | 11 ++-
 sound/soc/soc-acpi.c                          | 24 ++++++-
 13 files changed, 119 insertions(+), 170 deletions(-)

-- 
2.25.1

