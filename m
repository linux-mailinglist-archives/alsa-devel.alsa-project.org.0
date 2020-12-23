Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C834A2E1274
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 03:25:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BBAF17F2;
	Wed, 23 Dec 2020 03:24:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BBAF17F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608690314;
	bh=8/9mTcfvkzgNMCWVtLKeifjY/iJKLM5eRp/Y9Ydkqtw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eTsWhNk7nrCEi6K9suBJXBzb4SxPEZ69EMzeyHyTa61CchAsgg7PseXT2bKDPCmfV
	 BtfHX2VM4NUA3mCrUy6LKSgMVgo2FDXbKDGKiCcMKPGejM6hZVOmUe0IVKLbX7Nk5y
	 9G5BR90+mtlDS4lglT9NVHrJUAuyqsNhyge4Mqd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63509F80212;
	Wed, 23 Dec 2020 03:23:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CC28F8028D; Wed, 23 Dec 2020 03:23:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B102F80168
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 03:23:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B102F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gq56vUSD"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B01622273;
 Wed, 23 Dec 2020 02:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608690212;
 bh=8/9mTcfvkzgNMCWVtLKeifjY/iJKLM5eRp/Y9Ydkqtw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gq56vUSDYk8v65Q0GCi70H4MXF7n9C9LPmZN4e1/CHQW/CGbeh0GvfSAjOwAHi9n8
 j4we64PbPxpov9aqL7O+kF12f/LVn0+iyvh0GbLO5sEM6UxcINK1Z/GrFI6poYmCKg
 5j8nUE3lxeQkmrRDu8yX3t5lg988QzAc+V7412509xbKxG3i8ai9iB2cEIjGoAYH6Q
 htqs7a2zbFGVeVHyYsSJYzwpgo6/pjTokH3BlTLLRnYNd5S1P19Omfmb1OFO20CmOY
 bgIM4dljobpxp+OHG74ltPWVF/jVeiIhsA6Tw4j7Q2IuvGQNIzGbvuG7eX0JwlMNkF
 s63weQF808EpQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 31/66] ALSA: usb-audio: Don't call
 usb_set_interface() at trigger callback
Date: Tue, 22 Dec 2020 21:22:17 -0500
Message-Id: <20201223022253.2793452-31-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223022253.2793452-1-sashal@kernel.org>
References: <20201223022253.2793452-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Dylan Robinson <dylan_robinson@motu.com>,
 Keith Milner <kamilner@superlative.org>
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 4974b7950929e4a28d4eaee48e4ad07f168ac132 ]

The PCM trigger callback is atomic, hence we must not call a function
like usb_set_interface() there.  Calling it from there would lead to a
kernel Oops.

Fix it by moving the usb_set_interface() call to set_sync_endpoint().

Also, apply the snd_usb_set_interface_quirk() for consistency, too.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Link: https://lore.kernel.org/r/20201123085347.19667-3-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/pcm.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 6caf94581a0e8..1ed4a7c094c48 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -242,21 +242,6 @@ static int start_endpoints(struct snd_usb_substream *subs)
 	    !test_and_set_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags)) {
 		struct snd_usb_endpoint *ep = subs->sync_endpoint;
 
-		if (subs->data_endpoint->iface != subs->sync_endpoint->iface ||
-		    subs->data_endpoint->altsetting != subs->sync_endpoint->altsetting) {
-			err = usb_set_interface(subs->dev,
-						subs->sync_endpoint->iface,
-						subs->sync_endpoint->altsetting);
-			if (err < 0) {
-				clear_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags);
-				dev_err(&subs->dev->dev,
-					   "%d:%d: cannot set interface (%d)\n",
-					   subs->sync_endpoint->iface,
-					   subs->sync_endpoint->altsetting, err);
-				return -EIO;
-			}
-		}
-
 		dev_dbg(&subs->dev->dev, "Starting sync EP @%p\n", ep);
 
 		ep->sync_slave = subs->data_endpoint;
@@ -499,6 +484,19 @@ static int set_sync_endpoint(struct snd_usb_substream *subs,
 
 	subs->data_endpoint->sync_master = subs->sync_endpoint;
 
+	if (subs->data_endpoint->iface != subs->sync_endpoint->iface ||
+	    subs->data_endpoint->altsetting != subs->sync_endpoint->altsetting) {
+		err = usb_set_interface(subs->dev,
+					subs->sync_endpoint->iface,
+					subs->sync_endpoint->altsetting);
+		if (err < 0)
+			return err;
+		dev_dbg(&dev->dev, "setting usb interface %d:%d\n",
+			subs->sync_endpoint->iface,
+			subs->sync_endpoint->altsetting);
+		snd_usb_set_interface_quirk(dev);
+	}
+
 	return 0;
 }
 
-- 
2.27.0

