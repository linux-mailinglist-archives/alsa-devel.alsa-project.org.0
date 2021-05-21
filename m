Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F05C38DA8C
	for <lists+alsa-devel@lfdr.de>; Sun, 23 May 2021 10:39:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03F8416A5;
	Sun, 23 May 2021 10:38:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03F8416A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621759165;
	bh=QZsIkFYr8HPIQxMacYshzhwC1fh1RUN0vnuVmqgXwRY=;
	h=Date:From:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=In7qacNEWW8Bh+GlhS8EoNNThNWDExq9jhyHPx3BqGYS3Y0E4q6OA+SaqTD/xH46f
	 U3zfs9a52DFMeFxkM22NyLCdOEDMIBR/E7dwaob9/+WFBfG1ZWJ+bM3BolYpcdosx5
	 ZV7jTIXNj1As/Vs18gYM8TBzF3uerKqiNAyjIFOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58C30F8042F;
	Sun, 23 May 2021 10:37:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A82AAF801DB; Fri, 21 May 2021 20:46:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_13,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CBE0F80153
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 20:46:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CBE0F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eD+EWt6P"
Received: by mail-qt1-x831.google.com with SMTP id 1so16054201qtb.0
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 11:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:message-id:mime-version;
 bh=2BbLsNCBgtzCNCTDjZEZMfSu1q09KhN22M1FQtPTZfA=;
 b=eD+EWt6PRC9BM35XNxcwM3Nq0x903rjciTbPBEbTz4FpSmmZFPiLDvo8eUdPG/qqZm
 3AvFrcTE0qBLrfnuZdNCNNlI4Rdeyojk/OX706cPG4DVUo+JcaIitrBq+jv9lOnwjc2/
 ETequYWQy0ENDc4HGzKYl//T41BiJLaJHXtySCYEvziIQ5mr0ULLU7+MR69rm3xEcRAm
 6Ji2rmzr5OCX/Z8akqC7x5HJ4bH82DMDlYauMcFBQeaBC13w8wyCOPEAI/TtbFXZvQ6S
 oA/e2CM4IcTrxClWD26tQWUFNGyUq3i0LnaccX/ZR1k/eWbaLUIgCH62bHODSumcyLdD
 45lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:message-id:mime-version;
 bh=2BbLsNCBgtzCNCTDjZEZMfSu1q09KhN22M1FQtPTZfA=;
 b=CrRzTg1lFJrPRNzesiHmnXpUUdf7bw3aZTHndbhLm3bxIiKG1O/C3IbWHpkQ1BBf7/
 P3pUg8Lh62e+ZmzYKdv+C9FIw0Fm3t1vdvJroAZg9ktPqB7GVq5lJ61Oyh9nkkebjOFw
 dTM/RsoqjORZUscxe3YbiwuHktiqoN9C/qysxjF9HHAV3GIhL5UUwAgLFwwBbqx5/KR1
 7rdB6y+2Jha/iHfk0+L6tS/bq8xnnuvgxa1qBZFGN4SzcrCWO6DG747d1rWgar+mnYVH
 MI8IejfmNeJUre9gjBbRWDU+cNdDv30AQYKeuONbw+zU2sULVQo40IvhtCM4yXRhl9v4
 vN/A==
X-Gm-Message-State: AOAM531pNFe9JbI2dTWoW7yUHyS/mY/AYy8IyMeMHeWvrlO2729D0KMM
 xruk/lcIBBqFbD1cm8Ebcn58kH8w6wd/5w==
X-Google-Smtp-Source: ABdhPJyN0JK3uxcLOERZ352Fr7uZ5JSDa7S3ybOWH3cdYP6sUsrzjzaOlZ3CXD2ag34kLkMK506PIQ==
X-Received: by 2002:a05:622a:130b:: with SMTP id
 v11mr13214016qtk.362.1621622783790; 
 Fri, 21 May 2021 11:46:23 -0700 (PDT)
Received: from [192.168.0.3] ([189.62.150.233])
 by smtp.gmail.com with ESMTPSA id h23sm5419807qka.22.2021.05.21.11.46.22
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 11:46:23 -0700 (PDT)
Date: Fri, 21 May 2021 15:46:14 -0300
From: Georges Basile Stavracas Neto <georges.stavracas@gmail.com>
Subject: Motu M4 - where to report this issue?
To: alsa-devel@alsa-project.org
Message-Id: <250HTQ.CIMY4AIX2X883@gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Mailman-Approved-At: Sun, 23 May 2021 10:37:03 +0200
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

Greetings ALSA community,

I recently acquired a Motu M4 interface, and seems to be working
well so far. Everyday usage is completely functional.

However, I noticed an odd sound artifact that happens from time
to time when using DAWs like Ardour and Waveform11. It's a windy,
ghostly sound that happens whenever I open any DAWs (the simple
act of opening them triggers this). Interestingly, audio apps that
use PulseAudio do not suffer from this issue. It's hard to describe
it, so I recorded a video reproducing this problem:

https://youtu.be/bM8x-YuXLVI

A few things I've discovered while trying to understand what's
going on:

 * It only happens with apps that use JACK or ALSA APIs. Using
   PulseAudio (through PipeWire) does not trigger it.

 * Seems like this sound is not an artifact of the interface; it
   appears that this odd sound is sent to the interface through
   USB. (You can see this in the video.)

 * It's triggered per track; in the video, for example, the drums
   and keyboard tracks are affected independetly.

I was oriented in #alsa at Freenode that the output of 'alsa-info'
might be helpful, so here it is:

http://alsa-project.org/db/?f=62f686710cc6c9344a8986707bf3d09248c514d1

(I'm running this on top of a 5.12.5 kernel, which should include
 this fix: https://bugzilla.kernel.org/show_bug.cgi?id=207023)

I'd like to know where should I report this bug (kernel bugzilla?),
and if there's any other information I can provide to help fixing
it.

With respect,
Georges


