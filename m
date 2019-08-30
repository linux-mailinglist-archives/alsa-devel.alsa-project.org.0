Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8F4A3FF4
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 23:49:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B56C1664;
	Fri, 30 Aug 2019 23:49:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B56C1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567201796;
	bh=4P/UGfqzqDQd9DsXxP91u36VIvUucXtKLYkGp2MBJEM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gOPxqINzaX3sXJ7RU3pVQ7btq+GQ5KuUdYEnWB8aHhMbfr33JcLdhGSUP7l1Lp0K5
	 7borBYn1zeyBJcXosPFmIb/gScvTGEPSvLGL5XRNjGr3lQFQxOwfiBfPjp5NUrzXVo
	 Bl7i88WHo5WfrjsauoxczVQvm95/i9Np2mA53EHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F54BF805F7;
	Fri, 30 Aug 2019 23:47:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFE7FF805F5; Fri, 30 Aug 2019 23:47:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18F5AF805A0
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 23:47:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18F5AF805A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gd9mO68e"
Received: by mail-io1-xd44.google.com with SMTP id p12so17077142iog.5
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 14:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ktj9ijOXrDlsClzwNjZ3ksaxYmWqZ56FuwuOhvsPKKo=;
 b=gd9mO68eLPusJAzfzxl4zLc8gKbKmfkQ7af1kIyZebpDXbHObeZ0TtAcr7+/gXb065
 wz6v1UFCUc+PlNoolMSw/7RKrxDAQ0CBN8TbBN/dGfbJf/diJxWpIRaeUTj+DMxdb5Hp
 rnU7Hmv6RUAKnVozjfs2IaL0UJBIGb0RwXDeUU9klT4aJGkO1HIqrN8leDReJ2jOh2sO
 ePCIl6WCFnhVoL6ytAH46sZmFC/mZJLldqLzVDUvoOBTezvVcuXF0C9Nu5dyPG6L5Z85
 I7xgtw2L0KUEGgpRb2nn566RDyB+6ExIzCEIMdbrLeE+ex9oLl0Ul2i4bLr5Pt9+Pzo3
 Jy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ktj9ijOXrDlsClzwNjZ3ksaxYmWqZ56FuwuOhvsPKKo=;
 b=W+z46BEAl6cJ5DNz/JuyqQTnwKAtO8eayL/PzQJ/yprwRh+2ZE3UoJl2MTl2mm836B
 Lkc3wZQu9c0mexmxIP/Yoq/xTxERYsbyFy5FVWX+GlkMpBuTIud1bIGAptrFZZ5IS8b9
 aKJGtWOKFCrPiXuuiKSf816n2HkEcRLp5nLlFkwuV0hsUmi6vb+6eLOuBeh0JWi6AGX/
 ey0ri6eb35btGBvgrsUH9F+aT37ZSn5dHpkcE7C55NPz0DYhLfia2jxci32mvYL+oFnA
 Pw9e+LtUWu0+fBrO95bUpwAeh6cfW5BtMXTJ/7kfX2ziNdIYF8aDHycmEAdf72SPIRt7
 87SA==
X-Gm-Message-State: APjAAAUq2PRMoWpmdbKR1P5ogqR/tqftFbboC5URED1vsXU/JbMfPULK
 vd2W3gbCIP+bSmmSXvT9BDc=
X-Google-Smtp-Source: APXvYqyeFTplYCjFE+3c/w8BqfcYCdDNh+VGXtKXRugkIy1aYSS1whlWxjgPreD2EGxux4fx2zZztg==
X-Received: by 2002:a5d:974d:: with SMTP id c13mr2090159ioo.87.1567201654419; 
 Fri, 30 Aug 2019 14:47:34 -0700 (PDT)
Received: from peng.science.purdue.edu (cos-128-210-107-27.science.purdue.edu.
 [128.210.107.27])
 by smtp.googlemail.com with ESMTPSA id i14sm328004ioi.47.2019.08.30.14.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2019 14:47:34 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: stable@vger.kernel.org
