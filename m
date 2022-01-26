Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDA449C095
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:18:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED0FF1F79;
	Wed, 26 Jan 2022 02:17:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED0FF1F79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643159926;
	bh=rqczjyKj/SlLMVDMYtVBQmFXTLQ/61Vrv+fruQKZRP8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hUXaK5LJX3l4qMtSbH7Z4TB6v7Cu3cCcjS7ZpUqHplvD0Xcdarpc8qdS5hrqryMc6
	 sCE61CZ0QYDNluheT5E4A6ZexJ3v1avQ305AY43Vp7YeyAAu+2oaLw1egGP/nY2S8T
	 mnVj7pVM7inxbOYNdLt6BhycAV0MVPKRpv48EFvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79F58F804D6;
	Wed, 26 Jan 2022 02:17:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C647F80118; Wed, 26 Jan 2022 02:17:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32765F80118
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:17:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32765F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QS5+qLOk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159856; x=1674695856;
 h=from:to:cc:subject:date:message-id;
 bh=rqczjyKj/SlLMVDMYtVBQmFXTLQ/61Vrv+fruQKZRP8=;
 b=QS5+qLOkeU4csJVPvJ+Qs4CkUvXtNKVoPw/9ORPMpG9PtMjSQgl24BH1
 HFDm8N2v7ebirfiJo9PsRdIQya7WVbgLoPSeKVgMJpdWMvg4iaI7l5JKG
 zpnpHfPL4UKjETveZSRWu21hCW+2YsHPDHXDkWpiVvNB7bz3rG4eq56sk
 SoKgicwIpdvIkWwDvgMSHRVADPMBqBjwGFdjU4jboLGJQstJfwekRxHC0
 GGURw38JqWJ31sg3OYOWxwMTft6FoXoBHsUZ0LLFQWc0TQHfU+bqo7xuI
 VCs8ffoo10ORQIBT7nwaqCskd59A5vIWBNtKjWOy8a1PXYY/QllIOgaRm Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246236102"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="246236102"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="520617308"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:27 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 00/19] soundwire: stream: cleanup of 'stream' support
Date: Wed, 26 Jan 2022 09:16:56 +0800
Message-Id: <20220126011715.28204-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

This series revisits the SoundWire 'sdw_stream' support to split allocation
and configuration steps. This is necessary if for example the routines are
called multiple times from the hw_params stage. This also helps with better
error handling.

Pierre-Louis Bossart (19):
  soundwire: stream: remove unused parameter in sdw_stream_add_slave
  soundwire: stream: add slave runtime to list earlier
  soundwire: stream: simplify check on port range
  soundwire: stream: add alloc/config/free helpers for ports
  soundwire: stream: split port allocation and configuration loops
  soundwire: stream: split alloc and config in two functions
  soundwire: stream: add 'slave' prefix for port range checks
  soundwire: stream: group sdw_port and sdw_master/slave_port functions
  soundwire: stream: simplify sdw_alloc_master_rt()
  soundwire: stream: split sdw_alloc_master_rt() in alloc and config
  soundwire: stream: move sdw_alloc_slave_rt() before 'master' helpers
  soundwire: stream: split sdw_alloc_slave_rt() in alloc and config
  soundwire: stream: group sdw_stream_ functions
  soundwire: stream: rename and move master/slave_rt_free routines
  soundwire: stream: move list addition to sdw_slave_alloc_rt()
  soundwire: stream: separate alloc and config within
    sdw_stream_add_xxx()
  soundwire: stream: introduce sdw_slave_rt_find() helper
  soundwire: stream: sdw_stream_add_ functions can be called multiple
    times
  soundwire: stream: make enable/disable/deprepare idempotent

 drivers/soundwire/stream.c | 960 +++++++++++++++++++++----------------
 1 file changed, 547 insertions(+), 413 deletions(-)

-- 
2.17.1

