Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E4F1646C8
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 15:21:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 701601699;
	Wed, 19 Feb 2020 15:21:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 701601699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582122111;
	bh=0/GiNjrHW+mHWEnBRrtczwVBBLEGw1R3OFEH/pm/KHc=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qbyCdj0MBNfQCSEsKqX+Wtfza+HBUAwW8Po/F1CjNScK1RPoZ3SmdDC38Rxnvgsjx
	 oXprgNYKUq6q7bJse+BoZgn5kRukeP8jz4KVU/Smpuiuom97025mjmMmm/RW3/qccl
	 0Z4kdhV3yV5dguoYCODnslJCTqQvE6C6c6dlbnCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 817D7F80114;
	Wed, 19 Feb 2020 15:20:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4092F80273; Wed, 19 Feb 2020 15:20:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from resqmta-po-12v.sys.comcast.net (resqmta-po-12v.sys.comcast.net
 [IPv6:2001:558:fe16:19:96:114:154:171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E8AAF80142
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 15:20:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E8AAF80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=comcastmailservice.net
 header.i=@comcastmailservice.net header.b="Ib9zCpv8"
Received: from resomta-po-16v.sys.comcast.net ([96.114.154.240])
 by resqmta-po-12v.sys.comcast.net with ESMTP
 id 4PR7jXzYueHaE4QCljUQQZ; Wed, 19 Feb 2020 14:19:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=comcastmailservice.net; s=20180828_2048; t=1582121999;
 bh=zREuezz2WfRtL5xqeWJSSINvFtPTix3YWiBqn53OwTQ=;
 h=Received:Received:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type;
 b=Ib9zCpv8wMtfD3cCPiw//ciAGd1f4AV6z0h5eU2jfQpelbiFKvWBetaCjtnkHA1kd
 ZEfk+Kumx35R9ha0n7gY+2LG0mOzfeKh1pLv5/anlbzAqLQpJN9szYeIBNQlq2oeDb
 O10IqY67sLgyFnEElb3YM8lxiEtjWaYFYYd08MRXg/+yp8i6UjeI/KCVZ9xg75Gaj8
 jgfz03rP0R6g35CItUc3Rd3/vL1XGcQbam2gsmlwBuYdtp/krorsvtHU/t4yuoSf6k
 yhAs7NqGMHuhfZS5fxxEDBn2bpYYZYdMecvrgs7rIQMzqeV2gR4W+YcTSN18IzHLVX
 Rt8xnTH3nBIIw==
Received: from moe ([76.21.90.186])
 by resomta-po-16v.sys.comcast.net with ESMTPA
 id 4QCijzAv5y3NM4QCjj7udY; Wed, 19 Feb 2020 14:19:59 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgedugedrkedtgdeifecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucevohhmtggrshhtqdftvghsihdpqfgfvfdppffquffrtefokffrnecuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehttdertddttddvnecuhfhrohhmpefuthgvvhgvucfoohhrrhhishcuoehmohhrrhhishessghuihhnvggrrdgtohhmqeenucfkphepjeeirddvuddrledtrddukeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghlohepmhhovgdpihhnvghtpeejiedrvddurdeltddrudekiedpmhgrihhlfhhrohhmpehmohhrrhhishessghuihhnvggrrdgtohhmpdhrtghpthhtoheprghlshgrqdguvghvvghlsegrlhhsrgdqphhrohhjvggtthdrohhrgh
X-Xfinity-VMeta: sc=0.00;st=legit
Received: by moe (Postfix, from userid 1000)
 id 84C1C2011B; Wed, 19 Feb 2020 06:19:56 -0800 (PST)
Date: Wed, 19 Feb 2020 06:19:56 -0800
From: Steve Morris <morris@buinea.com>
To: alsa-devel@alsa-project.org
Subject: sytem reboots when initializing Edirol FA-101 firewire audio interface
Message-ID: <20200219141956.GA14216@buinea.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi All,

I'm running Arch Linux x86_64

My system consistently reboots when I power on my FA-101 when running
kernels 5.5.1-4. Downgrading to 5.4.15 allows everything to work
properly.

Here's the outpu of:
journalctl  | grep -E 'Reboot|firewire|fw|bebob|alsa|jack'

This is a good init under 5.4.15:
-- Reboot --
powered on interface while running 5.4.15, initialized properly
Feb 18 18:35:37 hostname kernel: firewire_ohci 0000:05:00.0: enabling device (0080 -> 0083)
Feb 18 18:35:37 hostname kernel: firewire_ohci 0000:05:00.0: added OHCI v1.10 device as card 0, 4 IR + 8 IT contexts, quirks 0x11
Feb 18 18:35:37 hostname kernel: firewire_core 0000:05:00.0: created device fw0: GUID 0011223333666677, S400
Feb 18 18:35:37 hostname systemd-udevd[541]: controlC0: Process '/usr/bin/alsactl restore 0' failed with exit code 99.
Feb 18 18:35:37 hostname systemd-udevd[541]: controlC1: Process '/usr/bin/alsactl restore 1' failed with exit code 99.
Feb 18 18:35:38 hostname kernel: amdgpu: [powerplay] smu driver if version = 0x00000033, smu fw if version = 0x00000035, smu fw version = 0x002a3200 (42.50.0)
Feb 18 18:36:08 hostname kernel: firewire_ohci 0000:05:00.0: isochronous cycle inconsistent
Feb 18 18:36:08 hostname kernel: firewire_core 0000:05:00.0: created device fw1: GUID 0040ab0000c20bc1, S400
Feb 18 18:36:08 hostname kernel: firewire_core 0000:05:00.0: phy config: new root=ffc1, gap_count=5
Feb 18 18:36:10 hostname kernel: firewire_core 0000:05:00.0: BM lock failed (timeout), making local node (ffc0) root
Feb 18 18:36:10 hostname kernel: firewire_core 0000:05:00.0: phy config: new root=ffc0, gap_count=5
Feb 18 18:36:12 hostname systemd-udevd[1532]: controlC2: Process '/usr/bin/alsactl restore 2' failed with exit code 99.
Feb 18 18:36:15 hostname kernel: snd-bebob fw1.0: transaction failed: no ack
Feb 18 18:36:15 hostname kernel: snd-bebob fw1.0: fail to get an input for MSU in plug 7: -5
Feb 18 18:36:15 hostname kernel: snd-bebob fw1.0: transaction failed: no ack
Feb 18 18:36:15 hostname kernel: snd-bebob fw1.0: fail to get an input for MSU in plug 7: -5

This is a bad init under 5.5.4:
-- Reboot --
Powered on interface when machine was running.
Feb 18 18:13:37 hostname kernel: firewire_ohci 0000:05:00.0: enabling device (0080 -> 0083)
Feb 18 18:13:37 hostname kernel: firewire_ohci 0000:05:00.0: added OHCI v1.10 device as card 0, 4 IR + 8 IT contexts, quirks 0x11
Feb 18 18:13:37 hostname kernel: firewire_core 0000:05:00.0: created device fw0: GUID 0011223333666677, S400
Feb 18 18:13:37 hostname kernel: audit: type=1130 audit(1582078417.360:3): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=ufw comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Feb 18 18:13:37 hostname audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=ufw comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Feb 18 18:13:37 hostname systemd-udevd[539]: controlC0: Process '/usr/bin/alsactl restore 0' failed with exit code 99.
Feb 18 18:13:37 hostname systemd-udevd[530]: controlC1: Process '/usr/bin/alsactl restore 1' failed with exit code 99.
Feb 18 18:13:38 hostname kernel: amdgpu: [powerplay] smu driver if version = 0x00000033, smu fw if version = 0x00000035, smu fw version = 0x002a3200 (42.50.0)
Feb 18 18:19:45 hostname kernel: firewire_core 0000:05:00.0: phy config: new root=ffc1, gap_count=5
Feb 18 18:19:48 hostname kernel: firewire_core 0000:05:00.0: phy config: new root=ffc1, gap_count=5
Feb 18 18:19:48 hostname kernel: firewire_core 0000:05:00.0: created device fw1: GUID 0040ab0000c20bc1, S400
Feb 18 18:19:52 hostname systemd-udevd[1682]: controlC2: Process '/usr/bin/alsactl restore 2' failed with exit code 99.
Feb 18 18:20:08 hostname kernel: snd-bebob fw1.0: transaction failed: no ack
Feb 18 18:20:08 hostname kernel: snd-bebob fw1.0: fail to get an input for MSU in plug 7: -5
Feb 18 18:20:08 hostname kernel: snd-bebob fw1.0: transaction failed: no ack
Feb 18 18:20:08 hostname kernel: snd-bebob fw1.0: fail to get an input for MSU in plug 7: -5
Feb 18 18:20:12 hostname kernel: firewire_core 0000:05:00.0: phy config: new root=ffc1, gap_count=5
Feb 18 18:21:24 hostname kernel: firewire_ohci 0000:05:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0001 address=0xd5080000 flags=0x0000]
Followed by 125 more O_PAGE_FAULT and then the reboot,

I'll be happy to provide additional information if needed.

Steve
