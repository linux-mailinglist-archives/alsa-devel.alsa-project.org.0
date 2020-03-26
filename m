Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4291D194D52
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 00:33:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE96A886;
	Fri, 27 Mar 2020 00:33:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE96A886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585265637;
	bh=tzwsrdvVyAJdGHaVeJ3Phb6uQrzA0a9TgoPhr6ftxq4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rkUBcIxlqd+3Ne1zAaQJc6vqchTGXUX1i3MhQz+AT66FZQjQdXnR1H95kOXfXTLQ3
	 WQhnbx3AXUGol14HChVLTZe7kpAl9QONmKlo+VzdUE9f6zkq1jZtS997HVromEpO7p
	 bprazaY8rjirWUA/UoJ/mnDDv4u+nrl55yOLCr2o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A41CF80322;
	Fri, 27 Mar 2020 00:25:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 465C8F80321; Fri, 27 Mar 2020 00:25:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77949F80317
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 00:25:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77949F80317
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ufmlXkXC"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 77A4420774;
 Thu, 26 Mar 2020 23:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585265124;
 bh=tzwsrdvVyAJdGHaVeJ3Phb6uQrzA0a9TgoPhr6ftxq4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ufmlXkXCGnXicHRqsFsn5EqCIg9L0E8vWaUVqIBK7R0LmfbHNmd50s6ARxNzqRgk5
 R2+vV9a7qTw5DewkKVYlB19WSusx6vyCSSrkD6RmUl7Yd0y26czaHosqYS9myfVOZg
 tLzDnKGA+OwP80LmCr6eNVQ7qpAYAqKZsv/nl+A0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 09/10] ALSA: line6: Fix endless MIDI read loop
Date: Thu, 26 Mar 2020 19:25:12 -0400
Message-Id: <20200326232513.8212-9-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326232513.8212-1-sashal@kernel.org>
References: <20200326232513.8212-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org,
 syzbot+cce32521ee0a824c21f7@syzkaller.appspotmail.com
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

[ Upstream commit d683469b3c93d7e2afd39e6e1970f24700eb7a68 ]

The MIDI input event parser of the LINE6 driver may enter into an
endless loop when the unexpected data sequence is given, as it tries
to continue the secondary bytes without termination.  Also, when the
input data is too short, the parser returns a negative error, while
the caller doesn't handle it properly.  This would lead to the
unexpected behavior as well.

This patch addresses those issues by checking the return value
correctly and handling the one-byte event in the parser properly.

The bug was reported by syzkaller.

Reported-by: syzbot+cce32521ee0a824c21f7@syzkaller.appspotmail.com
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/000000000000033087059f8f8fa3@google.com
Link: https://lore.kernel.org/r/20200309095922.30269-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/line6/driver.c  | 2 +-
 sound/usb/line6/midibuf.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index b223de3defc4f..bf4eacc53a7d2 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -313,7 +313,7 @@ static void line6_data_received(struct urb *urb)
 				line6_midibuf_read(mb, line6->buffer_message,
 						LINE6_MIDI_MESSAGE_MAXLEN);
 
-			if (done == 0)
+			if (done <= 0)
 				break;
 
 			line6->message_length = done;
diff --git a/sound/usb/line6/midibuf.c b/sound/usb/line6/midibuf.c
index 36a610ba342ec..c931d48801ebe 100644
--- a/sound/usb/line6/midibuf.c
+++ b/sound/usb/line6/midibuf.c
@@ -163,7 +163,7 @@ int line6_midibuf_read(struct midi_buffer *this, unsigned char *data,
 			int midi_length_prev =
 			    midibuf_message_length(this->command_prev);
 
-			if (midi_length_prev > 0) {
+			if (midi_length_prev > 1) {
 				midi_length = midi_length_prev - 1;
 				repeat = 1;
 			} else
-- 
2.20.1

