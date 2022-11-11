Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED2562658D
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Nov 2022 00:30:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD511166A;
	Sat, 12 Nov 2022 00:29:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD511166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668209412;
	bh=PojNhZKTWHAt3R87BpTtype1ifB021jC1XeYb0nZBts=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QHDe1sQgRRS8LScdHPpoOkZVENnZELDJhNYe5WurWYwLYV6YJGLFIwrA0l/Cx4utP
	 o6c38l/RkNVktz9NBZQ/DT8akmsz04d6Yi6lWeVjZa/AvzeDyFgvK8VwzKLyjTdld4
	 MD/xfeJN3xsaZFJpeGcn4z3y+R5Eg9GEhUrzm4bg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59B1AF804AB;
	Sat, 12 Nov 2022 00:29:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D3ECF8028D; Sat, 12 Nov 2022 00:29:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 71CCDF80162
 for <alsa-devel@alsa-project.org>; Sat, 12 Nov 2022 00:29:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71CCDF80162
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1668209351690187931-webhooks-bot@alsa-project.org>
References: <1668209351690187931-webhooks-bot@alsa-project.org>
Subject: Build failure with upcoming Clang 16
 (-Wincompatible-function-pointer-types)
Message-Id: <20221111232915.2D3ECF8028D@alsa1.perex.cz>
Date: Sat, 12 Nov 2022 00:29:15 +0100 (CET)
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

alsa-project/alsa-tools issue #12 was opened from thesamesam:

Clang 16 will make -Wincompatible-function-pointer-types an error by default.

You can emulate this error using:
* GCC via -Werror=incompatible-pointer-types (GCC lacks a more specific warning for just func. ptrs)
* Clang <16 via -Werror=incompatible-function-pointer-types

Originally reported downstream in Gentoo at https://bugs.gentoo.org/880997.

```
echomixer.c:2108:7: error: incompatible function pointer types passing 'void
      (GtkWidget *, gpointer)' (aka 'void (struct _GtkWidget *, void *)') to
      parameter of type 'GCallback' (aka 'void (*)(void)')
      [-Werror,-Wincompatible-function-pointer-types]
  ...gtk_signal_connect(GTK_OBJECT(menuitem), "activate", Digital_mode_activate, (gpointer)(long)i);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/include/gtk-2.0/gtk/gtksignal.h:51:47: note: expanded from macro
      'gtk_signal_connect'
   gtk_signal_connect_full ((object), (name), (func), NULL, (func_data)...
                                              ^~~~~~
/usr/include/gtk-2.0/gtk/gtksignal.h:123:23: note: passing argument to parameter
      'func' here
                                                 GCallback           func,
                                                                     ^
[...]
```

Full build log: https://bugs.gentoo.org/attachment.cgi?id=831477

Issue URL     : https://github.com/alsa-project/alsa-tools/issues/12
Repository URL: https://github.com/alsa-project/alsa-tools
