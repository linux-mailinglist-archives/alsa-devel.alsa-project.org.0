Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB9675CD2
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 04:16:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 326A11F7D;
	Fri, 26 Jul 2019 04:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 326A11F7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564107405;
	bh=mFr500myXH6P8LWzpRoMbP1SbBcjGpErCY6FV8rplH4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vOd7A23WBPX9IIoaNP1ZicieBFL6Gw4ce5Om5yhpjF7Gm0QdDLm4AFgmnwN0RMhH9
	 /5mOD4EtnQmsErHFuv6nR5fxgqu4oZOpGcofI7t0Fc0Dkv+4gYYui1vuC+zTJMBpWx
	 o8/di5ul6M0qpFgEp3d05K3pMtuB8XDIxawbM7SY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D164F803D5;
	Fri, 26 Jul 2019 04:15:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C03FCF80393; Fri, 26 Jul 2019 04:14:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20BB8F801A4
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 04:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20BB8F801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="L+5weXap"
Received: by mail-pl1-x643.google.com with SMTP id t14so24097903plr.11
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 19:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=omBls9Gx4bP4rqZZvHf2qg7ZHRKve5iFfEyz6IL0Sek=;
 b=L+5weXap3F/aUB3dU/dLA+E47mrqkGreRpNSO0P4EFp34DviXxVckUNAji93YEXOrK
 HaXiMFlzinZ1Ps+NCoJ+hMG9sIwJJyJm/PzOok2v1rnIamul1CNL0fjm0MUIGlLhpxSb
 g+c2f/hrtp3AoRTqU4Z0QrXkbM0IUSQr0Lm4Zztarg2M6/UgVLVwCJhRMnTOSc4P5wFm
 3+XHFE6MdqFXDzfFKidY+d8i5f8F7LEHmKEOAQ1t0Las1rpnsalyj0HJLZZeBsVfxXai
 J6x1DEySm84MM/MLR9GOgWy2utfArMn2CBkWLzlmTKJetppAHmDK0VkjzznOnj2R5GyV
 vjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=omBls9Gx4bP4rqZZvHf2qg7ZHRKve5iFfEyz6IL0Sek=;
 b=LhPjZq39ufdsNcj/QXLkZbLisea1SrcaznjX/sWpH18kSdFKMTQlOY4Ht9ephZLYOI
 eDCf1TlwrIUU443N3k0YEfVEYxktWpQY1sG3a9udy0NJep/MocBvCN1IoWH7jRm5oRNR
 +SMjpZKlUH7T7G+9hUPyTmvc6t8ylcbIrnETAYV596j9bJfoFjVHSwtLBLCn9PfAcuPw
 WrKOber1Gpfd6piEYoK+ehIEh3gam/0CXgcP8uuXBx1heXOSMzbIPc6ePLc30pwTVwg6
 RQyCsXr6/B20vgMHbJo+jpKHsrfTRAZu4JvJiZTa7+S1TFlE2c4d3X0+7InFJnYi9uPI
 /e2A==
X-Gm-Message-State: APjAAAUEu4bV7mhakUUDBhUlmVAwJFY6bMYI5gJG6cIrlL/HIZ4ZX7/k
 sIHwmTWAMaBR+J5BxDXjf/k=
X-Google-Smtp-Source: APXvYqzhtWZULLiTvGVlGqmQlDUERIrGC3/w9xnlHbHonHpzpbFCDrgdVCtDSTQxnMeQWP0657yc/A==
X-Received: by 2002:a17:902:1d4a:: with SMTP id
 u10mr9939058plu.343.1564107293936; 
 Thu, 25 Jul 2019 19:14:53 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([2402:f000:4:72:808::3ca])
 by smtp.gmail.com with ESMTPSA id y128sm69564365pgy.41.2019.07.25.19.14.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 19:14:53 -0700 (PDT)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: perex@perex.cz, tiwai@suse.com, tglx@linutronix.de, rfontana@redhat.com,
 gregkh@linuxfoundation.org
Date: Fri, 26 Jul 2019 10:14:42 +0800
Message-Id: <20190726021442.21177-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.0
Cc: alsa-devel@alsa-project.org, Jia-Ju Bai <baijiaju1990@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2] ALSA: i2c: ak4xxx-adda: Fix a possible null
	pointer dereference in build_adc_controls()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In build_adc_controls(), there is an if statement on line 773 to check
whether ak->adc_info is NULL:
    if (! ak->adc_info ||
        ! ak->adc_info[mixer_ch].switch_name)

When ak->adc_info is NULL, it is used on line 792:
    knew.name = ak->adc_info[mixer_ch].selector_name;

Thus, a possible null-pointer dereference may occur.

To fix this bug, referring to lines 773 and 774, ak->adc_info
and ak->adc_info[mixer_ch].selector_name are checked before being used.

This bug is found by a static analysis tool STCheck written by us.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
v2:
* Fix the errors reported by checkpatch.pl.
  Thank Takashi for helpful advice.

---
 sound/i2c/other/ak4xxx-adda.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/i2c/other/ak4xxx-adda.c b/sound/i2c/other/ak4xxx-adda.c
index 5f59316f982a..b03e6d1be656 100644
--- a/sound/i2c/other/ak4xxx-adda.c
+++ b/sound/i2c/other/ak4xxx-adda.c
@@ -775,11 +775,12 @@ static int build_adc_controls(struct snd_akm4xxx *ak)
 				return err;
 
 			memset(&knew, 0, sizeof(knew));
-			knew.name = ak->adc_info[mixer_ch].selector_name;
-			if (!knew.name) {
+			if (!ak->adc_info ||
+				!ak->adc_info[mixer_ch].selector_name) {
 				knew.name = "Capture Channel";
 				knew.index = mixer_ch + ak->idx_offset * 2;
-			}
+			} else
+				knew.name = ak->adc_info[mixer_ch].selector_name;
 
 			knew.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 			knew.info = ak4xxx_capture_source_info;
-- 
2.17.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
