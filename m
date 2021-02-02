Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1E630C00A
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 14:50:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E951D1753;
	Tue,  2 Feb 2021 14:49:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E951D1753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612273833;
	bh=ON8khd81JOtlBei0tp8Cn0Fki/+auzA1xTr1wHjbohM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ijgsBwswEllbXF/4hak5hIUZ8m8d3wJOcQ+0dUZ2WfE7vNzdCqraso7MBlqJ/GYVB
	 TOgAb/xnkIfN7Qf0fz2YNr8D4QV1qF+zIpiDVMxZtpiD3fo6eJr0oBaACS20P+RLtE
	 nOMIeBYpkesbpgd87gZ/yiOZ8Mnv84Ik+Z7pUQP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DEFCF800E1;
	Tue,  2 Feb 2021 14:49:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1FF5F80171; Tue,  2 Feb 2021 14:48:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C000F800E1
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 14:48:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C000F800E1
Received: from baphomet.hell (<unknown> [192.168.179.1])
 by hellmouth.base.nu (OpenSMTPD) with ESMTP id 34c9710d;
 Tue, 2 Feb 2021 13:48:45 +0000 (UTC)
Received: from baphomet.hell (localhost [127.0.0.1])
 by baphomet.hell (OpenSMTPD) with ESMTP id 63be26d0;
 Tue, 2 Feb 2021 13:47:04 +0000 (GMT)
Received: from localhost.localdomain ([192.168.178.2])
 by baphomet.hell with ESMTPSA id EDZxDFNXGWC6IgAAnQSWfg
 (envelope-from <livvy@base.nu>); Tue, 02 Feb 2021 13:44:37 +0000
From: Olivia Mackintosh <livvy@base.nu>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] ALSA: usb-audio: Add DJM450 to Pioneer format quirk
Date: Tue,  2 Feb 2021 13:42:26 +0000
Message-Id: <20210202134225.3217-2-livvy@base.nu>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210202134225.3217-1-livvy@base.nu>
References: <20210202134225.3217-1-livvy@base.nu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Olivia Mackintosh <livvy@base.nu>
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

Like the DJM-750, ensure that the format control message is passed to
the device when opening a stream. It seems as though fmt->sync_ep is not
always set when this function is called hence the passing of the value
at the call site. If this can be fixed, fmt->sync_up should be used as
the wvalue.

There doesn't seem to be a "cpu_to_le24" type function defined hence for
the open code but I did see a similar thing done in Bluez lib. Perhaps
we can get these definitions defined in byteorder.h. See hci_cpu_to_le24
in include/net/bluetooth/hci.h:2543 for similar usage.

Signed-off-by: Olivia Mackintosh <livvy@base.nu>
---
 sound/usb/quirks.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index e196e364cef1..9ba4682ebc48 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1470,6 +1470,23 @@ static void set_format_emu_quirk(struct snd_usb_substream *subs,
 	subs->pkt_offset_adj = (emu_samplerate_id >= EMU_QUIRK_SR_176400HZ) ? 4 : 0;
 }
 
+static int pioneer_djm_set_format_quirk(struct snd_usb_substream *subs,
+					u16 windex)
+{
+	unsigned int cur_rate = subs->data_endpoint->cur_rate;
+	u8 sr[3];
+	// Convert to little endian
+	sr[0] = cur_rate & 0xff;
+	sr[1] = (cur_rate >> 8) & 0xff;
+	sr[2] = (cur_rate >> 16) & 0xff;
+	usb_set_interface(subs->dev, 0, 1);
+	// we should derive windex from fmt-sync_ep but it's not set
+	snd_usb_ctl_msg(subs->stream->chip->dev,
+		usb_rcvctrlpipe(subs->stream->chip->dev, 0),
+		0x01, 0x22, 0x0100, windex, &sr, 0x0003);
+	return 0;
+}
+
 void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 			      const struct audioformat *fmt)
 {
@@ -1483,6 +1500,9 @@ void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 	case USB_ID(0x534d, 0x2109): /* MacroSilicon MS2109 */
 		subs->stream_offset_adj = 2;
 		break;
+	case USB_ID(0x2b73, 0x0013): /* Pioneer DJM-450 */
+		pioneer_djm_set_format_quirk(subs, 0x0082);
+		break;
 	}
 }
 
-- 
2.30.0

