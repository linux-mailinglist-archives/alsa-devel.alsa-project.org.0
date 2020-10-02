Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBAF281D8F
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 23:22:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8035D1B12;
	Fri,  2 Oct 2020 23:21:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8035D1B12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601673725;
	bh=U3ExdkhbqpO+PiKc/jBCSAM4lHVIb7wz6xjqwB+oolk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hu14bSkNRehRLuYxy7n7XqhXUexOswGafak2aynPQQ3kUjXKsJYNCVKwmZMaE2QPj
	 bB9+XAOV51vv6/1DhIOnZypL13upfHRM3WKNXTbqjV8aQ/tpH0xbJvgkZnQ5zT1XGG
	 fqgBE/D9fV0o4B/oKboWLqYxEhh9j8e8a5IQISlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA5F5F802E1;
	Fri,  2 Oct 2020 23:19:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 900DEF802E2; Fri,  2 Oct 2020 23:19:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65B5BF801A3
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 23:19:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65B5BF801A3
IronPort-SDR: XldhximRhorbyHkQ/w2hIJIae3c0RQ8e+WI9CWURoJZwA6bsh5zmfpHP4bse0jXexu6FZ0TcbJ
 3cXJNXL2EjiA==
X-IronPort-AV: E=McAfee;i="6000,8403,9762"; a="247823962"
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; d="scan'208";a="247823962"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2020 14:19:18 -0700
IronPort-SDR: 1luABX7iDp1GKiZn3Gw3VYIlxuautTNi44iGH0SpGqJOKXSBWzHvxuNcYkbI41b7ONVQmR2Fjo
 anSva4zy1VHw==
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; d="scan'208";a="346580615"
Received: from johnthom-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.158.101])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2020 14:19:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ASoC: rt715-sdw: probe with RT714 Device ID
Date: Fri,  2 Oct 2020 16:19:01 -0500
Message-Id: <20201002211902.287692-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002211902.287692-1-pierre-louis.bossart@linux.intel.com>
References: <20201002211902.287692-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jack Yu <jack.yu@realtek.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

RT715 and RT714 are essentially the same chips but with different
SoundWire Dev_ID registers, make sure we can probe the same driver if
RT714 is used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Jack Yu <jack.yu@realtek.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/codecs/rt715-sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index f3f5da512b59..8f0aa1e8a273 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -515,6 +515,7 @@ static int rt715_sdw_probe(struct sdw_slave *slave,
 }
 
 static const struct sdw_device_id rt715_id[] = {
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x714, 0x2, 0, 0),
 	SDW_SLAVE_ENTRY_EXT(0x025d, 0x715, 0x2, 0, 0),
 	{},
 };
-- 
2.25.1

