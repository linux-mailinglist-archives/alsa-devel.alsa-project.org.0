Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ECA198BDF
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 07:44:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 223591673;
	Tue, 31 Mar 2020 07:44:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 223591673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585633490;
	bh=QG6mricB5qEw2dKAN2049xFNYphKC6DtSZHP1K6NN4s=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ok5VJNgDicEiMUSPMUYnZ+fyAWOxC9dXUWQ9ZouuSHaGUlo011LsFJXlqeYjVo+Sm
	 NZO9XQNU0nrUfjeE4xVDvJmSf8Xo4api6XuMVbim9MFuC4RvDFlrnxgg1zifzvnU6g
	 YnOXa66wn+GKkEYKUB0Ev4/eBE2axvESGZv7wuiI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99AB5F80256;
	Tue, 31 Mar 2020 07:42:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D285F80146; Tue, 31 Mar 2020 07:42:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8383BF800AA
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 07:42:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8383BF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="qYeqMrWn"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200331054213epoutp04c543356b02d060d99d1354fa9fbb71be~BTR2V5eCJ1028810288epoutp04E
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 05:42:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200331054213epoutp04c543356b02d060d99d1354fa9fbb71be~BTR2V5eCJ1028810288epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585633333;
 bh=nxBljRL/HqZF/Xnk5mkQ0LBK9jG8ZWRGDYmwc1AskKs=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=qYeqMrWnHub9d2TXzNKOj37alJrMQj+mfpQrrMfPY6J5Wl0HXHwY7oeHhspBj72dc
 SIyvRS1pEJWXbDUL68xUdrGsGgiaYxVuz5+ioxoJM5LSxaeyUaGn7GI8rKvHKePM/D
 pigceuE4IFkgNlD//ZjOaVAEJ1CyOxs5xMLRA1tc=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20200331054212epcas2p4049282e4e0842e8f9f745fd69704ed49~BTR16QI7A0979109791epcas2p4D;
 Tue, 31 Mar 2020 05:42:12 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.190]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 48ryrg3GlXzMqYkd; Tue, 31 Mar
 2020 05:42:11 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 8A.C8.04142.238D28E5; Tue, 31 Mar 2020 14:42:10 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20200331054210epcas2p2923129b0393e62b6e3d8931c2393c934~BTRznIFhj0079800798epcas2p2J;
 Tue, 31 Mar 2020 05:42:10 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200331054210epsmtrp2883bb851fa184cd1b2d3e2e195be1ba3~BTRzmexDu0532005320epsmtrp2J;
 Tue, 31 Mar 2020 05:42:10 +0000 (GMT)
X-AuditID: b6c32a46-3f9ff7000000102e-96-5e82d832514c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B0.60.04158.238D28E5; Tue, 31 Mar 2020 14:42:10 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200331054210epsmtip26b9597c18c71ffcc4984d9c40b65a680~BTRzd1qMB0212902129epsmtip2h;
 Tue, 31 Mar 2020 05:42:10 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: <broonie@kernel.org>
