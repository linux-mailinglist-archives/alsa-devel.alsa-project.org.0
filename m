Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B038D45D861
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 11:43:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41098188F;
	Thu, 25 Nov 2021 11:43:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41098188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637837037;
	bh=mE2P2jDkGwDcZaYghjETqHNpTx+Q/S+88YkVhVG6BCY=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CLoOcO+h88obYOfFZXEtWW8XdBgCA+dIQ+NiGfeHn/s9qGslNnZU1750eEWwTuIOs
	 Y5EnH718K1qV7/wIZ+0/xBWC6O98h14A4R/oyKkVkPrt9tJjFvNOOK7YFtAUB8bQhM
	 uyvWaMjCZdHvfdt8Ni2gI+pCtFycSDgkRVi3Amuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AD7EF804AB;
	Thu, 25 Nov 2021 11:42:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B83DEF8049E; Thu, 25 Nov 2021 11:42:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 964C5F8007E
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 11:42:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 964C5F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pxKVbb4/"
Received: by mail-yb1-xb2a.google.com with SMTP id j2so10476808ybg.9
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 02:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=L9/imlFwxOFxdWIFhAQqL8HsQe1uKJNSnelwt+HA440=;
 b=pxKVbb4/ap0FRql97tkgA4z9Uh3tFc2Us4hR5r0qXU4oebtLzl9SpDMgFhPPwwY79F
 C0oqoKV+Tca2lY2pQjTkKJnq+vGRI6kFCQwy+lfRDiwgiN1Vx16iErAQB05jmMREWJTX
 /srL/Dry3TU8qKKx4vc4nLAXqqRCjXu4Kw71TM8jsZAQ6UIfg0LbGxBnQBT2H+ZVCv15
 +nDjF5f9hKVCAl0yXYURCQ96BDOB05NPj+pI4w+YZvyllQiqGQVRzTjef5Zu/jXPw908
 H2E4mmk6T37tqR+DG99V1mrCSbl58S57olt1+OSL9AI186FPb0DfdTZXxtoolqAzlVLk
 qiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=L9/imlFwxOFxdWIFhAQqL8HsQe1uKJNSnelwt+HA440=;
 b=BoMwb+1clWKfRgDs+oP/yyhm43I+KbEZPdqTaS/2fFNQcEJF/khXbE0Bf8lIcPk+B5
 15f20wRpaObqwST1+QY7tfTPlVHOynwfBpZR4aTGWkTV5NvFIOP3WF3dpRXsl1ATnLCK
 OKgH13ZXuszcarivJLiKB3eMJJqnQnY5iby4PY1Wv4FljLeWHZyECZvVMXgzTGy97MF8
 e5TEnjYEqnadjMSgPXPGqcRTBSTvcr0toIQmpjh+NpFbvr3VZ6fR8q4AojDH/+QxbAR2
 QslnPJYNWzUkoZXv6LnK8/91lsqOJ4ayxdYBXcNx2XVbxdW5ev3XWJcd0VnDiBxboFbC
 DUXQ==
X-Gm-Message-State: AOAM530QgAu5kSkGczsfrcugiw8B8RNO5KMTPwevP5Y1DKym8PSS+FYr
 Rv8Cr79EghdL5io+Bh4BBOeelEbPNdQGfWTiog3skeKtv1k=
X-Google-Smtp-Source: ABdhPJyIqAql5GOi1A0SK9lv/gFs1mhVrZqGsLQcgvZn2MHpRLtj23V6WDdFTxkGYzma6YdsJ5P96vpXtu6kExRM/dM=
X-Received: by 2002:a25:830f:: with SMTP id s15mr5159618ybk.549.1637836945375; 
 Thu, 25 Nov 2021 02:42:25 -0800 (PST)
MIME-Version: 1.0
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Thu, 25 Nov 2021 16:12:14 +0530
Message-ID: <CAHhAz+iG6+duCsU4oY__4J9NoLQArc-Cfh_2O8HjmgVCTZkYQg@mail.gmail.com>
Subject: sound: X86: Xilinx : PCIe : ALSA PCM sample driver code
To: alsa-devel <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
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

I am using a Linux X86 machine where Xilinx FPGA sound card connected
to X86 machine's PCIe slot. The sound card supports PCM playback and
capture capabilities. I need to write an ALSA driver for my sound
card.
Since I am using X86 machine and it don't have the  devicetree, can
someone please suggest the what driver architecture I should use for
this type of sound card, also please point me to the ALSA driver
reference code for this type of sound card.

-- 
Thanks,
Sekhar
