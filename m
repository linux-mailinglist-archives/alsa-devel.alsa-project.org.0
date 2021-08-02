Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC39F3DD2AE
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 11:11:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71555179E;
	Mon,  2 Aug 2021 11:11:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71555179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627895510;
	bh=vKZFJmTS6bhzE5M2ItVDQfVC++lE6lW5Tr+7YUXJMF4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U55mJfoaO0Ydjl5eh1zvk1BUoYvsDpIuTf4FGA6fd2mRzU0Zyi8sfmjVNNzYyYp3H
	 aWgv6SdK0sSpt/O0VZOePgGJljq/6yo7e/+ISUpBZCO33C/xMtgnqwhl0EntOGkvLQ
	 YWIG6gy3mpPuvveakQ5wO1ci3jsT+QRdNRDlT/mQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDA8DF80095;
	Mon,  2 Aug 2021 11:10:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29E81F8025F; Mon,  2 Aug 2021 11:10:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net
 [194.109.24.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9600BF8014D
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 11:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9600BF8014D
Received: from cust-b66e5d83 ([IPv6:fc0c:c157:b88d:62c6:5e3c:5f07:82d0:1b4])
 by smtp-cloud8.xs4all.net with ESMTPA
 id ATxdmIrDvXTlcATxemhCK2; Mon, 02 Aug 2021 11:10:14 +0200
Received: from localhost (localhost [127.0.0.1])
 by keetweej.vanheusden.com (Postfix) with ESMTP id 22E791626FA;
 Mon,  2 Aug 2021 11:10:13 +0200 (CEST)
Received: from keetweej.vanheusden.com ([127.0.0.1])
 by localhost (mauer.intranet.vanheusden.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id mlM43yOcSmlo; Mon,  2 Aug 2021 11:10:12 +0200 (CEST)
Received: from belle.intranet.vanheusden.com (belle.intranet.vanheusden.com
 [192.168.64.100])
 by keetweej.vanheusden.com (Postfix) with ESMTP id 5EF1D15F770;
 Mon,  2 Aug 2021 11:10:12 +0200 (CEST)
Received: by belle.intranet.vanheusden.com (Postfix, from userid 1000)
 id 50D7116063C; Mon,  2 Aug 2021 11:10:12 +0200 (CEST)
Date: Mon, 2 Aug 2021 11:10:12 +0200
From: folkert <folkert@vanheusden.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: aconnect occasionally causes kernel oopses
Message-ID: <20210802091012.GR890690@belle.intranet.vanheusden.com>
References: <20210801182754.GP890690@belle.intranet.vanheusden.com>
 <s5hlf5kz80e.wl-tiwai@suse.de>
 <20210802061845.GQ890690@belle.intranet.vanheusden.com>
 <s5him0oz5zq.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5him0oz5zq.wl-tiwai@suse.de>
Reply-By: Fri 16 Jul 2021 08:34:34 AM CEST
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4xfKIbZOadN40ysYUo83aNN8V5lWutjfrWvtOwMAbIODKz1IDxJ1uHGMab06a00DVGNO6hzxgHoUS0GjJ1CHANDXrjIYFQfWW9HC+RnIaoxV0XiRopgfy5
 7x7MTr3V9SKSXOYQhK00Kpn89VIzXWOWP+24OGB7dykY2V91gHObeV2P/ed9fLnUyivFqYFQjYSB229zxq+5/EvDTIfW+fPr+gsJOs3JBrK8H2sSEY/gyqzi
 V9RvGbECdCWj2FyOCD6eRw==
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

> > > In which situation?
> > 
> > I was testing something that listens for alsa events and for that I ran
> > a continuous loop that did:
> > 
> > while true
> > do
> > 	aconnect 128:1 14:0
> > 	aconnect -d 128:1 14:0
> > 	aconnect -d 128:2 128:1
> > 	aconnect 128:2 128:1
> > done
> > 
> > I ran 5 instances in parallel.
> > 
> > 14 is midi through
> > 128 is rtpmidi
> 
> So rtpmidi process keeps running during the loop, that is, it's only
> about connection and disconnection, right?
> Also, you're listening to an event during that -- but how?

I tried it again but with a simpler setup:

I've got these devices:

root@lappiemctopface:~# aplaymidi -l
 Port    Client name                      Port name
 14:0    Midi Through                     Midi Through Port-0
130:0    FLUID Synth (17032)              Synth input port (17032:0)
131:0    VMPK Input                       in
root@lappiemctopface:~# arecordmidi -l
 Port    Client name                      Port name
 14:0    Midi Through                     Midi Through Port-0
132:0    VMPK Output                      out

I run this in 3x parallel:

while true
do
        aconnect 132:0 130:0
        aconnect -d 132:0 130:0
done

and then in less than a minute I get a backtrace.

[ma aug  2 11:05:13 2021] Call Trace:
[ma aug  2 11:05:13 2021]  ? snd_seq_deliver_event+0x38/0x90 [snd_seq]
[ma aug  2 11:05:13 2021]  ? snd_seq_kernel_client_dispatch+0x72/0x90 [snd_seq]
[ma aug  2 11:05:13 2021]  kfree+0x3bc/0x3e0
[ma aug  2 11:05:13 2021]  ? snd_seq_port_disconnect+0x10c/0x140 [snd_seq]
[ma aug  2 11:05:13 2021]  snd_seq_port_disconnect+0x10c/0x140 [snd_seq]
[ma aug  2 11:05:13 2021]  snd_seq_ioctl_unsubscribe_port+0xb9/0x180 [snd_seq]
[ma aug  2 11:05:13 2021]  ? snd_seq_port_get_subscription+0xbb/0xd0 [snd_seq]
[ma aug  2 11:05:13 2021]  ? __check_object_size.part.0+0x3a/0x150
[ma aug  2 11:05:13 2021]  snd_seq_ioctl+0xe8/0x1b0 [snd_seq]
[ma aug  2 11:05:13 2021]  __x64_sys_ioctl+0x91/0xc0
[ma aug  2 11:05:13 2021]  do_syscall_64+0x38/0x90
[ma aug  2 11:05:13 2021]  entry_SYSCALL_64_after_hwframe+0x44/0xa9


Using:
fluidsynth                                 2.1.7-1
vmpk                                       0.7.2-1build1


On: 5.11.0-25-generic (ubuntu) on 2 cores, 2 threads/core cpu (64b).

