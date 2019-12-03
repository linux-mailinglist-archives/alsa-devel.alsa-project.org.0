Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 343E3111B88
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 23:16:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4771166F;
	Tue,  3 Dec 2019 23:15:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4771166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575411402;
	bh=Jh8BUu6FdHqGhXDfZ9y7tKeCsCOSDAT2P2js+jrMA9g=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AVTx8LhmFXMDAa4kiy468U/WzO7w2roD2MbMWqFnTexbNDWewAYNqCCmZsBqJB+a0
	 hlbn18+5/WvIJXtR5d/XG04f/E+YekKX0YBOLU5QWV4Jq9dw/2Kd6tsTL+Lut2TUpN
	 9B56LaXSljPitWFf4U9RqPi3x24fKTEkAlk7vHsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03B33F800F0;
	Tue,  3 Dec 2019 23:14:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A26A0F80227; Tue,  3 Dec 2019 23:14:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5EDAF800F0
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 23:14:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5EDAF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="P+RkjbHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575411289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P+2a0t9SbH64AMK8arg9gsHJrlov96sCY97aQcjW1rA=;
 b=P+RkjbHMbLuyVyqQW/AgL5SXBqrfupzmXKgqGh5BoBEw4293r7MUxxjiMvjSSgMUbl0kVb
 dDNlhCu8yiekdhz0rj+HCeOyk22uGf01v7hRG9D8iy7LMWtXTQTPUgbRHPencuX/KpkZnL
 R05rlxrTHtHBb/1F+mteJXMZw9vJad0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-fLmCD-obMh27HoDDzJ56IQ-1; Tue, 03 Dec 2019 17:14:47 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15718800D4E;
 Tue,  3 Dec 2019 22:14:46 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-25.ams2.redhat.com
 [10.36.116.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0ED15DA70;
 Tue,  3 Dec 2019 22:14:43 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Date: Tue,  3 Dec 2019 23:14:42 +0100
Message-Id: <20191203221442.2657-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: fLmCD-obMh27HoDDzJ56IQ-1
X-Mimecast-Spam-Score: 0
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] ASoC: Intel: bytcr_rt5640: Update quirk for
	Teclast X89
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When the Teclast X89 quirk was added we did not have jack-detection
support yet.

Note the over-current detection limit is set to 2mA instead of the usual
1.5mA because this tablet tends to give false-positive button-presses
when it is set to 1.5mA.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index dd2b5ad08659..243f683bc02a 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -707,13 +707,17 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_MCLK_EN),
 	},
 	{
+		/* Teclast X89 */
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "TECLAST"),
 			DMI_MATCH(DMI_BOARD_NAME, "tPAD"),
 		},
 		.driver_data = (void *)(BYT_RT5640_IN3_MAP |
-					BYT_RT5640_MCLK_EN |
-					BYT_RT5640_SSP0_AIF1),
+					BYT_RT5640_JD_SRC_JD1_IN4P |
+					BYT_RT5640_OVCD_TH_2000UA |
+					BYT_RT5640_OVCD_SF_1P0 |
+					BYT_RT5640_SSP0_AIF1 |
+					BYT_RT5640_MCLK_EN),
 	},
 	{	/* Toshiba Satellite Click Mini L9W-B */
 		.matches = {
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
