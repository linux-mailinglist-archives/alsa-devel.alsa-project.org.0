Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8743EC7F4
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Aug 2021 09:31:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36D34172F;
	Sun, 15 Aug 2021 09:31:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36D34172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629012719;
	bh=/fbXKPao9RfhNoOpmTGhd3hQyQYFlKY+K99YwG6o1NA=;
	h=Subject:From:To:Date:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=f+2cq2DlvlUHOXz7YCmnE9SPIpXRw+HOHTJg5kQgQbrYMh5cjnoyOIPEhlXk8jhQh
	 7/7jdHwzD6Bp1DIhNgTu1e0wr1oVIw/kENccg+BHsnPDZ9/3bwf9KabX8cfUCA37vf
	 YP3hGPysun6xV74cO9LfbK1kqLDznQ0Z74ehATu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 828D4F80301;
	Sun, 15 Aug 2021 09:30:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FEEAF8025D; Sat, 14 Aug 2021 16:02:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72F67F800BB
 for <alsa-devel@alsa-project.org>; Sat, 14 Aug 2021 16:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72F67F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fvQoglxH"
Received: by mail-pj1-x1036.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so9661448pjb.2
 for <alsa-devel@alsa-project.org>; Sat, 14 Aug 2021 07:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:user-agent
 :mime-version:content-transfer-encoding;
 bh=/fbXKPao9RfhNoOpmTGhd3hQyQYFlKY+K99YwG6o1NA=;
 b=fvQoglxHo2NpAW6Fsh46xRCAPP79e+fFPZ6dVmDjrUvsXO8By5ifjv7qBq/nRh/VZN
 hwQ3v7kOp7XndcgbSlQT8x8J7v4qnNEjj9vIOMnehaO2nKON67I6IkzB/Jre50Pl0xX1
 WRpgN14+PKEbi7zNuwjVp7FAIXnG++Hjvh2NuHMudYR2RkWOyX3vGQlqJfyTo6P8lAOk
 Pusf12oRF1EMDXRm9Bb603d7yzg5nWKTJTVPIbgnYYD9b9BDz6Fw5aqJobmnBMV51rax
 4s0jHgcaXlaWaA7L8FX/u6reeC9Ig1jZDEflStUyyEoQX9rg4JRg77rW+tlX+PZgizE1
 MFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :user-agent:mime-version:content-transfer-encoding;
 bh=/fbXKPao9RfhNoOpmTGhd3hQyQYFlKY+K99YwG6o1NA=;
 b=Uq7t6twlVBCsX/7oFhGAr7zaS6Jion5aTJgLMMuFdQ/0ksa/6KcS4oh7lomA+mt09Q
 mo/aFIcjIlLBzJDhUeAHtmCBe8FOh9OJwL26u2fqKOx0D82J4YU8fj+MLeA4y69eybym
 eYbBLBi+RoU4G0cTFqRMfs4R7lhrvyO7eqrXQXdEY2npkFy+YZIxJHLFTOwm+CiU0RaH
 ZVKhvwpQcf2Pzr6UQgOCrzQtv7fy1wj4BZO+CXSXlL3iawZN7tTUvJHRWPALYo2Aj8wj
 9dwTzgJdhoYMiGUFMM6RErPNHyhRJOVrCUHueB4GTYpMCu3mLfApAj4g2aq8yE/4v0r/
 t/yg==
X-Gm-Message-State: AOAM532yRkTFzWIUKXR0hwkl+fsXrmCrU/nVhYDRoKdNnnZitq/ILTbp
 mB4OvPmOAQpG2li3oRb/j/c=
X-Google-Smtp-Source: ABdhPJycTCoo1xTBH2a3y0Zz/dHjjWhQfGK2XxwcOVOj198rQtnEh8sxXcRCRXFmTdEOS4q39zsUcg==
X-Received: by 2002:a63:7c5:: with SMTP id 188mr7002295pgh.211.1628949760225; 
 Sat, 14 Aug 2021 07:02:40 -0700 (PDT)
Received: from [192.168.1.92] ([106.104.151.171])
 by smtp.gmail.com with ESMTPSA id g13sm4376701pfo.53.2021.08.14.07.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 07:02:39 -0700 (PDT)
Message-ID: <ac2232f142efcd67fe6ac38897f704f7176bd200.camel@gmail.com>
Subject: Re: [REGRESSION] "ALSA: HDA: Early Forbid of runtime PM" broke my
 laptop's internal audio
From: =?Big5?Q?=C2=C5=AE=BC=DE=B3?= <lantw44@gmail.com>
To: tiwai@suse.de
Date: Sat, 14 Aug 2021 22:02:36 +0800
In-Reply-To: <s5h7dnvlgg8.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.41.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 15 Aug 2021 09:30:28 +0200
Cc: alsa-devel@alsa-project.org, harshapriya.n@intel.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, kai.vehmanen@intel.com,
 mcatanzaro@redhat.com
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

I am not sure if I should join this old thread, but it seems that I saw the same
issue on my ASUS B23E laptop. It couldn't produce any sound after upgrading to
Linux 5.10, and 'git bisect' shows it was broken by the same commit
a0645daf16101bb9a6d87598c17e9a8b7bd60ea7.

I have tested the latest master branch (v5.14-rc4-322-gcceb634774ef) last week.
It still had no sound. If I reverted the broken commit, sound worked.

alsa-info from the broken kernel:
https://gist.github.com/lantw44/0660e059c488e3ff3d841bb03b371866

alsa-info from the working kernel:
https://gist.github.com/lantw44/9367f425e4f5ba98cf12343cb90f3301

lspci:
00:00.0 Host bridge: Intel Corporation 2nd Generation Core Processor Family DRAM
Controller (rev 09)
00:02.0 VGA compatible controller: Intel Corporation 2nd Generation Core
Processor Family Integrated Graphics Controller (rev 09)
00:16.0 Communication controller: Intel Corporation 6 Series/C200 Series Chipset
Family MEI Controller #1 (rev 04)
00:16.3 Serial controller: Intel Corporation 6 Series/C200 Series Chipset Family
KT Controller (rev 04)
00:19.0 Ethernet controller: Intel Corporation 82579LM Gigabit Network
Connection (Lewisville) (rev 05)
00:1a.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family
USB Enhanced Host Controller #2 (rev 05)
00:1b.0 Audio device: Intel Corporation 6 Series/C200 Series Chipset Family High
Definition Audio Controller (rev 05)
00:1c.0 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI
Express Root Port 1 (rev b5)
00:1c.1 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI
Express Root Port 2 (rev b5)
00:1c.2 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI
Express Root Port 3 (rev b5)
00:1c.3 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI
Express Root Port 4 (rev b5)
00:1d.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family
USB Enhanced Host Controller #1 (rev 05)
00:1f.0 ISA bridge: Intel Corporation QM67 Express Chipset LPC Controller (rev
05)
00:1f.2 SATA controller: Intel Corporation 6 Series/C200 Series Chipset Family 6
port Mobile SATA AHCI Controller (rev 05)
00:1f.3 SMBus: Intel Corporation 6 Series/C200 Series Chipset Family SMBus
Controller (rev 05)
02:00.0 Network controller: Intel Corporation Centrino Advanced-N 6230 [Rainbow
Peak] (rev 34)
06:00.0 USB controller: Fresco Logic FL1000G USB 3.0 Host Controller (rev 04)
