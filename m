Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBFE4FAD06
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Apr 2022 11:15:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 886C91748;
	Sun, 10 Apr 2022 11:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 886C91748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649582115;
	bh=6e8hhd4bMl6yvFivzulWwLd0jJ/QYzJD3wm7Kr4IQLA=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LCslQoINkOLajZp8YHKUXgxo5RCHY4rZyK7Qnaup41dAojYxj4hJ6cJbFZDA9dgI+
	 +F+rB1zEqOI2OhXwS5XFlynF2PI1CYZS3KLI8XmIkjBMtubDprnR7RnyfG6VgflJzc
	 a7a7aEXbdK79uKHw1IkXjTOeZNaZibWD3Uru6bfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00CEDF80217;
	Sun, 10 Apr 2022 11:14:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75146F80128; Sun, 10 Apr 2022 11:14:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCBB7F800F2
 for <alsa-devel@alsa-project.org>; Sun, 10 Apr 2022 11:14:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCBB7F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QkEh1cbc"
Received: by mail-pj1-x102b.google.com with SMTP id bx5so12456117pjb.3
 for <alsa-devel@alsa-project.org>; Sun, 10 Apr 2022 02:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=WDPfrzxoEqoQc1/eGWlrbqzJhsvrBmHHWTvNKjsYkJM=;
 b=QkEh1cbcPct4JczcOnXh+aKqtrHGkH6NNm7c3AONE1RhylRzyBpeOLzvd7XWaCm6XH
 0w+5Wx7u/vA05q6JUyqN7PQhtlbPVEysyU/yzh0BQULuiFdn8agGYwB+505VhLt4peSN
 4TQqL0CwpNkLD+pXkok19uXrGYOz1aLuv2SoKOxiG7XXzfYrJOFdAFlZPt91JtvjVucl
 8meujpcl/phahG9kPygAXIHfghNcXE4SYZgupB24Crh1GdY5Wp3W4DUMacPMraqYwDHG
 Ihs0My6BDesqs2JDr04owaQwiBUL40bYC6Zr0GgT47YsCjoM5Q8dxiknldQpzfe+gFOU
 BG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=WDPfrzxoEqoQc1/eGWlrbqzJhsvrBmHHWTvNKjsYkJM=;
 b=pSsOfUu7XH7JvlCgteFdoec0+F5Oh9aCRexDKlUn26KCBp6K+gx7d4VmO+7HGpoGcr
 Fdg228DCagBc+O6twxOn9jgkDzk7S9zksOHQ2/L1AfPpK4DsGA74lDCdjOmtXzaDj+3R
 gGyHpee/c0O9/c+k3Ur4Y3W5ngzZC+HaHHCTdg161KNjV1R+zU1k9rGgYWKkuH6FUZPI
 fUKIjpjeuRSP2O2msvOiB0yYjUy+ewJzUXsi1fh6bbRxVYv9j2JuELAKw4SaeFnHAeDW
 pft28fbXk0BbkwuxLTIhpMpWxrijNwj8rHnFEEZEdQLxzVFg3ykx+ef4ZfbcL6pe63YF
 bEiQ==
X-Gm-Message-State: AOAM532VUrc2iVuteCncEAtqnoKuoZOQ/vIL3AOg1fS96TAILSYtqyxw
 mfxuFKtJ0ABtev5P+0Ik6QkMBbhekCCzcPl5eg==
X-Google-Smtp-Source: ABdhPJxlVIb0T0CZqME8DQnXouztNp0D0cA7yEivwZdQ+Mrtmiv3y7hyXAvfEkrS8G4zaFx+aG1mH3vaE5zcmg+cO7w=
X-Received: by 2002:a17:90b:915:b0:1ca:b584:8241 with SMTP id
 bo21-20020a17090b091500b001cab5848241mr30853251pjb.46.1649582046260; Sun, 10
 Apr 2022 02:14:06 -0700 (PDT)
MIME-Version: 1.0
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Sun, 10 Apr 2022 17:13:55 +0800
Message-ID: <CAMhUBjm2AdyEZ_-EgexdNDN7SvY4f89=4=FwAL+c0Mg0O+X50A@mail.gmail.com>
Subject: [BUG] ALSA: echoaudio: warning when the driver fails to probe
To: perex@perex.cz, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

Hello,

I found a bug in echoaudio.c.
When the driver fails at the function snd_echo_create(), it should
release resources requested before, otherwise we will get the
following warning:

[    3.262866] remove_proc_entry: removing non-empty directory
'irq/21', leaking at least 'snd_indigodj'
[    3.263577] WARNING: CPU: 3 PID: 261 at fs/proc/generic.c:717
remove_proc_entry+0x389/0x3f0
[    3.267098] RIP: 0010:remove_proc_entry+0x389/0x3f0
[    3.269976] Call Trace:
[    3.269979]  <TASK>
[    3.269988]  unregister_irq_proc+0x14c/0x170
[    3.269997]  irq_free_descs+0x94/0xe0
[    3.270004]  mp_unmap_irq+0xb6/0x100
[    3.270011]  acpi_unregister_gsi_ioapic+0x27/0x40
[    3.270017]  acpi_pci_irq_disable+0x1d3/0x320
[    3.270025]  pci_disable_device+0x1ad/0x380
[    3.270034]  pcim_release+0x566/0x6d0
[    3.270046]  devres_release_all+0x1f1/0x2c0
[    3.270057]  really_probe+0xe0/0x920

Regards,
Zheyu Ma
