Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 887BA1243F6
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 11:10:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9C641614;
	Wed, 18 Dec 2019 11:10:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9C641614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576663854;
	bh=mDlXZcfoGJNaNIGgBZ+9X3YtcPtKir8AZPVAwtbX1bc=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QYho2XjUBU3uOgK2UEf4UJ0eCy5hg8XmPqMeEkuR4vdnmmUQgI6A46tLG8z9kLYHk
	 7ol/0OR/FW7nPzztYKAjNNXm4aUXWujKpm/Qjx85QKFCYT5k7lJvmDLC1GT/8rAkK6
	 gukMmTncOpkCyzd+IgJb/7QKvWOMQEY0kObsFA5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C4EEF8015A;
	Wed, 18 Dec 2019 11:09:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CBC5F8022C; Wed, 18 Dec 2019 11:09:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D845BF80059
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 11:09:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D845BF80059
MIME-Version: 1.0
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1576663745816961050-webhooks-bot@alsa-project.org>
References: <1576663745816961050-webhooks-bot@alsa-project.org>
Message-Id: <20191218100909.6CBC5F8022C@alsa1.perex.cz>
Date: Wed, 18 Dec 2019 11:09:09 +0100 (CET)
Subject: [alsa-devel] Undecalared Variable "p" when compile alsa-lib with
	TPLG_DEBUG defined
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

alsa-project/alsa-lib issue #18 was opened from aiChaoSONG:

Undecalared Variable "p" when compile alsa-lib with TPLG_DEBUG defined, the pointer 'p'  in line 152 of src/topology/data.c seem not declared. see code below.
```
static void dump_priv_data(struct tplg_elem *elem)
{
	struct snd_soc_tplg_private *priv = elem->data;
	unsigned int i, j = 0;

	tplg_dbg(" elem size = %d, priv data size = %d\n",
		elem->size, priv->size);

	for (i = 0; i < priv->size; i++) {
		if (j++ % 8 == 0)
			tplg_dbg("\n");

		*******tplg_dbg(" 0x%x", *p++);*******
	}

	tplg_dbg("\n\n");
}
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/18
Repository URL: https://github.com/alsa-project/alsa-lib
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
