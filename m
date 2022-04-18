Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5482506B7C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:54:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B28D17EA;
	Tue, 19 Apr 2022 13:53:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B28D17EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369247;
	bh=oLR/pw3icfRlc0wqZvPHwVWCp/h1tW4289vnuBMtYwM=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pKvLgcKn6EpkSkUmibq8YhlJnKGHbm0JNAlmdIEX4V82bEct9j3UvnBWx2LDKviyH
	 Dwv+10GJpdGiDW8cqgxgViHdUuK63cKNYT6O/qQIk36HpiX9nVv2ccDtJrz8Y5p0w7
	 NjmLtBdk8cTXZYeI483Tz4UySvt/o5j9shnUm5V8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CF71F804FE;
	Tue, 19 Apr 2022 13:52:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3EE6F8014E; Mon, 18 Apr 2022 15:28:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3A4DF80121
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 15:28:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3A4DF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LJ5T0cy9"
Received: by mail-ej1-x62d.google.com with SMTP id s18so26939534ejr.0
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 06:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=nkYV7T1aixHjHVn90tgTWbE9t0QEJM6StqL3GUrlAlk=;
 b=LJ5T0cy9J4PoTu2Gd8yp/uT1fnd+pbUuNHOuNNn89UJS8blNpb3NIOyZFbECSoeQcL
 DcZzQARnZ/5ZPC0G2rwBGsqQfKnsgvJgIpgBoTEYQe8ioKPrrvjKkPVIuA69qqb4g8DY
 NWg1yC27X17kcs5BKDp57PF9wPy06dijZTrxb4V8xl0/5Evb4zQyPB3o8WFYc99ZXhJv
 Cb9za5/p+OORSs/5+nxe6YFmjXWDigF9v+v7TG5iAkOYanf+jsB7T48gUxEKlXLn2abz
 7TG977jkIN85MD0Wzni8o/Dh8UxPcD/ECX13UaffuXbLncB0JHhYlFSgQ6BkfcD0d0IB
 Ez1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=nkYV7T1aixHjHVn90tgTWbE9t0QEJM6StqL3GUrlAlk=;
 b=a/2KQ6IoquhoUhKdCG2Ss9nqVHXR4Ygh7qUx4EWRo8I3N5ZDBbqTBtnZ4JGm+s+4s4
 fCbkDjD5OxYZdbHTyrRKNq5WLh2MQ5Py9jihN5wG2oN7BX5vHw7ZRGP4MbQIJIlB+j9k
 T5t2/jTkTtngXe7SPd3CXLWBiquuD/xatId/8r34YKvDnuVO3zvY8UdzqS0o0zfnxCFs
 6rzJ1kchPxL/fAnSXSYP2TKX2Jcwo1NcomNkYxACLxFJbUcy4+FZVsEcot3I1IEdbuOJ
 hqGnM4YkHeWzpMTqKpFSa4+VK/JY6XdCnJ5upU9NCsBl58lDgXSyGAH0jcrSmuOTtquC
 Zeeg==
X-Gm-Message-State: AOAM532Z44G17odbzgg2IZ7BwtiNVEnL9QBastgPdKSPEmEUOc4cLuWy
 dTPWJCEDwAllOAaHLGlFQuXzolZARtU+EQ==
X-Google-Smtp-Source: ABdhPJwWqLeK8fB27393z2QZpt7Z0xPsk0D8WVyrVl7h6EkfMopl9RFZbXWs6a/WiIcQSwI3zXri9g==
X-Received: by 2002:a17:906:58d2:b0:6da:b635:fbf3 with SMTP id
 e18-20020a17090658d200b006dab635fbf3mr8830951ejs.40.1650288480437; 
 Mon, 18 Apr 2022 06:28:00 -0700 (PDT)
Received: from ryzen ([2001:b07:2e3:dacc:d3f3:c3c5:d3a2:5ee7])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a170906521000b006d58773e992sm4619829ejm.188.2022.04.18.06.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 06:28:00 -0700 (PDT)
Date: Mon, 18 Apr 2022 15:27:57 +0200
From: Maurizio Avogadro <mavoga@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: add mapping for MSI MAG X570S Torpedo MAX.
Message-ID: <Yl1nXcsAKWrFOMbY@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 19 Apr 2022 13:52:22 +0200
Cc: Andrea Fagiani <andfagiani@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Maurizio Avogadro <mavoga@gmail.com>,
 Timo Gurr <timo.gurr@gmail.com>
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

The USB audio device 0db0:419c based on the Realtek ALC4080  chipset
exposes all playback volume controls as "PCM". This makes
distinguishing the individual functions hard: the mapping already
adopted for  device 0db0:419c fixes the issue, apply it.

Signed-off-by: Maurizio Avogadro <mavoga@gmail.com>
---
 sound/usb/mixer_maps.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 64f5544d0a0a..7ef7a8abcc2b 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -599,6 +599,10 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.id = USB_ID(0x0db0, 0x419c),
 		.map = msi_mpg_x570s_carbon_max_wifi_alc4080_map,
 	},
+	{	/* MSI MAG X570S Torpedo Max */
+		.id = USB_ID(0x0db0, 0xa073),
+		.map = msi_mpg_x570s_carbon_max_wifi_alc4080_map,
+	},
 	{	/* MSI TRX40 */
 		.id = USB_ID(0x0db0, 0x543d),
 		.map = trx40_mobo_map,
-- 
2.35.1

