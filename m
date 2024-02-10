Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA3985048C
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Feb 2024 14:45:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0A26852;
	Sat, 10 Feb 2024 14:45:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0A26852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707572729;
	bh=WBO5C6sVYdRuWLM5LZQAf1PayqEXdoHZZ8YtnHUd+Po=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JzOnAdlTW7GbfI5xZ9SC1jqZFkbiA/Am+zS6mpzPNME+71LHHR/KNWXguOg29FbBR
	 q9aRFiOtcpyScMyGRtEIhuXI/rxQGzEul4dRAzWn3pT3jgLOEvg6rTysRmfvUO8BXk
	 +qy8HXhETGyAg3m2U1lvhHAt2ltN9GZwrY+WO+6k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23D2FF805F8; Sat, 10 Feb 2024 14:44:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17B6AF805EE;
	Sat, 10 Feb 2024 14:44:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D1B3F801D5; Sat, 10 Feb 2024 14:44:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F01BF801EB
	for <alsa-devel@alsa-project.org>; Sat, 10 Feb 2024 14:44:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F01BF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=giP6EERR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707572650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PwgNRyGk3IaskSH1qj/6yJc3NIqPwSqMefX96tdvPGk=;
	b=giP6EERRVPSZb53Ftmhsnf/oo9Kt1Mdyv3PnXIyj12dm32CihSB7rw2ZvZIkXbhqURpb9J
	+6yTNXcBPJKhsjGSwe6kpJTW/3dRgF0+aHZtosWMRGaOoUZDcta7rXkyf1RtdKJZnh2FUm
	tTIspAIpflMph6PbsfRx3VlUw+0YS5c=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-561-JDcejDBWMkCj1C4jlaaqJg-1; Sat,
 10 Feb 2024 08:44:06 -0500
X-MC-Unique: JDcejDBWMkCj1C4jlaaqJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A07DB1C05EBC;
	Sat, 10 Feb 2024 13:44:05 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8EDFB40C9444;
	Sat, 10 Feb 2024 13:44:04 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: Intel: cht_bsw_rt5645: Cleanup codec_name handling
Date: Sat, 10 Feb 2024 14:44:00 +0100
Message-ID: <20240210134400.24913-3-hdegoede@redhat.com>
In-Reply-To: <20240210134400.24913-1-hdegoede@redhat.com>
References: <20240210134400.24913-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 72YYW6VSTV5KEHV32BWG3ZW64JTVA3NS
X-Message-ID-Hash: 72YYW6VSTV5KEHV32BWG3ZW64JTVA3NS
X-MailFrom: hdegoede@redhat.com
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

4 fixes / cleanups to the rt5645 mc driver's codec_name handling:

1. In the for loop looking for the dai_index for the codec, replace
card->dai_link[i] with cht_dailink[i]. The for loop already uses
ARRAY_SIZE(cht_dailink) as bound and card->dai_link is just a pointer to
cht_dailink using card->dai_link only obfuscates that cht_dailink is being
modified directly rather then say a copy of cht_dailink. Using
cht_dailink[i] also makes the code consistent with other machine drivers.

2. Don't set cht_dailink[dai_index].codecs->name in the for loop,
this immediately gets overridden using acpi_dev_name(adev) directly
below the loop.

3. Add a missing break to the loop.

4. Remove the now no longer used (only set, never read) codec_name field
from struct cht_mc_private.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/cht_bsw_rt5645.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index 7773f61064f4..eb41b7115d01 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -40,7 +40,6 @@ struct cht_acpi_card {
 struct cht_mc_private {
 	struct snd_soc_jack jack;
 	struct cht_acpi_card *acpi_card;
-	char codec_name[SND_ACPI_I2C_ID_LEN];
 	struct clk *mclk;
 };
 
@@ -567,15 +566,14 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	}
 
 	card->dev = &pdev->dev;
-	sprintf(drv->codec_name, "i2c-%s:00", drv->acpi_card->codec_id);
 
 	/* set correct codec name */
 	for (i = 0; i < ARRAY_SIZE(cht_dailink); i++)
-		if (card->dai_link[i].codecs->name &&
-		    !strcmp(card->dai_link[i].codecs->name,
+		if (cht_dailink[i].codecs->name &&
+		    !strcmp(cht_dailink[i].codecs->name,
 			    "i2c-10EC5645:00")) {
-			card->dai_link[i].codecs->name = drv->codec_name;
 			dai_index = i;
+			break;
 		}
 
 	/* fixup codec name based on HID */
-- 
2.43.0

