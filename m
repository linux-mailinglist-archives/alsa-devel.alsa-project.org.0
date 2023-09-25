Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8313B7AD77F
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 14:04:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5CE1DF2;
	Mon, 25 Sep 2023 14:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5CE1DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695643474;
	bh=fPtAXis1fewUnUMnrSzi4Is3JaQCt/rG8aIHxDhOVbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sNI7D/+DJSLsrWn2dKdzbp5wHcsH9r0Mugt70WwCSwMEdAbA1NDJPFCLR51w1CUu5
	 tTvmiHupgDMo1LbMROhYBqhc7zCQb91Vj6mFoUwMHQUvjPcLudUlmqG5aHrqXpeQCI
	 oYkuyZDCvz1P/tN3twJG2I1He4Caz2/E7/jht4c0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7477BF800AA; Mon, 25 Sep 2023 14:03:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 410D3F80166;
	Mon, 25 Sep 2023 14:03:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34419F8016A; Mon, 25 Sep 2023 14:03:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4066BF800AA
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 14:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4066BF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=GX2EG8jo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695643409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7BA8QLNemiJIXUC+XXC0PAivfRO0j2uaFr7AQHg4nPM=;
	b=GX2EG8jozUfRDmwUnih+CgGZNc8pnc4WKg3CiCrX7HBY5GBkDRJ6XZN1eTUuGZ2CMCyHah
	hYUKDvm4vClheu/L+kQFVu4PE79jXVLmjLLteOZrPaj9+Ej7qg9hpXNNvR6xihxL9bzOtv
	GC/ieRXfOYfIjaJ5uBR38Ht8ttUCasE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-3j0u1djBOj-K7pheSFVopw-1; Mon, 25 Sep 2023 08:03:26 -0400
X-MC-Unique: 3j0u1djBOj-K7pheSFVopw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B212811E88;
	Mon, 25 Sep 2023 12:03:25 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7101940C2064;
	Mon, 25 Sep 2023 12:03:22 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: David Howells <dhowells@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Christian Brauner <christian@brauner.io>,
	David Laight <David.Laight@ACULAB.COM>,
	Matthew Wilcox <willy@infradead.org>,
	Jeff Layton <jlayton@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	Suren Baghdasaryan <surenb@google.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH v7 03/12] sound: Fix snd_pcm_readv()/writev() to use iov
 access functions
Date: Mon, 25 Sep 2023 13:03:00 +0100
Message-ID: <20230925120309.1731676-4-dhowells@redhat.com>
In-Reply-To: <20230925120309.1731676-1-dhowells@redhat.com>
References: <20230925120309.1731676-1-dhowells@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Message-ID-Hash: DU5MDZKNLY6BTLOWRQH4JJM6AEYUQK6V
X-Message-ID-Hash: DU5MDZKNLY6BTLOWRQH4JJM6AEYUQK6V
X-MailFrom: dhowells@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DU5MDZKNLY6BTLOWRQH4JJM6AEYUQK6V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix snd_pcm_readv()/writev() to use iov access functions rather than poking
at the iov_iter internals directly.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
cc: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
cc: Jens Axboe <axboe@kernel.dk>
cc: Suren Baghdasaryan <surenb@google.com>
cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
cc: alsa-devel@alsa-project.org
---
 sound/core/pcm_native.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index bd9ddf412b46..9a69236fa207 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3527,7 +3527,7 @@ static ssize_t snd_pcm_readv(struct kiocb *iocb, struct iov_iter *to)
 	if (runtime->state == SNDRV_PCM_STATE_OPEN ||
 	    runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
-	if (!to->user_backed)
+	if (!user_backed_iter(to))
 		return -EINVAL;
 	if (to->nr_segs > 1024 || to->nr_segs != runtime->channels)
 		return -EINVAL;
@@ -3567,7 +3567,7 @@ static ssize_t snd_pcm_writev(struct kiocb *iocb, struct iov_iter *from)
 	if (runtime->state == SNDRV_PCM_STATE_OPEN ||
 	    runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
-	if (!from->user_backed)
+	if (!user_backed_iter(from))
 		return -EINVAL;
 	if (from->nr_segs > 128 || from->nr_segs != runtime->channels ||
 	    !frame_aligned(runtime, iov->iov_len))

