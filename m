Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B59359E586
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 17:00:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3054D1699;
	Tue, 23 Aug 2022 16:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3054D1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661266845;
	bh=DR8L7ctK37x21xY0t6IPWB87RM0PCfovo+bNNH7shtI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PvZEbb4v+p/8pq+sXrD4COrFmUFfHztLd7k+kNEatyALTgBkSoLkhhFjPN1/LXrrL
	 PbSoy3q2KveYsl/CULPS6OehyEMi0D8bVhMxjdU6Ohz0+q41plUnE83CJqVLxrTQuC
	 Lhcgh6zAY4C5jCdkPKCguXDsrV9UGuan9LUWp5/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB856F80533;
	Tue, 23 Aug 2022 16:58:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4804F8020D; Tue, 23 Aug 2022 15:04:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com
 [148.163.135.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AD58F800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 15:04:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AD58F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu
 header.b="A+IwRbnw"
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
 by mx0a-00364e01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27ND33sk003459
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 09:04:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu;
 h=mime-version :
 references : in-reply-to : from : date : message-id : subject : to : cc :
 content-type; s=pps01; bh=FzkLhZu9oVjiho5AdS4BwyCtg1MmumDSg3O/m8ReLOE=;
 b=A+IwRbnwvFgvE0enA6V7RWSyFk3HG79q73Yqp8mbJ+y4ml/Taate/ysd9cHChrbSVIQV
 1HOtTwuS2NxMHieQCMABYcmccGvq9Kfl+bBJ5zOO4/oi3JER8CPIT+SFvhblXjtJXIGs
 eq//PZskX031Ql/JnxKTpycJEn031Ut1EoPDlvA4vA53uNH4WZl4eG9vIX8v5vWPOLDS
 j4wD6ZpP+9G+hlJkpX8NjRJyvpowGlc0DJdl+h2weTQSFmDotr3Vrh+i4ajCQ1tv7kW/
 OTljzZehkMG7PPNAGO1sTULgTUkP18w9QXGwTVsP52y7/O77//2XuygBSOfwdeoHIaSt 6Q== 
Received: from sendprdmail22.cc.columbia.edu (sendprdmail22.cc.columbia.edu
 [128.59.72.24])
 by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 3j4wm88qes-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 09:04:09 -0400
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by sendprdmail22.cc.columbia.edu (8.14.7/8.14.4) with ESMTP id 27ND4389094356
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 09:04:07 -0400
Received: by mail-ua1-f69.google.com with SMTP id
 l7-20020ab053c7000000b0039f07e35f31so1747301uaa.21
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 06:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=FzkLhZu9oVjiho5AdS4BwyCtg1MmumDSg3O/m8ReLOE=;
 b=NDAqKKZuQxP4+CjwOSry2uuXQdOEbaDrjhkvOfQJawaBjMppawCRKMq6X1UJrg9E49
 xSbWXXdfVqv0NakQN0ZDX8iM1okE+R4/RwdrzTER5hX6EoSrEqKumJPcpwWqvWqJqLd3
 sV8FdJOnaVBcThoAGciac0625h04aXOLoWgWQwSt7PLWuVa0VDnLFJNaO5jhgTPFMWnH
 IsX5G2bhP1luO4yK7NWMUPCG6+TTI+UD67Tj+gCUPk7bmTQGPqu5DwLP6tYAwFEc8UT/
 N87JxQjogpovrjHIeKWHlVb1FDrKOtuosyN6OHAGgvmbo5mYzA7bQjBABdiYb6MENuZc
 YrPw==
X-Gm-Message-State: ACgBeo1SlQkCxUrDWqjJcAw5AVh0P+kpM0a6TBdIablYjMOiuNlKigKm
 XhZh9o5m+xb8jimTQpxwAGCn0U9Dt0hRoViEOdtObgEyEkKiAYqPcw9DZ4sFMi7l4Ag5mG+w0C0
 G/T4Zsxc+e4v+TGmhF1NU5NOPB0rZ/8yflBqKHAhdPvD2/5I=
X-Received: by 2002:a67:d284:0:b0:390:3f27:a274 with SMTP id
 z4-20020a67d284000000b003903f27a274mr5482217vsi.12.1661259846609; 
 Tue, 23 Aug 2022 06:04:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5Fe989j4t6OrrOXHR5MS4/hmhjELijhP5M8AF42Y7nnqnXEnWKXjDkCrx+nE/yg4+hcKNCh/AFzQmrE3nFng4=
X-Received: by 2002:a67:d284:0:b0:390:3f27:a274 with SMTP id
 z4-20020a67d284000000b003903f27a274mr5482173vsi.12.1661259846205; Tue, 23 Aug
 2022 06:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAEHB2493pZRXs863w58QWnUTtv3HHfg85aYhLn5HJHCwxqtHQg@mail.gmail.com>
 <87fshs7kaa.wl-tiwai@suse.de>
 <CALbthteSTTb5ok-xhcrkfmbtu+kgnWCX0SMBKJ-yNLzPNWGEvA@mail.gmail.com>
 <87a67vsb0w.wl-tiwai@suse.de>
In-Reply-To: <87a67vsb0w.wl-tiwai@suse.de>
From: Gabriel Ryan <gabe@cs.columbia.edu>
Date: Tue, 23 Aug 2022 09:03:55 -0400
Message-ID: <CALbthtd+mBopx79E9bmonhucGS4+OWTW4eQoScoV8jtd+fgW0Q@mail.gmail.com>
Subject: Re: data-race in snd_seq_oss_midi_check_exit_port /
 snd_seq_oss_midi_setup
To: Takashi Iwai <tiwai@suse.de>
X-Proofpoint-GUID: hNl_yudv6aUxZdkumjIU3GIz-Z-KJ4xK
X-Proofpoint-ORIG-GUID: hNl_yudv6aUxZdkumjIU3GIz-Z-KJ4xK
X-CU-OB: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_04,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 lowpriorityscore=10 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=10 mlxlogscore=999 mlxscore=0 phishscore=0 clxscore=1015
 bulkscore=10 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208230049
X-Mailman-Approved-At: Tue, 23 Aug 2022 16:58:46 +0200
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Ok, glad to hear our report was helpful, thanks!

Best,

Gabe

On Tue, Aug 23, 2022 at 2:56 AM Takashi Iwai <tiwai@suse.de> wrote:

> On Mon, 22 Aug 2022 22:00:42 +0200,
> Gabriel Ryan wrote:
> >
> > Hi Takashi,
> >
> > Makes sense, we'll note this race as benign for our future reference.
> >
> > Thanks for taking the time to look at this!
>
> Although it's more or less harmless, the data-race should be still
> addressed.  I'm going to submit the fixes for both issues you've
> reported.
>
>
> thanks,
>
> Takashi
>
> >
> > Best,
> >
> > Gabe
> >
> > On Fri, Aug 19, 2022 at 3:41 AM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Fri, 19 Aug 2022 03:00:00 +0200,
> > > Abhishek Shah wrote:
> > > >
> > > >
> > > > Hi all,
> > > >
> > > > We found a race involving the max_midi_devs variable. We see an
> interleaving
> > > > where the following check here passes before the
> > > > snd_seq_oss_midi_check_exit_port() finishes, but this check should
> not pass
> > > > if max_midi_devs will become zero, but we are not sure of its
> implications in
> > > > terms of security impact. Please let us know what you think.
> > >
> > > Through a quick glance, I guess it's rather harmless (although a bit
> > > fragile from the code sanity POV).
> > >
> > > A MIDI port could be closed at any time, and the dp->max_mididevs
> > > holds locally the upper bound of currently possibly accessible ports.
> > > The actual access to each port is done via get_mdev() in
> > > seq_oss_midi.c, which is a sort of refcount managed, and it should be
> > > fine that a port disappears meanwhile.
> > >
> > > That said, it'd be even feasible just dropping dp->max_mididevs field
> > > and scan all MIDI ports at each time, but it won't bring much benefit,
> > > either.
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > >
> > > >
> > > > Thanks!
> > > >
> > > > -------------------Report---------------------
> > > >
> > > > write to 0xffffffff88382f80 of 4 bytes by task 6541 on cpu 0:
> > > >  snd_seq_oss_midi_check_exit_port+0x1a6/0x270 sound/core/seq/oss/
> > > > seq_oss_midi.c:237
> > > >  receive_announce+0x193/0x1b0 sound/core/seq/oss/seq_oss_init.c:143
> > > >  snd_seq_deliver_single_event+0x30d/0x4e0
> sound/core/seq/seq_clientmgr.c:640
> > > >  deliver_to_subscribers sound/core/seq/seq_clientmgr.c:695 [inline]
> > > >  snd_seq_deliver_event+0x38c/0x490 sound/core/seq/seq_clientmgr.c:830
> > > >  snd_seq_kernel_client_dispatch+0x189/0x1a0 sound/core/seq/
> > > > seq_clientmgr.c:2339
> > > >  snd_seq_system_broadcast+0x98/0xd0 sound/core/seq/seq_system.c:86
> > > >  snd_seq_ioctl_delete_port+0x9a/0xc0
> sound/core/seq/seq_clientmgr.c:1356
> > > >  snd_seq_ioctl+0x198/0x2d0 sound/core/seq/seq_clientmgr.c:2173
> > > >  vfs_ioctl fs/ioctl.c:51 [inline]
> > > >  __do_sys_ioctl fs/ioctl.c:870 [inline]
> > > >  __se_sys_ioctl+0xe1/0x150 fs/ioctl.c:856
> > > >  __x64_sys_ioctl+0x43/0x50 fs/ioctl.c:856
> > > >  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> > > >  do_syscall_64+0x3d/0x90 arch/x86/entry/common.c:80
> > > >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > > >
> > > > read to 0xffffffff88382f80 of 4 bytes by task 6542 on cpu 1:
> > > >  snd_seq_oss_midi_setup+0x1b/0x40
> sound/core/seq/oss/seq_oss_midi.c:273
> > > >  snd_seq_oss_open+0x364/0x900 sound/core/seq/oss/seq_oss_init.c:198
> > > >  odev_open+0x55/0x70 sound/core/seq/oss/seq_oss.c:128
> > > >  soundcore_open+0x315/0x3a0 sound/sound_core.c:593
> > > >  chrdev_open+0x373/0x3f0 fs/char_dev.c:414
> > > >  do_dentry_open+0x543/0x8f0 fs/open.c:824
> > > >  vfs_open+0x47/0x50 fs/open.c:958
> > > >  do_open fs/namei.c:3476 [inline]
> > > >  path_openat+0x1906/0x1dc0 fs/namei.c:3609
> > > >  do_filp_open+0xef/0x200 fs/namei.c:3636
> > > >  do_sys_openat2+0xa5/0x2a0 fs/open.c:1213
> > > >  do_sys_open fs/open.c:1229 [inline]
> > > >  __do_sys_openat fs/open.c:1245 [inline]
> > > >  __se_sys_openat fs/open.c:1240 [inline]
> > > >  __x64_sys_openat+0xf0/0x120 fs/open.c:1240
> > > >  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> > > >  do_syscall_64+0x3d/0x90 arch/x86/entry/common.c:80
> > > >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > > >
> > > > Reported by Kernel Concurrency Sanitizer on:
> > > > CPU: 1 PID: 6542 Comm: syz-executor2-n Not tainted 5.18.0-rc5+ #107
> > > > Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1
> 04/01/
> > > > 2014
> > > >
> > > > Reproducing Inputs
> > > >
> > > > Input CPU 0:
> > > > r0 = openat$sndseq(0xffffffffffffff9c,
> &(0x7f0000000040)='/dev/snd/seq\x00',
> > > > 0x0)
> > > > ioctl$SNDRV_SEQ_IOCTL_CREATE_PORT(r0, 0xc0a85320,
> &(0x7f0000000240)={{0x80},
> > > > 'port1\x00', 0x10})
> > > > ioctl$SNDRV_SEQ_IOCTL_SET_CLIENT_POOL(r0, 0x40a85321,
> &(0x7f0000000100)=
> > > > {0x80})
> > > >
> > > > Input CPU 1:
> > > > r0 = openat$sequencer2(0xffffff9c,
> &(0x7f0000000000)='/dev/sequencer2\x00',
> > > > 0x0, 0x0)
> > > > ioctl$SNDCTL_SYNTH_INFO(r0, 0xc08c5102, &(0x7f0000000200)=
> > > > {"02961a3ce6d4828f8b5559726313251b55fa11d8d65406f1f33c9af8e3f8",
> 0xffffffff})
> > > >
> > > >
> >
> > --
> > Gabriel Ryan
> > PhD Candidate at Columbia University
> >
>
