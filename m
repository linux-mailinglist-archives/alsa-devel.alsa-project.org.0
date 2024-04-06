Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD7689A985
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 09:16:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61A6E2D27;
	Sat,  6 Apr 2024 09:16:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61A6E2D27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712387811;
	bh=fE5NND4/IUm7tNZy76HpwvBPiTqtYTd9VJ/3+TRj2pk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gZohArysVQRw/TX+0b0esU4PPyjypkupdXzGHYIzWHdvVqx3rf3dcLw1oQk2kta4f
	 hkbfUvFKAYIiZCFuv3Nlqo09iowx82zJJS5fct+Aytn4S2xJRmZ5JMM5TqOBUiwyWB
	 25zgwhL1bLY8Qxfe64fRy1jCu8m/hoBIh+yPbxns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 768F6F8060B; Sat,  6 Apr 2024 09:15:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD967F805F6;
	Sat,  6 Apr 2024 09:15:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB5C3F80571; Sat,  6 Apr 2024 09:01:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37B1EF80114
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 09:00:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37B1EF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=cx/rY2lw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712386850; x=1712991650;
	i=oswald.buddenhagen@gmx.de;
	bh=noigTvMp5s9tyXme04vcGcuwtYwZrLpbC++NpHVnp5c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=cx/rY2lwgfd+3oEoFxbNBHaoYjTJAkeZ1nCnowPrNqg38gc7N7BnY3uR+ORUpcAj
	 yBNec+/zkoqQ6BkokUxx2r5tvjHPKYtpHj0zJ/Ar4X4eNNeCJ9rjpwDg/F3WuNhgR
	 K2hYDo0WGpCmOEuna3Mx3xTpWr23154Y0AIFgangv3K32fHNSiTOfzto5j8ELhwtv
	 yH7xQH+6S38Wch63Hfl4VhX653Hhc/PWTf7aO07REi+yGGvLXciqjypwHR9wgmD64
	 Vp6yGtVY/eO7GbiqlRMPeFOsW0HWpdclGEfy9aSDHkGrLmMta9ktASg17vL2XjVp1
	 Eq81yhbA7QyXlO2kag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.118]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTiU3-1sMsj11cej-00U0vw; Sat, 06
 Apr 2024 09:00:50 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rszqo-Jrj-00; Sat, 06 Apr 2024 08:48:30 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v3 16/17] ALSA: emu10k1: shrink blank space in front of
 wavetable samples
Date: Sat,  6 Apr 2024 08:48:29 +0200
Message-ID: <20240406064830.1029573-17-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
References: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:g1t6kYYlaOfIbfaNuO+Yh8FBQ91T5AohATvHHqzaSKBNXAx8mHY
 2PwBzVytLKZ0TYlcmVghKFLUhGKllV0VIiYPruYp/4azElUJD1qp819brHyJA/sK9Cx9qIB
 eLiPSdrVOrZKJ0qJVrAakx1vxIvZAn1WTCMsWPy0hOjMgeAaVSVMKZTR5if9qEVlvcoD+LK
 AOvu7d4XYB9GpNYuOCiGA==
UI-OutboundReport: notjunk:1;M01:P0:lIjDtme9SNo=;Wfz4uvgP4LLdeHumr+ZF+5awTjr
 XSH2axB9ge0OWa8RAFoDoQZz8/kfo6EkUCgmTRqXU0Ppud+xyJ1ZZyTUVAFRy6yO9m+tEy9wU
 Y1o8PJFbyxrTnrfXtT6s9dL4CIa5wHf3aUW7l+d097ECjCu/Wq154xKryBFxN/Z+gFA6u4USi
 a9Hn+SX+4OB86jT8xC8/LwyFo3XWcEdT1RqrvRcwfSRHG2yzP0Ht74317F2XM2mVNCfQc7aMZ
 bZaVbpFtiSYDe7JGj9JiVPrNoOtf1QhmljpwRJ466Zkupjv6p0IjaXMQlDF35cIGMdQm8FBik
 HZnn0VyqSGzrBRDAh3Vh8fAwkOiXv3tNDcDxNjXtK4NjKGWmo/1xsuyGhena/9KhJUBx5bIew
 rKK9daDJ5dGfRGe302Qrvp5uYvjPl6gTpTK3+QdekRzocmuCe0aDOqQWGRVInVUJzs5BSHrya
 L4xU+/IC83eIDE3T7KgWXKenoQ8dE7YiUeOiHjhdxKp+68p5rZxW7+OzJaeohzms5DuVSry+x
 Vhfvw3hSNLfj2Ls3kQJ5RBBGqkS8moN/C8Y6hD+Wd1mppHLOm4GFpb1e1hJnmccCz92q3EH6u
 ZDF0yn0m7UxaVWlPamkx/aZ5fDpXRi6raXgcW4NrD5q5PO1dGKmkYjgWQ+uTRMoCblNAgg3xT
 aDRVN9Wf46omi4tmFNr9q+4MzcYts/ozgLt4DZBOB877PDkTr1Gl6Ta63wbeQncclgtEqmn7+
 EwGpjmUqf75LiAdHtO7MYaMWzyhpnrtvuZWsdBPcC1l2vGFqHWC+UQnowsEsPLiTfK/uK3iAW
 mSGVHh0ZGTIOE1isnSX7gRgx88GKcQAW4ss7W/ScTMSho=
Message-ID-Hash: DBX6BROZFQ5BY55AFR72GLIWJFWNEWGW
X-Message-ID-Hash: DBX6BROZFQ5BY55AFR72GLIWJFWNEWGW
X-MailFrom: oswald.buddenhagen@gmx.de
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is no need for it to be 32 samples - 3 will do just fine (which is
the interpolator's epsilon). The old size was presumably meant to
compensate for the cache's presence, but we're now handling that
properly.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_patch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1_=
patch.c
index 2a13fb32c1d2..dbfa89435ac2 100644
--- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -16,7 +16,7 @@
 #define BLANK_LOOP_START	4
 #define BLANK_LOOP_END		8
 #define BLANK_LOOP_SIZE		12
-#define BLANK_HEAD_SIZE		32
+#define BLANK_HEAD_SIZE		3
=20
 /*
  * allocate a sample block and copy data from userspace
--=20
2.44.0.701.g2cf7baacf3.dirty

