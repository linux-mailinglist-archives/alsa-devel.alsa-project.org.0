Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 505F456484A
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Jul 2022 17:07:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC69916D4;
	Sun,  3 Jul 2022 17:06:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC69916D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656860836;
	bh=p+pbDvfhGguJgwWEvVtNBqQ15xhdKnX41TIt/Hz2ddQ=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=soMbSGqqMtXmzv9a+s69D8xt7maeoxy/UJpWedpwCBzh1SgAvzNWS3XQkonFstFFb
	 YK5tm9EFjE4eNtJilAffdHGJGdHFfNOUY1qJA2l1kMdMFCIV99WqRVqzu3+C8GAKjf
	 0/U4VRMcnlh/5IWT1Bo8GHGByFYf+A/ykGztY3yc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3204FF80089;
	Sun,  3 Jul 2022 17:06:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AC63F80249; Sun,  3 Jul 2022 17:06:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66770F80089
 for <alsa-devel@alsa-project.org>; Sun,  3 Jul 2022 17:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66770F80089
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1C485B80B65;
 Sun,  3 Jul 2022 15:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622A0C341C6;
 Sun,  3 Jul 2022 15:06:07 +0000 (UTC)
Date: Sun, 3 Jul 2022 11:06:05 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: PATCH] tracing: ALSA: hda: Remove string manipulation out of the
 fast path
Message-ID: <20220703110605.07a86fb2@rorschach.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
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

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

The TRACE_EVENT() macro is broken up into various parts to be efficient.
The TP_fast_assign() is just to record the event into the ring buffer, and
is to be done as fast as possible as this occurs during the actual running
of the code. The slower this is, the slower the code that is being traced
becomes.

The TP_printk() is processed when reading the tracing buffer. This is
considered the slow path. Any processing that can be moved from the
TP_fast_assign() to the TP_printk() should do so.

For some reason, the entire string processing of the trace events
hda_send_cmd, hda_get_response, and hda_unsol_event was moved from the
TP_printk() into the TP_fast_assign(). On top of that, the
__dynamic_array() was used with a fixed size of HDAC_MSG_MAX, which is
useless as a dynamic_array as it will always allocate HDAC_MSG_MAX bytes
on the ring buffer and even save that amount into the event (as it expects
the size to be dynamic, which using a fixed size defeats that purpose).

Instead, just save the necessary elements in the TP_fast_assign() and do
the string manipulation in the slow path.

The output should be the same.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 sound/hda/trace.h | 41 ++++++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/sound/hda/trace.h b/sound/hda/trace.h
index 70af6c815089..2cc493434a8f 100644
--- a/sound/hda/trace.h
+++ b/sound/hda/trace.h
@@ -19,37 +19,48 @@ struct hdac_codec;
 TRACE_EVENT(hda_send_cmd,
 	TP_PROTO(struct hdac_bus *bus, unsigned int cmd),
 	TP_ARGS(bus, cmd),
-	TP_STRUCT__entry(__dynamic_array(char, msg, HDAC_MSG_MAX)),
+	TP_STRUCT__entry(
+		__string(name, dev_name((bus)->dev))
+		__field(u32, cmd)
+	),
 	TP_fast_assign(
-		snprintf(__get_str(msg), HDAC_MSG_MAX,
-			 "[%s:%d] val=0x%08x",
-			 dev_name((bus)->dev), (cmd) >> 28, cmd);
+		__assign_str(name, dev_name((bus)->dev));
+		__entry->cmd = cmd;
 	),
-	TP_printk("%s", __get_str(msg))
+	TP_printk("[%s:%d] val=0x%08x", __get_str(name), __entry->cmd >> 28, __entry->cmd)
 );
 
 TRACE_EVENT(hda_get_response,
 	TP_PROTO(struct hdac_bus *bus, unsigned int addr, unsigned int res),
 	TP_ARGS(bus, addr, res),
-	TP_STRUCT__entry(__dynamic_array(char, msg, HDAC_MSG_MAX)),
+	TP_STRUCT__entry(
+		__string(name, dev_name((bus)->dev))
+		__field(u32, addr)
+		__field(u32, res)
+	),
 	TP_fast_assign(
-		snprintf(__get_str(msg), HDAC_MSG_MAX,
-			 "[%s:%d] val=0x%08x",
-			 dev_name((bus)->dev), addr, res);
+		__assign_str(name, dev_name((bus)->dev));
+		__entry->addr = addr;
+		__entry->res = res;
 	),
-	TP_printk("%s", __get_str(msg))
+	TP_printk("[%s:%d] val=0x%08x", __get_str(name), __entry->addr, __entry->res)
 );
 
 TRACE_EVENT(hda_unsol_event,
 	TP_PROTO(struct hdac_bus *bus, u32 res, u32 res_ex),
 	TP_ARGS(bus, res, res_ex),
-	TP_STRUCT__entry(__dynamic_array(char, msg, HDAC_MSG_MAX)),
+	TP_STRUCT__entry(
+		__string(name, dev_name((bus)->dev))
+		__field(u32, res)
+		__field(u32, res_ex)
+	),
 	TP_fast_assign(
-		snprintf(__get_str(msg), HDAC_MSG_MAX,
-			 "[%s:%d] res=0x%08x, res_ex=0x%08x",
-			 dev_name((bus)->dev), res_ex & 0x0f, res, res_ex);
+		__assign_str(name, dev_name((bus)->dev));
+		__entry->res = res;
+		__entry->res_ex = res_ex;
 	),
-	TP_printk("%s", __get_str(msg))
+	TP_printk("[%s:%d] res=0x%08x, res_ex=0x%08x", __get_str(name),
+		  __entry->res_ex & 0x0f, __entry->res, __entry->res_ex)
 );
 
 DECLARE_EVENT_CLASS(hdac_stream,
-- 
2.35.1

