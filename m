Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB87046B2EE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 07:31:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 469C62215;
	Tue,  7 Dec 2021 07:30:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 469C62215
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638858674;
	bh=Bxtg+Md4Tx2O3zfguW43xRX6QWLK3nr94r5jvTZ6XgY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a3vqCy9sHVMeJfmak+SBbbkKQW5N0Qm+97hnFgAZmhKQx/KcmRG+AiXXzEOnpgDR/
	 fXBKmwtH89Ly2RoQfqmx3PS5/QywFu7YeGzJRB0K7hOb2bANCiroE4H7X55poXatf/
	 WBDBFm1BUYSGWN4Z1OeixMx9cpC8+lpZcOKfjbE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBF44F80217;
	Tue,  7 Dec 2021 07:29:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D210FF8028D; Tue,  7 Dec 2021 07:29:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5AD0F80217
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 07:29:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5AD0F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="J/GkOY2J"
Received: by mail-pg1-x52a.google.com with SMTP id f125so12922505pgc.0
 for <alsa-devel@alsa-project.org>; Mon, 06 Dec 2021 22:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f+udiqaZ67AekRJsfuEVb5uj3ROe2vP5ghr0oV195W0=;
 b=J/GkOY2JatD7FBAKkj7zo7qm0zu83gr3gssEcq7tECGOevoO4it7Y04ne6Pp3FnK0H
 zsGa0Q8F3qsvT6I4+YPKlNUfN4AUrxlPRJLNc4bitT7GsWdPgyBy5X6Nz9QXCwIMWniZ
 rEetwE3QNb+HZei31v9cbKSlBOd55Mtp6/JL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f+udiqaZ67AekRJsfuEVb5uj3ROe2vP5ghr0oV195W0=;
 b=zyiBIXshllxoDF/OjGnXY91WZK9c7DlSiBIrqHKc2g4/3qCWsX9nfMk9+cQdKrQNFt
 4B50J2Up4TFN4MMH91KGo9z1jgprUseh8Q61SOJ6xOAXFTxe5P2Jc26HoTccpfEWifK7
 Z8GrPeZ0J98kn0y5mF0l5sRah6f18lflXgpbfpNWoG+lx/xtRaCxsaZTbnWfIEiMUaNO
 EbRLtIGL5GwuxJZ/R19E1WeAeR1c88lLqAbf2aVo0DkjS9B9Qt9jAsRPP9kL42zwGWym
 Myd38G1NDaSSPCbcNNhuh1fddaF2CtXM9PH5RTa8Dp34o1MSvsU0xHJkvwxpZywAcMgJ
 53sw==
X-Gm-Message-State: AOAM532GSqO+p034/ynnd2sLJygNtfagA1tNJjVoE//DIAYbThLoBPi+
 p9+9L3G5x5dFW/C7ksTjtJCq4a/C8wiKew==
X-Google-Smtp-Source: ABdhPJyZvwNoT4oSGFb3KwxVMh+6xEESFDRswigiC1MShWxc/lpwRffNVSSyabXgOqaqPo9je5cC7w==
X-Received: by 2002:aa7:9438:0:b0:4a2:c941:9ac4 with SMTP id
 y24-20020aa79438000000b004a2c9419ac4mr40707651pfo.12.1638858583943; 
 Mon, 06 Dec 2021 22:29:43 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t13sm14347377pfl.98.2021.12.06.22.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 22:29:43 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: mixart: Reduce size of mixart_timer_notify
Date: Mon,  6 Dec 2021 22:29:41 -0800
Message-Id: <20211207062941.2413679-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3108; h=from:subject;
 bh=Bxtg+Md4Tx2O3zfguW43xRX6QWLK3nr94r5jvTZ6XgY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhrv9VWCfHEI86ECNtov7rQKCtIX1smQa5Ihsv4FCj
 5Fqfs7KJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYa7/VQAKCRCJcvTf3G3AJoAZD/
 9I4Bg7/tASi7/MTVYDZ2OFnqA7LGqGWzz6D1FZaf1OaIyQ7gz6QVCW+qLJQHpISRu7Z+vbvnEESekZ
 /qMW/R7pzdFdXaRWK2+XUIxBHgEo145KJOnnMI2qfmhsKgEWiThjnktZ53fZumZwQD/IylG4KOdrGO
 1mu+8wuNxCLXj9wAZn3MoawwpPwZwkAkAx4PSK1hqmXFtW6p+bK8AmSdukZJkZE4J3Zpx5x/Zy4sHU
 he4eUP/OdqVsQ+DsznpT2xT6DFLHO3PrSDol+dKyzNoNKaDsWTmclO6fYG0zY7+EeYAxIBOVk6oWJ9
 5XGK3CRaJU9LzoWiW27o1nRExmRCmWPO5dMpKTT62BxFzl+GsNljCaPCtyyFrQWSud8imTFzuuzz95
 key5HrZkeMwpHeT6H5LxTDVkBjw0exV6ajR8MXsjxyOlXS5JAa1jc3yCZ07Sk7hNMarx+VVgLmIa5g
 aS9ZQJCLqg2u5qX07BddMQNGu2K6g6RjicdGWxlFNPjquU0B2wtq0/G7cswcx2PVycAui9Pv96hAuH
 c0DNtqpb5uH3d4ctWK0rOjK4Ba22wacYENz2WJkQcQnQGWMV0gfllH4QhMmntSXjyfXD9NR/53xKov
 m407NkStVJqCGCut2aywT/IyRhZmtPESfh94Kx8hkLX93rqdItGmwdip/QZg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-hardening@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Takashi Iwai <tiwai@suse.com>
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

