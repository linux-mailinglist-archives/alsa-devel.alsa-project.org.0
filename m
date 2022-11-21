Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47936633884
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 10:32:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7AE716A0;
	Tue, 22 Nov 2022 10:31:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7AE716A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669109526;
	bh=Kf1GS3fL5gmsS0p20QnjqKmUNkv40AfXmkFjIvy0hsU=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Bk9rwToKEZmzAfz9FPNjoFrvLbJDr0Xa7FN3fawOzgq8ReUDDRL/mgRR2YY5VyG0i
	 7hVjHjiR7H78PDN9DHQsvO4nQzOstHUqWSnaP1R8EsH5KWdvVVYuLau9QJEiL+iDDe
	 bSXKrSdHc0v/QAUSEX9hrfLKPNh4VpkbWl+MuQrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 818AAF805C1;
	Tue, 22 Nov 2022 10:27:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E791F80149; Tue, 22 Nov 2022 00:20:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02C08F80115
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 00:20:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02C08F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qHqyHxrZ"
Received: by mail-wm1-x32f.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso10132037wms.4
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 15:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RHygxpssuDUiJzjzp0xH0KskztklwzppGLqlfrRansE=;
 b=qHqyHxrZxdbu053aP7anuXXTu+O+eBHo8HbT/vfgbsooaqpyMeU1NUPqwCa4buuoCr
 srEfqQQfgYaM/iRwMMQzW/x8NbT45XTBkOjvPGWOU8So/btX3++AVAtZ7a8aMnlad8g3
 Z8ZIHUOneZokf9JLVSWO5zNQq7c4sEtjOPu5IvW8/cqqIG0lA9HpPQK9DHV5MQQCvhMB
 EtAcFnn8WgUNCvJvOSYQ+pqdfjhJPNtKvpyctyaIEt+PBca0HOG780KMwNKhxvMzVIbM
 2X3XWQOZlSf22yszQtkSNolVqQv/vyZycuolIJN/nrTBvNiaVHR+qCy6kgowRm6Oe8dl
 MHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RHygxpssuDUiJzjzp0xH0KskztklwzppGLqlfrRansE=;
 b=loqzcVT26vs+dqjI08zR5ziuIZvSM4RYc+m/NIyVmkL7Yp2pGag4UNtJ3h3FJk1Z5E
 OLe1AGK6uTTePXzPf63evQCvwB/+ShPJc5l3kMdMtEhO50Antb+UkJ+DUOsgXZSguu1b
 N/NqNJug3rp8EENSpkk0g/flM4YIqWUfkie009bsLmhWv2K0y5ZdZjrfFm+1gz95tXFZ
 fcHsl2R5EKkOvqD/FZp8q6s0SHiXM1DvdHUrUI49tP4qXEuoZQ6DaIukQj/DFHF3EL3K
 i2FfKTu+ineBU/2bMXuJRE+A4nN4b0eRcScJVP62743E+1UVwUYu7hAO0HmBpuq715Ug
 wvbQ==
X-Gm-Message-State: ANoB5pl7p6H5mg3C6fRNkYBhtGEaVdzzOyZN14LkM1d+iavPBFY+k9IW
 UBI9EaVHxGff5F0JQTpHdVG1KjKBUMWXO4rn
X-Google-Smtp-Source: AA0mqf6x9wGrYv44LmSXYNRtK3ag+XTC0Bf8MEBAkPZSCGvgfOhuAiC7XSSVUxXK7Gh1gpdnnhpS+w==
X-Received: by 2002:a05:600c:4f93:b0:3cf:a616:ccc0 with SMTP id
 n19-20020a05600c4f9300b003cfa616ccc0mr18319130wmq.73.1669072842988; 
 Mon, 21 Nov 2022 15:20:42 -0800 (PST)
Received: from tora (80.49.50.209.ipv4.supernova.orange.pl. [80.49.50.209])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a5d4bc8000000b002238ea5750csm12583174wrt.72.2022.11.21.15.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 15:20:42 -0800 (PST)
Date: Tue, 22 Nov 2022 00:20:40 +0100
From: Alicja Michalska <ahplka19@gmail.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org
Subject: [PATCH] ASoC: Intel: avs: Add missing audio amplifier for KBL
Message-ID: <Y3wHyJ/EcsLRHGr3@tora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 22 Nov 2022 10:27:18 +0100
Cc: cezary.rojewski@intel.com, upstream@semihalf.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

KBL platform is missing the definition of 'max98357a' audio amplifier.
This amplifier is used on many KBL Chromebooks, for instance variant
'nami' of 'Google/poppy' baseboard.

Reported-by: CoolStar <coolstarorganization@gmail.com>
Signed-off-by: Alicja Michalska <ahplka19@gmail.com>

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 87f9c18be238..650faebb33ef 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -129,6 +129,14 @@ static struct snd_soc_acpi_mach avs_kbl_i2s_machines[] = {
 		},
 		.tplg_filename = "max98373-tplg.bin",
 	},
+	{
+		.id = "MX98357A",
+		.drv_name = "avs_max98357a",
+		.mach_params = {
+			.i2s_link_mask = AVS_SSP(0),
+		},
+		.tplg_filename = "max98357a-tplg.bin",
+	},
 	{
 		.id = "DLGS7219",
 		.drv_name = "avs_da7219",
---
 sound/soc/intel/avs/board_selection.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 87f9c18be238..650faebb33ef 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -129,6 +129,14 @@ static struct snd_soc_acpi_mach avs_kbl_i2s_machines[] = {
 		},
 		.tplg_filename = "max98373-tplg.bin",
 	},
+	{
+		.id = "MX98357A",
+		.drv_name = "avs_max98357a",
+		.mach_params = {
+			.i2s_link_mask = AVS_SSP(0),
+		},
+		.tplg_filename = "max98357a-tplg.bin",
+	},
 	{
 		.id = "DLGS7219",
 		.drv_name = "avs_da7219",
-- 
2.38.1

