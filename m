Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F34D4721DC
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 08:41:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D9C518EB;
	Mon, 13 Dec 2021 08:40:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D9C518EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639381289;
	bh=OvX/XhPspJFwaHBUys0X/Jk+nTGYvqFmu6AnkuVOyxQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PrtYmxrjLwYETMDJGJJ1ZAYMEzgz7ZOqkOtwa6H6v0L0aNHdFm3+UtHF/H6ogLe0V
	 2yAdXmVRGZb4GAG2RmDBHSSRwuIsY3UAbF0Y203qQi6e3m8in91JjQUFU/imnRPTgU
	 qBntJABMDk+coMcV40pMGnJMe7ssWYO6q72WxTNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D7DCF8025F;
	Mon, 13 Dec 2021 08:40:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97AE5F8025D; Mon, 13 Dec 2021 08:40:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,PRX_BODY_94,RDNS_DYNAMIC,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com
 [203.205.221.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D918F8013C
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 08:40:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D918F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com
 header.b="dPRrriv6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1639381206;
 bh=qH16UCbILLK1VIbn+YL3Zn3/Z/NDBg3u6EOmyyHF0tg=;
 h=From:To:Cc:Subject:Date;
 b=dPRrriv6ZYfP7/lOxqTKk83MCj+NQKV5kPtiY0rI+lypw7mhYyOpBTJwrrQxKN7hl
 GpcT8mU0Sw93e9Ls4CdGhaM7RPp+39kjMu008MrLWvjViuVGqhp0zS0GtJ1V+Lydfe
 YoReIzxfPNsYo2KBNVyC0M+0IuiYeqsN1T58vHYk=
Received: from localhost.localdomain ([43.227.136.188])
 by newxmesmtplogicsvrszb6.qq.com (NewEsmtp) with SMTP
 id A028B824; Mon, 13 Dec 2021 15:40:02 +0800
X-QQ-mid: xmsmtpt1639381202t5rjibsfn
Message-ID: <tencent_094816F3522E0DC704056C789352EBBF0606@qq.com>
X-QQ-XMAILINFO: M3ziZXKDk+iONkM+zBmL0oqMt2X16OZTTutED+JoujGCtiQ2z8gR+vGN3V/CI/
 GShe+Jsau0ry/h9XFHVauYxB4xEO0FcIxcXxTEIvyYZfXXiFAN18s4RXSn7wYklgYmu4M0MsSbG9
 yvqogXfzVLPKHisniYSaZxFhmcHf5Xy9jlGoidgAcUzHtQm6cHan3zKXzu3roKRmtrQd+4wqa2HM
 Lf5JbXKLRnWd5icoGFHyJaFTvAz2Rly6VwydGW4VbdSqv9plwzULhKPaCuPEmsTO7RkiBrLOmIpA
 YGkmwpVEIRrdbrX9Ptx7qaP6TJbClLtsVA75x8Oksa3NBhV3ZvvSpYH+ve8PdiHAw2ZrTF+cLHQY
 3d3xhvoujmdP2SCCXzV2zrchJvksqZI/CtI+gz63SsK4k4I7M368Haq9Qr1pJuLujSQv6rWv811U
 psDokJlv/ZAqJkx3gNTev4cb9N4Cq5JHQwBDARt0K/HUZqwjAVztiNT3BZsu7h75Qu7Iv3JBRXnV
 sK45mv7pK7rnlhsBriS9rmnLo+KU04v4Kj6pwzcN/0lQ82g/tBQV8DtBY+u4YGZwMF2037SuwJW3
 pMa5GuR7ahu0j3Of9HsqAs0nqK8IHAv5rn+omp2fx4ltewZ9xYNVDXg2vbmOMmGzE2Cc/MHfYwAP
 DGzUDeoZH2roDHGExUloMP7v5lwOrOsxZP10AO3hwrotLj8AEcVy7+2R8L6W0kXk/52En/jd7g6k
 S8+Btg7E7rYp9HyOQnO0xN7yAXl9eqwYjxwtv3b9a4YG4Hr++ZcvsicyLw+JolZBr1VZIVw/kToV
 lEqcpNPageHd0XKM+wLImlAn0CEF21xLwgFnlk83vLX+Kfl/btR0q+Hqce+tAWY0TOoHUPFk9Q9m
 oDJvziX/oxdEWukiW1MlE7n823vH2FrzfBi8+hcSeMTo3h5kfMa3s=
From: Xiaoke Wang <xkernel.wang@foxmail.com>
To: joe@perches.com,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: jack: Check the return value of kstrdup()
Date: Mon, 13 Dec 2021 15:39:31 +0800
X-OQ-MSGID: <20211213073932.4240-1-xkernel.wang@foxmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Xiaoke Wang <xkernel.wang@foxmail.com>
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

kstrdup() can return NULL, it is better to check the return value of it.
Fix: free jack and use my full name.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 sound/core/jack.c | 4 ++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/jack.c b/sound/core/jack.c
index 32350c6..5fd9954 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -509,6 +509,10 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 		return -ENOMEM;
 
 	jack->id = kstrdup(id, GFP_KERNEL);
+	if (jack->id == NULL) {
+		kfree(jack);
+		return -ENOMEM;
+	}
 
 	/* don't creat input device for phantom jack */
 	if (!phantom_jack) {
-- 

