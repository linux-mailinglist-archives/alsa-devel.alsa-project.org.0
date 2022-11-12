Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A82D6269CF
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Nov 2022 15:13:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C382166C;
	Sat, 12 Nov 2022 15:12:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C382166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668262426;
	bh=FUAs0o+GDqFg22g4vIeBAe72r6ZmtQdJPgN3z/hE7zo=;
	h=Date:In-Reply-To:Subject:From:To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=kHh+Kx/fkxfYvLdBWf70vFrhmck0hf5qI5IcyvuzTv581QMNB4/OlBxGnHbELkzxv
	 qGYwIzzKV3FZW308m3Krj1OqC28xZg5evJkefYKs7Tt0b0KyvSSi7d58IHtdr3L1PS
	 lT/39t2LCbcq7acov+bN4Q2hf/6fjho69lpx8gYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 643F6F80558;
	Sat, 12 Nov 2022 15:11:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16603F800E5; Sat, 12 Nov 2022 14:29:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SORTED_RECIPS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FD6FF800E5
 for <alsa-devel@alsa-project.org>; Sat, 12 Nov 2022 14:29:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FD6FF800E5
Received: by mail-il1-f199.google.com with SMTP id
 w9-20020a056e021c8900b0030247910269so2053216ill.4
 for <alsa-devel@alsa-project.org>; Sat, 12 Nov 2022 05:29:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SsnUsvhIwzsS7cZXIKYdGycWSuXBo6YozUvSoQomrm8=;
 b=FhSFjV50t1NaiaUTr53MpKzrPTQKKRGFqkADPl/QeYzGFWAsiqrRvpAKA3VCX/8fDY
 4C23AmmhIQVL514ov8DdmVMxzV2/6C1Tz7d9Ywzoc8P19a82+3tjFwzjmXcE9uDuPJYs
 oA/XCkEonXeR3WbrsPX0fwxkJLpkyW+RXVcUnMnaByBuWXzTBH/+1yv8LZg4AkVKumia
 hM26smc3RaOUlG6WYgZeFm6/WpRVxcDDJDS/LuTSIUiz3FHI2Ify8nSxOfpCfFZY3aQd
 n1y1LPr37iHkhxMVZ6hf6dM6EnBh4SW/GEHpTEIfX577hZf1E5JQuWcZWpqhFq+2v8AF
 9WpA==
X-Gm-Message-State: ANoB5pkQJ1G50b5OpJn+o/W1+Xz/xEJra/DnnaA/exFE06Tx0bLp1TFr
 UX6hTHakOfR+o83m6gyBajeD6unEAq6YN06dTZFV7ZNi7iJl
X-Google-Smtp-Source: AA0mqf6o/tGm0kyVXnxBAdO+ObJQdIvlTOuDuDp+X1w83mjSA0977oriViOeYIj1TU1YddlnHPU5j/Zf9LHYYHz313/xDqbZSGyv
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1303:b0:302:4f58:bcab with SMTP id
 g3-20020a056e02130300b003024f58bcabmr580521ilr.313.1668259761064; Sat, 12 Nov
 2022 05:29:21 -0800 (PST)
Date: Sat, 12 Nov 2022 05:29:21 -0800
In-Reply-To: <000000000000734a7305ed3608ba@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000073937205ed45fe5c@google.com>
Subject: Re: [syzbot] WARNING in snd_usbmidi_output_open
From: syzbot <syzbot+9abda841d636d86c41da@syzkaller.appspotmail.com>
To: alsa-devel-owner@alsa-project.org, alsa-devel@alsa-project.org, 
 broonie@kernel.org, clemens@ladisch.de, gregkh@linuxfoundation.org, 
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, peda@axentia.se, 
 perex@perex.cz, rafael@kernel.org, syzkaller-bugs@googlegroups.com, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 12 Nov 2022 15:11:54 +0100
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

syzbot has bisected this issue to:

commit 4f8ed19593872b710f27bbc3b7a9ce03310efc57
Author: Mark Brown <broonie@kernel.org>
Date:   Thu Jun 2 13:10:58 2022 +0000

    ASoC: tfa9879: Use modern ASoC DAI format terminology

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17433e69880000
start commit:   f8f60f322f06 Add linux-next specific files for 20221111
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14c33e69880000
console output: https://syzkaller.appspot.com/x/log.txt?x=10c33e69880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85ba52c07cd97289
dashboard link: https://syzkaller.appspot.com/bug?extid=9abda841d636d86c41da
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=160e91fa880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=161d3e69880000

Reported-by: syzbot+9abda841d636d86c41da@syzkaller.appspotmail.com
Fixes: 4f8ed1959387 ("ASoC: tfa9879: Use modern ASoC DAI format terminology")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
