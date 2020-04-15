Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 587501AA9C0
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 16:24:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCC351670;
	Wed, 15 Apr 2020 16:23:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCC351670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586960642;
	bh=2mm/RcZ+8JC8zdkbrOu85sQAh18VB+ZiFSvT+it/mD4=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lKEw8zcHR6TH0XjTnMEX0zu9k0q1+RGQM0QbvLKc+d3UWwxWTf69t9iNbwRMPIbTo
	 HuH9zK2NAATe0yOMKUNiz+R0JqVISPAbEnw8qiSHUUMAZQlSB4J3bsZeR2u080v6xj
	 zsnHfWR3di0S3ZJwq+MLCER1dt1rvCsz68XLvvNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A461DF8025F;
	Wed, 15 Apr 2020 16:22:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D0E0F80245; Wed, 15 Apr 2020 16:22:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 773C7F80124
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 16:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 773C7F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="ktRyiSU8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:
 Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1GgMiSCOWHfDjDdkJD6pJbAGY2Y+x0HVVKjxljVw8uI=; b=ktRyiSU8jVBwnp8htvNY8p+Bp4
 hs1mp9R0n5h3UTbrRMJWZH4XyIvmUf5FxM1yn4xqfDeayqwuufqz/DENc576F+dZHzgiTABZQbfkQ
 gDhNckoHSm6ZwgK8h13n6V7URQeMvRalxXDqBtpmpEpmDsYDaLazFQw5qX6gNOeK8zSamJjPGet9f
 9DK7qIrg/hx++g90QE0ok+tRzxn3bObIJDczIK8MyN/RCZU7EoZhIZ7CWJY+MITPAiSEyQarSubYm
 DJPUSs2Qcfji72ygQRnVu2dHVzIbHAMVbxYDADavnk0nIjjtVFBLfGLIJQx2/RWECfmwnJgF1ETQY
 uIV+JJWQ==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93.0.4 (FreeBSD))
 (envelope-from <mark@xwax.org>) id 1jOiva-00060c-O0
 for alsa-devel@alsa-project.org; Wed, 15 Apr 2020 15:22:10 +0100
Received: from mark (helo=localhost)
 by stax.localdomain with local-esmtp (Exim 4.84)
 (envelope-from <mark@xwax.org>) id 1jOiva-0003sq-BQ
 for alsa-devel@alsa-project.org; Wed, 15 Apr 2020 15:22:10 +0100
Date: Wed, 15 Apr 2020 15:22:10 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: alsa-devel@alsa-project.org
Subject: Debugging dmix?
Message-ID: <2004151441360.13529@stax.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Recommendations for debugging dmix?

For a long time I have a problem where audio output regresses to glitches, 
only solved by closing all applications using audio and reopening.

Especially common when Chromium is used: 3-4 times a day, frustrating.

I have a very explicit dmix configuration (see below); no PulseAudio. 
Reproducable on latest alsa-lib (fb48ad9e; later than v1.2.2)

I can rule out _some_ aspects of hardware/drivers (Layla3G); eg. when the 
fault occurs, other soundcard channels are fine.

Any way to understand what dmix is doing? Clients? Control process?

Here's a recording taken from the analogue output (L+R chanel get zero'd):

  http://www.pogo.org.uk/~mark/tmp/dmix-glitch.png 
  http://www.pogo.org.uk/~mark/tmp/dmix-glitch.flac

Some process overwriting the ring buffer? Not high enough thread priority?

Seems like it might be more prevalant with more applications using sound. 
Maybe why Chromium makes it worse; several threads/sandboxes, perhaps.

dmix has all the trappings of something fiendishly clever and concise, but 
quite opaque. I'd need time to study the code (it has few comments, a lot 
of assumed knowledge) to understand its IPC. Can anyone give a head start?

Specifically, how does the final mix get written to the output? eg. Thread 
priorities, if that process goes away etc.

Thanks

---

pcm.layla_multi {
        type route

        slave.pcm {
                type dmix
                ipc_key 833282
                ipc_key_add_uid true
                slave {
                        pcm "hw:Layla3G,0,0"
                        period_size 256
                        buffer_size 32768
                        channels 4
                        rate 48000
                        format S24_3LE
                }
        }

        ttable {
                # Headphones

                0.0 1
                1.1 1

                # Speakers

                0.2 1
                1.3 1
        }
}

pcm.!default {
        type plug
        slave.pcm layla_multi
}

-- 
Mark
