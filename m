Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F553392312
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 01:12:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5371172D;
	Thu, 27 May 2021 01:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5371172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622070767;
	bh=RK1+6RZCRH5a717yVji/EITwcmJ7fkj129RV8FDrWPU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PtJuZ2WtFQ5k1Mq8BFS7IGKrV2xubxF/ToDgzXviRDNw82oYHAusaFyMm8NXzFyH+
	 D668twItaB54HTOK/2qR9F+Jj+Mn+vWz35qMr6opcz0PKaCMQZmnFn5V/qOm4YPOth
	 iwowXeaSRCDdsx960Hx6VqwnqmdCYsU7yO2bi3w4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D4CDF80302;
	Thu, 27 May 2021 01:10:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DDE0F80274; Thu, 27 May 2021 01:10:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20ABEF80264
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 01:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20ABEF80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MIcepU19"
Received: by mail-lf1-x12d.google.com with SMTP id x38so3023953lfa.10
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 16:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J91A2ezJDwmmBjDbHzFnYK1SauhUWhSDtbv+ex6BQOE=;
 b=MIcepU1970vDHoUb96UFwfdYyRxbLToMCwifD7g/JcbLZv+mJFPdH5/BH15slSU09p
 OUpIpHClX62/SKVvDxMGfInkkAhYT57wIeHj5qgu8Kzf4PafVDYW4VcPDswnu6ZpC3VX
 nDNZfXNJCTJrsSM/Du2AjquLHl2Tz4oInZmK4VXmh9Kx1rG6Trfgtrzvs03+HHtUO6G5
 3Cq+k68/P/+yaxiTL1RS0tBci5pODFWxJzZaD2IegVe9TLbXk9rJi/Al29CsYF/mDCdO
 rEVYaPA1UwPo2z7OAZvxrIZgzys/RnpNV8C+PGdfG+Io+McJ7QNw92JsnFneNCyZJM1n
 bEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J91A2ezJDwmmBjDbHzFnYK1SauhUWhSDtbv+ex6BQOE=;
 b=B33dAwuH8UGlW0ajNqjKYzO5D4tKL7PCK2zj+OXutb1mh08X5LR7I0se8+zDrGg3O+
 zlLPTfKZpD0AqsdNDlBI3V7lggWjmuE1bUav4SYKnsowSHTT8IRfvLr43rQ1zVAWSFB3
 mAWvphJ9waXoFLGKdI1A2gUY0I6Z/x5CBon00jY39dWIPUlvnr5xQoK9xReZyF9tFZPR
 1VKbQmAmecxY4MU1Hnnl1fh3LfB+Occ6tbr17OZtaBXtmaSST5tuW4hyLOcmegG4Oej8
 nUXweBC0XHqSSnqTBQHovJJjq+DfX/W69vR0aCPMz1Cv59Z8JCmkfoOfQ0PYEeoJDwYo
 MJ+w==
X-Gm-Message-State: AOAM531YbOGCmtmF6lHOmmqOj7tCuN9ftFjC3YEV3RVveQJFN924lsyV
 9pE1kHTwlG9XSA4b2c20PEs=
X-Google-Smtp-Source: ABdhPJxT4uY6M8RKPTvy2BvhyVq4g0Cd0qirCeVYzU5lkL6YtQEwOkpw5HntEv08KNRZ9HTvwRgSnw==
X-Received: by 2002:a19:f012:: with SMTP id p18mr293953lfc.493.1622070624086; 
 Wed, 26 May 2021 16:10:24 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se.
 [98.128.228.193])
 by smtp.gmail.com with ESMTPSA id d5sm35802lfi.144.2021.05.26.16.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:10:23 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/5] ASoC: wm5102: Constify static struct snd_compress_ops
Date: Thu, 27 May 2021 01:10:10 +0200
Message-Id: <20210526231013.46530-3-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526231013.46530-1-rikard.falkeborn@gmail.com>
References: <20210526231013.46530-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
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

The snd_compress_ops structs are only stored in the compress_ops field
of a snd_soc_component_driver struct, so make it const to allow the
compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/codecs/wm5102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index 34b665895bdf..621598608bf0 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -1989,7 +1989,7 @@ static unsigned int wm5102_digital_vu[] = {
 	ARIZONA_DAC_DIGITAL_VOLUME_5R,
 };
 
-static struct snd_compress_ops wm5102_compress_ops = {
+static const struct snd_compress_ops wm5102_compress_ops = {
 	.open		= wm5102_open,
 	.free		= wm_adsp_compr_free,
 	.set_params	= wm_adsp_compr_set_params,
-- 
2.31.1

