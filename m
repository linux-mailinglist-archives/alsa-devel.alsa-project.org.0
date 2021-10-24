Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC6E43AC34
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 08:18:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7626316ED;
	Tue, 26 Oct 2021 08:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7626316ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635229131;
	bh=rYmM2tHF5GwYOrVO2pifT1zJDl5ObPQs5/1DUqbNeoc=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V0402jpwu5azgkyPUQoht5YhW9+O620tQx5ZKgS2H0DmfqUiyQRDKXJC5SpzkX0rN
	 98rCaet/1oUrQy7ul8UICvOSfJuw/juJTNN4of5YkfowsJph/2VmvH1SwB+/EVTpeu
	 6gk51UvLWpWQkcXcNlpVmr5/hOzuPKznCCJZqZ9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FEA3F8051C;
	Tue, 26 Oct 2021 08:14:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9128F802C8; Sun, 24 Oct 2021 22:56:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32153F8013D
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 22:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32153F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="R+g1fa+L"
Received: by mail-yb1-xb2d.google.com with SMTP id y80so2689792ybe.12
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 13:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=ETRiIAnvUod5Qf3W8eihUx0QJEqi5chByaPkyic/oU0=;
 b=R+g1fa+LjaTNJ+dd/0ghtAAomvNWMkcUtRT++kIawmfzkD6fA9OFfVUsryxmbfJEFJ
 r3aaShC0ix5Gq6VPdgJnHuuwTF1erpVA6qJIUOBYQub9S2Rz1aY1ePt1HMtIEIKf/2RX
 3VzI59VDmEJNNin0yWTd49ryz1vA42ixzOPc4287O63wgpRK9BPhRorLEdWPrmSWqFQ/
 TtenHr0x630t3dfHmGJhqTVd5sPv3UV8PWMLjYrluHkZWLG+4Q5nvEAnWf1x1H1f1gf5
 luvl1bMYJD5W7PM1+FSo07X/0mI5lhou94lj7vbGv8uEntJ3XiEK3KntybOLV4ngZ5Ax
 XHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ETRiIAnvUod5Qf3W8eihUx0QJEqi5chByaPkyic/oU0=;
 b=sBHsfQs43hPhoBFMzviyMDjYgyQzivZp3+hSaAtBKSQD0TwEbnuUfxQiUQXR4214Ea
 Ab9fomDVmKcBIMcS9h1UEeGzD1Sg588SJyPMC5Zks8J+SrOCT+9IZh2hQDIeneW5Kdsx
 9hsON+x7v9IlGsE1jJaobKgsr0WtQFgi4okMoem8ZOL6w7oyp6oOKwNWJzVN2iCGM9Bl
 c0lqoHNzHXZRoh3195iqI+y4iwQ0YNn+Ayg9GeFkmYYtzrHah8roOXKzYdBbxnEDSymy
 MulbAkIiAKYX3MOUQoER+UwAXZ3m2ErvOdjgty/rBG9FYtG54I00FJOBoHUHmbURRlFG
 Hxxw==
X-Gm-Message-State: AOAM5324dXB6rL4x7NAXpuSVW6FpUOZvgWwcrRQ+0c1GzXazo0Ol5zuP
 C8aZqtqY27ao4E3CtFOYSYj8xH4YYHCy/vyipWS6M4dVlh0t/w==
X-Google-Smtp-Source: ABdhPJz0YWxShh9RZtL9dbjJddDoZnEPkItV+rRJRvndZO8Ij2k+D6gjJbss7RdatrAEWwr+Sn5vX+4iW164Cok+OHI=
X-Received: by 2002:a25:2d48:: with SMTP id s8mr13732600ybe.380.1635108959081; 
 Sun, 24 Oct 2021 13:55:59 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?0JLQu9Cw0LQg0JzQsNC60LDRgNC+0LI=?= <vladmak04@gmail.com>
Date: Sun, 24 Oct 2021 23:54:14 +0300
Message-ID: <CAEMSB4AGR53OVO=htrrKhy28WTAsw9+P++CX6i751Nms-4gdmw@mail.gmail.com>
Subject: Mute LED on HP OMEN 15 needs a fixup in hda_intel
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Tue, 26 Oct 2021 08:14:36 +0200
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Greetings everyone
I am not sure if this is the right place to ask, but I don't know where
else to look for help. I have a laptop (HP Omen 15 2020 amd)  which has a
mute button (Fn + F5) which works great, however, the LED indicator on it
doesn't light up. With the help of this article
<https://asus-linux.org/blog/sound-2021-01-11/> I managed to figure out
that I can trigger the LED with the following command:

sudo hda-verb /dev/snd/hwC1D0 0x20 0x500 0x0B && sudo hda-verb
/dev/snd/hwC1D0 0x20 0x400 0x7778
And disable it with
sudo hda-verb /dev/snd/hwC1D0 0x20 0x500 0x0B && sudo hda-verb
/dev/snd/hwC1D0 0x20 0x400 0x777
I think that a fix should be added to patch_realtek.c
<https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/sound/pci/hda/patch_realtek.c>
 (to change those values when mute button is pressed) but this
requires knowledge of C and kernel stuff.
I don't have much experience with those so I would be very grateful if
anyone could help me.
I have also filed a kernel bug report
<https://bugzilla.kernel.org/show_bug.cgi?id=214735> (with some useful
attachments) but nobody responded there.

Thanks in advance
