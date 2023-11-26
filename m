Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7517F9593
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Nov 2023 22:42:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34311DF4;
	Sun, 26 Nov 2023 22:42:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34311DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701034974;
	bh=4Cw8Ra2dFrW1R5pRSv1HMLmw5LS+bBGgyKqJ6znDbA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V0Xe1uquSh5POaP64N9G47gUyY/evvpdRL715Bt5xuLVV3+fzTrhoiUjAMnnhNPJT
	 wD5CVEHOUXTNNyxOsYnbNQXGoJQSK+M6rEYcl+IqUKo6LtOHnzQX1MSAaos0qIuAMO
	 4WWRzPpng+JVV1RresHjs/j2WtNhIc6vS+0FxC2w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4ABB8F8065A; Sun, 26 Nov 2023 22:41:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D004AF8065A;
	Sun, 26 Nov 2023 22:41:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D12EDF80246; Sun, 26 Nov 2023 22:40:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A84EF8016E
	for <alsa-devel@alsa-project.org>; Sun, 26 Nov 2023 22:40:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A84EF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=TwRmlkI/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701034847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+fV+7bkIgASF7VfV/ehalXQfD4eT2vxR2FrTiqnDMOY=;
	b=TwRmlkI/+wzmA4uCzQBBHpfBnrxELUk8yA0LmTevpqqiE/B3vpCqo8oBre3OsYgExboRyE
	hkFbqVjq9EfkHFho/1faQKFa6WFj1J6WELgMwLs+1iYg5qHRsLnmAq4mWEV0jux5bqyKbz
	SHR4SOjWHkin7Ic6zDHMIRDFboAphqQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-QARgVfw-Pc6M9WlAFGiRFQ-1; Sun, 26 Nov 2023 16:40:44 -0500
X-MC-Unique: QARgVfw-Pc6M9WlAFGiRFQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5E5A85A58B;
	Sun, 26 Nov 2023 21:40:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9573D1C060B0;
	Sun, 26 Nov 2023 21:40:42 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 7/7] ASoC: Intel: cht_bsw_rt5645: Set card.components string
Date: Sun, 26 Nov 2023 22:40:24 +0100
Message-ID: <20231126214024.300505-8-hdegoede@redhat.com>
In-Reply-To: <20231126214024.300505-1-hdegoede@redhat.com>
References: <20231126214024.300505-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: QGSIFESRX2YI3TNO4JB6RK32XCIVZFUR
X-Message-ID-Hash: QGSIFESRX2YI3TNO4JB6RK32XCIVZFUR
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QGSIFESRX2YI3TNO4JB6RK32XCIVZFUR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Set the card.components string using the new rt5645_components() helper
which returns a components string based on the DMI quirks inside the
rt5645 codec driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/cht_bsw_rt5645.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index df23a581c10e..c952a96cde7e 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -534,6 +534,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	const char *platform_name;
 	struct cht_mc_private *drv;
 	struct acpi_device *adev;
+	struct device *codec_dev;
 	bool sof_parent;
 	bool found = false;
 	bool is_bytcr = false;
@@ -583,7 +584,14 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 			 "i2c-%s", acpi_dev_name(adev));
 		cht_dailink[dai_index].codecs->name = cht_rt5645_codec_name;
 	}
+	/* acpi_get_first_physical_node() returns a borrowed ref, no need to deref */
+	codec_dev = acpi_get_first_physical_node(adev);
 	acpi_dev_put(adev);
+	if (!codec_dev)
+		return -EPROBE_DEFER;
+
+	snd_soc_card_chtrt5645.components = rt5645_components(codec_dev);
+	snd_soc_card_chtrt5650.components = rt5645_components(codec_dev);
 
 	/*
 	 * swap SSP0 if bytcr is detected
-- 
2.41.0

