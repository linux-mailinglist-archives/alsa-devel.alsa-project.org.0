Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C8D96D9D1
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 15:06:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F4B886F;
	Thu,  5 Sep 2024 15:06:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F4B886F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725541611;
	bh=ZEif6jJBpMRuIxxinDLjQo7RNICE6DhYlKF+uI3VMlw=;
	h=Subject:To:Cc:From:Date:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HidqCHSfylF4c+RZ6UFuqBgkhkf0T/KrkpCuCWyNjj0/Zg6QdLiB7fiYIM6Wtp43x
	 SKEce2bZLM+D3ywBHi2SfldIzAEgt8IKT0t4sf1wco+u3FhaAvSNLqTchM2+DKTpmc
	 bv2XrDOc4Nz87/lyjC+zuDilmh381WDgGnRdbMxA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2F15F8059F; Thu,  5 Sep 2024 15:06:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0344F804FC;
	Thu,  5 Sep 2024 15:06:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FC5DF8016C; Thu,  5 Sep 2024 15:06:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA9A5F80027
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 15:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA9A5F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=sBxmTvoD
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA4375C440B;
	Thu,  5 Sep 2024 13:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5322C4CEC3;
	Thu,  5 Sep 2024 13:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725541579;
	bh=tP/iYglp4RZhEtooGI8nvdmTlrk1tKWPQXm8otb63lc=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=sBxmTvoDoZ2PbrVNjEmEGawfi4I+qGHYYWSrWKxDGnIrtDg6tN31rrfuJPn1gWiaW
	 DWodBm35kVBxEjXxWOQVhMzWOjvk9y1VL3bZMoUPDaMZhJ/hPhISx1l6c4gOYRuHbL
	 a0+ndIqFf0FGYSVT/qgruO/PzV/8ABklswndAEHU=
Subject: Patch "ALSA: usb-audio: Fix gpf in snd_usb_pipe_sanity_check" has
 been added to the 4.19-stable tree
To: 
 alsa-devel@alsa-project.org,andreyknvl@google.com,dan.carpenter@linaro.org,gregkh@linuxfoundation.org,hdanton@sina.com,perex@perex.cz,syzbot+d59c4387bfb6eced94e2@syzkaller.appspotmail.com,tiwai@suse.com,tiwai@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 05 Sep 2024 15:06:14 +0200
In-Reply-To: <d830ede4-1736-4548-94b3-51a21fa935c3@stanley.mountain>
Message-ID: <2024090510-sulphate-payment-7f46@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
Message-ID-Hash: QJ5Z2QMPHA5UPYXBRGJUMHML4HJZ3V4S
X-Message-ID-Hash: QJ5Z2QMPHA5UPYXBRGJUMHML4HJZ3V4S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QJ5Z2QMPHA5UPYXBRGJUMHML4HJZ3V4S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


This is a note to let you know that I've just added the patch titled

    ALSA: usb-audio: Fix gpf in snd_usb_pipe_sanity_check

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     alsa-usb-audio-fix-gpf-in-snd_usb_pipe_sanity_check.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


>From stable+bounces-73597-greg=kroah.com@vger.kernel.org Thu Sep  5 14:38:24 2024
From: Hillf Danton <dan.carpenter@linaro.org>
Date: Thu, 5 Sep 2024 15:38:13 +0300
Subject: ALSA: usb-audio: Fix gpf in snd_usb_pipe_sanity_check
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Hillf Danton <hdanton@sina.com>, alsa-devel@alsa-project.org, stable@vger.kernel.org
Message-ID: <d830ede4-1736-4548-94b3-51a21fa935c3@stanley.mountain>
Content-Disposition: inline

From: Hillf Danton <dan.carpenter@linaro.org>

[ Upstream commit 5d78e1c2b7f4be00bbe62141603a631dc7812f35 ]

syzbot found the following crash on:

  general protection fault: 0000 [#1] SMP KASAN
  RIP: 0010:snd_usb_pipe_sanity_check+0x80/0x130 sound/usb/helper.c:75
  Call Trace:
    snd_usb_motu_microbookii_communicate.constprop.0+0xa0/0x2fb  sound/usb/quirks.c:1007
    snd_usb_motu_microbookii_boot_quirk sound/usb/quirks.c:1051 [inline]
    snd_usb_apply_boot_quirk.cold+0x163/0x370 sound/usb/quirks.c:1280
    usb_audio_probe+0x2ec/0x2010 sound/usb/card.c:576
    usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
    really_probe+0x281/0x650 drivers/base/dd.c:548
    ....

It was introduced in commit 801ebf1043ae for checking pipe and endpoint
types. It is fixed by adding a check of the ep pointer in question.

BugLink: https://syzkaller.appspot.com/bug?extid=d59c4387bfb6eced94e2
Reported-by: syzbot <syzbot+d59c4387bfb6eced94e2@syzkaller.appspotmail.com>
Fixes: 801ebf1043ae ("ALSA: usb-audio: Sanity checks for each pipe and EP types")
Cc: Andrey Konovalov <andreyknvl@google.com>
Signed-off-by: Hillf Danton <hdanton@sina.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/usb/helper.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/sound/usb/helper.c
+++ b/sound/usb/helper.c
@@ -85,7 +85,7 @@ int snd_usb_pipe_sanity_check(struct usb
 	struct usb_host_endpoint *ep;
 
 	ep = usb_pipe_endpoint(dev, pipe);
-	if (usb_pipetype(pipe) != pipetypes[usb_endpoint_type(&ep->desc)])
+	if (!ep || usb_pipetype(pipe) != pipetypes[usb_endpoint_type(&ep->desc)])
 		return -EINVAL;
 	return 0;
 }


Patches currently in stable-queue which might be from dan.carpenter@linaro.org are

queue-4.19/alsa-usb-audio-sanity-checks-for-each-pipe-and-ep-types.patch
queue-4.19/alsa-usb-audio-fix-gpf-in-snd_usb_pipe_sanity_check.patch
