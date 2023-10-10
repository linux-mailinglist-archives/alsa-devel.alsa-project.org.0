Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8F37BF1FF
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 06:41:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C638FCE;
	Tue, 10 Oct 2023 06:40:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C638FCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696912864;
	bh=oUzphqxxg+EP13V765LD9xmh5txU8wuSTa4iovxFpTw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Smdno051ZzAREuD66SK1G5dXu/FzZtKIqubSKzK+pPGggY5/2OBtYi7VozOlNUAcF
	 aF2nUxTPMpx/ZDcOD7plhBmfNyCI0lKA/puplwZI1XA/bVi1YW0k+RDs3p/XzPXgSu
	 YKA71iAGx5YdBXXWfBdxd4GZqXIu2AIc0q2TbFkc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBE35F80557; Tue, 10 Oct 2023 06:40:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3AADF8027B;
	Tue, 10 Oct 2023 06:40:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC289F802BE; Tue, 10 Oct 2023 06:36:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 7941DF80166
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 06:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7941DF80166
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1696912586388449192-webhooks-bot@alsa-project.org>
References: <1696912586388449192-webhooks-bot@alsa-project.org>
Subject: Undefined symbols in version sccripts are error in LLD-17 (by
 default)
Message-Id: <20231010043627.EC289F802BE@alsa1.perex.cz>
Date: Tue, 10 Oct 2023 06:36:27 +0200 (CEST)
Message-ID-Hash: OHXWCDR2I5QMWYO2X5VXG5HPPV3S4RLS
X-Message-ID-Hash: OHXWCDR2I5QMWYO2X5VXG5HPPV3S4RLS
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OHXWCDR2I5QMWYO2X5VXG5HPPV3S4RLS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #356 was edited from parona-source:

LLD 17 defaults to erroring out on undefined symbols in version scripts.

```
libtool: link: clang -m32 -mfpmath=sse -shared  -fPIC -DPIC  .libs/conf.o .libs/confeval.o .libs/confmisc.o .libs/input.o .libs/output.o .libs/async.o .libs/error.o .libs/dlmisc.o .libs/socket.o .libs/shmarea.o .libs/userfile.o .libs/names.o  -Wl,--whole-archive control/.libs/libcontrol.a mixer/.libs/libmixer.a pcm/.libs/libpcm.a timer/.libs/libtimer.a rawmidi/.libs/librawmidi.a hwdep/.libs/libhwdep.a seq/.libs/libseq.a ucm/.libs/libucm.a -Wl,--no-whole-archive  -Wl,--as-needed -lm -lpthread -lrt  -m32 -mfpmath=sse -O3 -march=znver3 -Wl,--version-script=Versions -Wl,-z -Wl,defs -Wl,-O1 -Wl,--defsym=__gentoo_check_ldflags__=0   -Wl,-soname -Wl,libasound.so.2 -o .libs/libasound.so.2.0.0
x86_64-pc-linux-gnu-ld: error: version script assignment of 'ALSA_0.9.5' to symbol 'alsa_lisp' failed: symbol not defined
x86_64-pc-linux-gnu-ld: error: version script assignment of 'ALSA_1.2.10' to symbol 'snd_seq_seq_client_info_get_ump_group_enabled' failed: symbol not defined
x86_64-pc-linux-gnu-ld: error: version script assignment of 'ALSA_1.2.10' to symbol 'snd_seq_seq_client_get_ump_conversion' failed: symbol not defined
x86_64-pc-linux-gnu-ld: error: version script assignment of 'ALSA_1.2.10' to symbol 'snd_seq_seq_client_info_set_ump_group_enabled' failed: symbol not defined
x86_64-pc-linux-gnu-ld: error: version script assignment of 'ALSA_1.2.10' to symbol 'snd_seq_seq_client_set_ump_conversion' failed: symbol not defined
clang: error: linker command failed with exit code 1 (use -v to see invocation)
```

These symbols were added in https://github.com/alsa-project/alsa-lib/commit/2aefb5c41cc03b72b3161b57336dd4f924b7a90b, the subsequent commits makes me think these could be symbols that were added prematurely and that there is an intention to implement them. Which is why I am making an issue instead of making a pull request removing them.

@tiwai any input on this?

Bug: https://bugs.gentoo.org/914511

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/356
Repository URL: https://github.com/alsa-project/alsa-lib
