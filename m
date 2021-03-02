Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5466B32979F
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 10:13:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C61B516AF;
	Tue,  2 Mar 2021 10:12:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C61B516AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614676398;
	bh=bZcrVby0cG11lKYEsKVg+YyVkpCG3atrfEyGlH8xQlI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rx8DYnn2ptgPuP6L9N392S6dRqElbI7yOW0wZK+ayvn/pt3FtTxwdYGLxEyhZ3ynM
	 JakuibcKVX/Cg7ANgSKORSglXh+TpH1LgBOACf1YLh3DeRbpw9GD+jwHuVnvudS26H
	 RiPTYS+5GMxK51W/iKuslEMDnJMXVHTGHxIYx/UY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E980F802A9;
	Tue,  2 Mar 2021 10:11:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F33DDF80227; Tue,  2 Mar 2021 10:11:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FC96F80227
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 10:11:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FC96F80227
IronPort-SDR: SJ+fIXGPwyFjrVa5hlLxSFU25dB9U7ipRw00jpzm1Y8+ATleMNUJCiRSjZXWVpal40AFFPo3wr
 3GlZgwe3vchQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="248158704"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="248158704"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 01:11:34 -0800
IronPort-SDR: hZQxCrkKhBVjp3mM9YKHlcK//84I3xX50t9XgnrQVq0kZUn8/dKpFElU8843NUX5iWDuY6MImQ
 PSiNYpjlNzuA==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="506262244"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 01:11:30 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 00/11] soundwire: some cleanup patches
Date: Tue,  2 Mar 2021 17:11:11 +0800
Message-Id: <20210302091122.13952-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

To make soundwire driver more decent and less Cppcheck complaint.

Pierre-Louis Bossart (11):
  soundwire: bus: use correct driver name in error messages
  soundwire: bus: test read status
  soundwire: bus: use consistent tests for return values
  soundwire: bus: demote clock stop prepare log to dev_dbg()
  soundwire: bus: uniquify dev_err() for SCP_INT access
  soundwire: bus: remove useless initialization
  soundwire: generic_bandwidth_allocation: remove useless init
  soundwire: intel: remove useless readl
  soundwire: qcom: check of_property_read status
  soundwire: stream: remove useless initialization
  soundwire: stream: remove useless bus initializations

 drivers/soundwire/bus.c                       | 54 +++++++++++--------
 drivers/soundwire/bus_type.c                  | 15 ++++--
 .../soundwire/generic_bandwidth_allocation.c  |  4 +-
 drivers/soundwire/intel.c                     |  2 -
 drivers/soundwire/qcom.c                      |  3 ++
 drivers/soundwire/stream.c                    |  8 +--
 6 files changed, 52 insertions(+), 34 deletions(-)

-- 
2.17.1

