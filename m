Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE253D4923
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Jul 2021 20:22:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1F781768;
	Sat, 24 Jul 2021 20:21:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1F781768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627150951;
	bh=KeMJR/oOT6vnUfEf1QGuRaqBtn1buVaEAa8SwfA3FM8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u6VsWLsxdNzL6jLzitDYaRbuwUu815HbBq8nxOQIObHO4hlyTjs3tyE+9smpT77P6
	 NE87PSS5gwxbTedyQBtwhHvWGIBIth1wUlXVO2VM6guf3/xxG7nNsyFMolsk0bZtcS
	 dLb7YncJ7xbMYfQyuSu4y7FuuIwnSkJLffsB/3Eg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D3E9F80086;
	Sat, 24 Jul 2021 20:21:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C65DF80227; Sat, 24 Jul 2021 20:21:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57B98F80086
 for <alsa-devel@alsa-project.org>; Sat, 24 Jul 2021 20:20:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57B98F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZgQiFzz0"
Received: by mail-qv1-xf36.google.com with SMTP id db14so2260469qvb.10
 for <alsa-devel@alsa-project.org>; Sat, 24 Jul 2021 11:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KeMJR/oOT6vnUfEf1QGuRaqBtn1buVaEAa8SwfA3FM8=;
 b=ZgQiFzz0yfKej069imP4GcuB6HeHasV7gVLeT/CfcWN/DTJJg/Spjk6rqSuFDFhlT1
 oVmOW7zBobMisHPGm2lJ6U2deTrWP2dVpcAnkBwrEckp1xEgEVLqrGzio/uH9L0FtJ5x
 YwuITmQmANyJv6cVc1xXEw2bnfEQi9ni8vCVJEQierUO67Va65eBkypz5yIlWnx/sRnj
 Rn1vhvhajRBLIKYV1ZblyUfw7X488U151n4vUehE3r4BY6PlShmmVWoqx8oKVthyfLw6
 T5LvrGgwzMWi8l148NpGRoEnKkQskY2AUFedNhoTmCnP1WvfH1mAVmzhtgS6HRfQ60yb
 t50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KeMJR/oOT6vnUfEf1QGuRaqBtn1buVaEAa8SwfA3FM8=;
 b=LWO9PcK1ixha0Rd1FzDtSF0J3aFtPEN6fH00ADTJHgm2kWaGV16YCzNRVA5iBCCMbM
 tJBSbHsajQvKdnOMPtzF2Az41MP2dNkEKUTOq19SBP2R6Dlr1Wy9IUTRfPaJZuR4+oHR
 7vhQzoi/Ci/wa5Q897XlmTjBriI/maggk115xw6cce00E56yAgF1M84OwivF6jiC0r4e
 iiU1y0irJe5rmJo67+vNzTfCofzrVVRP0bqrcJdb4AxxKN723EtUNxuIkdd3+j/UaYX/
 CL+rFQGU+lgTEipjWpsfIUMszsI+9/l9v5jyiYf/90EpE7toGoJyEcYThuXMlpmlmAiO
 r4QA==
X-Gm-Message-State: AOAM533+eSHG5YkeS+kmO5dcItQPkq2OjOhl2djL8tTOD0qe/dFyurRJ
 ojfxQ6RG5YYb8+ZfX1DLOVO3V/ZdU46Us+Rb9v4=
X-Google-Smtp-Source: ABdhPJwue+Tzkl6UbAMvQoa11TWdFyaB3DBO04u2KVlOxPM50w9P2ankRPrOl20M6vwOqwo8EisbJUGjr8bJVz62/Qo=
X-Received: by 2002:a0c:d68f:: with SMTP id k15mr10642939qvi.14.1627150855374; 
 Sat, 24 Jul 2021 11:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <1627100621-19225-1-git-send-email-chihhao.chen@mediatek.com>
 <s5h7dhgi1e2.wl-tiwai@suse.de>
 <CAEsQvcs3P+TqQFzQetPfRycpo66eJFwnzwhk2JyCXFaCLFHmFg@mail.gmail.com>
In-Reply-To: <CAEsQvcs3P+TqQFzQetPfRycpo66eJFwnzwhk2JyCXFaCLFHmFg@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Sat, 24 Jul 2021 15:20:47 +0000
Message-ID: <CAEsQvcu3jXa4fXJAu7nvT+G+-S2bZ1BPkcuwnT4VjbrnW1Pkog@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, wsd_upstream@mediatek.com, damien@zamaudio.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, chihhao.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

> Dr. Iwai, perhaps we could restrict the generalized fix for the
> Behringer UFX1604 / UFX1204 with some simple logic to devices that
> only have *one* clock source.

Okay, rereading the original commit log from Cihhao Chen I gather
Samsung USBC Headset (AKG) with VID/PID (0x04e8/0xa051) actually has
two clock selectors and only one clock source.

Correct me if I'm wrong.

This is complicated by the fact I haven't been able to find a lsusb -v
of Samsung USBC Headset (AKG) with VID/PID (0x04e8/0xa051)

Even so, my proposition still stands: devices with only one clock
source and only one clock selector should be able to handle us
selecting the clock selector to the only clock source.
