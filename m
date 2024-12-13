Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CFA9FDED8
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Dec 2024 13:55:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8438D604BC;
	Sun, 29 Dec 2024 13:55:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8438D604BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735476931;
	bh=+agX/hxnK7PsbXVWPwKhiB1V054xuEENK8nIoWK3fi0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UfKh4Y/sBQrNSaq1V6vYnAeJYaHCRJ7MUkSZ3laDBGgZI13jz1aSIYdwoxAa/zWSz
	 MERaJKho4zzr5V7w5pbIhmWd3NF5mNDuTq7sQtImTsxtEge1BagukbjcbySKCSUrip
	 a9AnClzhOTsewzCNwS732as7yTnOw6DDo6tzhjxA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EE8DF805DA; Sun, 29 Dec 2024 13:54:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF9CDF805D2;
	Sun, 29 Dec 2024 13:54:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DBF9F80212; Fri, 13 Dec 2024 13:19:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SORTED_RECIPS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_SBL_A,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEA85F800EE
	for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2024 13:19:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEA85F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=VlLUbxMg
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d3d14336f0so2946879a12.3
        for <alsa-devel@alsa-project.org>;
 Fri, 13 Dec 2024 04:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734092357; x=1734697157;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rswNLiWFuDKiW42rbnE3/FFvogIGFwro7QX3xwapVa8=;
        b=VlLUbxMgy3usTWxyQoBVyroQan/dTHa70V+xfGR2ESQKrYsWBfw+YaTXntyYfl+oof
         FT0DxQ60sDvo+i1pif9AxMAQ9nBoleEpufepf7/WrkToBS1D4Kh/j68B32GfIYTnAU5j
         PBztMAPc/HpjP8ZbW6Scq+0vxwiZ7FtNwFut9w/difPZO0wnIwiLGC72mP5t2J+Rjha9
         wZyQS1JT2fqg8wdPJng1Bzv2aL9jeZZPPihVyOP1pF2td9QitTLCMQhzoncnAmN2XaEj
         C9LaE8sMdT+BXDg9++rQ+7MOVxAVaBXl0CtquBnvS32WjmgyY+cpauqpFKXglN/K41KZ
         viOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734092357; x=1734697157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rswNLiWFuDKiW42rbnE3/FFvogIGFwro7QX3xwapVa8=;
        b=Giexo2XrX+l/v80/Gz08A/W2MEvp9hN4zpiS2uwc0pJWjX4Vmk5IAfXK+jchpSMmVp
         B5P6PgR8cU1nl9qxEl9vLttVkaLFiRFx5xkS2+Prf81TACUHlMtLsM/6PcWzrbFR0UEc
         hE64m+GdH4eGzi1CvePRGdUjtl1sTxO8hGyhl6WKrfb8rSz5mzCeGReWEc5fMXOOFxhZ
         iXLAIjObmaoaRiIAIa2iG+cIYYyTNBABSHI2Ivw/uOTCHCEWNoY8Zo2iD5lZbWVf0kyd
         QlTRcFK4xPsad7mdH9QjUKJ9OkzfHTYbuI9nu+VeHYxemR/2kZnNOC5XGcyR5rId8Y5L
         D1VA==
X-Gm-Message-State: AOJu0Yz2h0TyS6LVux99RZhfd5bDWjBBk4qOMnALueYxof1H0A1qvgQh
	OxAPh4N2kPN9QBvzQ+59y+OuuaG95QiQZYy8dzHp8qqiM9bAfuMNZGyPoL/ojDNPVVEKBJ1EitF
	fJtTl0P+ToUPQ10kogutQwhoYEf2CfZ+iwOJh
X-Gm-Gg: ASbGncsX042omfnf8DS+3cORg8ijL60HAaPl9A0W0NxkaJ0az4Ud8A++d1BckncnV4u
	eHEgkJ704gozWDQ25G4++X7HWlYikDQ7F78CAjQ==
