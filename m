Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D26F338CD6
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 16:20:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D6D7166C;
	Fri,  7 Jun 2019 16:19:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D6D7166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559917220;
	bh=4Car/RuyiUQX1mwXosBjq2sPdZ+RESetNVSKKICdfJ0=;
	h=From:To:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jBBVzZYzKSvi5uiW6XvxLxKT7iwszWD3pESFClrhA3jKIyu6UgcOX74lsVtLoO1x3
	 4w79LCTlL0BoKB4cISFZcOxXyX4Grh2NcVYPzLb3idqmkySN6NbD8b3AhET6mMXOFq
	 Jchy98/r2wz4zShYt8Yhu/XxHp9E0KDjplaVX5jE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB7C6F896ED;
	Fri,  7 Jun 2019 16:18:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AABBF896CE; Fri,  7 Jun 2019 16:18:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1CC2F896CE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 16:18:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1CC2F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="Ytqr+x9I"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20190607141822epoutp0279131efe62be7d341a8e0a3d03b99e0b~l8Fccrz0e2151721517epoutp028;
 Fri,  7 Jun 2019 14:18:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20190607141822epoutp0279131efe62be7d341a8e0a3d03b99e0b~l8Fccrz0e2151721517epoutp028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1559917102;
 bh=D5svI1c1G5Arq1z0eJbRHduFhaYnIub9yFaEPXSWppg=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Ytqr+x9ILtOwIQAtvqsvsrBR5DN7DY5qaIy9a4lHubjCAs/XqFv4aL0VoGImn9I9a
 ZoLLVsE5HAz5KT5kV0x6K+w8SFjWxTpOSRnVv6wt38Pa9rNPnSP0zaH9mszUuUvUTp
 8WDwNgHiiQqPVn67d7GGmiZN1bkkP/RooQCQWphQ=
Received: from epsmges2p4.samsung.com (unknown [182.195.42.72]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20190607141822epcas2p4e97a8fb6c5a592b2b6e9a0a81970a0bb~l8FcHveVy1968219682epcas2p49;
 Fri,  7 Jun 2019 14:18:22 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 0E.22.04207.E227AFC5; Fri,  7 Jun 2019 23:18:22 +0900 (KST)
Received: from epsmgms2p2new.samsung.com (unknown [182.195.42.143]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20190607141821epcas2p120786c8cc5a1f1b71dbd1828b0a9d837~l8FbZqOMb0697906979epcas2p1n;
 Fri,  7 Jun 2019 14:18:21 +0000 (GMT)
X-AuditID: b6c32a48-6a1ff7000000106f-be-5cfa722e2401
Received: from epmmp2 ( [203.254.227.17]) by epsmgms2p2new.samsung.com
 (Symantec Messaging Gateway) with SMTP id 9E.05.03620.D227AFC5; Fri,  7 Jun
 2019 23:18:21 +0900 (KST)
Received: from AMDC3061.DIGITAL.local ([106.120.51.75]) by mmp2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5
 2014)) with ESMTPA id <0PSQ00B06FQ39R70@mmp2.samsung.com>; Fri, 07 Jun 2019
 23:18:21 +0900 (KST)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org
