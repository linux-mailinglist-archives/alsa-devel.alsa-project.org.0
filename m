Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3D03B348D
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Jun 2021 19:18:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B330D166B;
	Thu, 24 Jun 2021 19:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B330D166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624555085;
	bh=ULZiFuZ1SRLTDVAsRV/Zy+ZTseEtff31uZqMLatIDnY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M4e27PrlN1uWuhKd3drn4gfApSg/dskv7kojHNzRb7bH36L22HC4c7g9Ah2sjZz4r
	 01piKtiEG7U+2UXIH74q2CZB9LwCqLdKPbg7cy5CbHMiU7se0MsHABE5X3K0JKK4uU
	 zCPQ3bSIXgZ2E0XglioC85p7fgSZvMNbsgn1sf20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC7B4F802C4;
	Thu, 24 Jun 2021 19:16:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4ADE4F802C4; Thu, 24 Jun 2021 19:16:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.nihaljere.xyz (nihaljere.xyz [142.11.196.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0379FF801F7
 for <alsa-devel@alsa-project.org>; Thu, 24 Jun 2021 19:16:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0379FF801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nihaljere.xyz header.i=@nihaljere.xyz
 header.b="M0NNXSw7"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=20200619; bh=ULZiFuZ1SRL
 TDVAsRV/Zy+ZTseEtff31uZqMLatIDnY=;
 h=references:in-reply-to:date:
 subject:cc:to:from; d=nihaljere.xyz; b=M0NNXSw7zM/FPXtZwZmjNTqK3b5drms
 UIPY3OGyrxWDPoKGh4/Qe6jxYoELn/u0w2/7pw4W8slXLagZTtk0Pz2Q53ypydKZkzhe2p
 xymmufAXV5O7V1M3vNFT3YlXxQktv4MhOateqKFDOLaQBA7uPFZoIJ8hAmbVEVnfl/d3FM
 =
Received: from localhost (136-49-115-232.googlefiber.net [136.49.115.232])
 by vps.nihaljere.xyz (OpenSMTPD) with ESMTPSA id 52ce93a8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 24 Jun 2021 12:16:16 -0500 (CDT)
From: Nihal Jere <nihal@nihaljere.xyz>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 2/2] control: improve documentation for
 snd_ctl_elem_info_t
Date: Thu, 24 Jun 2021 12:16:01 -0500
Message-Id: <20210624171559.14003-2-nihal@nihaljere.xyz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210624171559.14003-1-nihal@nihaljere.xyz>
References: <20210624171559.14003-1-nihal@nihaljere.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nihal Jere <nihal@nihaljere.xyz>
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

Signed-off-by: Nihal Jere <nihal@nihaljere.xyz>
---
 include/control.h     | 38 +++++++++++++++++++++++++++++++++++++-
 src/control/control.c |  5 +++++
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/include/control.h b/include/control.h
index e386ecec..47e462fd 100644
--- a/include/control.h
+++ b/include/control.h
@@ -152,7 +152,43 @@ typedef struct _snd_ctl_elem_id snd_ctl_elem_id_t;
  */
 typedef struct _snd_ctl_elem_list snd_ctl_elem_list_t;
 
-/** CTL element info container */
+/** CTL element info container
+ *
+ * snd_ctl_elem_info_t can be allocated, cleared, and copied in the same
+ * way as #snd_ctl_elem_value_t, using the analogous functions.
+ *
+ * The ID can be filled in in the same way as for snd_ctl_elem_value_t,
+ * substituting snd_ctl_elem_value_* functions for snd_ctl_elem_info_*
+ * functions. See #snd_ctl_elem_value_t for details.
+ *
+ * The ID or numid must be set before calling snd_ctl_elem_info.
+ *
+ * \code
+ *   snd_ctl_t* ctl;
+ *   snd_ctl_elem_info_t* info;
+ *   snd_ctl_elem_id_t* id;
+ *
+ *   // Allocate info
+ *   snd_ctl_elem_info_malloc(&info);
+ *
+ *   // Obtain id, setup ctl...
+ *
+ *   // set id
+ *   snd_ctl_elem_info_set_id(info, id);
+ *   // OR just set numid (more applicable if you don't have an id)
+ *   snd_ctl_elem_info_set_id(info, snd_ctl_elem_id_get_numid(id));
+ *
+ *   // Get info from driver
+ *   snd_ctl_elem_info(ctl, info);
+ *
+ *   // Do things with info...
+ *
+ *   // Cleanup
+ *   snd_ctl_elem_info_free(info);
+ * \endcode
+ *
+ * The above example excludes error checking for the sake of readability.
+ */
 typedef struct _snd_ctl_elem_info snd_ctl_elem_info_t;
 
 /** CTL element value container.
diff --git a/src/control/control.c b/src/control/control.c
index 3930c7b1..e346fa6b 100644
--- a/src/control/control.c
+++ b/src/control/control.c
@@ -417,6 +417,11 @@ int snd_ctl_elem_list(snd_ctl_t *ctl, snd_ctl_elem_list_t *list)
 
 /**
  * \brief Get CTL element information
+ * 
+ * The object "info" must be allocated and the ID or numid must be filled
+ * prior to calling this function.
+ * See #snd_ctl_elem_info_t to learn more.
+ *
  * \param ctl CTL handle
  * \param info CTL element id/information pointer
  * \return 0 on success otherwise a negative error code
-- 
2.32.0

