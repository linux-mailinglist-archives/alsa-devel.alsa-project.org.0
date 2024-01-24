Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FBB83A91F
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 13:09:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AED4825;
	Wed, 24 Jan 2024 13:09:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AED4825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706098167;
	bh=C5c4sH4CaI7m2M5NSlfinxL7zAECwlDceD08znN1xdQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=d0/s9OvBOXGVxm0gclX3sqqz4ptbn91zbE6M5ep8BUu4EtR+WibNPlXpl2HNp24R+
	 rF0KnZqu9wSI0FORaDhBjYzlk9c3CLfycdSlymzYyC+oGHzi8XBG6jarnq6c0WyBM9
	 h7SKpmEBDQb6kGm//1hRAe4OVx0zo6ROCUWwV/6U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53483F80578; Wed, 24 Jan 2024 13:08:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3B26F80520;
	Wed, 24 Jan 2024 13:08:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2793FF8028D; Wed, 24 Jan 2024 13:08:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from njjs-sys-mailin01.njjs.baidu.com (mx312.baidu.com
 [180.101.52.108])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E365F8003A
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 13:08:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E365F8003A
Received: from localhost (bjhw-sys-rpm015653cc5.bjhw.baidu.com [10.227.53.39])
	by njjs-sys-mailin01.njjs.baidu.com (Postfix) with ESMTP id 8CFB67F0003D;
	Wed, 24 Jan 2024 20:08:38 +0800 (CST)
From: Li RongQing <lirongqing@baidu.com>
To: anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	perex@perex.cz,
	tiwai@suse.com,
	virtualization@lists.linux.dev,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Cc: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH] ALSA: virtio: remove duplicate check if queue is broken
Date: Wed, 24 Jan 2024 20:08:34 +0800
Message-Id: <20240124120834.49410-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.9.4
Message-ID-Hash: ANPXQ7UCZOAH4AG24NDBEUZKYDCKFIAX
X-Message-ID-Hash: ANPXQ7UCZOAH4AG24NDBEUZKYDCKFIAX
X-MailFrom: lirongqing@baidu.com
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ANPXQ7UCZOAH4AG24NDBEUZKYDCKFIAX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

virtqueue_enable_cb() will call virtqueue_poll() which will check if
queue is broken at beginning, so remove the virtqueue_is_broken() call

Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
 sound/virtio/virtio_card.c    | 2 --
 sound/virtio/virtio_ctl_msg.c | 2 --
 sound/virtio/virtio_pcm_msg.c | 2 --
 3 files changed, 6 deletions(-)

diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index e2847c0..b158c3c 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -91,8 +91,6 @@ static void virtsnd_event_notify_cb(struct virtqueue *vqueue)
 			virtsnd_event_dispatch(snd, event);
 			virtsnd_event_send(vqueue, event, true, GFP_ATOMIC);
 		}
-		if (unlikely(virtqueue_is_broken(vqueue)))
-			break;
 	} while (!virtqueue_enable_cb(vqueue));
 	spin_unlock_irqrestore(&queue->lock, flags);
 }
diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
index 18dc5ac..9dabea0 100644
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -303,8 +303,6 @@ void virtsnd_ctl_notify_cb(struct virtqueue *vqueue)
 		virtqueue_disable_cb(vqueue);
 		while ((msg = virtqueue_get_buf(vqueue, &length)))
 			virtsnd_ctl_msg_complete(msg);
-		if (unlikely(virtqueue_is_broken(vqueue)))
-			break;
 	} while (!virtqueue_enable_cb(vqueue));
 	spin_unlock_irqrestore(&queue->lock, flags);
 }
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index 542446c..8c32efa 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -358,8 +358,6 @@ static inline void virtsnd_pcm_notify_cb(struct virtio_snd_queue *queue)
 		virtqueue_disable_cb(queue->vqueue);
 		while ((msg = virtqueue_get_buf(queue->vqueue, &written_bytes)))
 			virtsnd_pcm_msg_complete(msg, written_bytes);
-		if (unlikely(virtqueue_is_broken(queue->vqueue)))
-			break;
 	} while (!virtqueue_enable_cb(queue->vqueue));
 	spin_unlock_irqrestore(&queue->lock, flags);
 }
-- 
2.9.4

