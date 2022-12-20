Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 140E0652111
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 13:57:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1343175E;
	Tue, 20 Dec 2022 13:56:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1343175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671541036;
	bh=h7i4yLv34vNJ9hY3EhSR7pp7GPsH2Hane5m3XiLI3eY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=QSj+2LLK4zmVzmx8HHvv7zaWjd8O/fOfr6J4C47zabtS5kICMi+/KERhUHIaa+tjy
	 6oq5wv+SKtZ8qxh5OgU0dUCR5k6HpBB0j/ey3MIyACLD9pKrux3OwZpk34cz/0wE1s
	 U9mXh117KC+UkqlL445Pr9/zoEmKWy1xPf5zQX7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A0B7F80027;
	Tue, 20 Dec 2022 13:56:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8633DF80027; Tue, 20 Dec 2022 13:56:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FCD8F80027
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 13:56:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FCD8F80027
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RYtYB/i9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671540976; x=1703076976;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h7i4yLv34vNJ9hY3EhSR7pp7GPsH2Hane5m3XiLI3eY=;
 b=RYtYB/i93C7n58f+viA+IBk0ZZUypn1jT6bNGRiiOOZo1ccqbBq2Kvho
 ya2Du4xWHdzXM8JVfjntImYk5PhE5UuznHl+e002KJGonapo4O8PCLoUh
 8ufjsItvf8TAONO97LwgHh2Rjg5fnetJS9huMlHyH9tplNTsbn2sq2IRT
 k/KLzUf1BEBP9iw1f/b/xJhawTQxUW9hVG/HOrxIoMO8x3sTFW+CKrrI8
 n1qrheoj6utwWtOn8Taggdp4e4e8DSMpY+On3miz6CCYIpAiVb2ycRPmL
 rScSTalbbqkewcgVymOeYKPBcWQlhAEVuuv2otnL9r5kSmAMuGw55/qHi w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="319655972"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="319655972"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 04:56:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="896420523"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="896420523"
Received: from vadimbel-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.20.205])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 04:56:05 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 0/3] ASoC: SOF: Fixes for suspend after firmware crash
Date: Tue, 20 Dec 2022 14:56:11 +0200
Message-Id: <20221220125614.8368-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 cujomalainey@chromium.org, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

This is the followup series for the v1 sent out by Ranjani [1]. Unfortunately
Ranjani was dragged away to another issue and could not send the update herself.

Changes since v1:
- In patch 2, move the tear_down_all_pipelines call instead of duplicating it

Amadeusz: I have kept the check as it is:
if (tplg_ops && tplg_ops->tear_down_all_pipelines)
I'm preparing the ops optionality change series which would require this change.

[1] https://lore.kernel.org/alsa-devel/20221215185347.1457541-1-ranjani.sridharan@linux.intel.com/T/#t

Regards,
Peter
---
Curtis Malainey (1):
  ASoC: SOF: Add FW state to debugfs

Ranjani Sridharan (2):
  ASoC: SOF: pm: Set target state earlier
  ASoC: SOF: pm: Always tear down pipelines before DSP suspend

 sound/soc/sof/debug.c | 4 +++-
 sound/soc/sof/pm.c    | 9 ++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

-- 
2.39.0