Date: Fri, 30 Aug 2019 17:47:29 -0400
Message-Id: <20190830214730.27842-1-benquike@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Mathias Payer <mathias.payer@nebelwelt.net>, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wenwen Wang <wang6495@umn.edu>, Takashi Iwai <tiwai@suse.com>,
 Hui Peng <benquike@gmail.com>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 2/2] Fix a stack buffer overflow bug in
	check_input_term
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

`check_input_term` recursively calls itself with input from
device side (e.g., uac_input_terminal_descriptor.bCSourceID)
as argument (id). In `check_input_term`, if `check_input_term`
is called with the same `id` argument as the caller, it triggers
endless recursive call, resulting kernel space stack overflow.

This patch fixes the bug by adding a bitmap to `struct mixer_build`
to keep track of the checked ids and stop the execution if some id
has been checked (similar to how parse_audio_unit handles unitid
argument).

CVE: CVE-2018-15118

Reported-by: Hui Peng <benquike@gmail.com>
Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
Signed-off-by: Hui Peng <benquike@gmail.com>
---
 sound/usb/mixer.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 10ddec76f906..e24572fd6e30 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -81,6 +81,7 @@ struct mixer_build {
 	unsigned char *buffer;
 	unsigned int buflen;
 	DECLARE_BITMAP(unitbitmap, MAX_ID_ELEMS);
+	DECLARE_BITMAP(termbitmap, MAX_ID_ELEMS);
 	struct usb_audio_term oterm;
 	const struct usbmix_name_map *map;
 	const struct usbmix_selector_map *selector_map;
@@ -709,15 +710,24 @@ static int get_term_name(struct mixer_build *state, struct usb_audio_term *iterm
  * parse the source unit recursively until it reaches to a terminal
  * or a branched unit.
  */
-static int check_input_term(struct mixer_build *state, int id,
+static int __check_input_term(struct mixer_build *state, int id,
 			    struct usb_audio_term *term)
 {
 	int err;
 	void *p1;
+	unsigned char *hdr;
 
 	memset(term, 0, sizeof(*term));
-	while ((p1 = find_audio_control_unit(state, id)) != NULL) {
-		unsigned char *hdr = p1;
+	for (;;) {
+		/* a loop in the terminal chain? */
+		if (test_and_set_bit(id, state->termbitmap))
+			return -EINVAL;
+
+		p1 = find_audio_control_unit(state, id);
+		if (!p1)
+			break;
+
+		hdr = p1;
 		term->id = id;
 		switch (hdr[2]) {
 		case UAC_INPUT_TERMINAL:
@@ -732,7 +742,7 @@ static int check_input_term(struct mixer_build *state, int id,
 
 				/* call recursively to verify that the
 				 * referenced clock entity is valid */
-				err = check_input_term(state, d->bCSourceID, term);
+				err = __check_input_term(state, d->bCSourceID, term);
 				if (err < 0)
 					return err;
 
@@ -764,7 +774,7 @@ static int check_input_term(struct mixer_build *state, int id,
 		case UAC2_CLOCK_SELECTOR: {
 			struct uac_selector_unit_descriptor *d = p1;
 			/* call recursively to retrieve the channel info */
-			err = check_input_term(state, d->baSourceID[0], term);
+			err = __check_input_term(state, d->baSourceID[0], term);
 			if (err < 0)
 				return err;
 			term->type = d->bDescriptorSubtype << 16; /* virtual type */
@@ -811,6 +821,15 @@ static int check_input_term(struct mixer_build *state, int id,
 	return -ENODEV;
 }
 
+
+static int check_input_term(struct mixer_build *state, int id,
+			    struct usb_audio_term *term)
+{
+	memset(term, 0, sizeof(*term));
+	memset(state->termbitmap, 0, sizeof(state->termbitmap));
+	return __check_input_term(state, id, term);
+}
+
 /*
  * Feature Unit
  */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
