Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F5121A4BE
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 18:25:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F7E71658;
	Thu,  9 Jul 2020 18:25:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F7E71658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594311953;
	bh=J7fwxkGVQFCSHuqpLSDSikk1ydAmG2CWDYa1UCGQhgk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PCJw6tGz/Y3GfODi+Vc4et9qDneessrISUh2Go26ggFRfbozidtjo2G4k/FP7j3tB
	 fV8zqeg3I08sX2r+JjhqF/u2El5lk13TZqQu1uqlZfN3SwkjxvOoMgRkbpIzjqiL9r
	 rFWlSjqNVRB1pag0KhZcF8uJLgoMHcayBOqYl8Fc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03934F802BE;
	Thu,  9 Jul 2020 18:24:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28FF3F802BD; Thu,  9 Jul 2020 18:24:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MIME_8BIT_HEADER,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 SUBJECT_NEEDS_ENCODING,SUBJ_ILLEGAL_CHARS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F2DCF80117
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 18:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F2DCF80117
IronPort-SDR: gPo0TQJvRHt6AVuH8gd0LM5nB+hpeqIzw5ChwZcULIFKNN4VDWlzgFXyN9k8bOtzC4Gy1vIpV1
 WidBNcCHpnLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="149515607"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="149515607"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 09:23:40 -0700
IronPort-SDR: KNlORbHmz08OtdajFft3R2u/CSdpD0n7yTuGKMoWU7wBndhyJ4xAIboMLAu9bnGVFZE92a4pi2
 VrrNT0dGxHhQ==
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="280352959"
Received: from mdcoakle-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.43])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 09:23:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 00/10] ASoC: Clean-up W=1 build warnings​ - part2
Date: Thu,  9 Jul 2020 11:23:17 -0500
Message-Id: <20200709162328.259586-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Lee Jones <lee.jones@linaro.org>,
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

Both Lee Jones and I submitted separate series, this is the second
part of the merged result, for which no feedback was provided.

I picked Lee's patches for rt5659 and ak4458 and added the pxa and
ux500 that I didn't fix. The rest is largely identical between our
respective series, with the exception of the sunxi which I documented
and Lee removed. I don't have any specific preference and will go with
the flow on this.

Changes since v3:
Improved commit subjects from 'fix kernel-doc' as suggested by Lee
Jones. In a couple of cases I just reverted to Lee's patches when the
code was identical.
Added a couple of CC: tags from Lee's patches.
Added Arnaud Pouliquen's Acked-by tag in first patch.

Lee Jones (6):
  ASoC: sunxi: sun4i-spdif: Fix misspelling of 'reg_dac_txdata' in
    kernel-doc
  ASoC: pxa: pxa-ssp: Demote seemingly unintentional kerneldoc header
  ASoC: ux500: ux500_msp_i2s: Remove unused variables 'reg_val_DR' and
    'reg_val_TSTDR'
  ASoC: codecs: rt5659: Remove many unused const variables
  ASoC: codecs: tlv320aic26: Demote seemingly unintentional kerneldoc
    header
  ASoC: codecs: ak4458: Remove set but never checked variable 'ret'

Pierre-Louis Bossart (4):
  ASoC: sti: uniperif: fix 'defined by not used' warning
  ASoC: qcom: qdsp6: q6asm: Provide documentation for 'codec_profile'
  ASoC: sunxi: sun4i-i2s: add missing clock and format arguments in
    kernel-doc
  ASoC: codecs: rt5631: fix spurious kernel-doc start and missing
    arguments

 sound/soc/codecs/ak4458.c       |  6 +++---
 sound/soc/codecs/rt5631.c       |  8 +++++--
 sound/soc/codecs/rt5659.c       | 37 ---------------------------------
 sound/soc/codecs/tlv320aic26.c  |  2 +-
 sound/soc/pxa/pxa-ssp.c         |  2 +-
 sound/soc/qcom/qdsp6/q6asm.c    |  2 +-
 sound/soc/sti/uniperif.h        |  2 +-
 sound/soc/sunxi/sun4i-i2s.c     | 10 ++++++++-
 sound/soc/sunxi/sun4i-spdif.c   |  2 +-
 sound/soc/ux500/ux500_msp_i2s.c |  8 +++----
 10 files changed, 27 insertions(+), 52 deletions(-)


base-commit: 6940701c715e193282cf8b31f970b2ea6eb26341
-- 
2.25.1

