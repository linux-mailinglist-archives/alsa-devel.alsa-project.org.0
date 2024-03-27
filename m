Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F78D894BFB
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:59:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5A592C35;
	Tue,  2 Apr 2024 08:59:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5A592C35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041153;
	bh=yEq2VMTPVDvaL2VvdEqCjK2n/T5h+SgXfSf2iwiMf9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MbtkMhOEM/hf1y5tnTM+gYpMdI+M2tU8FigLCh5p5b5eZUSyaArTysm4iDca+5h4U
	 kwaJeJz7EgyvdBMoJtWIko3+RaB3mDd+1KMuSTr8mJ1XgbHdCaFI1h+RXjXca84cIK
	 ZxV/XML1gLdsGFYU+QC4LUxp6KiDhx/4znwUuHuk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D9C7F80847; Tue,  2 Apr 2024 08:52:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59904F897E8;
	Tue,  2 Apr 2024 08:52:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DD70F802DB; Wed, 27 Mar 2024 14:08:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 788C1F801D5
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 14:07:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 788C1F801D5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 548EDCE2634;
	Wed, 27 Mar 2024 13:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A94C3C433F1;
	Wed, 27 Mar 2024 13:07:15 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Amit Shah <amit@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gonglei <arei.gonglei@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Joerg Roedel <joro@8bytes.org>,
	Alexander Graf <graf@amazon.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Kalle Valo <kvalo@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	virtualization@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	netdev@vger.kernel.org,
	v9fs@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 22/22] sound: virtio: drop owner assignment
Date: Wed, 27 Mar 2024 14:07:09 +0100
Message-Id: <20240327130710.378970-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: SRS0=G+Mr=LB=linaro.org=krzysztof.kozlowski@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: MEHEFHPKUVI2UDQ25ZZWWEP37MBTQF3Z
X-Message-ID-Hash: MEHEFHPKUVI2UDQ25ZZWWEP37MBTQF3Z
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:50:13 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MEHEFHPKUVI2UDQ25ZZWWEP37MBTQF3Z/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 sound/virtio/virtio_card.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index 2da20c625247..7805daea0102 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -438,7 +438,6 @@ static unsigned int features[] = {
 
 static struct virtio_driver virtsnd_driver = {
 	.driver.name = KBUILD_MODNAME,
-	.driver.owner = THIS_MODULE,
 	.id_table = id_table,
 	.feature_table = features,
 	.feature_table_size = ARRAY_SIZE(features),
-- 
2.34.1

