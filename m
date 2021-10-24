Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E70438906
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Oct 2021 15:23:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0859166D;
	Sun, 24 Oct 2021 15:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0859166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635081832;
	bh=WebPCIcUhqG0F9R0TyydiMVrPS021xBu3bKn7wrHMVg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SIlmMguiZnzBuVsvCjmWWZeQnmn9TozoQy1rIzVoERJfA9LlZkytlqHl2wqMkqFxM
	 rImWxMzsBUBGiWDVWuLA4QlK4ddE7LBY4TGhxSeajPcfqmbO5wIc3Oke9/tSrw7Klu
	 FcQjP6e1+UkjXvQNB168+4twL2Fth/Cz7wdXMv5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B6CAF802E7;
	Sun, 24 Oct 2021 15:22:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5556F802C8; Sun, 24 Oct 2021 15:22:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E606AF80086
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 15:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E606AF80086
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1635081749650825977-webhooks-bot@alsa-project.org>
References: <1635081749650825977-webhooks-bot@alsa-project.org>
Subject: Where did snd_pcm_parse_control_id() go?
Message-Id: <20211024132233.C5556F802C8@alsa1.perex.cz>
Date: Sun, 24 Oct 2021 15:22:33 +0200 (CEST)
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

alsa-project/alsa-lib issue #186 was opened from Saur2000:

It seems `snd_pcm_parse_control_id()` was made private in 1.2.5 without any prior deprecation. It is still present in `pcm_external.h`, and our code now fails to link with:

```
ld: src/plugin_control.o: in function `plugin_control_load_user_control':
src/plugin_control.c:254: undefined reference to `snd_pcm_parse_control_id'
```

What are we supposed to use instead?
And why is the function still in the header file if it is not in the library?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/186
Repository URL: https://github.com/alsa-project/alsa-lib
