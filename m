Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0285077C4
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 20:17:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F88E1A60;
	Tue, 19 Apr 2022 20:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F88E1A60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650392227;
	bh=j0gl3vwHeaKb2MMhrqnV3OYaEofGRoT5zWN/DeGK2dI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hZTeQFbx+r/ISXzEdmO4agOyKL2bZ+W+DeJ7FVMBV5Zcu92Fu1cMP6kPg4cqur2xx
	 nH7lqewT9ULz5aI6OsEyvN/PjIrsEtmf6z5gSoZ3HbJSCk16eDA3NYOOxbLXrLnQzx
	 6thyB7hJhp/+cSYyzqAi9qgCblMiNQm6qxqCIF0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7006F804CB;
	Tue, 19 Apr 2022 20:16:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09B33F802E3; Tue, 19 Apr 2022 20:16:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C495BF80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 20:16:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C495BF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H8jUkFe7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A191CB818FE;
 Tue, 19 Apr 2022 18:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483C9C385A5;
 Tue, 19 Apr 2022 18:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650392166;
 bh=j0gl3vwHeaKb2MMhrqnV3OYaEofGRoT5zWN/DeGK2dI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H8jUkFe7RE6W65hj8kx+mBagfkm6UkiFvKdd4UDEOwbKYW8KJ1eN1sacf1baaBXd8
 eWkQJ/qVSk/p3PFBBS89vBUy+GczPVe90d0ByczGjtT+b/8XhYsrJB+Blcb4iN/1jU
 aHLt6UXibo6Cd1eapN8PUYfJOZ0tECV6YtSL1nZQm5a35XLxZjNbfgqhZ4w4URaCKD
 xPWcV61eQaBjYBYGGmTGyiCI+Muflm92hPFXGbkLup+eOPZVLxlrKzRfObtUGzJ9vG
 VriRwdJTDwMHGQflg6kckMx22aOpOgl8KI7j0nvk6hU6ZaVm2WF8hd7MQYEyV5RYVB
 0FU28J3gbuXcg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 3/9] ALSA: usb-audio: Fix undefined behavior due
 to shift overflowing the constant
Date: Tue, 19 Apr 2022 14:15:51 -0400
Message-Id: <20220419181557.486336-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419181557.486336-1-sashal@kernel.org>
References: <20220419181557.486336-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, tiwai@suse.com, Borislav Petkov <bp@suse.de>
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

From: Borislav Petkov <bp@suse.de>

[ Upstream commit 1ef8715975de8bd481abbd0839ed4f49d9e5b0ff ]

Fix:

  sound/usb/midi.c: In function ‘snd_usbmidi_out_endpoint_create’:
  sound/usb/midi.c:1389:2: error: case label does not reduce to an integer constant
    case USB_ID(0xfc08, 0x0101): /* Unknown vendor Cable */
    ^~~~

See https://lore.kernel.org/r/YkwQ6%2BtIH8GQpuct@zn.tnic for the gory
details as to why it triggers with older gccs only.

[ A slight correction with parentheses around the argument by tiwai ]

Signed-off-by: Borislav Petkov <bp@suse.de>
Link: https://lore.kernel.org/r/20220405151517.29753-3-bp@alien8.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/usbaudio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 62456a806bb4..4b8f1c46420d 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -22,7 +22,7 @@
  */
 
 /* handling of USB vendor/product ID pairs as 32-bit numbers */
-#define USB_ID(vendor, product) (((vendor) << 16) | (product))
+#define USB_ID(vendor, product) (((unsigned int)(vendor) << 16) | (product))
 #define USB_ID_VENDOR(id) ((id) >> 16)
 #define USB_ID_PRODUCT(id) ((u16)(id))
 
-- 
2.35.1

