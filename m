Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AB74C9F83
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:41:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40D5A1914;
	Wed,  2 Mar 2022 09:40:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40D5A1914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210483;
	bh=goDaAwxAD9BftWePZeFj5H99yIKBm2FPEWGl4Xk6aHs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gFMgADvGzE8u3IOWb0+9rg8T3/NCg9nKUIrDwQpFpP/3GXFXsV3BrAzgvT8i3sLVL
	 TtciR5AnJ+FR7I7xmE7Dn9pfrvz7gV9/122dPrch3bRfb4TOOWKBR9/njdYuBxPJQk
	 fUvk7yEWCeT0PmoLQWghA97jANLf9hrCjJCxXJQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 968E3F805C3;
	Wed,  2 Mar 2022 09:33:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA06DF8015B; Mon, 28 Feb 2022 12:09:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09349F8013C
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 12:09:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09349F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XoHp2vZs"
Received: by mail-ej1-x62a.google.com with SMTP id p14so23947610ejf.11
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 03:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NwvvEiJPPM0SG7ZI4yc03tHRsjcGU4DYrm0+p7QW2+g=;
 b=XoHp2vZs5sXnnQm8jTsL06JwdjgH4Z1Am+qeboNHSyU/csHp7G8mKHTnYwT7vMJf3q
 1zZobpdX4BxBQ2erAJx74EzSCDXfVaAB33jAX9ZekfWtpz9xLL4KIzz7DciQBlIBY9DK
 vi6LJyw6u5UaEjT8CWPzRGPwv8GzX6oWgjgvygChKW8zu7PwVtsUQz/kuHu5rW/3vaBt
 P3mcu2gbh7uG62xQrliOtXiVl+brL2WoHfh7VHyAXnwazE3NNCXTKdQujGPQMoLCoB+H
 4TwL3ENhlSsI5tK0hgbUY+rfbxgFEyt/dohDr5V+g2PZ9mAGfyjh/75qZVaBOXbUEFp6
 QPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NwvvEiJPPM0SG7ZI4yc03tHRsjcGU4DYrm0+p7QW2+g=;
 b=FLl7HyvNd15UGLIeqHWTmE3SElFUDWmiYWwfjjqLpwvgVdkdaZkRXuziuMEbsQ7t1B
 BVLmRy+oAwAodyhui7T6wfbTDNqS9m5xOKxE0UoaaJ/SJ8qLvSqY5VzrXJbfbhOs8A9P
 sB/SFFGtt0JjTNva/HFiZAWi789UfvR3sjLA3Ox6unjMajQy9XWTc3PiT6ZYNEU7QI//
 NHSgMcxRy8fHDys/v5MS80WnB5vkO+V3W49zzQXBH+9i7T5GmhgDNIJgMgIapct8rGda
 6J+jImmsHa1gIhDojFiA0PoQU182occZ+IdOmCP+6cYzxf1vO39xNeYr8LG9/zP3fpLp
 CaQw==
X-Gm-Message-State: AOAM531XA+zoXszN4R/dcDGQJ9E+k7NvZbq9VvSZQyEdwginb2M39bCc
 fxYdB86rZiu/2b0zCF63HKQ=
X-Google-Smtp-Source: ABdhPJwx6JZK1Sd067eYUFaKDGIuHgaxlGXhzFGfLUQYCLtFq3NCzAqvSFrK3I6DGGTf6F+6FgXuew==
X-Received: by 2002:a17:906:2608:b0:6c9:b248:4dcf with SMTP id
 h8-20020a170906260800b006c9b2484dcfmr14572317ejc.320.1646046539415; 
 Mon, 28 Feb 2022 03:08:59 -0800 (PST)
Received: from localhost.localdomain (dhcp-077-250-038-153.chello.nl.
 [77.250.38.153]) by smtp.googlemail.com with ESMTPSA id
 z22-20020a17090655d600b006d229436793sm4209049ejp.223.2022.02.28.03.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 03:08:59 -0800 (PST)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 4/6] drivers: remove unnecessary use of list iterator variable
Date: Mon, 28 Feb 2022 12:08:20 +0100
Message-Id: <20220228110822.491923-5-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228110822.491923-1-jakobkoschel@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:34 +0100
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 kvm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-fsdevel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 linux-block@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
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

When list_for_each_entry() completes the iteration over the whole list
without breaking the loop, the iterator value will *always* be a bogus
pointer computed based on the head element.

To avoid type confusion use the actual list head directly instead of last
iterator value.

Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/dma/dw-edma/dw-edma-core.c             | 4 ++--
 drivers/net/ethernet/intel/i40e/i40e_ethtool.c | 3 ++-
 drivers/net/wireless/ath/ath6kl/htc_mbox.c     | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 468d1097a1ec..7883c4831857 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -136,7 +136,7 @@ static void dw_edma_free_burst(struct dw_edma_chunk *chunk)
 	}

 	/* Remove the list head */
-	kfree(child);
+	kfree(chunk->burst);
 	chunk->burst = NULL;
 }

@@ -156,7 +156,7 @@ static void dw_edma_free_chunk(struct dw_edma_desc *desc)
 	}

 	/* Remove the list head */
-	kfree(child);
+	kfree(desc->chunk);
 	desc->chunk = NULL;
 }

diff --git a/drivers/net/ethernet/intel/i40e/i40e_ethtool.c b/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
index 091f36adbbe1..c0ea9dbc4ff6 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
@@ -3963,7 +3963,8 @@ static void __i40e_reprogram_flex_pit(struct i40e_pf *pf,
 	 * correctly, the hardware will disable flexible field parsing.
 	 */
 	if (!list_empty(flex_pit_list))
-		last_offset = list_prev_entry(entry, list)->src_offset + 1;
+		last_offset = list_entry(flex_pit_list->prev,
+					 struct i40e_flex_pit, list)->src_offset + 1;

 	for (; i < 3; i++, last_offset++) {
 		i40e_write_rx_ctl(&pf->hw,
diff --git a/drivers/net/wireless/ath/ath6kl/htc_mbox.c b/drivers/net/wireless/ath/ath6kl/htc_mbox.c
index e3874421c4c0..cf5b05860799 100644
--- a/drivers/net/wireless/ath/ath6kl/htc_mbox.c
+++ b/drivers/net/wireless/ath/ath6kl/htc_mbox.c
@@ -104,7 +104,7 @@ static void ath6kl_credit_init(struct ath6kl_htc_credit_info *cred_info,
 	 * it use list_for_each_entry_reverse to walk around the whole ep list.
 	 * Therefore assign this lowestpri_ep_dist after walk around the ep_list
 	 */
-	cred_info->lowestpri_ep_dist = cur_ep_dist->list;
+	cred_info->lowestpri_ep_dist = *ep_list;

 	WARN_ON(cred_info->cur_free_credits <= 0);

--
2.25.1

