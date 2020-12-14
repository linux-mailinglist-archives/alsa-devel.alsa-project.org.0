Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7532D9CF9
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 17:53:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7401177B;
	Mon, 14 Dec 2020 17:52:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7401177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607964825;
	bh=emBWqiHzv0eb2XAg5mu3W3huf6ERXZheYegkoqX6rV4=;
	h=Date:From:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WI+dHwe105xMDaG/3P18zbLL27fvbr3KeaZw23lmHbX+3gxhpMexMdRY6WPh/HlKn
	 oo65zQyyvy0Say/OQapvrc4+gg/JmFUVfWOt+AVUUvTKgDYITGi3l5zUWwxseEmM8l
	 lBkZiExrS85CLDx20ZTC32XYvUi4Rjz6vzEN0TFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30BCDF80240;
	Mon, 14 Dec 2020 17:52:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 058E0F80240; Mon, 14 Dec 2020 17:52:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=AC_FROM_MANY_DOTS, HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91FB3F80121
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 17:52:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91FB3F80121
Received: from mail-pl1-f200.google.com ([209.85.214.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kor4q-0007oy-0R
 for alsa-devel@alsa-project.org; Mon, 14 Dec 2020 16:52:00 +0000
Received: by mail-pl1-f200.google.com with SMTP id y10so8718548pll.20
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 08:51:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:message-id:mime-version;
 bh=DBXM4TJ4sYpXZVawmAGPHeIMmeKftaDBG0aOsflo8SQ=;
 b=KXN7r49hPPdBiN6jF9risb0h32NLnTqojOgXDRxdp7pOyUj4UyBYx6q31d4rw4Zhjr
 Vs2PQRrlp0LiKVz8F4wEfC6si5RVtMODznsto/AWDlC75uIa1+9pZfzla+ziKGNLiWQI
 9jXnROxANMec3j/43JayH1M5j+P/dOkgw0rTZ2KzGWgtZUOAXGbZLymupAGcyMkvti2U
 XNMqi5f5PetGHd9onvvu9lQqyTL3IWDyaZldai53yobjSyzT05Dw/Bc4EhHxrXTzpXkW
 P4SXTw+e+EnCHRoRLdcaXRgpDbHN/wfxRvCbGRWlbUD7BJXHqUsWaG/y2zQTVXH0m7um
 c1Gg==
X-Gm-Message-State: AOAM533ayjiU3TpqD8Pb2moRuG95vO/U+VT+0pFBTDmZrwuqxF5WSm0I
 cfTRrCQULb4oipOsrSLigTFO9LEh7wii5Ho7QK6zNN0LyhB9ZACWloZx//D1ZOVuRpQUXzCK6jN
 O9sSsYYq+f89uH0OzKqdwQ1NJ3/1Ia7fXJLVZxLsr
X-Received: by 2002:a17:90b:4014:: with SMTP id
 ie20mr25961570pjb.95.1607964718265; 
 Mon, 14 Dec 2020 08:51:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUSV34rFKBkCKBLFvDVudtXx7uDVqRaDJRPVAK7OTlljFdFUjB1drDzS0EezBUcotyt6QsaA==
X-Received: by 2002:a17:90b:4014:: with SMTP id
 ie20mr25961540pjb.95.1607964717709; 
 Mon, 14 Dec 2020 08:51:57 -0800 (PST)
Received: from [10.101.196.174] (61-220-137-34.HINET-IP.hinet.net.
 [61.220.137.34])
 by smtp.gmail.com with ESMTPSA id m30sm13871828pgb.26.2020.12.14.08.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 08:51:56 -0800 (PST)
Date: Tue, 15 Dec 2020 00:51:45 +0800
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: SoF support for 8086:9d71?
To: sound-open-firmware@alsa-project.org
Message-Id: <9I9CLQ.GP190FSJBRXK3@canonical.com>
X-Mailer: geary/3.38.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: SOUND <alsa-devel@alsa-project.org>
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

Hi,

On more recent kernels legacy HDA stops working for device 8086:9d71:
[   47.211381] snd_hda_intel 0000:00:1f.3: DSP detected with PCI 
class/subclass/prog-if info 0x040100
[   47.211383] snd_hda_intel 0000:00:1f.3: Digital mics found on 
Skylake+ platform, using SST driver

However, only legacy HDA supports it:
00:1f.3 Multimedia audio controller [0401]: Intel Corporation Sunrise 
Point-LP HD Audio [8086:9d71] (rev 21)
..
	Kernel modules: snd_hda_intel

Ubuntu kernel doesn't select SND_SOC_INTEL_SKYLAKE, which builds 
snd-soc-skl, because based on the Kconfig description SOF should 
support it.

I wonder if SND_SOC_INTEL_SKYLAKE should be select again?

BugLink: <https://bugs.launchpad.net/bugs/1902457>

