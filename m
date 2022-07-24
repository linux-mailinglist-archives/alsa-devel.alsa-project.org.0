Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4631E57F962
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 08:28:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D549CE12;
	Mon, 25 Jul 2022 08:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D549CE12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658730485;
	bh=8OZoUpxrXz1z/+/D90tbHVCNlRw6+ya0ZlFVPRKGBwk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Wr+eZnkjfRQJWhuLV3kpD3K4ne4ZkVV1sQ+jqNOy6CuPbEP95IxqCQ+B70VCwv1Py
	 d1hLq3P/i5LCnqLDf5N2mhl15a8PwvZShFa186sPyASalUY4OEwhnaWU/qEXFqi0UG
	 ojHSAMXOnpS0xQXj7MBdR/W5zoZA0Dsrr69SrMgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EB30F80557;
	Mon, 25 Jul 2022 08:25:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C091F8016A; Sun, 24 Jul 2022 09:18:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=KHOP_HELO_FCRDNS, RDNS_DYNAMIC,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtpbg.qq.com (biz-43-154-54-12.mail.qq.com [43.154.54.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F792F80104
 for <alsa-devel@alsa-project.org>; Sun, 24 Jul 2022 09:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F792F80104
X-QQ-mid: bizesmtp80t1658647117t7pjan0r
Received: from localhost.localdomain ( [125.70.163.183])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 24 Jul 2022 15:18:36 +0800 (CST)
X-QQ-SSF: 01000000002000007000B00A0000000
X-QQ-FEAT: /rrU+puPB7TjkaUBztrLltq+wkA0e+Bb8w1SMyQjfVFqByq7dJyeckZRfXepg
 U4kMJIbsgKBCSxvyN4N7MfPy/TrwOMfyTX0u00GjabR6AnPtnJGlWb2Op7GkGbXw5zASVHA
 rBSSv36lgJWoZHtkl4rfEW7fOSpgfp1EcLnvGeBvtzSiOtfyCMLNpxP0ebtm334bRwoHD/V
 JfeWQ+I4WAg9joN5yVmkPwwMcI2niEzgDgJPJI6Zgct66AQqmEAKvLtHm/ocWm6Qa3yAjf7
 XMDO0R9fjs2u06UodpdBN5pzt4b5xW4eFzuXJLduFJCg4fQqv6PfFb6ulTN0nQA51Yq5ddV
 KVPWxiSeeLGQNGzufyRqwC8Ko4NaMVi0b7+Rex0Rvgqily7cUM=
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] usb/hiface: fix repeated words in comments
Date: Sun, 24 Jul 2022 15:18:29 +0800
Message-Id: <20220724071829.11117-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-Mailman-Approved-At: Mon, 25 Jul 2022 08:25:50 +0200
Cc: wangjianli <wangjianli@cdjrlc.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

 Delete the redundant word 'in'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 sound/usb/hiface/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/hiface/pcm.c b/sound/usb/hiface/pcm.c
index 71f17f02f341..cf650fab54d7 100644
--- a/sound/usb/hiface/pcm.c
+++ b/sound/usb/hiface/pcm.c
@@ -225,7 +225,7 @@ static int hiface_pcm_stream_start(struct pcm_runtime *rt)
 			}
 		}
 
-		/* wait for first out urb to return (sent in in urb handler) */
+		/* wait for first out urb to return (sent in urb handler) */
 		wait_event_timeout(rt->stream_wait_queue, rt->stream_wait_cond,
 				   HZ);
 		if (rt->stream_wait_cond) {
-- 
2.36.1

