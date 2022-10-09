Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FD85F9433
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 01:53:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E0D616D0;
	Mon, 10 Oct 2022 01:52:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E0D616D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665359625;
	bh=IUpuJLyLUQd1BoDEG1IqdNAmx4Mwk+yPRjQw2dQF9bI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nbAZza54je4cg7ThnQaDOOQs8nZdNYZ9RPm3IC8mJWMMwsl22D1xl+kX6PEjYrdan
	 CVRrtjxLzt7ft9pQo73lXepWyHrcJN8Phxn6JkjaOjkhJsexwS4fKEIol/7dPHJ5u1
	 p5p+WL02/ddgEyI1duqt5OBeaVH8RqjVGok7XcTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC20EF800EC;
	Mon, 10 Oct 2022 01:52:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 534E9F80517; Mon, 10 Oct 2022 01:52:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4191DF800EC
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 01:52:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4191DF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P7FBaD4q"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D208260D3D;
 Sun,  9 Oct 2022 23:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74396C433C1;
 Sun,  9 Oct 2022 23:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359561;
 bh=IUpuJLyLUQd1BoDEG1IqdNAmx4Mwk+yPRjQw2dQF9bI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P7FBaD4qsy1uvZ2KlyK4q6lfMKoZqXc1YpCNhaMHV/kDkYiCnalrhEYZQ0tPXLu8+
 WjZja5Kgbr0X28EuK3cKFc1ZFPdOugfSH0nactmwuDwOpzdhvuQW7J75YFYYUk6VG4
 11g60VqvpDwb4JX4L7pBChj3NqxRHuQhgfkjF+g3/RQtzvugeDlyH+j/66w76H1FZs
 KIsmK5YiKF6UJ4MQ8aVr/8fyE1PPdnevkorQW79Sk9SdSg8s3Kbf+trKCnkba2h9pe
 SLAL21g96ec65aMneiFbQMq0uRHZMARiJAg/KQW4d9K3pbE5OnvNajigNieR3nUudM
 rE3nu1bcKXmwg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 07/36] ALSA: usb-audio: Add quirk to enable Avid
 Mbox 3 support
Date: Sun,  9 Oct 2022 19:51:53 -0400
Message-Id: <20221009235222.1230786-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009235222.1230786-1-sashal@kernel.org>
References: <20221009235222.1230786-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 john-linux@pelago.org.uk, Conner Knox <connerknoxpublic@gmail.com>,
 Takashi Iwai <tiwai@suse.de>, gregkh@linuxfoundation.org,
 brendan@grieve.com.au, sdoregor@sdore.me, cyrozap@gmail.com, tiwai@suse.com,
 willovertonuk@gmail.com, alexander@tsoy.me, hahnjo@hahnjo.de, giun7a@gmail.com
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

From: Conner Knox <connerknoxpublic@gmail.com>

[ Upstream commit b01104fc62b6194c852124f6c6df1c0a5c031fc1 ]

Add support for Avid Mbox3 USB audio interface at 48kHz

Signed-off-by: Conner Knox <connerknoxpublic@gmail.com>
Link: https://lore.kernel.org/r/20220818201433.16360-1-mbarriolinares@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/quirks-table.h |  76 ++++++++++
 sound/usb/quirks.c       | 302 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 378 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index f93201a830b5..06dfdd45cff8 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2985,6 +2985,82 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+/* DIGIDESIGN MBOX 3 */
+{
+	USB_DEVICE(0x0dba, 0x5000),
+	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.vendor_name = "Digidesign",
+		.product_name = "Mbox 3",
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_COMPOSITE,
+		.data = (const struct snd_usb_audio_quirk[]) {
+			{
+				.ifnum = 0,
+				.type = QUIRK_IGNORE_INTERFACE
+			},
+			{
+				.ifnum = 1,
+				.type = QUIRK_IGNORE_INTERFACE
+			},
+			{
+				.ifnum = 2,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 4,
+					.iface = 2,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.attributes = 0x00,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						USB_ENDPOINT_SYNC_ASYNC,
+					.rates = SNDRV_PCM_RATE_48000,
+					.rate_min = 48000,
+					.rate_max = 48000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) {
+						48000
+					}
+				}
+			},
+			{
+				.ifnum = 3,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 4,
+					.iface = 3,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x81,
+					.attributes = 0x00,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						USB_ENDPOINT_SYNC_ASYNC,
+					.maxpacksize = 0x009c,
+					.rates = SNDRV_PCM_RATE_48000,
+					.rate_min = 48000,
+					.rate_max = 48000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) {
+						48000
+					}
+				}
+			},
+			{
+				.ifnum = 4,
+				.type = QUIRK_MIDI_FIXED_ENDPOINT,
+				.data = &(const struct snd_usb_midi_endpoint_info) {
+					.out_cables = 0x0001,
+					.in_cables  = 0x0001
+				}
+			},
+			{
+				.ifnum = -1
+			}
+		}
+	}
+},
 {
 	/* Tascam US122 MKII - playback-only support */
 	USB_DEVICE_VENDOR_SPEC(0x0644, 0x8021),
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 5b4d8f5eade2..194c75c45628 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1020,6 +1020,304 @@ static int snd_usb_axefx3_boot_quirk(struct usb_device *dev)
 	return 0;
 }
 
