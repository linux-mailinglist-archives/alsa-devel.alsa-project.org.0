Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B626141CC6B
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 21:12:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CE3C16E8;
	Wed, 29 Sep 2021 21:11:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CE3C16E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632942752;
	bh=g/8s55Jc9bqt8ZNNteEuzgrzOaKJ/elKL6Rcokeb5XM=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aFxWBs9ML8LqehVSQrJKX6/XV7PK+FDp7Bg4O+fRY+VO/GNdcJuoXNCt6aZ3y322p
	 S7elZymIZIfzAgsRFXHgB8qA760UI0+vXiA2ymas7HeE376JnOjykB/4sejEzgsXg8
	 0emGQY48NDkqk/9Jk/HrfFBH8dKMoi6waS2PVgmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E5E4F8026D;
	Wed, 29 Sep 2021 21:11:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB5C5F80227; Wed, 29 Sep 2021 21:11:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43F20F80105
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 21:11:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43F20F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nXFeiZPS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4F8461526;
 Wed, 29 Sep 2021 19:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632942660;
 bh=g/8s55Jc9bqt8ZNNteEuzgrzOaKJ/elKL6Rcokeb5XM=;
 h=Date:From:To:Cc:Subject:From;
 b=nXFeiZPSW79r4UtpWMpAj+sFQtFDItw0Azdkv+bcgqAhlqsNY1rIMFzeJg0E7AOSL
 GGu092Vwb+B8Zt66Dd9akCOdAQvl3OY6aYceGqV3pxbJuAGIkSdxbV/MNqD2KFhu3T
 /7NbpFrr3sVtXygweNooeksB8BgKwFl5i9ggQhKmF7iWNj6jC9yjwHkRG/tzHnLdNx
 K4Xv8A8njMCu+Idbn8Qw3uojter5eeOMewy7T24AH+8FsPdwDK8As8WQalcTgI2CUo
 dDvWtlydXy2hkheMpF31hBm/d5sop6hyYl6WolfVTVwbkDyYm+995y/SnXJbN4pNh3
 ZHTzk8/g/jVpA==
Date: Wed, 29 Sep 2021 14:15:04 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH][next] ALSA: virtio: Replace zero-length array with
 flexible-array member
Message-ID: <20210929191504.GA337268@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

There is a regular need in the kernel to provide a way to declare
having a dynamically sized set of trailing elements in a structure.
Kernel code should always use “flexible array members”[1] for these
cases. The older style of one-element or zero-length arrays should
no longer be used[2].

Also, make use of the struct_size() helper in kzalloc().

[1] https://en.wikipedia.org/wiki/Flexible_array_member
[2] https://www.kernel.org/doc/html/v5.10/process/deprecated.html#zero-length-and-one-element-arrays

Link: https://github.com/KSPP/linux/issues/78
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 sound/virtio/virtio_pcm_msg.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index f88c8f29cbd8..aca2dc1989ba 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -20,7 +20,7 @@ struct virtio_pcm_msg {
 	struct virtio_snd_pcm_xfer xfer;
 	struct virtio_snd_pcm_status status;
 	size_t length;
-	struct scatterlist sgs[0];
+	struct scatterlist sgs[];
 };
 
 /**
@@ -146,8 +146,7 @@ int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
 		int sg_num = virtsnd_pcm_sg_num(data, period_bytes);
 		struct virtio_pcm_msg *msg;
 
-		msg = kzalloc(sizeof(*msg) + sizeof(*msg->sgs) * (sg_num + 2),
-			      GFP_KERNEL);
+		msg = kzalloc(struct_size(msg, sgs, sg_num + 2), GFP_KERNEL);
 		if (!msg)
 			return -ENOMEM;
 
-- 
2.27.0

