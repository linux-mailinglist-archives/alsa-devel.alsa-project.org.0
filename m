Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD77E8A9ECA
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:44:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 334F3DEE;
	Thu, 18 Apr 2024 17:44:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 334F3DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455064;
	bh=RRyqPnteX9svo/FeqH7qejShvl+Wu9J6rtShURC1Bwc=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iaxhr0n99q5IOuuiexX4EhMtfjsJV2iQdySHpg2PcQP0Fi7GJvcYUkfXTqiFzQ7dF
	 INmdD6b6ckIgFLyHTkbhtCvkX1SwI+bG7+IJpBQH8kMkkhj29KcY8/YBlxpluxFu65
	 IpOcmcyh2ices3b4vNE7T+okE4xrE6vjOYyLDrFU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43C30F80578; Thu, 18 Apr 2024 17:43:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CADFF80589;
	Thu, 18 Apr 2024 17:43:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8DFDF8026D; Mon,  8 Apr 2024 10:10:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C398F80130
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 10:10:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C398F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Pp8ihlE1
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56e56ee8d5cso976417a12.2
        for <alsa-devel@alsa-project.org>;
 Mon, 08 Apr 2024 01:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712563818; x=1713168618;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zrHqjLybF7CJnuNHXKR+lEoGvKA0pqz74L9RRTV+fT8=;
        b=Pp8ihlE1aCJZCuHhOvPOj07gYU21kWE+9zR58o0f8nbSSBQqrBlIxlTEIWLeSM7OF3
         EMeQ/1/bLhmFxPVa4GgLzi4pvwFjkBv2m3toQOG9trOELjNp1rMvCpSugfwI+Tj1lGYn
         GqIHOVXN+cuIxhrDOPoF2hTt9/mh7MapN29KAYYps5JXqlD/ZgXhI5Pedi1nwr9OUsaH
         lczk8U2tt+EKHgIdtxwKT6gHA6SxPmTmMOpbo+IsfbHTbMQ+buQ4sISZ3AzfcyH3L7Ic
         MvkfrrfFRUR73umST8MMXoI77xX1gM2Cp+6m0hl5HWoyTOF7W9ZOHuw/i4KWHt3nDezI
         Et5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712563818; x=1713168618;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zrHqjLybF7CJnuNHXKR+lEoGvKA0pqz74L9RRTV+fT8=;
        b=RytKLnEC2ORqCnbkbvwzjkm1LwvLVV2AV2cpodMMkH5OmFtqujm7pf47GJ9yWGewIE
         DC+nBEu/MnPPEIua9+drflIWEr95jsft5QOa5Hw+tWcgNhTJFwDm5NTariDmjCCcQslr
         81o/Tq6TGcqjQ4i1HnH5O8BkSnE9YlWUkLWklGFLQIKqOyc9TCOnQ7nJRnsI/fL0p9Lp
         smXBk03JOA1UpQ6xX2mlLJDOHdzRhkknb4G6n7Sq8Wwz1iGQjRIfEbWyDdYAMgTTQMPB
         7NRyVgTQL6ZtTQ2wnO4DMuIMD3aoeYtqOOe94Upm4Fye5nq/u1WAToQ7xhULOuc9HF/D
         h0Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA0P7kWpI/I+bK5e09gn0m6U1sZaE4PHHINmk+UmUXA8KmNSsKEewdOJuQJkiUhOrScK3BVOJ7YcBVDC9MBxtUEt22cLwR8Vkfn8I=
X-Gm-Message-State: AOJu0Yy5De/4pmmneqkdzL5oH6Gpmxdmq0YDObLUoEd1foyB8BSgjeqJ
	dzaTnM+69lDXQvxbOQ4qnRAeSi9wYQWfJWu1rBR7O3YBhfvrKP0ttWN/XAXoKY0=
X-Google-Smtp-Source: 
 AGHT+IFaWJ0ko+880OE4+Ydorjjhc+EVFX8MZM5sS9kOSFgetr0n6d6xvsAp8RTPVZNNLK44nNU7nQ==
X-Received: by 2002:a17:906:fcab:b0:a51:8a78:d2ff with SMTP id
 qw11-20020a170906fcab00b00a518a78d2ffmr5620413ejb.34.1712563818217;
        Mon, 08 Apr 2024 01:10:18 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id
 my46-20020a1709065a6e00b00a4735e440e1sm4149587ejc.97.2024.04.08.01.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 01:10:17 -0700 (PDT)
Date: Mon, 8 Apr 2024 10:35:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Brent Lu <brent.lu@intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Terry Cheong <htcheong@chromium.org>,
	Uday M Bhat <uday.m.bhat@intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mac Chiang <mac.chiang@intel.com>, apoorv <apoorv@intel.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: Intel: sof_rt5682: Fix uninitialized variable in probe
Message-ID: <6e16433f-1897-46a2-b3ee-e177e7d846b8@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UBPGLTUETTUIZOASUV6QO4OWWQVIW2R4
X-Message-ID-Hash: UBPGLTUETTUIZOASUV6QO4OWWQVIW2R4
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:43:45 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UBPGLTUETTUIZOASUV6QO4OWWQVIW2R4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Initialize "is_legacy_cpu" to false to prevent an uninitialized variable
bug.

Fixes: 8efcd4864652 ("ASoC: Intel: sof_rt5682: use common module for sof_card_private initialization")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/intel/boards/sof_rt5682.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index aadd341a202c..966bcd3e8bdc 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -606,7 +606,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct sof_card_private *ctx;
-	bool is_legacy_cpu;
+	bool is_legacy_cpu = false;
 	int ret;
 
 	if (pdev->id_entry && pdev->id_entry->driver_data)
-- 
2.43.0

