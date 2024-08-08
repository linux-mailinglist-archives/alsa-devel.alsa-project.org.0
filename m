Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4418794C4EF
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 20:53:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3E987F8;
	Thu,  8 Aug 2024 20:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3E987F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723143223;
	bh=IYIEF2tpGgWgsk3UCWqxe52vjVCoL1cfnQRYQZUX0wU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u7BTMLTMoTjdNjAELDzJry5TszowMyIq/ezp2q/Q5kTZqOM3ET+gMxT//HAkpxhMO
	 sH0kg8vsPuNXVpTNKEmh2Rze4ixNvpo9yAUuwMA4k0a+0yG64nzleVhZYVp0TjuEHP
	 wqpnVDMMAxh2/FURo/TpEA2Z7fofbZTHwQJJsDZ0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 763B3F8067B; Thu,  8 Aug 2024 20:52:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92541F8023A;
	Thu,  8 Aug 2024 20:52:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F18CCF802DB; Thu,  8 Aug 2024 20:50:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B0C1F800B0
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 20:50:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B0C1F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=l+EKkqen
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-70d2879bfb0so130383b3a.0
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Aug 2024 11:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723143038; x=1723747838;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dN83GrAFp2sbzsWsThcrr6kqMedA31alRy4sc8FYM98=;
        b=l+EKkqenm1F3rZRnETewYts3rx2y52TwdiieuBFCkDopzjdSxnzBkTyr8jjia/kmK1
         s/58btUGb0LO31YNvmgrYJi+Rk8Jw5qdbgyLvQKFFU9M7vwIclU/Oxsys1SPoN+FBv9B
         PZXG3I5djJ1sitnJMaYv4LxHH4OOW+7fRvHk0vehAc3yEI3UziFnW4ahLRj2FEtCmxNS
         ee8xZZb0j+4WfCeVKsZCSW76JlOqxhXwQOvWZG7s6rfRaZx9P22rQ/RRKu3bsPqMy3N1
         fozcl7VWjdzXuqGh+cH4Px6CdtDjg/dcEM/q8IikjAXgO/vz93Mb92Nevq61udceXDdd
         Oe6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723143038; x=1723747838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dN83GrAFp2sbzsWsThcrr6kqMedA31alRy4sc8FYM98=;
        b=Sx/YyI50YhF+cWqbuH6H59cJMyVgrY5F0WdP7Smm+lgd3EKJs+e8Sv+Twg/ADFSyrV
         vxLG6GZ5x4P8dBYkQMyvfVVI+k+yAX3HvsCW0g5mFrC4Fi+hwvZQag1Ay8bmmyhnZCGR
         w73sN62d+RLKHWJp3mCNOOxTRN7cZ5Dgl5gUeGyTgBdKCuQGTjnrRdDPgHSZLbQuhTrB
         1kDbfndlqMBiSvi1QXh9YR/zlLhJyHt0bjJntde0nYYJMvmVa5YYlt40kFgi4fhl/Dfx
         H9XaZKXhHC5D+RjnpqvKgs0HvWHLMj+I6AFGu/+RhGwRPGVsdryOJjaVOrTaq/20eJIk
         2Wug==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5RgWnAfQvu4lRSOR89ypUCp2llPxYetBduz8VGJbEmbqmJHumRToGr931BRU7JQdtAqk1vnBYS5qwmBMO1EuabheZgh6bVQtanbg=
X-Gm-Message-State: AOJu0YwMVOtZQ67Stz0fz9s5w6smK0hjwcbAb7p7FDNKQKkRx1YaWi/c
	pIBznjEKXne88nE2GCe7W7xbeoPjXo+HJgeWhw1gk38I8uoNFeWIO9rQ1A==
X-Google-Smtp-Source: 
 AGHT+IFNv4lJ/2PUM0ae4lyqNexS0DCH4TI69skYGrTVrP7C3nl35aJfHts5bNDEcXHvD5zesFe0ww==
X-Received: by 2002:a05:6a00:3a14:b0:70d:1048:d4eb with SMTP id
 d2e1a72fcca58-710cae6b355mr2038957b3a.3.1723143038367;
        Thu, 08 Aug 2024 11:50:38 -0700 (PDT)
Received: from fabio-Precision-3551..
 ([2804:14c:485:4b61:d689:1e02:dd79:b72c])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710cb2e4acesm1466354b3a.141.2024.08.08.11.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 11:50:37 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	alsa-devel@alsa-project.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 6/7] ASoC: imx-audmux: Switch to SYSTEM_SLEEP_PM_OPS
Date: Thu,  8 Aug 2024 15:49:43 -0300
Message-Id: <20240808184944.267686-6-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240808184944.267686-1-festevam@gmail.com>
References: <20240808184944.267686-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JZEVBSDBMEZAHDY4BBELFLWT4EXXOGCS
X-Message-ID-Hash: JZEVBSDBMEZAHDY4BBELFLWT4EXXOGCS
X-MailFrom: festevam@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JZEVBSDBMEZAHDY4BBELFLWT4EXXOGCS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Fabio Estevam <festevam@denx.de>

Replace SET_SYSTEM_SLEEP_PM_OPS() with its modern SYSTEM_SLEEP_PM_OPS()
alternative.

The combined usage of pm_sleep_ptr() and SYSTEM_SLEEP_PM_OPS() allows
the compiler to evaluate if the suspend/resume() functions
are used at build time or are simply dead code.

This allows removing the CONFIG_PM_SLEEP ifdefery from the
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 sound/soc/fsl/imx-audmux.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index 747ab2f1aae3..f97ae14dc452 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -320,7 +320,6 @@ static void imx_audmux_remove(struct platform_device *pdev)
 		audmux_debugfs_remove();
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int imx_audmux_suspend(struct device *dev)
 {
 	int i;
@@ -348,10 +347,9 @@ static int imx_audmux_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops imx_audmux_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(imx_audmux_suspend, imx_audmux_resume)
+	SYSTEM_SLEEP_PM_OPS(imx_audmux_suspend, imx_audmux_resume)
 };
 
 static struct platform_driver imx_audmux_driver = {
@@ -359,7 +357,7 @@ static struct platform_driver imx_audmux_driver = {
 	.remove_new	= imx_audmux_remove,
 	.driver	= {
 		.name	= DRIVER_NAME,
-		.pm = &imx_audmux_pm,
+		.pm = pm_sleep_ptr(&imx_audmux_pm),
 		.of_match_table = imx_audmux_dt_ids,
 	}
 };
-- 
2.34.1

