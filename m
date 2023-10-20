Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F367D3986
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 16:40:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1907A4C;
	Mon, 23 Oct 2023 16:39:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1907A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698072004;
	bh=RiC4CUPwQVZ5g0b9P+Y++/Y7a2cailDUgucK0AuK7es=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=d7IHvW7hqrgXfG7oDk6Eu67C4j6D/2xm9vVUzGmTot2jo1r3sE/ANNd9ZTRt0CyyH
	 3gF5dDGhq+D9ypg/ScxMNY0v+/idzF1a3Llfr+exZEOfUT2juawHMS0kkKYqEVyIi8
	 EhAj8cdZiAUHFu6vuHqyWwCEdM3l30GnwzyvMUkY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0CBCF80570; Mon, 23 Oct 2023 16:38:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD813F80537;
	Mon, 23 Oct 2023 16:38:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66917F8027B; Fri, 20 Oct 2023 23:00:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E58ADF8024E
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 23:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E58ADF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=QDMCtdm9
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-7a67c3d62a3so43184139f.1
        for <alsa-devel@alsa-project.org>;
 Fri, 20 Oct 2023 14:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697835607; x=1698440407;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yo+YzGcf5ti2JGohRAjm5fHeXV6DLkhxTHbBeTwM3H0=;
        b=QDMCtdm92gEIhszW9f7Z/BAt5zxQd6nd2HYe2mlWxGoGstaRExs5d2W/eUwbA0SV0m
         ClYSzzJCvuoaUmrAkAAd7PvS+keN/E1/ENFClyXtTvFyiF0cG+SGAEQ4U9zpGL9ObVuP
         WIygEXcB9YlFrbWxH4UtHe+n09MHRFy+Zyn3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697835607; x=1698440407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yo+YzGcf5ti2JGohRAjm5fHeXV6DLkhxTHbBeTwM3H0=;
        b=ke254vmD7j009EuW/5En3HKsmEieig5DMf+yIgG5oYkWseSjxU6b3NQn2XD9RNv2GL
         kzwQnMr2AJMpbRzvbAVyeoT/71OHmqC4Go4Cx/Pf/Z7zmAyysnecyEPqn9hUxFIvwy09
         PUPrpZ4K8cZxpapNXh08buwC/9L2Yim47HNr8ARj/6K1ZsDvO5UELbVXCnqN/sHMWpSp
         aPPN8S5nZ9S21jI2m0aBrWi8YzOh95A3tiEF9NcDzJ8P8Xv/6VKzk4lT2cDwQPsnbn9A
         A2yeCF1Zq6PAUriE602wi0DmPQVq0iz8WSzb1Dc2HA42zuZYc8kXiEjkIPi4r6AsZ+N2
         DvqQ==
X-Gm-Message-State: AOJu0Yyaz2eyAGMv6+ufoSmCavK50dnf54v+Z5KfvufYQm4qRsd+t6cP
	cLMc+7MtgLhnrybjZea33AkALw==
X-Google-Smtp-Source: 
 AGHT+IHLHEyod+8rFouea36HiEYaF4mxyr+6M++FfbGIBZU2nDJ69584ByMJ7vuTFzTPPec8CAEqCg==
X-Received: by 2002:a05:6602:1355:b0:7a2:a6db:9a58 with SMTP id
 i21-20020a056602135500b007a2a6db9a58mr3565751iov.15.1697835607174;
        Fri, 20 Oct 2023 14:00:07 -0700 (PDT)
Received: from markhas1.lan (71-218-45-6.hlrn.qwest.net. [71.218.45.6])
        by smtp.gmail.com with ESMTPSA id
 y127-20020a6bc885000000b0076373f90e46sm850966iof.33.2023.10.20.14.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 14:00:06 -0700 (PDT)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Curtis Malainey <cujomalainey@chromium.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	stable@vger.kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	sound-open-firmware@alsa-project.org
Subject: [PATCH v1] ALSA: SOF: sof-pci-dev: Fix community key quirk detection
Date: Fri, 20 Oct 2023 14:59:53 -0600
Message-ID: 
 <20231020145953.v1.1.Iaf5702dc3f8af0fd2f81a22ba2da1a5e15b3604c@changeid>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: markhas@chromium.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HQKFIHKYY73QJRY4FWKDCQL5ZTTXAJI3
X-Message-ID-Hash: HQKFIHKYY73QJRY4FWKDCQL5ZTTXAJI3
X-Mailman-Approved-At: Mon, 23 Oct 2023 14:38:20 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQKFIHKYY73QJRY4FWKDCQL5ZTTXAJI3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some Chromebooks do not populate the product family DMI value resulting
in firmware load failures.

Add another quirk detection entry that looks for "Google" in the BIOS
version. Theoretically, PRODUCT_FAMILY could be replaced with
BIOS_VERSION, but it is left as a quirk to be conservative.

Cc: stable@vger.kernel.org
Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

 sound/soc/sof/sof-pci-dev.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 1d706490588e..64b326e3ef85 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -145,6 +145,13 @@ static const struct dmi_system_id community_key_platforms[] = {
 			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google"),
 		}
 	},
+	{
+		.ident = "Google firmware",
+		.callback = chromebook_use_community_key,
+		.matches = {
+			DMI_MATCH(DMI_BIOS_VERSION, "Google"),
+		}
+	},
 	{},
 };
 
-- 
2.42.0.655.g421f12c284-goog

