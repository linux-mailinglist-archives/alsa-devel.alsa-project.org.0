Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C5359E582
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 16:59:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B54C1679;
	Tue, 23 Aug 2022 16:58:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B54C1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661266787;
	bh=0J2cwEYFBiQvRoI1HY/0IzligpoFInilfNYkCTKX5JU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KIjaXN0eDJIkTzI/mPnmLE6c4Vm1ZGdjawbv7GOB8ADr5A8tsMZVCSgQ5otsOn8lY
	 6N+yyHMBEa/t/AVfkToNDzOvRr3HoSEy2tJA+OOg1m/FlINqIw6BwUntH4kbSRhujL
	 64k9U57/o7Bx6P6EQW5kbmCnSBvYA4ehEWbyMStU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17E40F8030F;
	Tue, 23 Aug 2022 16:58:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64D36F8026A; Mon, 22 Aug 2022 22:01:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com
 [148.163.135.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0954F800ED
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 22:00:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0954F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu
 header.b="sjc0bWe/"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
 by mx0a-00364e01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27MJvIvj002278
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 16:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu;
 h=mime-version :
 references : in-reply-to : from : date : message-id : subject : to : cc :
 content-type; s=pps01; bh=NwBaqiqjV96gAiGASIa98OtPq+SfiPYIbjEAnvA4dsc=;
 b=sjc0bWe/aj80GAcnYz/CgAJyhJhBlsgxU3mYwfYVcq0SPacsljHF6oHJKBu7Pja2KOLZ
 yuJbgyFZ3I2FqZJUVEmtVuKkc2v2rtOXlCSA0ziraJyCS+T04S93CLxhStMh/l4s2pmQ
 kH5bK5DuxyqeXNqtHtaUk96a/UkrpBJhjZ8ptfVwTDyxfWb9wElCHk1ocaJB4352N+xF
 L0+0fU5HTQoD9QHbH4hstOPo10otUnQsqM2m79Kda3gtzs996ugeGLRWn2zXEdtwZnbo
 GTlHnVUhBtiwbZoM66eSxOx/CTjMQG18A9vWeKG2YQ8r20W6yii1szltEVbwpDPSIyTo yw== 
Received: from sendprdmail21.cc.columbia.edu (sendprdmail21.cc.columbia.edu
 [128.59.72.23])
 by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 3j4fqcranm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 16:00:51 -0400
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by sendprdmail21.cc.columbia.edu (8.14.7/8.14.4) with ESMTP id 27MK0VId107912
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 16:00:50 -0400
Received: by mail-vk1-f199.google.com with SMTP id
 n205-20020a1fa4d6000000b0037d1d4d3237so1942427vke.6
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 13:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=NwBaqiqjV96gAiGASIa98OtPq+SfiPYIbjEAnvA4dsc=;
 b=4XtJiICH/dX9eJiC26XSLONIiL0rDPnQBpjzf2aZvWD7SapeV3abTSr6taSWiJWpBK
 rIwr4BNsKksfx1iAoBj9KjeoFXeRYgbJEwlZoYxpu0ifJrYaF5RbLn3UROGQC6WyHoSN
 A5f0iUpSWXqy4OyR/YhPLuhDeAR7WyC8//4Zl/2L0Akqe3zZMocOsp7fo+gcUqqQexJz
 Wyb6PUeO8PZGPxzjkl6Pbi/LWohjGJjnC4zycyNcSPDxm/lxffZuO4/1BXagzThiBLu9
 46hGsqk9ki6qO6UUE7b/eDBupclKWMoKKJrLUANRXM4epPHz/JOOtPYgp9UNxhfC7Yz4
 YjUQ==
X-Gm-Message-State: ACgBeo0+Z1R3tQUZpQaDYH2hd7aTZLe9Up8tQUBChR+VqVjTwwQL1CRg
 qg46ixj8L57C7EyyAvilyAao+Chz5DN4FCD26azjFDEH22IEw+ppHfQUKSFKx9zHMWMAb0zHB7J
 aDxkHX/xrPrPfYE81mU8IaO63yDzAtXencHdx8KS6V7lMoYU=
X-Received: by 2002:a67:d284:0:b0:390:3f27:a274 with SMTP id
 z4-20020a67d284000000b003903f27a274mr4327301vsi.12.1661198449670; 
 Mon, 22 Aug 2022 13:00:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4ozSi0IzmAx38EYVD7HBQ0oS/5Yt3yR4ZRmG1ltA7uoqEQmj9iHMn1hMmWiRlDuBCfd0EdLN8GRu2S+Dfm/EY=
X-Received: by 2002:a67:d284:0:b0:390:3f27:a274 with SMTP id
 z4-20020a67d284000000b003903f27a274mr4327286vsi.12.1661198449262; Mon, 22 Aug
 2022 13:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAEHB2493pZRXs863w58QWnUTtv3HHfg85aYhLn5HJHCwxqtHQg@mail.gmail.com>
 <87fshs7kaa.wl-tiwai@suse.de>
In-Reply-To: <87fshs7kaa.wl-tiwai@suse.de>
From: Gabriel Ryan <gabe@cs.columbia.edu>
Date: Mon, 22 Aug 2022 16:00:42 -0400
Message-ID: <CALbthteSTTb5ok-xhcrkfmbtu+kgnWCX0SMBKJ-yNLzPNWGEvA@mail.gmail.com>
Subject: Re: data-race in snd_seq_oss_midi_check_exit_port /
 snd_seq_oss_midi_setup
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: S_XB2eqoIGvJ6jtlvA_br6LJNFL3s5-B
X-Proofpoint-GUID: S_XB2eqoIGvJ6jtlvA_br6LJNFL3s5-B
X-CU-OB: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_12,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 impostorscore=10 phishscore=0 mlxlogscore=999 priorityscore=1501
 bulkscore=10 clxscore=1011 mlxscore=0 lowpriorityscore=10 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208220079
X-Mailman-Approved-At: Tue, 23 Aug 2022 16:58:46 +0200
Cc: abhishek.shah@columbia.edu, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org
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

Hi Takashi,

Makes sense, we'll note this race as benign for our future reference.

Thanks for taking the time to look at this!

Best,

Gabe

On Fri, Aug 19, 2022 at 3:41 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 19 Aug 2022 03:00:00 +0200,
> Abhishek Shah wrote:
> >
> >
> > Hi all,
> >
> > We found a race involving the max_midi_devs variable. We see an interleaving
> > where the following check here passes before the
> > snd_seq_oss_midi_check_exit_port() finishes, but this check should not pass
> > if max_midi_devs will become zero, but we are not sure of its implications in
> > terms of security impact. Please let us know what you think.
>
> Through a quick glance, I guess it's rather harmless (although a bit
> fragile from the code sanity POV).
>
> A MIDI port could be closed at any time, and the dp->max_mididevs
> holds locally the upper bound of currently possibly accessible ports.
> The actual access to each port is done via get_mdev() in
> seq_oss_midi.c, which is a sort of refcount managed, and it should be
> fine that a port disappears meanwhile.
>
> That said, it'd be even feasible just dropping dp->max_mididevs field
> and scan all MIDI ports at each time, but it won't bring much benefit,
> either.
>
>
> thanks,
>
> Takashi
>
> >
> > Thanks!
> >
> > -------------------Report---------------------
> >
> > write to 0xffffffff88382f80 of 4 bytes by task 6541 on cpu 0:
> >  snd_seq_oss_midi_check_exit_port+0x1a6/0x270 sound/core/seq/oss/
> > seq_oss_midi.c:237
> >  receive_announce+0x193/0x1b0 sound/core/seq/oss/seq_oss_init.c:143
> >  snd_seq_deliver_single_event+0x30d/0x4e0 sound/core/seq/seq_clientmgr.c:640
> >  deliver_to_subscribers sound/core/seq/seq_clientmgr.c:695 [inline]
> >  snd_seq_deliver_event+0x38c/0x490 sound/core/seq/seq_clientmgr.c:830
> >  snd_seq_kernel_client_dispatch+0x189/0x1a0 sound/core/seq/
> > seq_clientmgr.c:2339
> >  snd_seq_system_broadcast+0x98/0xd0 sound/core/seq/seq_system.c:86
> >  snd_seq_ioctl_delete_port+0x9a/0xc0 sound/core/seq/seq_clientmgr.c:1356
> >  snd_seq_ioctl+0x198/0x2d0 sound/core/seq/seq_clientmgr.c:2173
> >  vfs_ioctl fs/ioctl.c:51 [inline]
> >  __do_sys_ioctl fs/ioctl.c:870 [inline]
> >  __se_sys_ioctl+0xe1/0x150 fs/ioctl.c:856
> >  __x64_sys_ioctl+0x43/0x50 fs/ioctl.c:856
> >  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> >  do_syscall_64+0x3d/0x90 arch/x86/entry/common.c:80
> >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> >
> > read to 0xffffffff88382f80 of 4 bytes by task 6542 on cpu 1:
> >  snd_seq_oss_midi_setup+0x1b/0x40 sound/core/seq/oss/seq_oss_midi.c:273
> >  snd_seq_oss_open+0x364/0x900 sound/core/seq/oss/seq_oss_init.c:198
> >  odev_open+0x55/0x70 sound/core/seq/oss/seq_oss.c:128
> >  soundcore_open+0x315/0x3a0 sound/sound_core.c:593
> >  chrdev_open+0x373/0x3f0 fs/char_dev.c:414
> >  do_dentry_open+0x543/0x8f0 fs/open.c:824
> >  vfs_open+0x47/0x50 fs/open.c:958
> >  do_open fs/namei.c:3476 [inline]
> >  path_openat+0x1906/0x1dc0 fs/namei.c:3609
> >  do_filp_open+0xef/0x200 fs/namei.c:3636
> >  do_sys_openat2+0xa5/0x2a0 fs/open.c:1213
> >  do_sys_open fs/open.c:1229 [inline]
> >  __do_sys_openat fs/open.c:1245 [inline]
> >  __se_sys_openat fs/open.c:1240 [inline]
> >  __x64_sys_openat+0xf0/0x120 fs/open.c:1240
> >  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> >  do_syscall_64+0x3d/0x90 arch/x86/entry/common.c:80
> >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> >
> > Reported by Kernel Concurrency Sanitizer on:
> > CPU: 1 PID: 6542 Comm: syz-executor2-n Not tainted 5.18.0-rc5+ #107
> > Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/
> > 2014
> >
> > Reproducing Inputs
> >
> > Input CPU 0:
> > r0 = openat$sndseq(0xffffffffffffff9c, &(0x7f0000000040)='/dev/snd/seq\x00',
> > 0x0)
> > ioctl$SNDRV_SEQ_IOCTL_CREATE_PORT(r0, 0xc0a85320, &(0x7f0000000240)={{0x80},
> > 'port1\x00', 0x10})
> > ioctl$SNDRV_SEQ_IOCTL_SET_CLIENT_POOL(r0, 0x40a85321, &(0x7f0000000100)=
> > {0x80})
> >
> > Input CPU 1:
> > r0 = openat$sequencer2(0xffffff9c, &(0x7f0000000000)='/dev/sequencer2\x00',
> > 0x0, 0x0)
> > ioctl$SNDCTL_SYNTH_INFO(r0, 0xc08c5102, &(0x7f0000000200)=
> > {"02961a3ce6d4828f8b5559726313251b55fa11d8d65406f1f33c9af8e3f8", 0xffffffff})
> >
> >

-- 
Gabriel Ryan
PhD Candidate at Columbia University
