Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D848E699823
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 15:58:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F0B5EB9;
	Thu, 16 Feb 2023 15:57:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F0B5EB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676559486;
	bh=hJUIVjIWcroVtvu4OXuhx/MmU7Sz2UPG988Be7bAuc8=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ws2NgFmQNRsQYP28JZVXPxrOqy22SGNfSIi5WJkGlPxoA1PV7W6QYAnkho3VRLQn3
	 qzUVYxNmp2mNeWP1CkW58u9nVol+5yfPqkdti9ynoh3QsPYPmNuNyUq6YpUL1lhs1T
	 o9tvXibgavzuem+TdDM6m/xAOjCxbIyveRusci6s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6EF3F805A0;
	Thu, 16 Feb 2023 15:55:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E96EF800E4; Sat, 11 Feb 2023 04:34:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E04A0F80086
	for <alsa-devel@alsa-project.org>; Sat, 11 Feb 2023 04:34:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E04A0F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=weissschuh.net header.i=@weissschuh.net
 header.a=rsa-sha256 header.s=mail header.b=Nlkhb7/w
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1676086438;
	bh=hJUIVjIWcroVtvu4OXuhx/MmU7Sz2UPG988Be7bAuc8=;
	h=From:Date:Subject:To:Cc:From;
	b=Nlkhb7/w3HVQhOPusCBshsTE2RxwP3UhboUuSlVe4kmfAXzewm6FRxuBAPonAjtDu
	 GuXKqyfoCfmWQ8zV44Uc/GBSAy3M9vMrGgentEpTfObRWH8Hj8RL2oa+XyIoqy+1Fg
	 ZHCHXJvxdNr68pYPqgZi+/rhGbhQ8pljY2KA7wZg=
Date: Sat, 11 Feb 2023 03:33:53 +0000
Subject: [PATCH] ALSA: hda: make kobj_type structure constant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230211-kobj_type-sound-v1-1-17107ceb25b7@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAKAM52MC/x2N0QrCMAwAf2Xk2ULTPemviEizRhcd6WicOMb+f
 cHHOzhuA+MmbHDpNmj8FZOqDnjqYBizPjlIcYYUUx8TYnhXet0/68zB6qIlxB4LIjOdmcArysa
 BWtZh9E6XaXI5N37I77+53vb9ALFIMzl2AAAA
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676086434; l=970;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=hJUIVjIWcroVtvu4OXuhx/MmU7Sz2UPG988Be7bAuc8=;
 b=hfQTL2SZmLdiFSwlG3dnRfYwVUsBxpeQYwTuSWZgxp/oi3Uw/HmSgB6yKiqlWzlQ+YOah2NzE
 59vxI90qCtBAQh4xuDlNWs8bIvhLqNfs7jGQPDwKIZhMB4zIu1HgMBK
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-MailFrom: linux@weissschuh.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 76SBCPPWCWIKFUHL7PIBEW7TBYURFWKS
X-Message-ID-Hash: 76SBCPPWCWIKFUHL7PIBEW7TBYURFWKS
X-Mailman-Approved-At: Thu, 16 Feb 2023 14:54:48 +0000
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/76SBCPPWCWIKFUHL7PIBEW7TBYURFWKS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since commit ee6d3dd4ed48 ("driver core: make kobj_type constant.")
the driver core allows the usage of const struct kobj_type.

Take advantage of this to constify the structure definition to prevent
modification at runtime.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 sound/hda/hdac_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/hdac_sysfs.c b/sound/hda/hdac_sysfs.c
index 62a9615dcf52..60b0a70428d5 100644
--- a/sound/hda/hdac_sysfs.c
+++ b/sound/hda/hdac_sysfs.c
@@ -148,7 +148,7 @@ static void widget_release(struct kobject *kobj)
 	kfree(kobj);
 }
 
-static struct kobj_type widget_ktype = {
+static const struct kobj_type widget_ktype = {
 	.release	= widget_release,
 	.sysfs_ops	= &widget_sysfs_ops,
 };

---
base-commit: 420b2d431d18a2572c8e86579e78105cb5ed45b0
change-id: 20230211-kobj_type-sound-031d11eeb9eb

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

