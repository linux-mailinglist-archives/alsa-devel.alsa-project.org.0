Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9A161E84D
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 02:35:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE2471F1;
	Mon,  7 Nov 2022 02:34:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE2471F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667784916;
	bh=c6gfSvzCnsTyGBLe33w74JaUEzLQ/NkcpE4ib9BwGY8=;
	h=From:Subject:To:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=R5Jdecjf50UcAvCN3h7ayTheqF4y7KLP9q6wdjzgGoNXOlyml2AD75NMPjQKDZIpb
	 uWE1gT2/9bm8ITUOOjyfIfZsvzhm4YYmLQ52cybH7YmXdojPWWbZstPCzMNbaQ62Ag
	 BiBsvOVMqK4QO9BOIuV015eGjd1XNMXWZUV7yuQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59EEFF80238;
	Mon,  7 Nov 2022 02:34:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22B53F80137; Mon,  7 Nov 2022 02:34:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.3 required=5.0 tests=HTML_MESSAGE,
 HTML_MIME_NO_HTML_TAG,HTML_OBFUSCATE_05_10,MIME_HTML_ONLY,MSGID_RANDY,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,RDNS_NONE,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ACD7F800BB
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 02:34:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ACD7F800BB
X-UUID: 64a417c4e36449f6abfab5e360c125df-20221107
X-UUID: 64a417c4e36449f6abfab5e360c125df-20221107
Received: from cs2c.com.cn [(192.168.0.8)] by mailgw
 (envelope-from <aichao@kylinos.cn>) (Generic MTA)
 with ESMTP id 1108827578; Mon, 07 Nov 2022 09:34:08 +0800
Received: by cs2c.com.cn (NSMail, from userid 0)
 id 9346E18D0E095; Mon,  7 Nov 2022 09:33:57 +0800 (CST)
From: =?UTF-8?B?6Im+6LaF?= <aichao@kylinos.cn>
Subject: =?UTF-8?B?5Zue5aSNOiBSZTog5Zue5aSNOiBSZTogW1BBVENIXSBBTFNBOiB1c2ItYXVkaW86IGZpeCBIYW1lZGFsIEMyMCB1c2IgY2FtZXJvIGRpc2Nvbm5lY3QgaXNzdWU=?=
To: =?UTF-8?B?VGFrYXNoaSBJd2Fp?= <tiwai@suse.de>,
Date: Mon, 07 Nov 2022 09:33:57 +0800
X-Mailer: NSMAIL 6.0
Message-ID: <1ky6wp89pgz-1ky6wp89ph0@nsmail6.0>
References: 87pme3jazk.wl-tiwai@suse.de
X-Delaysendtime: Mon, 07 Nov 2022 09:33:57 +0800
X-ns-mid: webmail-63686085-1ky86n1o
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
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

       Yes, the audio device is a UAC1 device, and it used
   set_sample_rate_v1 to set sample.

       So, I add a quirk to keep up the USB interface up even if the audio
   stream is closed.


   ----


   ä¸»ãé¢ï¼Re: åå¤: Re: [PATCH] ALSA: usb-audio: fix Hamedal C20 usb
   camero disconnect issue
   æ¥ãæï¼2022-11-04 17:59
   åä»¶äººï¼Takashi Iwai
   æ¶ä»¶äººï¼è¾è¶

   On Fri, 04 Nov 2022 10:50:48 +0100,
   è¾è¶ wrote:
   >
   > I 'm sorry, I don't know whether you receiver my mail for 'lsusb -v'
   to
   > Hamedal C20
   I received your previous mails including lsusb -v output.  But the
   post was filtered out by some reason?
   So the audio device looks like a UAC1 device.  And this one requires
   to keep up the USB interface up even if the audio stream is closed
   (not about the parameter changes)?
   Takashi
