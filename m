Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 585C226DB0A
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 14:06:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F052B1655;
	Thu, 17 Sep 2020 14:05:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F052B1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600344362;
	bh=6Kx2b18cJpahkf8RFDVCZoaqqk/md2vlqPGq5+X+nGY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tDJ2AiwX7vmCee1Wr8Qrp6mfnEf+f+qaHfw370PXqVKg85rtcy/TvF8VlM0+wEGK8
	 QZXCSoyd6/wqEnD58JlGUSCTne2OQTlaAhKK/oM352ZnD8cp/yHTHC+9N2qR03rivC
	 touLxB5ruAXgUjGrBfbsw6imT+q338SnqIJZVl9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE67FF802E9;
	Thu, 17 Sep 2020 14:02:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF2B8F802EA; Thu, 17 Sep 2020 14:02:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 709D0F802E1
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 14:02:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 709D0F802E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="j1Qg0Vbb"
Received: from localhost.localdomain (unknown [136.185.111.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C7D382087D;
 Thu, 17 Sep 2020 12:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600344121;
 bh=6Kx2b18cJpahkf8RFDVCZoaqqk/md2vlqPGq5+X+nGY=;
 h=From:To:Cc:Subject:Date:From;
 b=j1Qg0VbbLbQHcmh+a9+0CkryI99GiIFGDBOlJJmKnDPLAXcNzx0bBdCZ4lZbSjV+b
 wmNUe3so/DipClSW50GKg54UtxFWXbnLXQnj4YBdN95q0L8XnjfcoCI6tyq+u5vy8I
 DonBhKKcVEFtQcLi1GpHcOINr4f/8bUs6t/3x1Rw=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/2] soundwire: use {u32|u16}p_replace_bits
Date: Thu, 17 Sep 2020 17:31:44 +0530
Message-Id: <20200917120146.1780323-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
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

This is v2 of the series to fix usage of FIELD_PREP and use
{u32|u16}p_replace_bits.

v1 used u32_replace_bits but looks like it might be removed so use the
{u32|u16}p_replace_bits() instead. Also this helped to find that one
instance in intel driver should have used u16p_replace_bits() so that is
fixed too

Vinod Koul (2):
  soundwire: cadence: use u32p_replace_bits
  soundwire: intel: use {u32|u16}p_replace_bits

 drivers/soundwire/cadence_master.c | 21 ++++++++++-----------
 drivers/soundwire/intel.c          | 14 +++++++-------
 2 files changed, 17 insertions(+), 18 deletions(-)

-- 
2.26.2

