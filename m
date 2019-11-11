Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60125F8CA5
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 11:19:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0006B165F;
	Tue, 12 Nov 2019 11:18:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0006B165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573553971;
	bh=LuTxY3rdFlZCzrsjTYfy0O+lwOx5G2jdkhtfQzGq+YI=;
	h=Date:In-Reply-To:From:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=IPEwgcb00yJYlaMWBZinp3CwnARDnA4C39+lvQTrbFLqcKveuBLMuluOz/ZIJfJxG
	 tAJwIIFPuaOH+ukfUZczZUbBkfTEXLwpkYs7HqxIlI2nDICmY6KH0LwtyvAlfswvv0
	 Ht4oDb0Zsl7Yl+w5XQW0ZzO98ICSQK6z0RkN+OKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 065BEF8063C;
	Tue, 12 Nov 2019 11:14:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F2C9F80506; Tue, 12 Nov 2019 00:45:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 654CEF8015C
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 00:45:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 654CEF8015C
Received: by mail-io1-f71.google.com with SMTP id w1so14731092ioj.9
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 15:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=upaZmQpBla0D2GJufrH+1eVVJ7+lAzflwX+ckLKLrsg=;
 b=b3ZEHPb7L/e6yVEf7DzKj0NOneGt14ZotfsjqQZa8Zi9cCkQz5VQAEXWZjN8pa6ESZ
 uyFvv0ps69kdX+98Esz5NldI4nB1WnSJVcOVGSjcQ6CoU0uOBkuQQ0Pw+kpWlDl+wnp8
 FE2QlP/M/8J5qZsDXfTwPqshb0rvxWhHn5WEv/2b3Eyf+Vy1j+cAft4jHA3AmwOFQHGL
 hUD09kfRmjoemTA2iUsq/Ervru3TlHjQCB6l91h0CL5HHyEkDfPXJRIRDq4PtS970SL7
 PStids78hhhBTa4mwZMQwQTF+wh42KXY2ErPOry/jTL14Cg91zPdPwmX5uczcJd0K1af
 1i5Q==
X-Gm-Message-State: APjAAAWdLqDMjc68cAv2Rc2pnPgfF40qwXiFmpko4VyyNzk9u29+DP5l
 owxrAZ8Jsb6EmOPsuJVWg6OeWL/J58Rddq35X75zn9KZfnFI
X-Google-Smtp-Source: APXvYqxq9lv/VmQ8ezGOcmCF95BVBz118ALVK0je34s/k1S1HcLJ9P5+EYXmjYbL1lVyXHvAoXlRLBYt7xYeZz2aTy9+bxdsRhud
MIME-Version: 1.0
X-Received: by 2002:a6b:660b:: with SMTP id a11mr15664068ioc.283.1573515901287; 
 Mon, 11 Nov 2019 15:45:01 -0800 (PST)
Date: Mon, 11 Nov 2019 15:45:01 -0800
In-Reply-To: <0000000000007f69a2059714b34d@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000058443705971ab84d@google.com>
From: syzbot <syzbot+4476917c053f60112c99@syzkaller.appspotmail.com>
To: alexandre.belloni@bootlin.com, allison@lohutok.net, 
 alsa-devel-owner@alsa-project.org, alsa-devel@alsa-project.org, 
 bhelgaas@google.com, enric.balletbo@collabora.com, gregkh@linuxfoundation.org, 
 kirr@nexedi.com, linux-kernel@vger.kernel.org, lkundrak@v3.sk, 
 logang@deltatee.com, perex@perex.cz, rfontana@redhat.com, 
 syzkaller-bugs@googlegroups.com, tglx@linutronix.de, tiwai@suse.com, 
 tiwai@suse.de
X-Mailman-Approved-At: Tue, 12 Nov 2019 11:14:25 +0100
Subject: Re: [alsa-devel] KASAN: use-after-free Read in snd_timer_open
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

commit 6a34367e52caea1413eb0a0dcbb524f0c9b67e82
Author: Takashi Iwai <tiwai@suse.de>
Date:   Thu Nov 7 19:20:08 2019 +0000

     ALSA: timer: Fix possible race at assigning a timer instance

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16b5dde6e00000
start commit:   6980b7f6 Add linux-next specific files for 20191111
git tree:       linux-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=15b5dde6e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=11b5dde6e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2af7db1972ec750e
dashboard link: https://syzkaller.appspot.com/bug?extid=4476917c053f60112c99
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=108fbfece00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1055d5aae00000

Reported-by: syzbot+4476917c053f60112c99@syzkaller.appspotmail.com
Fixes: 6a34367e52ca ("ALSA: timer: Fix possible race at assigning a timer  
instance")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
