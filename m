Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D327F44B99F
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Nov 2021 01:31:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FFFC1655;
	Wed, 10 Nov 2021 01:30:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FFFC1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636504263;
	bh=7Es3VeTVW1GnIKahWix+UKGt5Rsc+62EfxineE23Stw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fnRznFaVP/R5EGEZmPH8VDK9xtuBwqzKOiFAxEgvK+Esk2S6SOwS9sEZdC/4BAcVf
	 cAzQuQ6OmxF1oGIoQbbLhRvbO/egYHbWUzr88rPXu74wI6gROJ/rkfIpWiqs2YGBWD
	 tP5VS3y1kT7AH6kH7TzCIG6C55wiRuFlpLBzbmvw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97BB3F80224;
	Wed, 10 Nov 2021 01:29:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CD53F802D2; Wed, 10 Nov 2021 01:29:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86FBFF801D8
 for <alsa-devel@alsa-project.org>; Wed, 10 Nov 2021 01:29:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86FBFF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HoUfE9FM"
Received: by mail-pf1-x432.google.com with SMTP id o4so974285pfp.13
 for <alsa-devel@alsa-project.org>; Tue, 09 Nov 2021 16:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AEzErmitUUc1WCRwF90GY08l0xszb/xghqlykO8h5XQ=;
 b=HoUfE9FMPs9FbWg+kuLPHy/L4ScIui5grCU8JXDkrj4jNnMmSBVDJH9ybI+5cI5KyM
 kiyqA9oGfmaiIp0bg7woJAxlerKajDVP0Qk/XBfycWTsDVEnm1Ig5L4uf/WmUu841bRT
 aNkR/veAg2w3ULbimJTbQGJEpcF5Bo9bGvdaS3Hf7dsxkwwBaE7ip0vnfwZv8XFHmCcc
 e57WL3zXoxDqavdn1mSjovQXAXN0QC3Tk6KmEJPh+BtWVmMDtqURDnpB9os97UMcTwr0
 BAlnEEVb28PTC+hW82HQT5m9w4tC7U+/pinOH0TFk24abX3MYyx4ZcJMfaNlYxmeY9Q0
 km0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AEzErmitUUc1WCRwF90GY08l0xszb/xghqlykO8h5XQ=;
 b=5S90XWceO4nljVRrWRIuzleOdYDr3765G5Qilnr5CCx+OjMRqthFDSdEW3TYRHVH/o
 lP3q85Tw2MWU2XVxn1eOKER7u3Bohe5KzVKHShmrFChniDg98w0szljJ39tta/zY2lKv
 VAMb0hJQDHmcd7+0FA0nwzocyUK3cSBxHCXC9wjz0j0LK/p2iJsse0Wz0DgGO0iTLZI4
 s24Xin/eWxdTH07oVIxFNg3fMlQKo9IZKMnD0WCd+314yC/sXWnKly6JC65pOwX2DJFT
 6+EU2ptYtE4T1fRgA21HNz8j72LCJlAr9qrroXk9zFuShKtjQs/NSQb340p8+eLKspED
 2e9Q==
X-Gm-Message-State: AOAM532LYVUGC1kjWp11dSGyj5U2x0RE5Dxz71Etj8slCFUNxZE6lTyb
 K5LaKZDhQTAwFIT1+fwP3cM=
X-Google-Smtp-Source: ABdhPJye/VUSnlCLCAknWO+RWaynEg+Kow/VhPktmT23o2DuN4Tmpy6jXdqg82E0C967zkissHr4bg==
X-Received: by 2002:a05:6a00:1a50:b0:49f:fc2a:fa9f with SMTP id
 h16-20020a056a001a5000b0049ffc2afa9fmr8630020pfv.43.1636504159274; 
 Tue, 09 Nov 2021 16:29:19 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id f185sm9515716pfg.39.2021.11.09.16.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 16:29:18 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.guojin@zte.com.cn
To: nicoleotsuka@gmail.com
Subject: [PATCH] ASoC: imx-hdmi: add put_device() after
 of_find_device_by_node()
Date: Wed, 10 Nov 2021 00:29:10 +0000
Message-Id: <20211110002910.134915-1-ye.guojin@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 s.hauer@pengutronix.de, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 Ye Guojin <ye.guojin@zte.com.cn>, shawnguo@kernel.org, shengjiu.wang@gmail.com,
 Zeal Robot <zealci@zte.com.cn>, linux-arm-kernel@lists.infradead.org
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

From: Ye Guojin <ye.guojin@zte.com.cn>

This was found by coccicheck:
./sound/soc/fsl/imx-hdmi.c,209,1-7,ERROR  missing put_device; call
of_find_device_by_node on line 119, but without a corresponding object
release within this function.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Ye Guojin <ye.guojin@zte.com.cn>
---
 sound/soc/fsl/imx-hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index f10359a28800..929f69b758af 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -145,6 +145,8 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 	data->dai.capture_only = false;
 	data->dai.init = imx_hdmi_init;
 
+	put_device(&cpu_pdev->dev);
+
 	if (of_node_name_eq(cpu_np, "sai")) {
 		data->cpu_priv.sysclk_id[1] = FSL_SAI_CLK_MAST1;
 		data->cpu_priv.sysclk_id[0] = FSL_SAI_CLK_MAST1;
-- 
2.25.1

