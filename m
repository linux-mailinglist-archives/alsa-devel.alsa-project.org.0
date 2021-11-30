Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEB3463869
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 15:57:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EBD721E9;
	Tue, 30 Nov 2021 15:56:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EBD721E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638284268;
	bh=0NDsr83+EogaVnAmGrqnMsG/gXmouT8EdiQm/ybL3W8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hEiqadQI+vf6pj407Sd9eqFzW7UAsQpF2MsXjLAPPEfxEeLxyR907debbA7+tIKbp
	 91RV50d9l9D10a3KO7HH/GG0L0qg8jR5i7P0BwqZpEk03xuvvvCA5yynizMA0ogKSb
	 /964o/+FGx9CjKDENf/xTCCb4U9pD89Py0ITiCJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A8E3F80525;
	Tue, 30 Nov 2021 15:51:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DBC9F80524; Tue, 30 Nov 2021 15:51:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47A60F8051D
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 15:51:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47A60F8051D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZNrxbFLp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ECA4BB81A50;
 Tue, 30 Nov 2021 14:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A00C53FCF;
 Tue, 30 Nov 2021 14:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638283907;
 bh=0NDsr83+EogaVnAmGrqnMsG/gXmouT8EdiQm/ybL3W8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZNrxbFLpfQzrGO7YcILMDjm/6TBS1uY4hZp3ev/dkHKKt2OrdGH+Dvw9gQ7JfSeW+
 0ZTH42p1yyKgu0m0A+TOG3ritbyUc2ekR87EwZhW71fR7am5DOoCxn5xYngFtXa73K
 HlGxElJCmWrDL55Hckac39r0x/HlHuN8dV7uxlcMMaD2nd/0CdTZZG+TvAhtYxMeaJ
 TdjX+QQWEsytomB8ReY56fGBnRWAJdVSW1AUXwLljAFm0S3sKqVPbXoMrKpPbNRhUR
 rt7tR3/rUJp3eztFbJS/dd1pzFLhrEvpQursvSWqXVG9/c+8X3pEAGvKbyAeLjtLT4
 jMMxWsymbVTtQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 38/43] xen: flag xen_snd_front to be not
 essential for system boot
Date: Tue, 30 Nov 2021 09:50:15 -0500
Message-Id: <20211130145022.945517-38-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130145022.945517-1-sashal@kernel.org>
References: <20211130145022.945517-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, tiwai@suse.com,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
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

From: Juergen Gross <jgross@suse.com>

[ Upstream commit de6da33e6cb79abd4a5721b65b9a7dbed24378f8 ]

The Xen pv sound driver is not essential for booting. Set the respective
flag.

[boris: replace semicolon with comma]

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Link: https://lore.kernel.org/r/20211022064800.14978-6-jgross@suse.com
Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/xen/xen_snd_front.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/xen/xen_snd_front.c b/sound/xen/xen_snd_front.c
index 228d820312973..33ebba73f6c08 100644
--- a/sound/xen/xen_snd_front.c
+++ b/sound/xen/xen_snd_front.c
@@ -358,6 +358,7 @@ static struct xenbus_driver xen_driver = {
 	.probe = xen_drv_probe,
 	.remove = xen_drv_remove,
 	.otherend_changed = sndback_changed,
+	.not_essential = true,
 };
 
 static int __init xen_drv_init(void)
-- 
2.33.0

