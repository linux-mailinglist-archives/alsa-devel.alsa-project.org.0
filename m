Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E25613AAF
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 16:50:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A27E61664;
	Mon, 31 Oct 2022 16:49:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A27E61664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667231446;
	bh=G0KoPUscGMdCw8ZkNDHuXvBeYtGOoIEmnjk1OnrBALo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZsWXY4mRAgPoKs0WXMGcajmoXLfsOJ1nDDpgHMUPfyaF9qnXo6IWt9WUID2A4aysQ
	 OtZoAbdHxHrMOaAtzvLspRsMZWjNXqoao3vazJ4IP/aVleGGW82HLh00EvZJKVqRhV
	 +IpsPDgxxYRktgJY3f2cjgq+JTut4/QeUc7B/5N0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B852FF80256;
	Mon, 31 Oct 2022 16:49:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1368F800F3; Mon, 31 Oct 2022 16:49:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C18E6F800F3
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 16:49:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C18E6F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bvOAatfi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667231387; x=1698767387;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G0KoPUscGMdCw8ZkNDHuXvBeYtGOoIEmnjk1OnrBALo=;
 b=bvOAatfiN8kxbHlP7sqdBRyCWZRJ2UL+b+pHas6XLH+NlVNIXjtwq4No
 MjojU6UBsxeMezp84/oL/FCFMBXIaCUmN4MDEMzOKQmR68xdIr9bg0jwM
 AzyUH+HP9tM0Ln0r6RtWOo1oJ3T2GKWk8KfHZGR9Th36nx9UAFx16nW6L
 FWp+EiMs3fOz0hRaPv/6Ir1DAT9r/CeJfam7c53usQEe15sV6N+eejASD
 8Sjhv/PgNmPSHPnayEtialHkvRkixrsb+u0QVyF5Y0kI87s0HxrntqfIE
 mw/NYjKx/3u9j9obw7g80W99xwPo4ltz6jQF+kI4+JQXt/VBtZrdJ9HIL A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="308929887"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="308929887"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 08:49:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="776178879"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="776178879"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 31 Oct 2022 08:49:32 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 0/7] ASoC: codecs: da7219: Do not export da7219_aad_jack_det()
Date: Mon, 31 Oct 2022 17:02:20 +0100
Message-Id: <20221031160227.2352630-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Vijendar.Mukunda@amd.com,
 heiko@sntech.de, AjitKumar.Pandey@amd.com, linux-rockchip@lists.infradead.org,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, jiaxin.yu@mediatek.com,
 lgirdwood@gmail.com, hdegoede@redhat.com, Syed.SabaKareem@amd.com,
 amadeuszx.slawinski@linux.intel.com, trevor.wu@mediatek.com
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

Goal of the series is to drop any usage of the internal function.

First, update all users to utilize component->set_jack() and then remove
the relevant EXPORT_SYMBOL_GPL.

Amadeusz Sławiński (2):
  ASoC: codecs: da7219: Introduce set_jack() callback
  ASoC: codecs: da7219: Do not export internal symbols

Cezary Rojewski (5):
  ASoC: Intel: Drop da7219_aad_jack_det() usage
  ASoC: mediatek: Drop da7219_aad_jack_det() usage
  ASoC: rockchip: Drop da7219_aad_jack_det() usage
  ASoC: amd: Drop da7219_aad_jack_det() usage
  ASoC: Intel: avs: Drop da7219_aad_jack_det() usage

 sound/soc/amd/acp-da7219-max98357a.c                     | 3 +--
 sound/soc/codecs/da7219-aad.c                            | 4 ----
 sound/soc/codecs/da7219.c                                | 9 +++++++++
 sound/soc/intel/avs/boards/da7219.c                      | 3 +--
 sound/soc/intel/boards/bxt_da7219_max98357a.c            | 3 +--
 sound/soc/intel/boards/kbl_da7219_max98357a.c            | 3 +--
 sound/soc/intel/boards/kbl_da7219_max98927.c             | 3 +--
 sound/soc/intel/boards/sof_da7219_max98373.c             | 4 ++--
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c       | 3 +--
 .../soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c  | 4 ++--
 sound/soc/rockchip/rk3399_gru_sound.c                    | 3 +--
 11 files changed, 20 insertions(+), 22 deletions(-)

-- 
2.25.1

