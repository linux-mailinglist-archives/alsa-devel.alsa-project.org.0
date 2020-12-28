Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0D72E337D
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 02:45:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BC6717BC;
	Mon, 28 Dec 2020 02:44:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BC6717BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609119906;
	bh=8XHHi8Siaf/qYcMrh8wROE3iL3tKo+nYaMA1jMHWzDw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eXjvaaPKAAend5XKBORZD2BoC/ClrPJ8zZK1XttqjEmUguNQJNWiHPpcYjDIeZ7OP
	 86GIypLsCFa6+7X0PPqIdU3m7uNdC4U7mK0eYqytgJ459meUbYC0u9WrvY0oqMiqhd
	 uZvMS5ZP8K/bGEuboGs1TmyUND4oSiHEXBWG14fo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43875F80169;
	Mon, 28 Dec 2020 02:44:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEFA6F80240; Mon, 28 Dec 2020 02:44:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5057EF80169
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 02:44:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5057EF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="f9GQootl"
Received: by mail-pg1-x532.google.com with SMTP id v19so6473159pgj.12
 for <alsa-devel@alsa-project.org>; Sun, 27 Dec 2020 17:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z1FPgLpDk0gh+cKN0ax6PiFpVakJ9UkXdOQerOT23RY=;
 b=f9GQootlA1cGpm9ySBaeMh/zyB73fARiaAycDwZEselhQxlUASYEGvt97pzdkaCYhd
 obesKc2C5sTPhIe280H5ftsjOTW71bZZ/Beq4capTLz25KhK9PlG8jW7DV43qhl0FvIu
 qXCRcHJqXGUAdipzPxT9XqSGGmZJEQRF81W2EK/uv7Eo2k4pa5F6DC47/hx3z4JXC6oT
 oZyOPwgi2laSjH/Q7N1zm29i1pKg1H2VsYPilq1jLs4j1OIaQs3/Wi8QSZHSN0yPr+0V
 OBIlYXKsigytDeqhUWfuW4eDYKRMlMxNV3ATqrgoK5X9a+HRsfrA5cxgvvPaOIOo33sq
 Id6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z1FPgLpDk0gh+cKN0ax6PiFpVakJ9UkXdOQerOT23RY=;
 b=lV09HCpri5jlX+iTKZJTmDZi17JmqYRGQaVXzaIP4TNAvH97RH4BBI+XHPvUAnoSJE
 lyuQl5/mvR9dPdZYmHg6+pACktIAEtPAdJuwR+jGqqX6bC0s0OXvnhcU2gsi32FDqDKO
 Ioc1Vur63Mv1DnyYhLzmvciTimN+SADShsZceXYseTvOM8AJrrUdpjJ4AbEKxxf+lzm6
 AYtAwfJQAxRD/g61vDGJorWxn20BsKnYO+Pj3xM3jw7uLnX9eHRuT2WyGJnwtaAZsD+a
 wNDKklCxgDia7+6sSaISTIhmvK/M92IDVE8a7OpLYi6qy+5idYqTEDdL85sQ26Qon8ZX
 kNCg==
X-Gm-Message-State: AOAM53393ttUhoJuSx5SMVfLlrlP/vtEefoCyRIUh9oWOQ8WeQhJW/7R
 6YIuGF1ACXRzhWX9J945dR6iupbsxCJRnQ==
X-Google-Smtp-Source: ABdhPJzBGVS4m52XKyzxVYVBi79yMDvAmwB1y2wxQ+pd8XLPHWYTXK8GLwC/mRnL/ykPYfM38VcnhQ==
X-Received: by 2002:a62:d142:0:b029:19e:62a0:ca1a with SMTP id
 t2-20020a62d1420000b029019e62a0ca1amr38755981pfl.80.1609119846848; 
 Sun, 27 Dec 2020 17:44:06 -0800 (PST)
Received: from viper.bn-i.net ([2001:470:b:65c:b92f:8d47:b3dd:6388])
 by smtp.gmail.com with ESMTPSA id b12sm33635701pft.114.2020.12.27.17.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Dec 2020 17:44:06 -0800 (PST)
From: Alex Henrie <alexhenrie24@gmail.com>
To: alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.de
Subject: [PATCH v2] confmisc: fix memory leak in snd_func_concat
Date: Sun, 27 Dec 2020 18:43:15 -0700
Message-Id: <20201228014315.39991-1-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alex Henrie <alexhenrie24@gmail.com>
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

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 src/confmisc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/src/confmisc.c b/src/confmisc.c
index eb8218c1..3ce95c7a 100644
--- a/src/confmisc.c
+++ b/src/confmisc.c
@@ -419,7 +419,6 @@ int snd_func_concat(snd_config_t **dst, snd_config_t *root, snd_config_t *src,
 				tmp = realloc(res, len + len1 + 1);
 				if (tmp == NULL) {
 					free(ptr);
-					free(res);
 					err = -ENOMEM;
 					goto __error;
 				}
@@ -440,8 +439,8 @@ int snd_func_concat(snd_config_t **dst, snd_config_t *root, snd_config_t *src,
 	err = snd_config_get_id(src, &id);
 	if (err >= 0)
 		err = snd_config_imake_string(dst, id, res);
-	free(res);
       __error:
+	free(res);
 	return err;
 }
 #ifndef DOC_HIDDEN
-- 
2.29.2

