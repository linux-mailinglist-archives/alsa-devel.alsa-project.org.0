Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD8763C6E6
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 18:58:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C5341695;
	Tue, 29 Nov 2022 18:57:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C5341695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669744705;
	bh=zts54bfa/kBfj5Q9LHaIlFdBIPur5Oqwg8YwMz4znVI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C2esF7xLyA0SIwr3ZqB9hov8FB2kjrTtmJ7YbtRdoVN2KGuldnW0fgkBsLFYzXvAM
	 cRZ5rpcdWjTfvYTacoZEr3uUZVI5VOuUFuQ1f/IvZ/hzZL7JJNzG1Uj6l10JPepu77
	 1y0Yf389hMfq1VtjQ8vkNWCOz3wvrtsBOcRPWqNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA381F802DF;
	Tue, 29 Nov 2022 18:57:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B34FF80212; Tue, 29 Nov 2022 18:57:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94317F80137
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 18:57:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94317F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CN54sh2A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669744644; x=1701280644;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zts54bfa/kBfj5Q9LHaIlFdBIPur5Oqwg8YwMz4znVI=;
 b=CN54sh2A4N3M+4/8CnbwmW3vvoCmh5GA9LUa5bcxNtaLZY+b8PyBSHVN
 Z9RKCnK3B+PbML1HXfU5idNGWlQMB9eoLPuD8KiDfBlw3Z2TqGM4XKUCM
 Tctp9sOWnocbt6oUKpbHWyqKtgA4NbgjixqogPBIFeEDuKPSNhWxUAi0n
 LdripJbEYpz58kvlwnWL8OjupB2x8seQW4WYcEzx/leCGUD+Re/y/aBQf
 nScJrL0+Nq0gjRvr2QTCmAu7OEZNgyRr3gu1R0ZAki4QesJXUx21d8MAC
 UX2hSbtCcpILWGFwuAzA4s/naDDyjJWg1oxmznq7J7cPFtQotkQkDx8gx Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="377343601"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="377343601"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 09:50:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="645996028"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="645996028"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 29 Nov 2022 09:50:34 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 0/2] ASoC: Intel: avs: rt5682: Refactor jack handling
Date: Tue, 29 Nov 2022 19:07:36 +0100
Message-Id: <20221129180738.2866290-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Leftover from recent series [1].
Following changes are proposed for the rt5682 sound card driver:

1) Move jack unassignment from platform_device->remove() to
   dai_link->exit(). This is done to make jack init and deinit flows
   symmetric
2) Remove platform_device->remove() function
3) Simplify card->suspend_pre() and card->resume_post() by making use of
   snd_soc_card_get_codec_dai() helper


Changes in v2:
- fixed compilation of the first patch in the series by moving offending
  pieces to the second patch


[1]: https://lore.kernel.org/alsa-devel/20221125184032.2565979-1-cezary.rojewski@intel.com/

Amadeusz Sławiński (2):
  ASoC: Intel: avs: rt5682: Add define for codec DAI name
  ASoC: Intel: avs: rt5682: Refactor jack handling

 sound/soc/intel/avs/boards/rt5682.c | 31 ++++++++++++-----------------
 1 file changed, 13 insertions(+), 18 deletions(-)

-- 
2.25.1

