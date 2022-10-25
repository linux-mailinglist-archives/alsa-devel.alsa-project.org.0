Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 393E760CE7B
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 16:10:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1414526E;
	Tue, 25 Oct 2022 16:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1414526E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666707054;
	bh=E7LtvhuB6t9AblRuIZn3tDRobuDsAUxH9APskeQAolQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QLgsuUmHso6oIl9bDbybTl709yt1bEROiwObsi1ezufSCjgEcyHw84jlqdLAoZnMY
	 SJnNxEKHezlTJuDh/87prRJ/KyHTS/Emx7bcl5yPIGfsTxsvkNZypvSVRg4d/4OV/D
	 UZAPmxuLAdTpmqTHP2SqWnZgvbvjFSYO7oMrKWvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EC22F80448;
	Tue, 25 Oct 2022 16:10:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DFE1F80431; Tue, 25 Oct 2022 16:09:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C63E5F80115
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 16:09:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C63E5F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Q25+kPV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666706994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uCWU84K2OkW37ynQfbQOTPWj3Yaj/3eCjNmSyUljAXA=;
 b=Q25+kPV65uLckHc+REXJ/AKuzkniFDcOzgMaXtIeWrQD8pzM9AyJ8l/grS0Z/55RTS4uJi
 suXEJaDZ+xEjOOEhYGn4L8REr8zpUGQIWfROvma/CgqKrcx1ZohHu+DiNW4/BSXvnGhN81
 YvFYdkVNeqfE1Cml0AACeXzKfVm60x4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-JsK2nu3xMSaYxq2VOqIaZg-1; Tue, 25 Oct 2022 10:09:50 -0400
X-MC-Unique: JsK2nu3xMSaYxq2VOqIaZg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83AF7858F13;
 Tue, 25 Oct 2022 14:09:45 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C03247505E;
 Tue, 25 Oct 2022 14:09:43 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: bytcht_es8316: Add quirk for the Nanote UMPC-01
Date: Tue, 25 Oct 2022 16:09:42 +0200
Message-Id: <20221025140942.509066-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

The Nanote UMPC-01 mini laptop has stereo speakers, while the default
bytcht_es8316 settings assume a mono speaker setup. Add a quirk for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcht_es8316.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 6432b83f616f..a935c5fd9edb 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -443,6 +443,13 @@ static const struct dmi_system_id byt_cht_es8316_quirk_table[] = {
 					| BYT_CHT_ES8316_INTMIC_IN2_MAP
 					| BYT_CHT_ES8316_JD_INVERTED),
 	},
+	{	/* Nanote UMPC-01 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "RWC CO.,LTD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "UMPC-01"),
+		},
+		.driver_data = (void *)BYT_CHT_ES8316_INTMIC_IN1_MAP,
+	},
 	{	/* Teclast X98 Plus II */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TECLAST"),
-- 
2.37.3

