Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 771C54883EB
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jan 2022 15:09:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1529D1778;
	Sat,  8 Jan 2022 15:08:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1529D1778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641650960;
	bh=faP/wcTOPX1IaUK22XBUsZxPPCA2W8kym4L+jJW9va8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XEVXbRrIvySVClRnR+TOZZbr8BceJnhpipHfsacE6z/cz2J0ODBGrLk0xGFkG4vz4
	 HIFntOHMNloIJ1MbLP+5vJmO24PJ9WvT6fFb+RmHkoUwtEP3abwYEp54YjQm71jWRk
	 UM2b9EvQru4Z3b5dN+P+F5jqpkX4vb7asSLLKxMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44B95F801F5;
	Sat,  8 Jan 2022 15:08:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB768F801EC; Sat,  8 Jan 2022 15:08:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D71E4F80083
 for <alsa-devel@alsa-project.org>; Sat,  8 Jan 2022 15:08:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D71E4F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="LNCA0KDb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641650883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PocnGmnCbMvgl/mM4UqClsCjrZwW9G0adKzchgFrwe0=;
 b=LNCA0KDbpkdr03Wse0eE8VVY0zl/D8qtrXjQqV/vXlSGmDSxkS4vxjjMi0oouBOqIasBg1
 0AjKke83OnvYiWIwtR2aDNGlRWA05vNohF4TtYSHCRhS7nlVHj+DscoI46+/PDlrZhYqES
 ttGOD8P42il65/NExG0ttdw603Aus2Y=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-7dCwAlkrNbaJR9dZcSQy3Q-1; Sat, 08 Jan 2022 09:08:02 -0500
X-MC-Unique: 7dCwAlkrNbaJR9dZcSQy3Q-1
Received: by mail-oo1-f70.google.com with SMTP id
 b26-20020a4ac29a000000b002dac1c5b232so5958835ooq.2
 for <alsa-devel@alsa-project.org>; Sat, 08 Jan 2022 06:08:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PocnGmnCbMvgl/mM4UqClsCjrZwW9G0adKzchgFrwe0=;
 b=U4illvGvKGMCoi56BKmIIKWWn1vCamyp930V/X7v4Q6/VL375WrU8wjMDss1rdiJ5c
 2g8kXztmHqKoDtpe8CuVBGMkTBO7JYB42J8uN7dgEQ0+ckkk3t3vfrPkZG9VFGdSM5n1
 iaxRc47ECPX6oRR9EIIvHoygwm/typNLpA6t4n0N1c8FpddjQS1oV/vwLPu/J2dBispw
 by/6DrmtOoUPMi23RsyVLZuW1kw12fEPLgwn2+ur/K/y8f2uZIZFnm9q5B4qu5EBft5E
 D6jPNZRUrq2WGH0SiFbMnvlUhb3jHQ4W7syVYXQQGjDkQFtoSGi+OFsc53WxIVmR6cqW
 KJJQ==
X-Gm-Message-State: AOAM530roJSYOetuM6/oUKvx4yh4llqD5TyOiKWdzw0B10SgiEvE/4yE
 PdMtkCe9nEFf3R1BZbcEEQnaWx8agg/jJGb9zmmkSEaNBB+IqyVTiHm9zvtgrtlRJWA9DrEeTu7
 45JMtxhcRDh/hWIrpHUfwSaA=
X-Received: by 2002:a4a:da59:: with SMTP id f25mr43483459oou.46.1641650882095; 
 Sat, 08 Jan 2022 06:08:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLFcO/UPfE7QdAafOO6wi0ODe4Q/vmKo+QUX+NZH/NVBUk5VTc2tOqw3QSi/spK+bC/u82nA==
X-Received: by 2002:a4a:da59:: with SMTP id f25mr43483434oou.46.1641650881740; 
 Sat, 08 Jan 2022 06:08:01 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id i27sm348535ots.49.2022.01.08.06.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 06:08:01 -0800 (PST)
From: trix@redhat.com
To: james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com,
 nathan@kernel.org, ndesaulniers@google.com
Subject: [PATCH] ALSA: hda: cs35l41: fix double free in cs35l41_hda_probe()
Date: Sat,  8 Jan 2022 06:07:56 -0800
Message-Id: <20220108140756.3985487-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
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

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this problem
cs35l41_hda.c:501:2: warning: Attempt to free released memory
        kfree(acpi_hw_cfg);
        ^~~~~~~~~~~~~~~~~~

This second free happens in the function's error handler which
is normally ok but acpi_hw_cfg is freed in the non error case
when it is still possible to have an error.

Consolidate the frees.

Fixes: 7b2f3eb492da ("ALSA: hda: cs35l41: Add support for CS35L41 in HDA systems")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/pci/hda/cs35l41_hda.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index aa5bb6977792c..265ace98965f5 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -476,7 +476,6 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	ret = cs35l41_hda_apply_properties(cs35l41, acpi_hw_cfg);
 	if (ret)
 		goto err;
-	kfree(acpi_hw_cfg);
 
 	if (cs35l41->reg_seq->probe) {
 		ret = regmap_register_patch(cs35l41->regmap, cs35l41->reg_seq->probe,
@@ -495,13 +494,14 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 
 	dev_info(cs35l41->dev, "Cirrus Logic CS35L41 (%x), Revision: %02X\n", regid, reg_revid);
 
-	return 0;
-
 err:
 	kfree(acpi_hw_cfg);
-	if (!cs35l41->vspk_always_on)
-		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
-	gpiod_put(cs35l41->reset_gpio);
+
+	if (unlikely(ret)) {
+		if (!cs35l41->vspk_always_on)
+			gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
+		gpiod_put(cs35l41->reset_gpio);
+	}
 
 	return ret;
 }
-- 
2.26.3

