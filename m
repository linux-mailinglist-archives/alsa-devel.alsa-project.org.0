Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BEB3DDB08
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 16:29:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1075616FC;
	Mon,  2 Aug 2021 16:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1075616FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627914541;
	bh=1MaxUSWqneGDNaGeouqqwBKCKu+6Rbs8ksKySnzqPM4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z0oi1JKTbKsfdqc294M7vjOBFZfpxv0Jxjql+FizmmQtN3hIS09T+YV1fGcEjPB2L
	 lfOOyyORHSM/LB4u04/WYAjPIX3ZOxKokF3HwTGixQh6UQqf5iaHsIUP0qpgpbML7D
	 UyWposC49F7L82/fE6mPDxINMf1ZFrbwOFFGfuws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83A44F80510;
	Mon,  2 Aug 2021 16:25:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C59FCF8050F; Mon,  2 Aug 2021 16:25:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70C79F804FE
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 16:25:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70C79F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="S90qdBYe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627914339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nxLMVP/CA2WGd/O5vFsTOShau05VR+/WVuOCTV6uXP8=;
 b=S90qdBYeiwNTJ6OF+PtkYsNsuEwqumJanqlWY/fsZgSJjxI7o+Q7RAHAOkR0aP0KnplqDk
 BNH+D3WbdrrkS2kPB3VmC5lBcmJvjbeXmfjuuwLAQNGNee50msVu2O4CUNYfd1TUeTImah
 b5+AONE25n2u02WbUMVTdbyZxvnH2Sg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-9ickkX_mPL2WL1rdqAERug-1; Mon, 02 Aug 2021 10:25:35 -0400
X-MC-Unique: 9ickkX_mPL2WL1rdqAERug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9588801B3C;
 Mon,  2 Aug 2021 14:25:33 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5E9761093;
 Mon,  2 Aug 2021 14:25:28 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 6/6] ASoC: Intel: bytcr_rt5640: Fix HP ElitePad 1000 G2
 quirk
Date: Mon,  2 Aug 2021 16:25:01 +0200
Message-Id: <20210802142501.991985-7-hdegoede@redhat.com>
In-Reply-To: <20210802142501.991985-1-hdegoede@redhat.com>
References: <20210802142501.991985-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Bard Liao <bard.liao@intel.com>
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

The HP Elitepad 1000 G2 has 2 headset jacks:

1. on the dock which uses the output of the codecs built-in HP-amp +
the standard IN2 input which is always used with the headset-jack.

2. on the tablet itself, this uses the line-out of the codec, combined
with an external HP-amp + IN1 for the headset-mic.

Fix the HP ElitePad 1000 G2 to properly reflect this now that the
machine-driver supports this setup.

Note this also changes the mapping for the internal mic. from
IN1 (which was pointing to the 2nd headset-jack mic) to DMIC2
which is the actual input for the internal mics.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=213415
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index f67bd6caec36..d51bd22073df 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -644,8 +644,11 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "HP ElitePad 1000 G2"),
 		},
-		.driver_data = (void *)(BYT_RT5640_IN1_MAP |
-					BYT_RT5640_MCLK_EN),
+		.driver_data = (void *)(BYT_RT5640_DMIC2_MAP |
+					BYT_RT5640_MCLK_EN |
+					BYT_RT5640_LINEOUT |
+					BYT_RT5640_LINEOUT_AS_HP2 |
+					BYT_RT5640_HSMIC2_ON_IN1),
 	},
 	{	/* HP Pavilion x2 10-k0XX, 10-n0XX */
 		.matches = {
-- 
2.31.1

