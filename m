Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F927329557
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:58:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80F421688;
	Tue,  2 Mar 2021 00:57:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80F421688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614643106;
	bh=NzvYhRq4+rq+/caB1qruTs8ZZj2PiPOGwTlw+hRHn7U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vFHaEilPdoku30Yy232KfSN8kZgt0g1j/3HTuIdyqv4ytMVwGzW2HHZ9HsxQdlVX9
	 dp1cJYWFuWa9tivCdPBC1MQdYME++DoYD4p1fQOzvBBdeES5Pb63ZBj3nWotpfhZUQ
	 yFWblRYiR//BVxOpN+fZ6GIoBWH/35DYKufyGQ/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E11F1F8010B;
	Tue,  2 Mar 2021 00:56:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56E28F8025E; Tue,  2 Mar 2021 00:56:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFD30F800E0
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:56:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFD30F800E0
IronPort-SDR: wEV37FzBYGKxF/cUathvRjnwWyhsKKdq+lRv7ti01QUIOQcxC5+dn6PdcMTFl51g+z34xdjkwP
 c7auHG6D7Ukg==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="184195005"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="184195005"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 15:56:45 -0800
IronPort-SDR: Q0zblfZFVLGwBICgRSC85xQya65czhNbMOBwaV/LjFDd1BQqAaNhCs8IYSXSDvFJ1LrLq6/XIR
 v7u2n1XN4vPA==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="406449836"
Received: from josemrod-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.215.233])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 15:56:44 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: Intel: soc-acpi: remove unused TigerLake
 configurations
Date: Mon,  1 Mar 2021 17:56:35 -0600
Message-Id: <20210301235637.1177525-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

Remove two machine descriptors which were added for development on
Intel RVPs but are no longer used or productized. This will not have
any impact on end-users. The corresponding cleanup was applied in the
SOF topologies.

Pierre-Louis Bossart (2):
  ASoC: Intel: soc-acpi: remove unused TGL table with rt5682 only
  ASoC: Intel: soc-acpi: remove TGL RVP mixed SoundWire/TDM config

 .../intel/common/soc-acpi-intel-tgl-match.c   | 23 -------------------
 1 file changed, 23 deletions(-)

-- 
2.25.1

