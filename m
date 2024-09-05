Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E35496D9D2
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 15:07:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7066DEC;
	Thu,  5 Sep 2024 15:07:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7066DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725541638;
	bh=rc/HVvEbapK46GUWxR685sZ+MexkLi6IFlE05jCx0Oc=;
	h=Subject:To:Cc:From:Date:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uqnhn07HYA8bWuMToqn2hC9f4kFSUtNbXZTnWbcA+YkOhqAxXFpi1CeF9QyRe/p+8
	 8FcqNiO88mTsroQFfJGcR89BEXk05PwVGoBNxQv4Bb9qa8qAcNaS6wpVfA7TM4gleF
	 X0oeJlhmwdFZFxtbQUs1m2F0bn4BlCwbfJvlaHh8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2BF3F805D6; Thu,  5 Sep 2024 15:06:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CAC1F805CA;
	Thu,  5 Sep 2024 15:06:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08A96F805C0; Thu,  5 Sep 2024 15:06:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AE1BF805BA
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 15:06:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AE1BF805BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=kYdlD6Ji
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 149CDA442AE;
	Thu,  5 Sep 2024 13:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E3EC4CEC3;
	Thu,  5 Sep 2024 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725541583;
	bh=bFkZuuFngjINkjf1ZFRFBA50DaPa1qKgLoxcOb5s7Q8=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=kYdlD6Ji9Afv/+F6fsKh4ThLjsoWm+Rz2X9/qrC29/LOAiHC41Me0RQrZWbX113pm
	 u47GiTxfcpp9hEUUV+ASoGfT+IsvVvEFNMbSyBI8C+/oF7Zq3hzXYrDHywrnEuEM/Z
	 qmPPv3ZROOkXzWMXrwmgT+GPVzU+qOnQ0RI5fQOw=
Subject: Patch "ALSA: usb-audio: Sanity checks for each pipe and EP types" has
 been added to the 4.19-stable tree
To: 
 alsa-devel@alsa-project.org,dan.carpenter@linaro.org,gregkh@linuxfoundation.org,hdanton@sina.com,perex@perex.cz,syzbot+d952e5e28f5fb7718d23@syzkaller.appspotmail.com,tiwai@suse.com,tiwai@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 05 Sep 2024 15:06:19 +0200
In-Reply-To: <599b79d0-0c0f-425e-b2a2-1af9f81539b8@stanley.mountain>
Message-ID: <2024090516-opulently-handcraft-1731@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
Message-ID-Hash: DVU3MPGVFBLQOMKBIIQD2ZJVF7UZBSK6
X-Message-ID-Hash: DVU3MPGVFBLQOMKBIIQD2ZJVF7UZBSK6
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DVU3MPGVFBLQOMKBIIQD2ZJVF7UZBSK6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


This is a note to let you know that I've just added the patch titled

    ALSA: usb-audio: Sanity checks for each pipe and EP types

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     alsa-usb-audio-sanity-checks-for-each-pipe-and-ep-types.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


>From stable+bounces-73596-greg=kroah.com@vger.kernel.org Thu Sep  5 14:38:22 2024
From: Takashi Iwai <dan.carpenter@linaro.org>
Date: Thu, 5 Sep 2024 15:38:07 +0300
Subject: ALSA: usb-audio: Sanity checks for each pipe and EP types
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>, Hillf Danton <hdanton@sina.com>, alsa-devel@alsa-project.org, stable@vger.kernel.org
Message-ID: <599b79d0-0c0f-425e-b2a2-1af9f81539b8@stanley.mountain>
Content-Disposition: inline

From: Takashi Iwai <dan.carpenter@linaro.org>

[ Upstream commit 801ebf1043ae7b182588554cc9b9ad3c14bc2ab5 ]

The recent USB core code performs sanity checks for the given pipe and
EP types, and it can be hit by manipulated USB descriptors by syzbot.
For making syzbot happier, this patch introduces a local helper for a
sanity check in the driver side and calls it at each place before the
message handling, so that we can avoid the WARNING splats.

Reported-by: syzbot+d952e5e28f5fb7718d23@syzkaller.appspotmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/usb/helper.c |   17 +++++++++++++++++
 sound/usb/helper.h |    1 +
 sound/usb/quirks.c |   14 +++++++++++---
 3 files changed, 29 insertions(+), 3 deletions(-)

