Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 229E71A7533
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 09:52:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCEF116A2;
	Tue, 14 Apr 2020 09:51:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCEF116A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586850729;
	bh=ZxmgDJQCYvN5UDrL1T5SEa/OomP0wN7bxg+1duIt/Lg=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=irQaf2O/1+dQ+fzZKxZuI69ls6vsbgcrBDp9ltGlqeh61fdRGETr7+MhiqWnmZavs
	 NPYgeDOLt9UCnxpL8RmX66VHPj4d5n39OEqKpi5pPS4OSN62hvnETB1eWJ4mvc2l7X
	 Gi+wr/+tDbenOco4mPc7smrDqWpBIqbCkAa2q4Dw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEA4AF80315;
	Tue, 14 Apr 2020 09:42:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0881BF8013D; Sun, 12 Apr 2020 13:43:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D917F800B6
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 13:42:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D917F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CL8dalZj"
Received: by mail-yb1-xb42.google.com with SMTP id t10so3761963ybk.8
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 04:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=DlNubOsGgG9UnvRSmJsP6nkFgf/TGrRpd6lbJPBtZIM=;
 b=CL8dalZjC7YzahQHAtKyld4xUc2hrOr3Ikd5KbThOImr8svFvepVXg7wCBKwP4Ue4b
 4a7V0jzah0cSLx7lIzNof3N2I3j/PEB/UmYfIFeOACpDTF/7lon4fKCBRmS4C8+WCFAO
 4QlAoXJBg2Ily8OZE1eNzHu1uEkpR50vKgWvl3r3LOmywrR/R5Eu8GhlvEZMsqZHr5fd
 JkvTQicK3mmE+OTjgiifbv6I3QzySU1IdP3I3MOfKqN8M8HVoHnVBFYYckYuYiPPby9U
 0L9lSK0GjjaNH7C3XV5xeHnj9O6GC4N6WXcEPyzcjy1BpjfeHcR1G5Sdc755Jw2CI6zt
 HTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DlNubOsGgG9UnvRSmJsP6nkFgf/TGrRpd6lbJPBtZIM=;
 b=MNQzC5DOrcOGKL1Pu+DF+sKChF76k4122B9YB6sgPmic33EUKqCYN3z+NGHIdFkJ7w
 X8aAAIRTmVOpGTtafVIIk9QYbBn2tnxcad0/9clQW5Hi4q7JEWloFLyNf7ImjuuU/GDg
 pDi5C9ZXHvmQo0uyMm97cL3EJMltRWhmELATisvSar+NS6csJwNse23KTIcl+o39v4t7
 ilQCBUSIgCHADHjAv/qP43lOl0E4JLk6addjiMLrcr78e890tQOaTYP/+ExF9nKMXkxY
 lrcqnqhb2AY4jPTqoqGFcUdOoUl7gBO8pvxr8MWE+z5bajh13jZbKuS3928GIO63RTgO
 x7mA==
X-Gm-Message-State: AGi0Pub/QyI960Wh+zj6AoAdCsviUpFAezML7NLqDUZNMSyG6EEkHWhO
 G5waE6iUse4DD/6Rc4iMZhjEZPQjBHq/1w1V9QX7LkdfUDdywR57HLg=
X-Google-Smtp-Source: APiQypK3PGCfgg/NCGRNGvVh3jwQ6opk3PigVFaJTEkkyk/f0ZabcJk1UxbXQ5DeL338fsFqAe/+ls5KgraTjouXFMw=
X-Received: by 2002:a25:800f:: with SMTP id m15mr18976982ybk.320.1586691777525; 
 Sun, 12 Apr 2020 04:42:57 -0700 (PDT)
MIME-Version: 1.0
From: n c <ironincoder@gmail.com>
Date: Sun, 12 Apr 2020 11:42:46 +0000
Message-ID: <CAHTAdq1bmbjHu9fuK-TV-wG2aVCgGTYdhorQjV7LE+Myv1W0xQ@mail.gmail.com>
Subject: desperate to find a fix for ALC298
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Tue, 14 Apr 2020 09:41:56 +0200
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

Kernel: linux5.6 (source here
<https://github.com/torvalds/linux/releases/tag/v5.6>)
Distro: Tried most for months since linux5.4 (currently on manjaro)
Desktop: gnome
Alsa-info: (pastebin here <https://pastebin.com/w35JGdGu>)
Any configs: No just the defaults (no alsa/.asound, pulse/client.conf
etc...)
Cards: Single on-board Realtek ALC298

*Issue*
On-board sound does not work at all. Neither on speakers or headphones, no
matter which distro or kernel I tried (since 5.4+ of course).

*Have I asked the community?*
I have a SO question here
<https://unix.stackexchange.com/questions/579486/alsa-pulseaudio-and-intel-hda-pch-with-no-sound>
and a manjaro topic here
<https://forum.manjaro.org/t/alsa-pulseaudio-and-intel-hda-pch-with-no-sound>
.

*Have I tried fixing it myself?*
Yes, a lot. The threads above both have a lot of information in them.
Highlight of my debugging so far is that the codec pin "0x1a" has an
incorrect VREF assigned to it (HIZ). Found this by accident when using
hda-analyzer. Changing it to VREF 50, 80 or 100 fixes the headphones. Have
no idea how to persist it using init_verbs (don't know how to package the
new value 0x05), so wrote a systemd file to hack it using hda-verb utility
at startup. It stopped working eventually or sometimes had to stop/restart
the service to reissue the change. I read somewhere that the incorrect VREF
is a sign of UEFI/BIOS chip assigning incorrect speaker pins. Although I
could not get the speakers working at all using any utilities mentioned
above.

Thank you for reading,