The mixart_timer_notify structure was larger than could be represented
by the mixart_msg_data array storage. Adjust the size to as large as
possible to fix the warning seen with -Warray-bounds builds:

sound/pci/mixart/mixart_core.c: In function 'snd_mixart_threaded_irq':
sound/pci/mixart/mixart_core.c:447:50: error: array subscript 'struct mixart_timer_notify[0]' is partly outside array bounds of 'u32[128]' {aka 'unsigned int[128]'} [-Werror=array-bounds]
  447 |                                 for(i=0; i<notify->stream_count; i++) {
      |                                                  ^~
sound/pci/mixart/mixart_core.c:328:12: note: while referencing 'mixart_msg_data'
  328 | static u32 mixart_msg_data[MSG_DEFAULT_SIZE / 4];
      |            ^~~~~~~~~~~~~~~

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 sound/pci/mixart/mixart_core.c |  3 +--
 sound/pci/mixart/mixart_core.h | 10 +++++++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/pci/mixart/mixart_core.c b/sound/pci/mixart/mixart_core.c
index fb8895af0363..853083dd4bad 100644
--- a/sound/pci/mixart/mixart_core.c
+++ b/sound/pci/mixart/mixart_core.c
@@ -23,8 +23,6 @@
 #define MSG_DESCRIPTOR_SIZE         0x24
 #define MSG_HEADER_SIZE             (MSG_DESCRIPTOR_SIZE + 4)
 
-#define MSG_DEFAULT_SIZE            512
-
 #define MSG_TYPE_MASK               0x00000003    /* mask for following types */
 #define MSG_TYPE_NOTIFY             0             /* embedded -> driver (only notification, do not get_msg() !) */
 #define MSG_TYPE_COMMAND            1             /* driver <-> embedded (a command has no answer) */
@@ -444,6 +442,7 @@ irqreturn_t snd_mixart_threaded_irq(int irq, void *dev_id)
 				struct mixart_timer_notify *notify;
 				notify = (struct mixart_timer_notify *)mixart_msg_data;
 
+				BUILD_BUG_ON(sizeof(notify) > sizeof(mixart_msg_data));
 				for(i=0; i<notify->stream_count; i++) {
 
 					u32 buffer_id = notify->streams[i].buffer_id;
diff --git a/sound/pci/mixart/mixart_core.h b/sound/pci/mixart/mixart_core.h
index fbf4731a276d..2f0e29ed5d63 100644
--- a/sound/pci/mixart/mixart_core.h
+++ b/sound/pci/mixart/mixart_core.h
@@ -49,6 +49,7 @@ enum mixart_message_id {
 	MSG_CLOCK_SET_PROPERTIES             = 0x200002,
 };
 
+#define MSG_DEFAULT_SIZE            512
 
 struct mixart_msg
 {
@@ -251,10 +252,17 @@ struct mixart_sample_pos
 	u32   sample_pos_low_part;
 } __attribute__((packed));
 
+/*
+ * This structure is limited by the size of MSG_DEFAULT_SIZE. Instead of
+ * having MIXART_MAX_STREAM_PER_CARD * MIXART_MAX_CARDS many streams,
+ * this is capped to have a total size below MSG_DEFAULT_SIZE.
+ */
+#define MIXART_MAX_TIMER_NOTIFY_STREAMS				\
+	((MSG_DEFAULT_SIZE - sizeof(u32)) / sizeof(struct mixart_sample_pos))
 struct mixart_timer_notify
 {
 	u32                  stream_count;
-	struct mixart_sample_pos  streams[MIXART_MAX_STREAM_PER_CARD * MIXART_MAX_CARDS];
+	struct mixart_sample_pos  streams[MIXART_MAX_TIMER_NOTIFY_STREAMS];
 } __attribute__((packed));
 
 
-- 
2.30.2

