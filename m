Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD307DDD2F
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Nov 2023 08:28:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AB539F6;
	Wed,  1 Nov 2023 08:27:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AB539F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698823723;
	bh=c03BVXby9Pnffb5i10dbdyYNb+ETscQ/VWfHWacY8PU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RN5RfEIrRxVO1RV1/ztgijswDQUeBX8MnDM6MRVdZVF1CzzU1KU1AvnLDC7fR0rBk
	 KbPKb51Adc+4o9ZEV/+BF/jKq4ayQEuoxRWOELidbm2rf1nnD6/3azuKi2nudcPlCD
	 sCe/Pn5R7rP4jgAropM3wySjUazt8l4dtokGvaOM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B80EDF8014B; Wed,  1 Nov 2023 08:27:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54EFCF8020D;
	Wed,  1 Nov 2023 08:27:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13260F8020D; Wed,  1 Nov 2023 08:27:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 404EFF8014B
	for <alsa-devel@alsa-project.org>; Wed,  1 Nov 2023 08:27:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 404EFF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Og+bjtVo
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6c115026985so3140448b3a.1
        for <alsa-devel@alsa-project.org>;
 Wed, 01 Nov 2023 00:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698823638; x=1699428438;
 darn=alsa-project.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKwqo5h4s13sebhxnRbLoY1rW1jT2Dv7hIFO/iV2KV4=;
        b=Og+bjtVoPPS9KGWyupAQb2UgyOHePfkGYZpUkVtMYKPYTgp7TlVAcMrILPyCPNL1yw
         5FhZZbBOgOR2dxIbHbJUONGFtZKWw7RTGvQURcT3+z8uZuZkTf2kENJqV7aTVxM/naMW
         oWtPGQKDAqpTaxk7To8TMJUbBmFIJU+OVTLDNNHoNydU24Mx0zD4HV8vwHI34N09JBli
         MwovninjRQ6IKvWTbRrpK3/1Ir4iIHECfqSfAa7WCh8v0tSAdwS9KCp4PACh+P9H0L0N
         5cS0PFBsF/yD9owLm7VgLtaxemXCQHFj1Nt+pS1sF4c6BfNWWe65MGrvEa3UEQvjTuVV
         6QdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698823638; x=1699428438;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKwqo5h4s13sebhxnRbLoY1rW1jT2Dv7hIFO/iV2KV4=;
        b=rBeirXhvXW+k4YlN/N/oSCA8ydxTOqovE7H4C8hxjVRqzwqAiveVuL7FvMoMZbCd3c
         TUKJKlrSd7RlFkTBUDDgp7xoJgyrtkZbgyu7lYlEyzOQqQx+Ry7nGuHw1SmSEjKpvMJe
         CDOyump9iiwTFG6WVCRMDbe/MVfjUgHAPyDdoQy+T0WWUPmPkKqIV2Mj9/nXnB/GU7IP
         JirkXS73nr5jeqv0OG/RU2gngFcHtj9g/W+pz0LfYzXqs4KROl5rLlg7xRpHBDZXph8t
         77+Oenc/PlsWwQGg4bXuJCMy9X7KZML+sKY5E4dT4uzGTBr9DyO+awR71/yx6umOuNyR
         525w==
X-Gm-Message-State: AOJu0YxkFAxh/U06fxQccDLNwnpzoO8UmVoc68ttCTO25DQk9OwH5AaG
	HwVJ1nz0cl/28bTwo42OggzbesNTJLkIig==
X-Google-Smtp-Source: 
 AGHT+IHKD4QFEiYEKdIZJnzj/ef4E0Lt5Pjvt0dsZxp1Wa6LbTcfTdGdXLYmQLqpcpWKiA6Ka11cKA==
X-Received: by 2002:a05:6a20:4924:b0:17b:2c56:70b8 with SMTP id
 ft36-20020a056a20492400b0017b2c5670b8mr13744016pzb.22.1698823636920;
        Wed, 01 Nov 2023 00:27:16 -0700 (PDT)
Received: from zy-virtual-machine.localdomain ([116.232.53.74])
        by smtp.gmail.com with ESMTPSA id
 t23-20020aa78f97000000b0068ff0a633fdsm686124pfs.131.2023.11.01.00.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 00:27:16 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH v1 0/3] ASoC: codecs: ES8326
Date: Wed,  1 Nov 2023 15:26:59 +0800
Message-Id: <20231101072702.91316-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
Message-ID-Hash: PDSYWV6QFOF7FVL7TPDYRZG4RO6EIPAG
X-Message-ID-Hash: PDSYWV6QFOF7FVL7TPDYRZG4RO6EIPAG
X-MailFrom: zhuning0077@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PDSYWV6QFOF7FVL7TPDYRZG4RO6EIPAG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi ,

    3 patches here for the es8326 driver...
    
    We developed a new version of the chip. 3 Three patches are used for 
    compatibility with the old and new versions of the chip.We did tests 
    with the new driver at version_v0 and version_v3.The test results
    from the test department met our expectations.Both versions work well 
    with the new drivers.

Thanks,
Zhuning.

Zhu Ning (3):
  ASoC: codecs: ES8326: Add chip version flag
  ASoC: codecs: ES8326: Changing initialisation and broadcasting
  ASoC: codecs: ES8326: Changing the headset detection time

 sound/soc/codecs/es8326.c | 231 +++++++++++++++++++++++---------------
 1 file changed, 139 insertions(+), 92 deletions(-)
 mode change 100644 => 100755 sound/soc/codecs/es8326.c

-- 
2.17.1

