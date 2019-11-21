Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C940105505
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 16:04:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 949DB1782;
	Thu, 21 Nov 2019 16:03:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 949DB1782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574348661;
	bh=U2zWvNUzTPfCjKy53a0GGFA2528RDxAK0LnHI3SCoso=;
	h=Date:In-Reply-To:From:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=DHmc7LFVeeN7n7+WG55NjSQ/6oRqTfzGQUIhOeOAlQUmzaaykLreYekl/aqJ2JrCx
	 iAoOQP6+X1YSr+A+Z9TFhlm22Qsj8zfc+U8ZUtECA4e/E9hvU6qflBWHAMrYKuv7wk
	 IlM62qpLPZUWtL/D+f0WTvR4hl7s6XkJ3Yx5nkaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE3F5F8014E;
	Thu, 21 Nov 2019 16:01:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C57BF80146; Thu, 21 Nov 2019 16:00:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EAF5F800F0
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 16:00:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EAF5F800F0
Received: by mail-io1-f72.google.com with SMTP id f66so2397970ioa.21
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 07:00:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=ss8b6/361E3xQgXhoZEYKHN2dErL3lbrsVOt2HQ4G28=;
 b=Wz4cjWq4EXChoPg9IGzP0WkjFWK/8eCS1FjlPhz1lv9bB4wEzwt4ugfpOIzlclQtR/
 WJG93W1xpQ05DsURio0/Sg8sE/FRsSrOtKPI/1UqVRs/NRqMNnKBgRoAGSK+Cr4Y3895
 9sN5vBel96n6D9zPvrYuClq+KK9mPZmmo0iBpJZhCUFYePdAJZ/8JzDOYgKJPwxpsn7V
 uyEbDc3DZFUpqysAvMamptbdPYWrJthUNFEmxhJ2xO1u6WZz12WR9kmvYiCGBJE2TcPz
 ekXGAItzo9H2NTg9k8tljrVBN3YzZvdT41rzlkMgqwHr4DGMKahjO1RHCMvTCu1TFi7P
 q+vA==
X-Gm-Message-State: APjAAAVdNFmgxess7UHcYRvCEeTJocvxs0n1MEkvDdNFLF0RW/QOz5Vd
 9VbLxoL3tQHYKg/n8ApzCXCgx9zv8H7C9PIIRWXvySHK5dVy
X-Google-Smtp-Source: APXvYqyCE3fIAS/eC3JiBF7ln0rcJKb0Mpnhw+NSQWlfaE9hNZqCT8kSX8wwCB901bHXK9fjJCwPCRFDQaQ+fjGMJaNsn83Bb8+C
MIME-Version: 1.0
X-Received: by 2002:a02:282:: with SMTP id 124mr9334489jau.6.1574348400631;
 Thu, 21 Nov 2019 07:00:00 -0800 (PST)
Date: Thu, 21 Nov 2019 07:00:00 -0800
In-Reply-To: <000000000000de3c7705746dcbb7@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002c243a0597dc8d9d@google.com>
From: syzbot <syzbot+3967c1caf256f4d5aefe@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, dan.carpenter@oracle.com, davem@davemloft.net,
 dccp@vger.kernel.org, gerrit@erg.abdn.ac.uk, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
 tiwai@suse.com, tiwai@suse.de
X-Mailman-Approved-At: Thu, 21 Nov 2019 16:01:49 +0100
Subject: Re: [alsa-devel] KASAN: use-after-free Read in ccid_hc_tx_delete
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

syzbot has bisected this bug to:

commit f04684b4d85d6371126f476d3268ebf6a0bd57cf
Author: Dan Carpenter <dan.carpenter@oracle.com>
Date:   Thu Jun 21 08:07:21 2018 +0000

     ALSA: lx6464es: Missing error code in snd_lx6464es_create()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10dd11cae00000
start commit:   eb6cf9f8 Merge tag 'arm64-fixes' of git://git.kernel.org/p..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=12dd11cae00000
console output: https://syzkaller.appspot.com/x/log.txt?x=14dd11cae00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c8970c89a0efbb23
dashboard link: https://syzkaller.appspot.com/bug?extid=3967c1caf256f4d5aefe
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11022ccd400000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=124581db400000

Reported-by: syzbot+3967c1caf256f4d5aefe@syzkaller.appspotmail.com
Fixes: f04684b4d85d ("ALSA: lx6464es: Missing error code in  
snd_lx6464es_create()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
