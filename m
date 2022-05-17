Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D768252A93B
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 19:28:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ED0482A;
	Tue, 17 May 2022 19:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ED0482A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652808489;
	bh=M3ILwqovAxTh6AYHomTWJ8pmDFncdh9esI4Ea0HjHC0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M43mUccwflOcdNvxMU73juz6qinuLNHw/JcUQsQMFVgHZn7soRCVfM9yt2OhKaZzI
	 jNWNvtHMPZRyNkXTdcZTRGMX94jDq1e8yVqINOrRoVrrfAg/GiM6s84pisSImKTlbw
	 TLmDb/JW+Tb6hL4GgSgCJi2+ln5TP5UcLOwH8O0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C57CAF800D8;
	Tue, 17 May 2022 19:27:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17C10F800F0; Tue, 17 May 2022 19:27:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D09AF800F0
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 19:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D09AF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IUnWewJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652808421; x=1684344421;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M3ILwqovAxTh6AYHomTWJ8pmDFncdh9esI4Ea0HjHC0=;
 b=IUnWewJXEk/9ZrQiZrLBHWEga4RKeIBO69i2UOhPURLPrN+pcr9OArcN
 e+1W8eJW1r+1PAz0j3JVPmqlcB9QbIMGFoXw3OV53QV+BrFtVHLz31ueg
 opcZkwtDu8+OCQemhgJE7HzsjrjQFTcsPmOq2hEcHwtqSgRQuO7kgvW6n
 HAVJRHNfywDBePmfqZUrV5vXTwyNFAIVqEj8YBj8aRs5q9XJFHotpwNDm
 Q8DpL4TzzkXuFZEUWooFD6d8M2i+lydtxvZYVJGvff5Tx5hmVckSzzCza
 s47/Wt0jmwaGnCD89+bnM+5KZE/3NpG6O2Tvf9nqoA2HeLTJYEya0r8KL Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="271208262"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="271208262"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 10:26:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="626589245"
Received: from sfilary-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.67.235])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 10:26:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: remove two unnecessary gpiolib dependencies
Date: Tue, 17 May 2022 12:26:45 -0500
Message-Id: <20220517172647.468244-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Remove two dependencies - issues reported by Intel kernel test bot.

Pierre-Louis Bossart (2):
  ASoC: max98357a: remove dependency on GPIOLIB
  ASoC: rt1015p: remove dependency on GPIOLIB

 sound/soc/codecs/Kconfig | 2 --
 1 file changed, 2 deletions(-)

-- 
2.30.2