In-Reply-To: <000e01d60665$d48444b0$7d8cce10$@samsung.com>
Subject: [PATCH 1/3] ASoC: dapm: connect virtual mux with default value
Date: Tue, 31 Mar 2020 14:42:10 +0900
Message-ID: <010901d6071f$1f299dd0$5d7cd970$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQHT5UBTKtX+5pznRWgpVI/NXVAXlgFfQZWpqFt1jmA=
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjuO+fs7GitTsvyxX40TlQkqNvR2dEyulGLioSKIsJ5cAc32uW0
 MyX7kxnJptHFLGzdhCxiFl5adpVoLiu1IJilhV21myWUZQUtmjsL9u953/d5Pp7n/V4KV18g
 UyiL3SU47byVIROJto75C9LYvooCrbd3Hhd6HMC4o68HSa6urZrgxkJujLv7+CzGNf+8hLjg
 nlpsidLQPFpBGq57B5SGVp+HNBzw+5Chyd9L5Cu2WheZBd4kODWCvchhstiL85g1G4zLjfps
 rS5Nl8MtYDR23ibkMSvW5qettFgjPhhNKW8tibTyeUliMhYvcjpKXILG7JBceYwgmqyiTiem
 S7xNKrEXpxc5bLk6rZbVR5iFVnPY/0Yh3qR2ngp3onLURVahBAroLPjhq8KrUCKlpq8h6Hwe
 xOTiG4KXn/cRcjGG4PboEPZfUut5oZAH7Qhq6kIx/UcE/SNeVIUoiqRzYX81My5IogG+37gf
 fRanaxA0fniPxgcJEU7DYGUUT6NXQWjvhagpgp4Dh9vOR/sqOgc6joQJGU+FB8cHoxinWWho
 PIPJeBZc/XISl91p4PfQeYXcT4ITnkpcNpELl4+0R00APUzC0HCQkAUrYNhzPLaNafDpnl8p
 4xQYHWknZcFeBCMP/8QGtQg81WoZZ4L/VBc2nhjo2RB8FjM3GdwdYaXcVoG7MsZmoKXrb4wN
 cLpZeQgx3rhk3rhk3rhk3rg09YjwoRmCKNmKBYkV2fjvbkXRK01deQ01PFobQDSFmEmqV717
 CtQKvlQqswUQUDiTpCLXlxeoVSa+bJfgdBidJVZBCiB9ZPOH8ZTpRY7IzdtdRp2ezc7W5ug5
 fTbLMcmq1on929R0Me8StguCKDj/6zAqIaUcsX3nvpZtUbJLvmbOvTj15ZX8xOAvy8n6H7tL
 34Ud+2c9OWZsMr2df5BwT7Is3uTzsv47E5Nv/v0zs3NroKd62d2Bp+XSutQJJr+7u1GcYk43
 JZel53bXZIUyDq0fGFy6bONmbkP9Da6ukOnxf1r4+V33rcIMpufF6n1nHk7YIY61VDCEZOZ1
 qbhT4v8BlUL5d7sDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEIsWRmVeSWpSXmKPExsWy7bCSvK7RjaY4g4XtghZXLh5ispj68Amb
 xYxt3SwW3650MFkcvbiYyWLD97WMFkcapzA5sHts+NzE5rFz1l12j02rOtk8+rasYvRYv+Uq
 SwBrFJdNSmpOZllqkb5dAlfG3y2PWAt2c1TM/XuMsYHxFFsXIyeHhICJxJTOe6xdjFwcQgK7
 GSVunH/GBJGQkPgw/ww7hC0scb/lCFTRc0aJVY1dQN0cHGwCVhI93UogNSJA9V92nWACqWEW
 mMUo8WrObKiGbkaJC0dfMINUcQI1LHnSxghiCwu4S1xpXgF2BouAqsTEbcvA4rwClhKHJ/9l
 gbAFJU7OfAJmMwOd2ni4G8qWl9j+dg4zxHUKEj+fLmOFiItIzO5sY4a4yEpi8+S9TBMYhWch
 GTULyahZSEbNQtK+gJFlFaNkakFxbnpusWGBUV5quV5xYm5xaV66XnJ+7iZGcExpae1gPHEi
 /hCjAAejEg/vg6uNcUKsiWXFlbmHGCU4mJVEeNn8G+KEeFMSK6tSi/Lji0pzUosPMUpzsCiJ
 88rnH4sUEkhPLEnNTk0tSC2CyTJxcEo1ME7RXuiWrVwXMPvAe4VtIYc/HHi2QP6L6dUl66bF
 tG6beOtVUN/9v9yZEiIZMeF72Q1NFk4oeOF8n/flMaaLy1VqHRfsCn3b1a657srCloc7Vm7d
 z15xcMP2HfuU/BYLJPtML1Sez2gW/msNxxQ7LgdZk7ue9w7nC5vPSlvEx+P8kdNQJ+Fvu4QS
 S3FGoqEWc1FxIgCWRmjepQIAAA==
X-CMS-MailID: 20200331054210epcas2p2923129b0393e62b6e3d8931c2393c934
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200330073548epcas2p3045be9d3c8b76115c76ce27679840b6f
References: <CGME20200330073548epcas2p3045be9d3c8b76115c76ce27679840b6f@epcas2p3.samsung.com>
 <000e01d60665$d48444b0$7d8cce10$@samsung.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 hmseo@samsung.com, tkjung@samsung.com, pilsun.jang@samsung.com
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

Since a virtual mixer has no backing registers to decide which path to
connect, it will try to match with initial value 0.
This is to ensure that the default mixer choice will be correctly powered
up during initialization.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
---
 sound/soc/soc-dapm.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c index
9fb54e6fe254..fc55a0534252 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -802,7 +802,16 @@ static void dapm_set_mixer_path_status(struct
snd_soc_dapm_path *p, int i,
 			val = max - val;
 		p->connect = !!val;
 	} else {
-		p->connect = 0;
+		/* since a virtual mixer has no backing registers to
+		 * decide which path to connect, it will try to match
+		 * with initial value 0.  This is to ensure
+		 * that the default mixer choice will be
+		 * correctly powered up during initialization.
+		 */
+		val = 0;
+		if (invert)
+			val = max - val;
+		p->connect = !!val;
 	}
 }
 
--
2.21.0