+static void mbox3_setup_48_24_magic(struct usb_device *dev)
+{
+	/* The Mbox 3 is "little endian" */
+	/* max volume is: 0x0000. */
+	/* min volume is: 0x0080 (shown in little endian form) */
+
+
+	/* Load 48000Hz rate into buffer */
+	u8 com_buff[4] = {0x80, 0xbb, 0x00, 0x00};
+
+	/* Set 48000Hz sample rate */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			0x01, 0x21, 0x0100, 0x0001, &com_buff, 4);  //Is this really needed?
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			0x01, 0x21, 0x0100, 0x8101, &com_buff, 4);
+
+	/* Deactivate Tuner */
+	/* on  = 0x01*/
+	/* off = 0x00*/
+	com_buff[0] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+		0x01, 0x21, 0x0003, 0x2001, &com_buff, 1);
+
+	/* Set clock source to Internal (as opposed to S/PDIF) */
+	com_buff[0] = 0x01;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0100, 0x8001, &com_buff, 1);
+
+	/* Mute the hardware loopbacks to start the device in a known state. */
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x80;
+	/* Analogue input 1 left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0110, 0x4001, &com_buff, 2);
+	/* Analogue input 1 right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0111, 0x4001, &com_buff, 2);
+	/* Analogue input 2 left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0114, 0x4001, &com_buff, 2);
+	/* Analogue input 2 right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0115, 0x4001, &com_buff, 2);
+	/* Analogue input 3 left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0118, 0x4001, &com_buff, 2);
+	/* Analogue input 3 right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0119, 0x4001, &com_buff, 2);
+	/* Analogue input 4 left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x011c, 0x4001, &com_buff, 2);
+	/* Analogue input 4 right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x011d, 0x4001, &com_buff, 2);
+
+	/* Set software sends to output */
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x00;
+	/* Analogue software return 1 left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0100, 0x4001, &com_buff, 2);
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x80;
+	/* Analogue software return 1 right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0101, 0x4001, &com_buff, 2);
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x80;
+	/* Analogue software return 2 left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0104, 0x4001, &com_buff, 2);
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x00;
+	/* Analogue software return 2 right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0105, 0x4001, &com_buff, 2);
+
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x80;
+	/* Analogue software return 3 left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0108, 0x4001, &com_buff, 2);
+	/* Analogue software return 3 right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0109, 0x4001, &com_buff, 2);
+	/* Analogue software return 4 left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x010c, 0x4001, &com_buff, 2);
+	/* Analogue software return 4 right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x010d, 0x4001, &com_buff, 2);
+
+	/* Return to muting sends */
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x80;
+	/* Analogue fx return left channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0120, 0x4001, &com_buff, 2);
+	/* Analogue fx return right channel: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0121, 0x4001, &com_buff, 2);
+
+	/* Analogue software input 1 fx send: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0100, 0x4201, &com_buff, 2);
+	/* Analogue software input 2 fx send: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0101, 0x4201, &com_buff, 2);
+	/* Analogue software input 3 fx send: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0102, 0x4201, &com_buff, 2);
+	/* Analogue software input 4 fx send: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0103, 0x4201, &com_buff, 2);
+	/* Analogue input 1 fx send: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0104, 0x4201, &com_buff, 2);
+	/* Analogue input 2 fx send: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0105, 0x4201, &com_buff, 2);
+	/* Analogue input 3 fx send: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0106, 0x4201, &com_buff, 2);
+	/* Analogue input 4 fx send: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0107, 0x4201, &com_buff, 2);
+
+	/* Toggle allowing host control */
+	com_buff[0] = 0x02;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			3, 0x21, 0x0000, 0x2001, &com_buff, 1);
+
+	/* Do not dim fx returns */
+	com_buff[0] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			3, 0x21, 0x0002, 0x2001, &com_buff, 1);
+
+	/* Do not set fx returns to mono */
+	com_buff[0] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			3, 0x21, 0x0001, 0x2001, &com_buff, 1);
+
+	/* Mute the S/PDIF hardware loopback
+	 * same odd volume logic here as above
+	 */
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x80;
+	/* S/PDIF hardware input 1 left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0112, 0x4001, &com_buff, 2);
+	/* S/PDIF hardware input 1 right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0113, 0x4001, &com_buff, 2);
+	/* S/PDIF hardware input 2 left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0116, 0x4001, &com_buff, 2);
+	/* S/PDIF hardware input 2 right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0117, 0x4001, &com_buff, 2);
+	/* S/PDIF hardware input 3 left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x011a, 0x4001, &com_buff, 2);
+	/* S/PDIF hardware input 3 right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x011b, 0x4001, &com_buff, 2);
+	/* S/PDIF hardware input 4 left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x011e, 0x4001, &com_buff, 2);
+	/* S/PDIF hardware input 4 right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x011f, 0x4001, &com_buff, 2);
+	/* S/PDIF software return 1 left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0102, 0x4001, &com_buff, 2);
+	/* S/PDIF software return 1 right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0103, 0x4001, &com_buff, 2);
+	/* S/PDIF software return 2 left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0106, 0x4001, &com_buff, 2);
+	/* S/PDIF software return 2 right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0107, 0x4001, &com_buff, 2);
+
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x00;
+	/* S/PDIF software return 3 left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x010a, 0x4001, &com_buff, 2);
+
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x80;
+	/* S/PDIF software return 3 right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x010b, 0x4001, &com_buff, 2);
+	/* S/PDIF software return 4 left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x010e, 0x4001, &com_buff, 2);
+
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x00;
+	/* S/PDIF software return 4 right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x010f, 0x4001, &com_buff, 2);
+
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x80;
+	/* S/PDIF fx returns left channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0122, 0x4001, &com_buff, 2);
+	/* S/PDIF fx returns right channel */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0123, 0x4001, &com_buff, 2);
+
+	/* Set the dropdown "Effect" to the first option */
+	/* Room1  = 0x00 */
+	/* Room2  = 0x01 */
+	/* Room3  = 0x02 */
+	/* Hall 1 = 0x03 */
+	/* Hall 2 = 0x04 */
+	/* Plate  = 0x05 */
+	/* Delay  = 0x06 */
+	/* Echo   = 0x07 */
+	com_buff[0] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0200, 0x4301, &com_buff, 1);	/* max is 0xff */
+	/* min is 0x00 */
+
+
+	/* Set the effect duration to 0 */
+	/* max is 0xffff */
+	/* min is 0x0000 */
+	com_buff[0] = 0x00;
+	com_buff[1] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0400, 0x4301, &com_buff, 2);
+
+	/* Set the effect volume and feedback to 0 */
+	/* max is 0xff */
+	/* min is 0x00 */
+	com_buff[0] = 0x00;
+	/* feedback: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0500, 0x4301, &com_buff, 1);
+	/* volume: */
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			1, 0x21, 0x0300, 0x4301, &com_buff, 1);
+
+	/* Set soft button hold duration */
+	/* 0x03 = 250ms */
+	/* 0x05 = 500ms DEFAULT */
+	/* 0x08 = 750ms */
+	/* 0x0a = 1sec */
+	com_buff[0] = 0x05;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			3, 0x21, 0x0005, 0x2001, &com_buff, 1);
+
+	/* Use dim LEDs for button of state */
+	com_buff[0] = 0x00;
+	snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			3, 0x21, 0x0004, 0x2001, &com_buff, 1);
+}
+
+#define MBOX3_DESCRIPTOR_SIZE	464
+
+static int snd_usb_mbox3_boot_quirk(struct usb_device *dev)
+{
+	struct usb_host_config *config = dev->actconfig;
+	int err;
+	int descriptor_size;
+
+	descriptor_size = le16_to_cpu(get_cfg_desc(config)->wTotalLength);
+
+	if (descriptor_size != MBOX3_DESCRIPTOR_SIZE) {
+		dev_err(&dev->dev, "Invalid descriptor size=%d.\n", descriptor_size);
+		return -ENODEV;
+	}
+
+	dev_dbg(&dev->dev, "device initialised!\n");
+
+	err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
+		&dev->descriptor, sizeof(dev->descriptor));
+	config = dev->actconfig;
+	if (err < 0)
+		dev_dbg(&dev->dev, "error usb_get_descriptor: %d\n", err);
+
+	err = usb_reset_configuration(dev);
+	if (err < 0)
+		dev_dbg(&dev->dev, "error usb_reset_configuration: %d\n", err);
+	dev_dbg(&dev->dev, "mbox3_boot: new boot length = %d\n",
+		le16_to_cpu(get_cfg_desc(config)->wTotalLength));
+
+	mbox3_setup_48_24_magic(dev);
+	dev_info(&dev->dev, "Digidesign Mbox 3: 24bit 48kHz");
+
+	return 0; /* Successful boot */
+}
 
 #define MICROBOOK_BUF_SIZE 128
 
@@ -1324,6 +1622,10 @@ int snd_usb_apply_boot_quirk(struct usb_device *dev,
 	case USB_ID(0x0dba, 0x3000):
 		/* Digidesign Mbox 2 */
 		return snd_usb_mbox2_boot_quirk(dev);
+	case USB_ID(0x0dba, 0x5000):
+		/* Digidesign Mbox 3 */
+		return snd_usb_mbox3_boot_quirk(dev);
+
 
 	case USB_ID(0x1235, 0x0010): /* Focusrite Novation Saffire 6 USB */
 	case USB_ID(0x1235, 0x0018): /* Focusrite Novation Twitch */
-- 
2.35.1