--- a/sound/usb/helper.c
+++ b/sound/usb/helper.c
@@ -76,6 +76,20 @@ void *snd_usb_find_csint_desc(void *buff
 	return NULL;
 }
 
+/* check the validity of pipe and EP types */
+int snd_usb_pipe_sanity_check(struct usb_device *dev, unsigned int pipe)
+{
+	static const int pipetypes[4] = {
+		PIPE_CONTROL, PIPE_ISOCHRONOUS, PIPE_BULK, PIPE_INTERRUPT
+	};
+	struct usb_host_endpoint *ep;
+
+	ep = usb_pipe_endpoint(dev, pipe);
+	if (usb_pipetype(pipe) != pipetypes[usb_endpoint_type(&ep->desc)])
+		return -EINVAL;
+	return 0;
+}
+
 /*
  * Wrapper for usb_control_msg().
  * Allocates a temp buffer to prevent dmaing from/to the stack.
@@ -88,6 +102,9 @@ int snd_usb_ctl_msg(struct usb_device *d
 	void *buf = NULL;
 	int timeout;
 
+	if (snd_usb_pipe_sanity_check(dev, pipe))
+		return -EINVAL;
+
 	if (size > 0) {
 		buf = kmemdup(data, size, GFP_KERNEL);
 		if (!buf)
--- a/sound/usb/helper.h
+++ b/sound/usb/helper.h
@@ -7,6 +7,7 @@ unsigned int snd_usb_combine_bytes(unsig
 void *snd_usb_find_desc(void *descstart, int desclen, void *after, u8 dtype);
 void *snd_usb_find_csint_desc(void *descstart, int desclen, void *after, u8 dsubtype);
 
+int snd_usb_pipe_sanity_check(struct usb_device *dev, unsigned int pipe);
 int snd_usb_ctl_msg(struct usb_device *dev, unsigned int pipe,
 		    __u8 request, __u8 requesttype, __u16 value, __u16 index,
 		    void *data, __u16 size);
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -743,11 +743,13 @@ static int snd_usb_novation_boot_quirk(s
 static int snd_usb_accessmusic_boot_quirk(struct usb_device *dev)
 {
 	int err, actual_length;
-
 	/* "midi send" enable */
 	static const u8 seq[] = { 0x4e, 0x73, 0x52, 0x01 };
+	void *buf;
 
-	void *buf = kmemdup(seq, ARRAY_SIZE(seq), GFP_KERNEL);
+	if (snd_usb_pipe_sanity_check(dev, usb_sndintpipe(dev, 0x05)))
+		return -EINVAL;
+	buf = kmemdup(seq, ARRAY_SIZE(seq), GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 	err = usb_interrupt_msg(dev, usb_sndintpipe(dev, 0x05), buf,
@@ -772,7 +774,11 @@ static int snd_usb_accessmusic_boot_quir
 
 static int snd_usb_nativeinstruments_boot_quirk(struct usb_device *dev)
 {
-	int ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
+	int ret;
+
+	if (snd_usb_pipe_sanity_check(dev, usb_sndctrlpipe(dev, 0)))
+		return -EINVAL;
+	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
 				  0xaf, USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 				  1, 0, NULL, 0, 1000);
 
@@ -879,6 +885,8 @@ static int snd_usb_axefx3_boot_quirk(str
 
 	dev_dbg(&dev->dev, "Waiting for Axe-Fx III to boot up...\n");
 
+	if (snd_usb_pipe_sanity_check(dev, usb_sndctrlpipe(dev, 0)))
+		return -EINVAL;
 	/* If the Axe-Fx III has not fully booted, it will timeout when trying
 	 * to enable the audio streaming interface. A more generous timeout is
 	 * used here to detect when the Axe-Fx III has finished booting as the


Patches currently in stable-queue which might be from dan.carpenter@linaro.org are

queue-4.19/alsa-usb-audio-sanity-checks-for-each-pipe-and-ep-types.patch
queue-4.19/alsa-usb-audio-fix-gpf-in-snd_usb_pipe_sanity_check.patch
