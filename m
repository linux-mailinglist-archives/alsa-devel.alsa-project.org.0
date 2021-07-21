Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C547F3D468C
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Jul 2021 11:01:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D78517BC;
	Sat, 24 Jul 2021 11:00:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D78517BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627117287;
	bh=+q+H3szsJWLTO1Wa0q0FpV2hR8KLK6TgecN5pYJuzak=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P9sALQNvsxEF0hicu6UwzZMruUuMn+ARAqW3nZzm9JXvQLi/WrsB4hUae91n/8Qbu
	 D+OJWUObB5hZ48bKwWeaMRy6adOv1CpHVSKUSzZntpjoPoR9vioE99z18FSNbb+BUC
	 KqKle9NGDJqZb/g5r0Mx0iGwyGNwha3EZ0/uaUGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3BAFF80588;
	Sat, 24 Jul 2021 10:54:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35576F804AC; Wed, 21 Jul 2021 20:06:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40E20F80143
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 20:06:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40E20F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YNR+/Qkm"
Received: by mail-io1-xd31.google.com with SMTP id r18so3356889iot.4
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 11:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=+q+H3szsJWLTO1Wa0q0FpV2hR8KLK6TgecN5pYJuzak=;
 b=YNR+/QkmRzsSAeUJV+6jDEZq+28QisNSWdoTylz7Qs3Aa6OedKXdUEmzDNLIwojyMM
 EngDdRs0dfVJ6i84UpCDgVeXrhHZkrpCdLNnmsFRLcTHBA2Lcuybwo/jtIDrgwMBVHE7
 whjt7lU32odpJiKbcaOvfWeujVUslMDkKbefttVBRPXYDBCqNO3ti8y0tvEQMPYBf3SR
 OYpegbab64jMMvLNBcGlqW6DbFCBvXdaI6QPjWQjFybx/GTqH+5z9zNm/099fxLEBgIB
 5Uo9g1v4J7/bZfDayDRdxDOLv2Hqzsc1UR/QzWQUpSCRvX4bO+0/em28k+GkuvJ55Bv6
 HPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+q+H3szsJWLTO1Wa0q0FpV2hR8KLK6TgecN5pYJuzak=;
 b=CA3+HWQ0l0tTiGW3na9ZQUieNNUqnnW028pChl07BmpWCLUKWod2LqfZ7gjBOXXlKa
 IvLe1aMmGtbVmLUXq4rYnFN62iv5q+nJkWmuRH4cxzbLITVlgjl2uYzDmez32aKiDY2Z
 3/v5odlVeC5HVr43+pxQgrfY0h+tmvq5wG43PvGYcgY9slOLhJTBCI/2kpYAH/sBO+eZ
 P5fSAJ562sHPxzroVZqg9GJj5RUexEIdpAU5dc6Kp9+zE2Hga9bnQngLZYKOE2zP0w6w
 a7KFf3xPj3rqXQiFLTE1UuM9GKROp5fLUEum59N3Ddr4oPo8uEdDjtJ3PfLHEqu4W4ir
 fwiQ==
X-Gm-Message-State: AOAM530dluRFjO+R911RqYvnQXL9H38vykN30rVzEWvtLEr6Y6NfjIyo
 0hoWPmIogGI9Ce7S+ZF6PXr4SppqswPcug5imFXu3Tvo
X-Google-Smtp-Source: ABdhPJypVObUFi+KsN+X08TTRl6hN27VbLd4EiVPvMfstlMQ/+nhCLTRVJ4FwIG7u4cJ6fpB62OCdPsMgKye5BpPvXs=
X-Received: by 2002:a05:6638:25c7:: with SMTP id
 u7mr31770273jat.26.1626890797134; 
 Wed, 21 Jul 2021 11:06:37 -0700 (PDT)
MIME-Version: 1.0
From: Alex Roberts <arob109@gmail.com>
Date: Wed, 21 Jul 2021 13:06:26 -0500
Message-ID: <CAPkENw-3zYvhjdn6J8x3W7B+u-FrnTH4Kv98NDsj4YAswjsdnQ@mail.gmail.com>
Subject: out of memory issue
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 24 Jul 2021 10:54:14 +0200
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

Hello,

I am developing a dummy codec to interface with an 8-channel, 24-bit
ADC. I've got it working on an NXP imx8m through the fsl_sai driver on
kernel 5.4.85. I can capture all 8 channels at varying sample rates
using arecord, and I've verified correct data capture via opening the
resulting .wav file in Audacity. The problem I am having is that
occasionally, upon starting arecord - after a fresh power cycle - I
get an out of memory error. Other times I get an out of memory after a
non-deterministic period of capture. Starting capture again also
reports out of memory, but if I wait several minutes and start capture
it will start recording again. A power cycle usually helps, but as
stated earlier, not 100% of the time.

I'm trying to track down where the oom error is coming from, but
haven't had much luck. My colleague tried running arecord with
valgrind to check for memory leaks and nothing of note was observed.
My suspicion is there's something going on with allocated memory for
DMA, like fragmentation starts to happen and it can't get a contiguous
region for operation. Reserving a large pool - either via device tree
or boot cmd arguments in the bootoader - did not seem to help.

Another thought is that it's a boundary/alignment issue due to the
24-bit data, and the error is the result of trying to allocate a chunk
of memory for DMA that doesn't align.

I'm very new to ALSA dev with some exposure to kernel dev in general,
so please correct me if I'm wrong or completely mis-understanding
something.

Any suggestions on where I should / how I can debug this memory error?

Thanks,
Alex.
