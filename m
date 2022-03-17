Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B604DBDC3
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 05:19:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE3F2175A;
	Thu, 17 Mar 2022 05:18:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE3F2175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647490772;
	bh=2x9Q2nued5ACxdtpwR/h9zRhtDnkDRPHw7YRw0bVGB8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BKXL058bUSrdd4DTH1EFt6H29dvZQYMf1qDJd2btT3GrS4N21eObSr3QqsZu5apVI
	 4x7ds3iOt1o3gxwS4OBxTDVcvYQZ+9y2FydtH21rxtZFeHBRN7DOEMNgTVsAl9laDR
	 sw/YGtvqxwOT1dxsyuozYmRhJRI6DJuhbjtDJHMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E6DBF8023A;
	Thu, 17 Mar 2022 05:18:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AD52F8020D; Thu, 17 Mar 2022 05:18:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6B55F80124
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 05:18:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6B55F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p/DaaFIB"
Received: by mail-pf1-x42b.google.com with SMTP id u17so5792536pfk.11
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 21:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Gfg0sfM1yOZcobziVscETOqEbK+m4KH2STWY/RhzvKM=;
 b=p/DaaFIBXMKLYKdMeigqMEbkNzz2UmwkZ1EFHnR+vGLGHiUzJ+oKoWCc75yRbblKlU
 XY6wS1b4XYolAjRWWIbz2PyAx1bgYIMsc/BNIwUvTkGVTrriASyMjIxrZlTWbEkWFKc+
 UXp4FsH2NtXkPBUVp8Hjm6oD+oW2I+mh6qhDStIhDHojgZEvqp48XO9zh0KiOf1HRfoK
 3rmwCExGHErobvapU73Qay5djJ77vuKl037+x+eIuxYIb6IQBBkHSZEuQQzhEnbiHm4s
 zHWtECJsTTjb2A09PYM3BfQlKkWw1gwtBiNSPD8mj3xWLFyCUcVjn8ySAgg4nMNupmoQ
 uTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Gfg0sfM1yOZcobziVscETOqEbK+m4KH2STWY/RhzvKM=;
 b=JLGIeppn36pKT0Se3an03JxOuQ2k7UVR3cr+LDtJMyWINGO53M5Yt1KHif0PQpQUIk
 m9AY57iuxvyqNUboC+k6FiY2+C4aMRNXudXp+tlQQ9sw95rS+ocREyFOqcYkmh7NvkVT
 QULU/QBXj6SbBq+ydOp1KQ8nHtBK+grIw51LmVtBa9UzSB3Ypb8t+mnZN1Ie8/0InB+0
 FpT5ExkjmpjWV45CuKb4Chk3/tkavKVudQ6jYmUYQBUe1CHrqoh11hwJsDM7sC/rtNcw
 yIaDBWu6GLbfYXY3lMwaw/c7drwA8fFrAWpNv/HFUCr0wagDD0pMr7svsVei8ZwoSiRp
 c1vQ==
X-Gm-Message-State: AOAM530XgoPyzuuXH6Q7GISiPhrtOjM/FglT8/BLBTsral1sRDAKJyaH
 eMh/b+uSVxLp6PCkV25hWbA=
X-Google-Smtp-Source: ABdhPJzkf6aRGNT4PCjsIj3xSQL7MwoZQSgaVrVC2ZHHBuegkwTvvtn8/goU3JG9vEQ+mi8RqnmORg==
X-Received: by 2002:a63:1743:0:b0:381:42cf:187 with SMTP id
 3-20020a631743000000b0038142cf0187mr2089420pgx.397.1647490701303; 
 Wed, 16 Mar 2022 21:18:21 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com ([12.154.207.45])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00170d00b004f757a795fesm5047654pfc.219.2022.03.16.21.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 21:18:20 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: broonie@kernel.org,
	shengjiu.wang@nxp.com
Subject: [PATCH] MAINTAINERS: Add Shengjiu to maintainer list of sound/soc/fsl
Date: Wed, 16 Mar 2022 21:18:06 -0700
Message-Id: <20220317041806.28230-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
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

Shengjiu has been actively working on latest FSL platforms and
keeping upstream effort as well, while I have been working on
other subsystem lately and cannot guarantee audio patch review
in the near term. So replacing with him in the maintainer list.

Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46ffe05eaeb7..bf7a0ae10d06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7779,10 +7779,10 @@ F:	drivers/net/ethernet/freescale/fs_enet/
 F:	include/linux/fs_enet_pd.h
 
 FREESCALE SOC SOUND DRIVERS
-M:	Nicolin Chen <nicoleotsuka@gmail.com>
+M:	Shengjiu Wang <shengjiu.wang@gmail.com>
 M:	Xiubo Li <Xiubo.Lee@gmail.com>
 R:	Fabio Estevam <festevam@gmail.com>
-R:	Shengjiu Wang <shengjiu.wang@gmail.com>
+R:	Nicolin Chen <nicoleotsuka@gmail.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Maintained
-- 
2.17.1

