Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2323154ED24
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 00:10:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2FA41B3B;
	Fri, 17 Jun 2022 00:09:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2FA41B3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655417401;
	bh=w2fUZ6Iltfct+W4TVBVaRON6NJTXIRWktWfEbLOEWps=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QIg9xk4HxxpaVled7X9JYwcQZP3ojuQ2IHqRtF2GpYEoC6oPn8axaKYnaAdJ+GjyI
	 wyWI/FljyZ1LG/jO2LkipEEt1gHhKeEleQ7Xg2SxQSL6kWvHRVI/Vye1r1nE/p93KY
	 N9iX5MgKY+URbkP9iNZL1DsOXbwU+MbSArO/Uvew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B916DF80534;
	Fri, 17 Jun 2022 00:08:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96A4FF80534; Fri, 17 Jun 2022 00:08:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D547EF8012A
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 00:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D547EF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="oDn7ZTH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655417295; x=1686953295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w2fUZ6Iltfct+W4TVBVaRON6NJTXIRWktWfEbLOEWps=;
 b=oDn7ZTH7EGnA8UFppwchgaOm9lY7n1XPJ/x/0tkm+6Pc9w1qnPjKU1pa
 BeSvV83UVYmT5+V1kLRUP3LqIwo2dUNujo6eT6TQmhNtjC+5TFcDPhq11
 iCPCOqi4bvm7Hq1DghkYJGwkfb+qaocDzGc9UWJM/DtKVOBFLflfBVvhC
 B9ers9qnV8UQN0L+xHGZzu0S5d4Xj8vorgiPtzigZUWBNYzrpnn1kF4Af
 f6HELAkAgXqbmvVBB2KW6Nd5Cj6i4kdhvBbgsZaY/V8egElyR9Dc42ky+
 725ygyZboObjN/NBCU5D+IpaGP3MLcM3MRH8VPwOeloNYGx1UjUQHuYDM g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259214925"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="259214925"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:08:10 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="583803288"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:08:09 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: sunxi: sun4i-i2s: update kernel-doc
Date: Thu, 16 Jun 2022 17:08:02 -0500
Message-Id: <20220616220802.136282-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616220802.136282-1-pierre-louis.bossart@linux.intel.com>
References: <20220616220802.136282-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Remove warnings

sound/soc/sunxi/sun4i-i2s.c:205: warning: Function parameter or member
'num_din_pins' not described in 'sun4i_i2s_quirks'

sound/soc/sunxi/sun4i-i2s.c:205: warning: Function parameter or member
'num_dout_pins' not described in 'sun4i_i2s_quirks'

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index f58aa6406a874..5be33d07361bd 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -161,6 +161,8 @@ struct sun4i_i2s;
  * @field_clkdiv_mclk_en: regmap field to enable mclk output.
  * @field_fmt_wss: regmap field to set word select size.
  * @field_fmt_sr: regmap field to set sample resolution.
+ * @num_din_pins: input pins
+ * @num_dout_pins: output pins (currently set but unused)
  * @bclk_dividers: bit clock dividers array
  * @num_bclk_dividers: number of bit clock dividers
  * @mclk_dividers: mclk dividers array
-- 
2.34.1

