Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8141B0422
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 10:16:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E36471671;
	Mon, 20 Apr 2020 10:15:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E36471671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587370583;
	bh=lJPmfIhxskuEVN0sQJrDkjM6OLotlmIxpqTJj4OYe/8=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M+8wUr9uqTHzcJ1SKJOLRbHlZpbWRYFTNqdpitdkwT1EaOAGGTRZgwG/OmoLiKnKq
	 tc3809mPTgpRrnyhUQS8pSbDVUmdhlnsOBMo9VUYFYkGNTcO4aEuqLbCY5G0a6iomn
	 D9iH2YvuQMhZ5AnsKKTm6p+U2QtF/ovaagVq3WEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C2FFF8028D;
	Mon, 20 Apr 2020 10:13:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 445E5F801D9; Mon, 20 Apr 2020 09:22:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D6C3F8012F
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 09:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D6C3F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Uru540pI"
Received: by mail-oo1-xc35.google.com with SMTP id 190so1900759ooa.12
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 00:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=xln4YDfUucddPO2RJjviiXNHhEKT4FTEt8hSue+CsDQ=;
 b=Uru540pIiEOaCaISeIQGvJld/naAvaf7lbWhlsPgpwc3GBkVHkw4z5rNHQlmSqa2Dl
 PCjDgbMNvaqP+KbVRk+DS6g0rRj2Xqrx1bwxsMMI+w8z+98mV+MfvSOEqq9t5iTkyMwF
 wzAiHqKZfkKW1WzGChL4C+GoCY4mQ4zreOSOTlcgxkgeVA+GWqWXXaJEcR0dE0dE2vBZ
 PNM0ZlrHftCXwZ+qnNbAIOQI6J5dyCXJmu7nrTTdhFoaZM1JAx6V5CO9XX5ConnneQuE
 2EdVb3dfBHJEzP6xSy7dHxUDNb7UqNU1sv+gI+FVfr6YcbLHPu4lrYkTdYRHMTPd1eyC
 QZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=xln4YDfUucddPO2RJjviiXNHhEKT4FTEt8hSue+CsDQ=;
 b=VTZtCoZuwE6xlPGj0kKsmaHn0PYAHuXsndo7W/SW5LebA8GWAggZ4lYkTf+A6AU0EL
 E4Wgz4rnVfkRt2NJPQZw6NlaQfCnuf0wyQLiJSfrug+W1UaAPpwdg+etz6U3CEL8sNTH
 c7uqQOe8PsVxCefE95eenkW5k7d7il4TW0EBPBsj02OQl0j0v1TmLlXjaR7CYI6ZlrTH
 zPkgUoAbPl2/Bk3BF5bdLVodou4cvI56hM0SWqIxC0RQBqlBUNUZYY+4qbS0eI1cBqjL
 WVVNbLb+5NYL5U4s7GqZZ/AYCRBQmwZWWcP7v9ajIoOg1GG9hhN359wuJlVz668GT6O6
 JOiA==
X-Gm-Message-State: AGi0Puaujw4rXL/c4+ClMpEemQr+dFj8WRQhVMhJHQmozDXPp2c03gzJ
 3JTKn+i2WBPbY2ABZtKH4ZrQAUKvcms8PSRxnBE=
X-Google-Smtp-Source: APiQypJ94PMbnFeJkrXdWncuhwQBjB4LSv+S6Ay8r/DRlCK2D8qmSGR8nNJ5iX+VclsVx1/UqrSWOkmATESVaKQPSs0=
X-Received: by 2002:a4a:a54a:: with SMTP id s10mr12010459oom.73.1587367342093; 
 Mon, 20 Apr 2020 00:22:22 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?5Lq/5LiA?= <teroincn@gmail.com>
Date: Mon, 20 Apr 2020 15:22:11 +0800
Message-ID: <CANTwqXB+Lq1fq0dXUjToL9JhjcfSFwtqPpiFoRcFZeJC3o0s-g@mail.gmail.com>
Subject: sound: usb: usx2y: is it a null pointer deference in function
 usX2Y_rate_set?
To: perex@perex.cz, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 20 Apr 2020 10:13:37 +0200
Cc: alsa-devel@alsa-project.org
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

Hi, all:
    when reviewing function usX2Y_rate_set, here may exist a NULL
pointer deference if kmalloc_array failed or usb_alloc_urb failed,
in cleanup,  we should judge whether us->urb[i] is NULL first.
static int usX2Y_rate_set(struct usX2Ydev *usX2Y, int rate)
{
    us = kzalloc(sizeof(*us) + sizeof(struct urb*) *
NOOF_SETRATE_URBS, GFP_KERNEL);
    if (NULL == us) {
        err = -ENOMEM;
        goto cleanup;
    }
    usbdata = kmalloc_array(NOOF_SETRATE_URBS, sizeof(int),
                GFP_KERNEL);
    if (NULL == usbdata) {
        err = -ENOMEM;
        goto cleanup;
    }
    for (i = 0; i < NOOF_SETRATE_URBS; ++i) {
        if (NULL == (us->urb[i] = usb_alloc_urb(0, GFP_KERNEL))) {
            err = -ENOMEM;
            goto cleanup;
        }
        ...
    }
    ...
cleanup:
    if (us) {
        us->submitted = 2*NOOF_SETRATE_URBS;
        for (i = 0; i < NOOF_SETRATE_URBS; ++i) {
            struct urb *urb = us->urb[i];
            if (urb->status) {
                if (!err)
                    err = -ENODEV;
                usb_kill_urb(urb);
            }
            usb_free_urb(urb);
