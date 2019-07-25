Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD91074924
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 10:29:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A1E91AC2;
	Thu, 25 Jul 2019 10:28:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A1E91AC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564043373;
	bh=SqYK31yKn1c3LNJgYcx5aC5sviYQf3PeMmDuqhz3vcs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=truihwvnxyYuZZfuZ4bEodnoCPJNqDtt8T72vIiwCcbOgBGBzFecODvfe1BBrDyv7
	 9WYo8l1u1qoRVRFEBgeGGuimawxKOZh0xy+iP9PiRc6hhPhDBWohAhelvlecx8Mm4f
	 jcB8qgSb/zG4X93CUStO4bDkwhQoKE5yuXMcFyc4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59B95F80448;
	Thu, 25 Jul 2019 10:27:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D330DF803D0; Thu, 25 Jul 2019 10:27:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC062F8015A
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 10:27:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC062F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uEdHBdGN"
Received: by mail-pl1-x643.google.com with SMTP id c14so23060056plo.0
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 01:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=XrnR0ob5JN+jXhmz3b6uLie9luXhbO1bl9luxd0o9lU=;
 b=uEdHBdGN1tspb+2pw1vjjIP9TPRoE69vcLhIkbQ3Buu7aF3UPsHXWe2IGuA3tRNBVq
 eZXOen8g79oqskTFwJi1T4z8wTYMs5sHGS0dqZWc/XYrk3vIl90BAeCwfVc+QcLwYOQz
 684c2rKuEzuenlNVqPQqjGAjSAeU3XELQqNfmTeBKmIgEEhwTS98qHi5dH17lvRp0YYC
 s6m0F+PUjW1Agvc//exnF281ZadBdvEmKtcTVmcM4wsV2N3OFyRGwROU1WbmN1p0uxrN
 60cn7S8wSpSNHW/6RJ3ewRADxQ2F1NIrCVVYAo4bhsdyT7rNAgsxSWrJB+GgjsoyU1uJ
 Rx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=XrnR0ob5JN+jXhmz3b6uLie9luXhbO1bl9luxd0o9lU=;
 b=WSvNWLsxVA8Hxv4/2i0rvVRiNffg7z1HhcRpsenG1vRGND4fxjg+R7q9gOi0k4Kz/h
 9MOgIXtRUTbBSc9Yh0g9QaUhUSA69WuEzFe46TsCPj4zXQPAd+VG00KetBzhzUkUzGYq
 eu1wTrQsnMJrCWYr0CUR9NV/pbLDLrEkEoRf/jcEUxVUxSiIhB/K1tEaWz18p48zYr+g
 JUG6N/OvDTzrhSIP2ngRw9mVn2iMzU2fXBLtSNjWgamsFDlbSEzVxJEKadmzwF9YM/33
 BWuLF27OeUH+uJWVQeteAmi5Ypog+C2lQbN31zl+ikYBFDILZQJEQI3BOvr670DzL3Qz
 TNcw==
X-Gm-Message-State: APjAAAV3U/L/uc0lgurbb3UEv6IxT7EeqzQ9zn7f+uzL7iiBiFg2QuUA
 l1JPddsaoQDnBd+YjHzWdIs=
X-Google-Smtp-Source: APXvYqww6hvROz9O0Lb5ItTHVgyKuuT2KrkP+kX9Gqvrb1HRFc/sHhySqFiHwAfn8TyH0dHBPbAzXg==
X-Received: by 2002:a17:902:e383:: with SMTP id
 ch3mr89404861plb.23.1564043260596; 
 Thu, 25 Jul 2019 01:27:40 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([2402:f000:4:72:808::3ca])
 by smtp.gmail.com with ESMTPSA id 201sm58677399pfz.24.2019.07.25.01.27.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 01:27:39 -0700 (PDT)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: perex@perex.cz, tiwai@suse.com, gregkh@linuxfoundation.org,
 tglx@linutronix.de, rfontana@redhat.com
Date: Thu, 25 Jul 2019 16:27:33 +0800
Message-Id: <20190725082733.15234-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.0
Cc: alsa-devel@alsa-project.org, Jia-Ju Bai <baijiaju1990@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: i2c: ak4xxx-adda: Fix a possible null
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
 sound/i2c/other/ak4xxx-adda.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/i2c/other/ak4xxx-adda.c b/sound/i2c/other/ak4xxx-adda.c
index 5f59316f982a..9a891470e84a 100644
--- a/sound/i2c/other/ak4xxx-adda.c
+++ b/sound/i2c/other/ak4xxx-adda.c
@@ -775,11 +775,13 @@ static int build_adc_controls(struct snd_akm4xxx *ak)
 				return err;
 
 			memset(&knew, 0, sizeof(knew));
-			knew.name = ak->adc_info[mixer_ch].selector_name;
-			if (!knew.name) {
+			if (! ak->adc_info ||
+				! ak->adc_info[mixer_ch].selector_name) {
 				knew.name = "Capture Channel";
 				knew.index = mixer_ch + ak->idx_offset * 2;
 			}
+			else
+				knew.name = ak->adc_info[mixer_ch].selector_name;
 
 			knew.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 			knew.info = ak4xxx_capture_source_info;
-- 
2.17.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
