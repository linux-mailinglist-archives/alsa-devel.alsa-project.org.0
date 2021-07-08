Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 609FF3C1708
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 18:25:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB42B1657;
	Thu,  8 Jul 2021 18:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB42B1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625761542;
	bh=M5Uki8noRPrnc8Snxopd1VjV+UJcFE6D4lYsYG/aoYA=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DNDBp9d/YfTrNa/8ARDxjM6Turjh/N3NLDJkdLWKiRfyGhk4oZp2YyAiTyY/j2de4
	 9brflYKK/VIqdVPHoaxh5pg54tAYkU3tPl8wM+7zRNc18X+KqMHmPSJg2LmVAD3Rgd
	 FvVZ95Pgp0QEEuLWx3ZPGGkiTAUTCEHEcWgq69JE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73A30F8028D;
	Thu,  8 Jul 2021 18:24:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF07BF80249; Thu,  8 Jul 2021 18:24:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8887EF80143
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 18:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8887EF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="vLjBZXIE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=swing;
 h=Content-Type:MIME-Version:Message-ID:Subject:cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7F92V4wyriBUcU+RnlKnxzq+31u8YDI5IuKgj+NNSfM=; b=vLjBZXIEAN1KYh9Le3rI9SyDrR
 J15DlwBNWlB5caAvO328OEqS7XxYqydIcYjALr2CAS3Eiy3kOeujO9ISBM+G8oG6rPv+Jtt5bXtWH
 FoAAujrMZZIsseM8xS0KKXvwRMPLeVPXkWGRt96n5eAUnd9PPtDZ4wg893n5/uN8CKi4=;
Received: from [2001:470:1d21:0:428d:5cff:fe1b:f3e5] (helo=stax)
 by jazz.pogo.org.uk with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2 (FreeBSD)) (envelope-from <mark@xwax.org>)
 id 1m1WpM-000PxY-Jr; Thu, 08 Jul 2021 17:24:40 +0100
Received: from localhost (stax.localdomain [local])
 by stax.localdomain (OpenSMTPD) with ESMTPA id f19a782e;
 Thu, 8 Jul 2021 16:24:39 +0000 (UTC)
Date: Thu, 8 Jul 2021 17:24:39 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: alsa-devel@alsa-project.org
Subject: Can't get snd-aloop in sync with another device
Message-ID: <2107081637250.26064@stax.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Andrew Gabbasov <andrew_gabbasov@mentor.com>
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

I use dmix+snd-aloop for all local applications; then forwarded to the 
dmix+Layla3G using a custom C program.

Despite asking for clock sync, they slowly drift. Am I doing something 
wrong?

  $ echo hw:Layla3G,0,0 > /proc/asound/Loopback/timer_source

The forwarder drains its buffer and eventually underruns. Loopback is not 
providing enough audio to feed Layla3G -- drifts by about 9 samples/second 
at 48kHz.

This _feels_ like a regression; I'm pretty sure this was perfectly in time 
before. I'd need to bisect kernel and alsa-lib changes.

Below shows the status during playback/capture.

The timer is definitely connected in some way. It's listed below, and 
aloop ticking corresponds to whether Layla3G is open by any application 
(not just the forwarder)

-- 
Mark



$ cat /proc/asound/Loopback/cable#0
Cable 0 substream 0:
  inactive
Cable 0 substream 1:
  inactive
Cable 0 substream 2:
  inactive
Cable 0 substream 3:
  valid: 3
  running: 3
  pause: 0
  Playback
    buffer_size:        65536
    buffer_pos:         12800
    silent_size:        0
    period_size:        512
    bytes_per_sec:      384000
    sample_align:       8
    rate_shift:         0
    sound timer:        hw:0,0,0
    timer open:         playback
  Capture
    buffer_size:        65536
    buffer_pos:         53760
    silent_size:        0
    period_size:        512
    bytes_per_sec:      384000
    sample_align:       8
    rate_shift:         0
    sound timer:        hw:0,0,0
    timer open:         playback
Cable 0 substream 4:
  inactive
Cable 0 substream 5:
  inactive
Cable 0 substream 6:
  inactive
Cable 0 substream 7:
  inactive

