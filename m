Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 676D0326C5D
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Feb 2021 10:02:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC4D616A2;
	Sat, 27 Feb 2021 10:01:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC4D616A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614416526;
	bh=ynYxj0YE6Zj4GR6AwZfMhhKycdTyQsOJhTolatQ+on0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mlzOSF1s+iPYfvEm9gus642AU/noabANej82lzhfxKGYyUJBKEYH+1ehBfhNtKSoP
	 9QJBZMZp7XN4+8NNL/Cz6WjDO+z4VbZ43H8mazx89oJ3E0c4oJ4YsPTyJMUuv3Xqo3
	 Qye6mA1ErRPwNN08m8Ets+0zDECdrwPHubSaVtzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73D99F8026C;
	Sat, 27 Feb 2021 10:00:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DF74F80245; Sat, 27 Feb 2021 10:00:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17B3BF80169
 for <alsa-devel@alsa-project.org>; Sat, 27 Feb 2021 10:00:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17B3BF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="lx2Ug7ay"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 1142FA123F;
 Sat, 27 Feb 2021 10:00:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=H/IqaTbkOtxU
 zfKUTf6SoEir9ZqTvVT/Ba9mrKSHQWE=; b=lx2Ug7ay6rfrNixN+QUPwHbATjpu
 UbkwNOBaf49EX3Df1yDld4pBmpkkNQQaR/XVKKSL+/7p3ai4LtmeJWMLb+1qZobI
 WQ5PDUT8Ao11tlxFS5qfRLb071j6BNoEKb3iR+UwfMEPqvKOcHLGNP952YjW5ukH
 uRhvNcKXxW6G69R05PkKF8sWFjO18/yrUppS6TZBZ49jy7sNyZSxuAIUY6FwR3Ki
 M3gQ6AusjCBdjolPvn0aXE5CVaNalRfetpAK28QW0v95pwpHCWHu/I4t/xZ/fGqd
 hnVvQuRp5YHg3IJ6Hhs5btq7FVrHC0b5tHsUAUlRVkVAL8EIzXBb7TmTWw==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH v6 1/9] uapi: virtio_ids: add a sound device type ID from
 OASIS spec
Date: Sat, 27 Feb 2021 09:59:48 +0100
Message-ID: <20210227085956.1700687-2-anton.yakovlev@opensynergy.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210227085956.1700687-1-anton.yakovlev@opensynergy.com>
References: <20210227085956.1700687-1-anton.yakovlev@opensynergy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SR-MAIL-01.open-synergy.com (10.26.10.21) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Cc: linux-kernel@vger.kernel.org, Jason Wang <jasowang@redhat.com>,
 Takashi Iwai <tiwai@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>
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

The OASIS virtio spec defines a sound device type ID that is not
present in the header yet.

Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
---
 include/uapi/linux/virtio_ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index bc1c0621f5ed..029a2e07a7f9 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -51,6 +51,7 @@
 #define VIRTIO_ID_PSTORE		22 /* virtio pstore device */
 #define VIRTIO_ID_IOMMU			23 /* virtio IOMMU */
 #define VIRTIO_ID_MEM			24 /* virtio mem */
+#define VIRTIO_ID_SOUND			25 /* virtio sound */
 #define VIRTIO_ID_FS			26 /* virtio filesystem */
 #define VIRTIO_ID_PMEM			27 /* virtio pmem */
 #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
-- 
2.30.1


