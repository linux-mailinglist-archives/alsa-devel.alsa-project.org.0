Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2786CABC9
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 19:22:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E00A420C;
	Mon, 27 Mar 2023 19:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E00A420C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679937753;
	bh=9F9GQyqDcKheTFgLgiBrbfftaifnEUkmh1EsXRFdevI=;
	h=Subject:From:To:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=R8Pj2OSe8VEAtwNE9shXI8lI8CCckTJyxYyDXWlEla5E8XXE7zXcyyI4RTKJFX2Y5
	 OkB36z2ELhCvxnicHhSzHJCXnQuWTsLyuMl53oMdaigez52LXoJ0cwXCJUzZgIzJKW
	 E/QOryA22K+4/qBQP8pWJBWY0O4SIqvprKR+2cgI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E756F8024E;
	Mon, 27 Mar 2023 19:21:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 223C8F80272; Mon, 27 Mar 2023 19:21:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CAC7F80114
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 19:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CAC7F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=bjoern.foersterling@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=ORocPqsW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679937692; i=bjoern.foersterling@web.de;
	bh=9F9GQyqDcKheTFgLgiBrbfftaifnEUkmh1EsXRFdevI=;
	h=X-UI-Sender-Class:Subject:From:To:Date;
	b=ORocPqsWzRMKSoYkfIcjasXtp8x/IhN9iXiuZTh2pOkMSdlGdFejJPnDp3x3IwdIB
	 2wsn8EpS9l2A3L2/MEYOHofH3GBF3vO0awt53lly5V+dvPQ4ehvYpMR70Vy0VrSuts
	 GLT2aWju64eXjB/LdJwFsJtpK7JWslCnD6FelfIKbxzW7fhuNINHboTJqIxcfqdole
	 JrHm1j5VfBdo+QOxjj6AOKUzqcPzGnjBUs4a2AdkDSdzFBiETW9ECL3Wb1UURSGSgq
	 4Js3a0+4W6TpuoxLhfGMxs3eT7W5CJ4UDM0O0H4WALdn2/Ppm8bM1PS22qRBDdggX1
	 9W+kFs5gkXw9Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.2.172] ([84.185.167.66]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MuFD5-1qaTWT39qf-00uXCw for
 <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 19:21:32 +0200
Message-ID: <93664c4122f4b3cdb5a6afc58c6c94f1064bba5f.camel@web.de>
Subject: alsa-doc: Examples Are Not Compiling
From: =?ISO-8859-1?Q?Bj=F6rn_F=F6rsterling?= <bjoern.foersterling@web.de>
To: alsa-devel@alsa-project.org
Date: Mon, 27 Mar 2023 19:22:36 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
X-Provags-ID: V03:K1:Mc/e6xTgboEe1L2HOpT4Qq7wfI1+hUpAZ2BV+TqtHF+lNjqr5s1
 eTd2N+umpfIb3pU+0nx70OhRjK/FVzqkFgjOf+gz6NgZ3ctW35glW6peNycLfj+xdP/ag6S
 1MTxA4aPVc5dXDHO3bQqwXvHGWduvNmPGYyg6XljC5B7HAJA1U6QX351JL0KvmNoWre6BFE
 fHWHny/IDEGFxOMSECQzA==
UI-OutboundReport: notjunk:1;M01:P0:hAl1mMbAUuc=;rmZ6ooPfp30oiCXBwtknjcNXSBk
 2SJxV9jvmo2e9j332mTA+psYhxuUXlWX3oM3KONq4Wu49WQ8qkj5JDz0DMR8jw4tgztqbFdT0
 Cd5qlqGXPLCK9KgzzH5HEfsvnjzCevVtnyUa/YpTDfTRM1ByTsZiS7LLwjC7dsprKQYyEs7n8
 +Ug1XdouJuqImDqttq8I3joU46YdLqti5qR5ur+trz6+7MlufWBNdyDPhg4iLJsgFVg97mwsU
 rZfGSWYOtZUbCRw51brKem4x+8d0yIpEjn51cY0bRbApaPmstpaUcHNCwcvrRaxth09lGkYdy
 P9/YTYBjn2OP12F8GUmgytK3nL0Cfa/MyAtAsg4Fo3c3Zy5+dwHn1sCghof4IhkT+eLxCo4l5
 vLP4TbuPl1Dk4FoBd5RLlVLHyeY3z0ZNpM/riNDmIMT9/Bt/UqavViADoStwvmW5vMHs4LAOf
 IQRq5mQ+XhpQkcI1BGRRu07o9xRUYxOiQPY0XtPZiBit0CjFHM9P1j1Yf24Sdhm6XEpMRwnGu
 p4XycpM9XD1YgZu5V6HMWpwafiNbRh60HKL+3iqTAClGRIYcAIQY8FsC1aN1Eb4ZovskBbj50
 RMdIvkRzRL84f50ryFPEZokL4z6nezgKdmS6n3IVHzd08F77OiRKr2dfJm6UbfLhhOQjMlXWy
 /gzM12xZ4WMqUC13oz1jYyMNKPDG0iGCHubFf2aypUmeRt3zWA4d+w21q7URbFuPip/pHQg6s
 06HtaVvcztiB+ynL7u+DEPEhz14WmJVfx4G+ru+OpK8emwk3Qtbv1UMN1gSEfhmCHz7Ea4rGA
 ajS9UoQPH/fEWnOv7lRHndXLZ2chn8FVcat+IUtkEDjbThhMeWSXYUzvYzWECjgLqoegvod49
 WJAY4IbgYUNYrH7ae/TFFwK3e1RPX4wQL065mfuYSLHRjY1ev9PVXaL75iWt0oTl3VbHMeU4V
 KldYNn3GSzRMknWAvDYlzVi3ubg=
Message-ID-Hash: KKVACR2GZZWSYVK37U2Q2OBSVDEURQKA
X-Message-ID-Hash: KKVACR2GZZWSYVK37U2Q2OBSVDEURQKA
X-MailFrom: bjoern.foersterling@web.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KKVACR2GZZWSYVK37U2Q2OBSVDEURQKA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

after looking at the documentation and the examples and I noticed that the =
examples are not
compiling.

https://www.alsa-project.org/alsa-doc/alsa-lib/_2test_2pcm_min_8c-example.h=
tml

$ gcc -Wall main.c
In file included from main.c:6:
/usr/include/asoundlib.h:1:2: warning: #warning This header is deprecated, =
use <alsa/asoundlib.h>
instead. [-Wcpp]
 1 | #warning This header is deprecated, use <alsa/asoundlib.h> instead.
 | ^~~~~~~
/usr/bin/ld: /tmp/cc1pkxGK.o: in function `main':
main.c:(.text+0x5a): undefined reference to `snd_pcm_open'
/usr/bin/ld: main.c:(.text+0x6d): undefined reference to `snd_strerror'
/usr/bin/ld: main.c:(.text+0xbe): undefined reference to `snd_pcm_set_param=
s'
/usr/bin/ld: main.c:(.text+0xd5): undefined reference to `snd_strerror'
/usr/bin/ld: main.c:(.text+0x11d): undefined reference to `snd_pcm_writei'
/usr/bin/ld: main.c:(.text+0x141): undefined reference to `snd_pcm_recover'
/usr/bin/ld: main.c:(.text+0x159): undefined reference to `snd_strerror'
/usr/bin/ld: main.c:(.text+0x1bd): undefined reference to `snd_pcm_drain'
/usr/bin/ld: main.c:(.text+0x1d0): undefined reference to `snd_strerror'
/usr/bin/ld: main.c:(.text+0x1f3): undefined reference to `snd_pcm_close'
collect2: error: ld returned 1 exit status

Is there a working version of that example somewhere or can someone help me=
 to get this working?

Regards=20
Bj=C3=B6rn F=C3=B6rsterling <bjoern.foersterling@web.de>
