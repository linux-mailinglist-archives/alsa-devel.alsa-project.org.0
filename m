Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF011B3801
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 08:53:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C5AF16C8;
	Wed, 22 Apr 2020 08:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C5AF16C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587538414;
	bh=6WIXipBm1mssrlfy650rmj1luRbFA3Cyii02NjQSGhg=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J4wCYWwYA4JHT8nROAfrCLIWutYMo+Vw4QCfapDbKUEsOLPtrPbzTE/i7vz4CHvRz
	 EQTOMUSPGc3xgUtZMGuXNihSMbU47JORrvxs7FdkXwin9GR4BWgHkmWnVMSXiE1utZ
	 W5P2zkraFCk6leW1SZig7vnDQcdkHF1KAceZRsls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54C77F800F2;
	Wed, 22 Apr 2020 08:51:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B5A3F801D9; Wed, 22 Apr 2020 08:51:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B65D6F800FF
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 08:51:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B65D6F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ANAeVD56"
Received: by mail-qt1-x833.google.com with SMTP id z90so857735qtd.10
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 23:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=V4pXwGRsqqRtiV3ahMn8UzaJzmUKAyMUanfEOAD5tN4=;
 b=ANAeVD567oLr0BQ7ab4Cy7cFbsveWFNNqKaCuxvyy6bdWFAjiOvVVCc7ZSzikxikRF
 lJ8FiJWrshEE7ZsHWUhj2ID3Id3EqSsczlQhMDhGPfNB2NyzwRhEG+Hztws+HOWlAOnM
 AveqtgVMoMdceFa8vW3sMhHQzAaxNh7q/eB0AMtTBb7EPuHCKNOeTLUKo23KVlaTCJjQ
 s4lpUpAvbllDDL1Vr8243O/OJ+euuoBjkENBwv9Dt53cTuB7VZUNCkfd2olgnPiKNDvp
 R1zH0I0lR6CAjA9oRpyOp00dSjY1fuydGENSBY6L5XaIQYes6CSpE7P0P4AyD6eoYF64
 hMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=V4pXwGRsqqRtiV3ahMn8UzaJzmUKAyMUanfEOAD5tN4=;
 b=M5OErx1k4Rr2xTt6M9JoaqTnbFMBqljxx3AKJPZGpqN3MDRRDcGuFlEj6V0dQjZoOk
 tjXUzgDxvpyQxqjdti3xd/2tonz0aB8WAHbBy7/tO885r9zCMRhhb3k7BK8yRalVFks8
 SW2XR6DDxx5JpvCclD16X0npHr4exID6/andk3jhB1gQ9biq9xrLXCH6eVboEYj3vfp0
 Q+AoC/82UNKSdTuIIHDVNN1lCHcwEXi8+kGF77NOYNXpm7Xdcz+93Tbq9+eT/IZLZwH1
 014KwhmihPXPPSZ0dxLHRBqYYBrS2mP2yFZikk7cYb8HNXKqfp5i6hwDMKiu49UXkxzo
 t06w==
X-Gm-Message-State: AGi0PuY1uLidZmCF9DkOf7QW+yA0EEdgOSc5GfCJN//ZaO0wof4zvqTA
 k+38BvB6R6T4iJ2pIuuQFrTyRQxjLKWNMO8x8xXtVroAVRs=
X-Google-Smtp-Source: APiQypLwZSMRmGsxwzXR3xzice/Pdq5Gg75uV5EDIyIxfyT8WKl+MLBpshTz6ts9U4rXhSJTGn4KqZ9FNMU29RfcyHI=
X-Received: by 2002:ac8:6799:: with SMTP id b25mr24931248qtp.54.1587538301730; 
 Tue, 21 Apr 2020 23:51:41 -0700 (PDT)
MIME-Version: 1.0
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 22 Apr 2020 14:51:30 +0800
Message-ID: <CAA+D8APas0p1ghsGK+OL3+zu_xbgCG2HnVNd2dzoAbKXt=6JJw@mail.gmail.com>
Subject: How to support multi FIFO address in ALSA & DMA Engine?
To: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Cc: yibin.gong@nxp.com
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

Hi Experts

     Some cpu-dai devices support multi FIFO,  so we need to tell DMA
which fifos and how many fifos it should fill the data to.

     For example, when channels = 2, only one fifo is used.   when
channels = 4, then two fifos are used.

    or  when channels = 2,   two fifos are used,  when channels= 4,
four fifos are used.

    But in snd_dmaengine_dai_dma_data, and dma_slave_config, there is
only one dma address.   Do you have any idea to support multi FIFO?
is there any implemented reference?

Best regards
Wang shengjiu
