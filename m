Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE7CA1CA4
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:25:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 090931682;
	Thu, 29 Aug 2019 16:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 090931682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567088734;
	bh=QQXYEBPF3FhHM74H0XlSFyp9QdBBBLfoz6FYLM42vuE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AF2gIDzT0eEbn8bxvMVfhWQ29MF4kjhzBB28ffGnCDsDFRa1qOicgE55O/Hk5s7Dt
	 +U1bij+cqMyIMoI2iAbPeLr20Kzf0aFiiCpLuGoX7NoK6larprjVGy2J21sS1CzIE+
	 ex8MumM9KXBb75ENRJ81C7dpUgXd2xA2lPBBZd/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C986F8087D;
	Tue, 27 Aug 2019 23:09:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E389F8087B; Tue, 27 Aug 2019 23:09:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.sonarnerd.net (rankki.sonarnerd.net [194.142.149.154])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 805C5F80878
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 23:09:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 805C5F80878
Received: from porkkala.uworld (porkkala.uworld [IPv6:fc00::2])
 by mail.sonarnerd.net (Postfix) with ESMTP id CC60C2310E9;
 Wed, 28 Aug 2019 00:09:21 +0300 (EEST)
From: Jussi Laako <jussi@sonarnerd.net>
To: alsa-devel@alsa-project.org
Date: Wed, 28 Aug 2019 00:08:47 +0300
Message-Id: <20190827210847.10306-2-jussi@sonarnerd.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190827210847.10306-1-jussi@sonarnerd.net>
References: <20190827210847.10306-1-jussi@sonarnerd.net>
Cc: tiwai@suse.de, Jussi Laako <jussi@sonarnerd.net>
Subject: [alsa-devel] [PATCH 2/2] ALSA: usb-audio: Update DSD support quirks
	for Oppo and Rotel
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

Oppo has issued firmware updates that change alt setting used for DSD
support. However, these devices seem to support auto-detection, so
support is moved from explicit whitelisting to auto-detection.

Also Rotel devices have USB interfaces that support DSD with
auto-detection.

Signed-off-by: Jussi Laako <jussi@sonarnerd.net>
---
 sound/usb/quirks.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 79fb24843d5b..91ce7d5eb0f2 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1584,9 +1584,6 @@ u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 	/* XMOS based USB DACs */
 	switch (chip->usb_id) {
 	case USB_ID(0x1511, 0x0037): /* AURALiC VEGA */
-	case USB_ID(0x22d9, 0x0416): /* OPPO HA-1 */
-	case USB_ID(0x22d9, 0x0436): /* OPPO Sonica */
-	case USB_ID(0x22d9, 0x0461): /* OPPO UDP-205 */
 	case USB_ID(0x2522, 0x0012): /* LH Labs VI DAC Infinity */
 	case USB_ID(0x2772, 0x0230): /* Pro-Ject Pre Box S2 Digital */
 		if (fp->altsetting == 2)
@@ -1600,7 +1597,6 @@ u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 	case USB_ID(0x16d0, 0x0733): /* Furutech ADL Stratos */
 	case USB_ID(0x16d0, 0x09db): /* NuPrime Audio DAC-9 */
 	case USB_ID(0x1db5, 0x0003): /* Bryston BDA3 */
-	case USB_ID(0x22d9, 0x0426): /* OPPO HA-2 */
 	case USB_ID(0x22e1, 0xca01): /* HDTA Serenade DSD */
 	case USB_ID(0x249c, 0x9326): /* M2Tech Young MkIII */
 	case USB_ID(0x2616, 0x0106): /* PS Audio NuWave DAC */
@@ -1657,8 +1653,10 @@ u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 	switch (USB_ID_VENDOR(chip->usb_id)) {
 	case 0x152a:  /* Thesycon devices */
 	case 0x20b1:  /* XMOS based devices */
+	case 0x22d9:  /* Oppo */
 	case 0x23ba:  /* Playback Designs */
 	case 0x25ce:  /* Mytek devices */
+	case 0x278b:  /* Rotel? */
 	case 0x2ab6:  /* T+A devices */
 		if (fp->dsd_raw)
 			return SNDRV_PCM_FMTBIT_DSD_U32_BE;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