X-Google-Smtp-Source: 
 AGHT+IGRpkdDBASQbA4W9W4t1BgK2dSzLTzvJG9Vc9UhANfCeYe2U4Z/qo2tMOoP0ps7OytKBednRAPV6i81BAZBwaE=
X-Received: by 2002:a05:6402:2790:b0:5d0:b51c:8478 with SMTP id
 4fb4d7f45d1cf-5d63c3158c3mr1721305a12.12.1734092352701; Fri, 13 Dec 2024
 04:19:12 -0800 (PST)
MIME-Version: 1.0
References: <675b61aa.050a0220.599f4.00bb.GAE@google.com>
 <675c1dc6.050a0220.17d782.000c.GAE@google.com>
In-Reply-To: <675c1dc6.050a0220.17d782.000c.GAE@google.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 13 Dec 2024 13:19:01 +0100
Message-ID: 
 <CANn89i+Zm_0a5jqtsL5m-S4=E06mdQXA8RLaFEF75Y6umFWxpQ@mail.gmail.com>
Subject: Re: [syzbot] [tipc?] kernel BUG in __pskb_pull_tail
To: syzbot <syzbot+4f66250f6663c0c1d67e@syzkaller.appspotmail.com>
Cc: alsa-devel@alsa-project.org, asml.silence@gmail.com, axboe@kernel.dk,
	clm@fb.com, davem@davemloft.net, dennis.dalessandro@cornelisnetworks.com,
	dsterba@suse.com, eric.dumazet@gmail.com, horms@kernel.org,
	io-uring@vger.kernel.org, jasowang@redhat.com, jdamato@fastly.com,
	jgg@ziepe.ca, jmaloy@redhat.com, josef@toxicpanda.com, kuba@kernel.org,
	kvm@vger.kernel.org, leon@kernel.org, linux-block@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, miklos@szeredi.hu,
	mst@redhat.com, netdev@vger.kernel.org, pabeni@redhat.com,
	pbonzini@redhat.com, perex@perex.cz, stable@vger.kernel.org,
	stefanha@redhat.com, syzkaller-bugs@googlegroups.com,
	tipc-discussion@lists.sourceforge.net, tiwai@suse.com,
	viro@zeniv.linux.org.uk, virtualization@lists.linux-foundation.org,
	ying.xue@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: edumazet@google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: O6OOCLQX7VTOYB7Y75CWEBJ22LXISB6P
X-Message-ID-Hash: O6OOCLQX7VTOYB7Y75CWEBJ22LXISB6P
X-Mailman-Approved-At: Sun, 29 Dec 2024 12:54:36 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O6OOCLQX7VTOYB7Y75CWEBJ22LXISB6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Dec 13, 2024 at 12:43=E2=80=AFPM syzbot
<syzbot+4f66250f6663c0c1d67e@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this issue to:
>
> commit de4f5fed3f231a8ff4790bf52975f847b95b85ea
> Author: Jens Axboe <axboe@kernel.dk>
> Date:   Wed Mar 29 14:52:15 2023 +0000
>
>     iov_iter: add iter_iovec() helper
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D1742473058=
0000
> start commit:   96b6fcc0ee41 Merge branch 'net-dsa-cleanup-eee-part-1'
> git tree:       net-next
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D14c2473058=
0000
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D10c2473058000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D1362a5aee630f=
f34
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D4f66250f6663c0c=
1d67e
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D166944f8580=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1287ecdf98000=
0
>
> Reported-by: syzbot+4f66250f6663c0c1d67e@syzkaller.appspotmail.com
> Fixes: de4f5fed3f23 ("iov_iter: add iter_iovec() helper")
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisect=
ion

Great, thanks syzbot.

Patch is under review :

https://patchwork.kernel.org/project/netdevbpf/patch/20241212222247.724674-=
1-edumazet@google.com/
