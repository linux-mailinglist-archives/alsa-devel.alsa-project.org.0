Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B26C568AE06
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Feb 2023 03:14:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92647820;
	Sun,  5 Feb 2023 03:13:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92647820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675563270;
	bh=+iVORuYuMhu4qETJZoX18Qxn9K3wJdKgmvIQpT9JmQs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=oSX2YmBek+RIXnl0sFpgJ0cFKp9hJloExTOmZnufoj/6+odSOjg88QkXDMhCIHcxQ
	 fgculQQGEnuz8cAh4OItD/e8jhN139NCcFNW41/efqV+EXLB2YzZn0FbQlSoVvjntC
	 5Oprx0Xe/IjtGYRf4+7yg9zXJrbYhYnbUYv1qgZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6552F8001D;
	Sun,  5 Feb 2023 03:13:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 146B8F804C2; Sun,  5 Feb 2023 03:13:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E513F80162
 for <alsa-devel@alsa-project.org>; Sun,  5 Feb 2023 03:13:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E513F80162
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=MRNlVGw1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675563201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ti8X/no/PUHL0AZuLXOo07rzpY67vV1fRdGL+Apgc10=;
 b=MRNlVGw1pjlIOAt7gxYzdtsC9gvQkF9aeFQjqAe8B62G1WdDSCaNwFHVp3aePZP7C1xA9L
 uDIJ+0mbQOB/Pnw663YljpWgVM4D4UuQXIL9WINzxa/Rsfq15sI8XmNbCB5loXOK2kv/yv
 F5C5WjjNTJCflQN3DGtEiPeDeZHGcs0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-441-xXVyxhbNMrSvH9aE26zmLA-1; Sat, 04 Feb 2023 21:13:19 -0500
X-MC-Unique: xXVyxhbNMrSvH9aE26zmLA-1
Received: by mail-qk1-f199.google.com with SMTP id
 w17-20020a05620a425100b00706bf3b459eso5844427qko.11
 for <alsa-devel@alsa-project.org>; Sat, 04 Feb 2023 18:13:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ti8X/no/PUHL0AZuLXOo07rzpY67vV1fRdGL+Apgc10=;
 b=bTv1MVFMTFAmD2sw7sieHpacU8lby8vIdHz2yJi1wc8uoINPIaSXS4Lr6PzupLfBuF
 Ndtbyrw8pLMRLxfKO+JdtSBto+7VIA2hNvGsTtIJk1IklCX8G+AT0SEmZ5xRmqipqb8r
 Zyww5D0LUZy3ch6ZyaJ4cptui3Ut/bNpcys3delpxmAAZ1Uq4IBcV9p+3l7s0PJ9lfE+
 LvSu878Y21Y6Awk0igc2smW7vB+e7oxFfbGknSFXI1KkXYDrrwJ7kTP3czpiZ6KcUnOb
 9I81QmViDBtQJwLpL7cLwXJfNRY6yXXhd6hzU/XWU5zpSUjEMOPdue37lF2hpm8TICP9
 09Dw==
X-Gm-Message-State: AO0yUKUPy+s/R9OGPuA1/M/GCstXa4kFQHZaPPGJbOaeGjipUmeGWI6j
 lyLrXX/77qqHGd4LwoKkuwuE5LDVl9Z5ZDWw030ov7HmzY1eqgI6emWcy2y6ak4gonPWum7i86H
 vpRlocgIJJ+wARN3l8Gjv43o=
X-Received: by 2002:a05:622a:34e:b0:3b9:bda7:bfa7 with SMTP id
 r14-20020a05622a034e00b003b9bda7bfa7mr28226310qtw.40.1675563199202; 
 Sat, 04 Feb 2023 18:13:19 -0800 (PST)
X-Google-Smtp-Source: AK7set9OkA10FCcupiaY4iiAdKXtqwaxPP+EiUcMzFKXACPqRgx3hajFPOHWvBbGXnWXABs0p0KGrw==
X-Received: by 2002:a05:622a:34e:b0:3b9:bda7:bfa7 with SMTP id
 r14-20020a05622a034e00b003b9bda7bfa7mr28226286qtw.40.1675563198864; 
 Sat, 04 Feb 2023 18:13:18 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 y21-20020a05622a005500b003b9bb59543fsm4590130qtw.61.2023.02.04.18.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 18:13:18 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 liweilei@awinic.com, colin.i.king@gmail.com, wangweidong.a@awinic.com,
 zhaolei@awinic.com
Subject: [PATCH] ASoC: codecs: aw88395: initialize cur_scene_id to 0
Date: Sat,  4 Feb 2023 17:57:33 -0800
Message-Id: <20230205015733.1721009-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Tom Rix <trix@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

cppcheck reports
sound/soc/codecs/aw88395/aw88395_lib.c:789:6: error: Uninitialized variable: cur_scene_id [uninitvar]
 if (cur_scene_id == 0) {
     ^

Passing a garbage value to aw_dev_parse_data_by_sec_type_v1() will cause a crash
when the value is used as an array index.  This check assumes cur_scene_id is
initialized to 0, so initialize it to 0.

Fixes: 4345865b003b ("ASoC: codecs: ACF bin parsing and check library file for aw88395")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/soc/codecs/aw88395/aw88395_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88395/aw88395_lib.c b/sound/soc/codecs/aw88395/aw88395_lib.c
index 64dde972f3f0..d7c31a202adc 100644
--- a/sound/soc/codecs/aw88395/aw88395_lib.c
+++ b/sound/soc/codecs/aw88395/aw88395_lib.c
@@ -769,7 +769,7 @@ static int aw_dev_parse_dev_type_v1(struct aw_device *aw_dev,
 {
 	struct aw_cfg_dde_v1 *cfg_dde =
 		(struct aw_cfg_dde_v1 *)((char *)prof_hdr + prof_hdr->hdr_offset);
-	int cur_scene_id;
+	int cur_scene_id = 0;
 	unsigned int i;
 	int ret;
 
-- 
2.26.3

