Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9135F12E011
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jan 2020 19:28:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBACE16B5;
	Wed,  1 Jan 2020 19:27:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBACE16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577903292;
	bh=wsFrp2EcB8bMCy0OtnfN1N8rtg74ScJGH7YphYAdnZ8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ms7TWnPT0Wd9HE3yX9dgL+9rqH6Xw86XWBX3HsboeQOLl/257slxkepMLOn+l9x4C
	 uiV0s7mfvXfRwYpaYi3P+rbs47XthrgIH5FCelWtzoVBGctulT6IqFkz+ZW6qEvvJ+
	 WE8BgQch+PHZwPtQqwOIgwwhJPxT/b2kJZoG4s3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B615F80123;
	Wed,  1 Jan 2020 19:26:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4771FF8015E; Wed,  1 Jan 2020 19:26:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A4A6F80123
 for <alsa-devel@alsa-project.org>; Wed,  1 Jan 2020 19:26:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A4A6F80123
X-IronPort-AV: E=Sophos;i="5.69,382,1571695200"; d="scan'208";a="334542273"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES128-SHA256;
 01 Jan 2020 19:26:24 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Jaroslav Kysela <perex@perex.cz>
Date: Wed,  1 Jan 2020 18:49:42 +0100
Message-Id: <1577900990-8588-3-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
References: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 02/10] ALSA: ml403-ac97cr: use resource_size
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

Use resource_size rather than a verbose computation on
the end and start fields.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

<smpl>
@@ struct resource *ptr; @@
- ((ptr->end) - (ptr->start) + 1)
+ resource_size(ptr)
</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 sound/drivers/ml403-ac97cr.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/drivers/ml403-ac97cr.c b/sound/drivers/ml403-ac97cr.c
index 4e6042e652f0..9de5caaf6047 100644
--- a/sound/drivers/ml403-ac97cr.c
+++ b/sound/drivers/ml403-ac97cr.c
@@ -1100,9 +1100,7 @@ snd_ml403_ac97cr_create(struct snd_card *card, struct platform_device *pfdev,
 	PDEBUG(INIT_INFO, "Trying to reserve resources now ...\n");
 	resource = platform_get_resource(pfdev, IORESOURCE_MEM, 0);
 	/* get "port" */
-	ml403_ac97cr->port = ioremap(resource->start,
-					     (resource->end) -
-					     (resource->start) + 1);
+	ml403_ac97cr->port = ioremap(resource->start, resource_size(resource));
 	if (ml403_ac97cr->port == NULL) {
 		snd_printk(KERN_ERR SND_ML403_AC97CR_DRIVER ": "
 			   "unable to remap memory region (%pR)\n",

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