Date: Fri, 07 Jun 2019 16:17:45 +0200
Message-id: <20190607141745.759-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsWy7bCmqa5e0a8Yg3XLZSyuXDzEZLFxxnpW
 i6kPn7BZnD+/gd3i25UOJou1R+6yWxx+085qsefiK3YHDo8Nn5vYPHbOusvusWBTqcemVZ1s
 Hn1bVjEGsEZx2aSk5mSWpRbp2yVwZfR8/she0MlT0T5fqoFxDVcXIweHhICJxPllGV2MXBxC
 AjsYJSYfmMjSxcgJ5HxnlPh9UAHEBql5sfoDE0R8A6PEtreSEA0/GSW6dj0Ea2ATMJToPdrH
 CGKLCIhJ3J7TyQxSxCywj1Gi59g0sISwQKjE9WffwRpYBFQl1hx+zwpi8wpYSpz8+pUdYpu8
 xOoNB8CaJQR+skr8u3yMFSLhIjH56h6oImmJZ6s2MkIUNQNt2H2bHcKZwChx//gCRogqa4nD
 xy+CdTML8El0HP7LDvE0r0RHmxBEiYfE5zvdUD/HSsy4M5VlAqP4AkaGVYxiqQXFuempxUYF
 JnrFibnFpXnpesn5uZsYwVGl5bGD8cA5n0OMAhyMSjy8M5h+xgixJpYVV+YeYpTgYFYS4S27
 8CNGiDclsbIqtSg/vqg0J7X4EKM0B4uSOO8m7psxQgLpiSWp2ampBalFMFkmDk5g1Cic6V/k
 reRtkPplyxGDfb0MoScki3a/VoxxeXp+wSv9gupQkbe2hobSnt9enAlZOHl92E2xv8G5Qn48
 m9/W91y4WbbxjnDAuRnyN6SeNLnvOC13gYep4jL/Q9WMr22SVxJ2X9a6pfTATNHqrfv6a4K5
 9nJxvEbXReec2WLO0Oai921vbfz3bUosxRmJhlrMRcWJAH/eUFCmAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJJMWRmVeSWpSXmKPExsVy+t9jQV3dol8xBj+na1pcuXiIyWLjjPWs
 FlMfPmGzOH9+A7vFtysdTBZrj9xltzj8pp3VYs/FV+wOHB4bPjexeeycdZfdY8GmUo9NqzrZ
 PPq2rGIMYI3isklJzcksSy3St0vgyuj5/JG9oJOnon2+VAPjGq4uRk4OCQETiRerPzB1MXJx
 CAmsY5TYdOYXlPOTUeLrt0PsIFVsAoYSvUf7GEFsEQExidtzOplBipgF9jFKPL77nxUkISwQ
 KnH92XcWEJtFQFVizeH3YHFeAUuJk1+/skOsk5dYveEA8wRGrgWMDKsYJVMLinPTc4uNCozy
 Usv1ihNzi0vz0vWS83M3MQIDZNthrf4djI+XxB9iFOBgVOLhLTzwM0aINbGsuDL3EKMEB7OS
 CG/ZhR8xQrwpiZVVqUX58UWlOanFhxilOViUxHn5849FCgmkJ5akZqemFqQWwWSZODiBARDN
 nx41cduZc+U3npxI4uu4eKbvk8jLk0xHlflPsGSqfBD2cNvP4/OpzXXR1l3u54uWn9LVcDjy
 yTJm7vdo1lk6L+RMxV9zG2jf/MfrZ1DT1axy2TTu9tmpzPeUxZ/syhawuit/f8+v/PKVMusK
 L/kcMPxoulr0lOwlSekarmv5S3duqFd7/EGJpTgj0VCLuag4EQBtv2qBDAIAAA==
X-CMS-MailID: 20190607141821epcas2p120786c8cc5a1f1b71dbd1828b0a9d837
CMS-TYPE: 102P
X-CMS-RootMailID: 20190607141821epcas2p120786c8cc5a1f1b71dbd1828b0a9d837
References: <CGME20190607141821epcas2p120786c8cc5a1f1b71dbd1828b0a9d837@epcas2p1.samsung.com>
Cc: alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, lgirdwood@gmail.com,
 krzk@kernel.org, tzungbi@google.com,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH] ASoC: Fix freeing of incompletely initialized
 snd_soc_dapm_context
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When soc_init_dai_link() call at the beginning of snd_soc_instantiate_card
function fails soc_cleanup_card_resources() and then snd_soc_dapm_free()
gets called with an incompletely initialized card->dapm. In particular
card->dapm.card is NULL and it gets dereferenced in dapm_free_widgets().
Also dapm->list is invalid and there is an invalid pointer dereference
from list_del().

The function call stack (deferred probing) on Chromebook Snow where this
issue has shown up in todays -next:

 snd_soc_dapm_free
 soc_cleanup_card_resources
 snd_soc_instantiate_card
 snd_soc_register_card
 devm_snd_soc_register_card
 snow_probe

Fix this by testing dapm->card before attempting to free dapm widgets.

Fixes: 70fc53734e71 ("ASoC: core: move DAI pre-links initiation to snd_soc_instantiate_card")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/soc-dapm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 6b44b4a78b8e..5774cbd393fe 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4658,8 +4658,11 @@ EXPORT_SYMBOL_GPL(snd_soc_dapm_ignore_suspend);
 void snd_soc_dapm_free(struct snd_soc_dapm_context *dapm)
 {
 	dapm_debugfs_cleanup(dapm);
-	dapm_free_widgets(dapm);
-	list_del(&dapm->list);
+
+	if (dapm->card) {
+		dapm_free_widgets(dapm);
+		list_del(&dapm->list);
+	}
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_free);

--
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
