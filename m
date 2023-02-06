Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B742168BF0F
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 14:59:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07FA6F7;
	Mon,  6 Feb 2023 14:58:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07FA6F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675691988;
	bh=/hngscjINzSgKXSuYx5IHnlxm7V3RsCQg/q7xqkkprg=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=oN33tDzj7u0VYPz500o55FTr1P/rim6bsociJXY6ORb/btkKFMIK5fTOQ9Rk/Mhij
	 ule8F9d5USNyfT9emM3DCPrIVTrJOjGfvAAY5j/7kbQr1gsPYaGiMgfDPyhqkA4ziY
	 8al2GAwnGsyMykBF3ZUvuFKvHcME8iXMYXXto4rI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35834F804F1;
	Mon,  6 Feb 2023 14:58:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6C45F804F1; Mon,  6 Feb 2023 14:58:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D38BF800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 14:58:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D38BF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RTout/gg
Received: by mail-wm1-x332.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso10854829wms.0
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 05:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u9BgtJ4so9KwHhE8rorYQ5JnQdesAnEyOYjdic9MTfc=;
 b=RTout/ggpHfdGBZVfYR89ad+hgiP0Eb6NEBtrAjuAZtS5HlHGYlt6HOQf1A7UqrBue
 qm/ZfeS8bs/s1nRE4MgBhcyVDZq+4NwvPL1zY/CtaNolQkoypGoGzrYohc1woRsIiQYw
 Z1rhjxBtZaEVphFcZshQsVn9D9jUd/po6Gt9fbDlYNM8bCbQKaoySCIYJUCoB2JrWJAG
 7fG0TQ5ldCXIE0zL0bE0MYj1Gs4WQ2RT5d07F5hsbe+nBlPIXqqMAn3hpEnFrAWz7x19
 ixvApe1G/mC87L/adlORLPJGgwjDzVRhyDfWL6dx19TLTq9nMdSie81kj14F2O1Lim4T
 PWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u9BgtJ4so9KwHhE8rorYQ5JnQdesAnEyOYjdic9MTfc=;
 b=3ss9UdL0ceXNbW/akBlsX791sBxr7lmyAttJ6xIlFsRaF6UcXOPJ+6woCP6V0KGvSv
 Id9WOD+GP+xUZM2uI9v7pUlZF+QNmpy4WZRIaD0eLBcAaeh9Q2wSRx9KzEk5/0u6ACQf
 LdVVNWeS1fp0ZGLanwLfjvjfzNhkW+aWsHtOKe/pC2mPNBp/eH/T2XVvHEZfLKA80Q2W
 fVLCcGXOGHNk6zPUTGa5sFAPxWVlKFEVeKlsrA+bg5yM7vGxB1sawSKZD8ZJTgAJFX+9
 9EISjiVYHncNyKMG9tpa7kpo6cBZ0oDLGaPoaDntR+rG7r81NaN6vgxJlm0Lwbx8jzG3
 BMAA==
X-Gm-Message-State: AO0yUKVT8ukVlWR31JUy0m3Vm6P2+QuuAf6c8ML/cV+2JEWgQ5cXDX9P
 loYySVwoSlG+7v/k1b1CLVn04ljKZN8=
X-Google-Smtp-Source: AK7set/lsRA0W5X4iJwzoXeGyM8eEf3KsDdv4IP8UG2N0ozVzaPlKmjU1xAsfIAkmUt8JS6LFE+2Dw==
X-Received: by 2002:a05:600c:1d96:b0:3dd:af7a:53db with SMTP id
 p22-20020a05600c1d9600b003ddaf7a53dbmr19346118wms.11.1675691921772; 
 Mon, 06 Feb 2023 05:58:41 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 j33-20020a05600c1c2100b003db0ad636d1sm18549148wms.28.2023.02.06.05.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 05:58:41 -0800 (PST)
Date: Mon, 6 Feb 2023 16:58:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Weidong Wang <wangweidong.a@awinic.com>
Subject: [PATCH] ASoC: codecs: aw88395: Uninitialized variable bug in
 aw_dev_parse_dev_type_v1()
Message-ID: <Y+EHjQ0+QCAXxmlh@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Bruce zhao <zhaolei@awinic.com>,
 Nick Li <liweilei@awinic.com>, Mark Brown <broonie@kernel.org>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The "cur_scene_id" variable is never initialized.  It needs to be set
to zero for the code to work.

Fixes: 4345865b003b ("ASoC: codecs: ACF bin parsing and check library file for aw88395")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Presumably this code was tested with CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
or whatever to automatically initialize it to zero or it would have died
specatularly.  ;)

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
2.35.1

