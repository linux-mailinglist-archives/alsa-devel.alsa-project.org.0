Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA827F75D6
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Nov 2023 14:58:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE9BAE0F;
	Fri, 24 Nov 2023 14:57:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE9BAE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700834283;
	bh=MBa0sbZ5OfSGKnvLbayVusDHUZ7L4u2k9/Ba47MuuOU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=to/28kQ40yuEEELF2ckBk5OvaMzp+Alz52v3EKFI0K6SN1bcirHN+cOYWhCIyHD/5
	 X5C+MgDj1y3lGcSSPvcMNS+naAYa4SWyzi3wr0DHD/4K9DBP/4keDnt0/6Gc5bYBCn
	 PyTSzxy/KwHdgqP6DTbHi45iQzccuee+zmYT0dns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B82DF8057A; Fri, 24 Nov 2023 14:57:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 787C6F8056F;
	Fri, 24 Nov 2023 14:57:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 110E6F80310; Fri, 24 Nov 2023 14:57:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2AD2F80166
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 14:57:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2AD2F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GAzt8i8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700834243; x=1732370243;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MBa0sbZ5OfSGKnvLbayVusDHUZ7L4u2k9/Ba47MuuOU=;
  b=GAzt8i8EkRCYF6Tbpcj+s1zvF9AXaEBfV5aU5hpOnZO0z+hbqge+DJ6w
   ZUW0zmZ42EQqZpzzc+T8iTaSw8+nOLN8mGzLfyubjMrUZ8Emv9QyzQM+i
   1zLjrfLzepCms5i9Smdkmqps+iBpQkVn33AUY2tw0Dv5NdNZt5HAGR9m+
   iLbJ5WoMS8G/YHXWwH/9sDe/uLsuyIwt5uCrEYLPvx9hQSVDGvplN4aA/
   dHirbxXDPQVvSTsWJqURnHZqalyt+6E2jhoSRZBJVUPLkzPGMkIKq9veJ
   +f/2OucVShFpn+A7DA3cwgauRzxqzb8ke1sCPS4y+1+n9s/jLYf6KH9w7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="372590352"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600";
   d="scan'208";a="372590352"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 05:57:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="858397217"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600";
   d="scan'208";a="858397217"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.182])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 05:57:10 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 0/2] ASoC: SOF: Extend the enabled DSP core handling
Date: Fri, 24 Nov 2023 15:57:41 +0200
Message-ID: <20231124135743.24674-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IPSZNNA2YIQVUECBKAGP7DACNAF3VDUF
X-Message-ID-Hash: IPSZNNA2YIQVUECBKAGP7DACNAF3VDUF
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IPSZNNA2YIQVUECBKAGP7DACNAF3VDUF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

In the current code, we enable a widget core when it is set up and
disable it when it is freed. This is problematic with IPC4 because
widget free is essentially a NOP and all widgets are freed in the
firmware when the pipeline is deleted. This results in a crash during
pipeline deletion when one of it's widgets is scheduled to run on a
secondary core and is powered off when widget is freed. So, change the
logic to enable all cores needed by all the modules in a pipeline when
the pipeline widget is set up and disable them after the pipeline
widget is freed.

Regards,
Peter
---
Ranjani Sridharan (2):
  ASoC: SOF: ipc4-topology: Add core_mask in struct snd_sof_pipeline
  ASoC: SOF: sof-audio: Modify logic for enabling/disabling topology
    cores

 sound/soc/sof/ipc3-topology.c |  2 ++
 sound/soc/sof/ipc4-topology.c |  9 +++++
 sound/soc/sof/sof-audio.c     | 65 ++++++++++++++++++++++-------------
 sound/soc/sof/sof-audio.h     |  2 ++
 4 files changed, 54 insertions(+), 24 deletions(-)

-- 
2.42.1

