Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFFF43E532
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 17:33:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B0C216A0;
	Thu, 28 Oct 2021 17:32:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B0C216A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635435193;
	bh=scDv7/OqSTMu+1TxpX/2b6xLRK8ark94ZdS9hA+Zn0M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fxvdbs4PlCaiM/JtAaFZNpShHW3FJNG6adt+T4ZQEiP7YjricdEBY10gXe5hr69U1
	 Lg7Id5CX29lqrLJZv0h5A0QbuMMEL5uTUwGsPvcEXeh51NxNPpL5eo8aySaTJID1lR
	 nBhDeGHsHu80yBHkVPAOg5HqWFmu/EL2Lf0bVCzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5951DF802E7;
	Thu, 28 Oct 2021 17:31:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8E15F802C8; Thu, 28 Oct 2021 17:31:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03B40F8010A
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 17:31:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03B40F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="I3TQsGq0"
Received: by mail-qk1-x732.google.com with SMTP id bm16so6147746qkb.11
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 08:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y/lP7m9bbtZLyZMl0xJejkjX8uxw1IBdpAgTmoTpUPo=;
 b=I3TQsGq0VpPhQ805uRgShUYrWSAvwSSBInQuey7BQboUtWdtj1Zr/V9CEbMJMs/smC
 +SMGqBX+xvVZZfiS3Bp3SkDHKbAqmpJXuTDpyhI04KEIbHdaaasA3xygdfAf9PF4cMRg
 iy0JfEESSGd6wKIpieJGJt+oYSsXvZpgA+pEu+uexDXP24qTGos+Qsf0Gr6VA746K1nB
 zSp7O4es3lRqlbmj3f/IW6RtpEhRKuhFhhouIm88jJ8Z4/QwAoMw+aChTrfuNI/hsN8N
 Zhygep4RIFZttBmpA4st9UbrUXdGPUgJNG66KYgeML1P1kUoIK1MZnlCzSbayVS73GYi
 s+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Y/lP7m9bbtZLyZMl0xJejkjX8uxw1IBdpAgTmoTpUPo=;
 b=02NIHctBPzzqyW6a95tBopy81DWKby5hn0M2csdNUn9tONLU7zG/XDo2NqiaFYraK9
 LygMfeClCjiYK2eySF9E0aPnIl9VEwz1DmirFnRQ9pOYyFnkF16nauSO3TIxT4+3oFCq
 9oeiBzXSNKXXRudfB9CIKWigHR5GdiioP42emRrnTSflVU06vxzbBhNUKQh8DhPRiMkT
 Mwf4/CGOgBFuC1NwyHIpu7Qu8oExsl+1bu4BZDnnfxNYIL15uO/A4dMV+93rk13reOpb
 Wslx2SzF/sxQUmtc3+0eZFg47xWkEEfZnfhmnaUDO07jB8MAdtPooBmOWdzuAAU0BSvp
 7f2A==
X-Gm-Message-State: AOAM530boH/I6WlmcN492thhw6IBniIpijZuC2nNFZ0/aBGJMWzXm5YL
 WKFhEc7nAkgJSEigEzE2Y+A=
X-Google-Smtp-Source: ABdhPJzUm0SFvgE1v+CNg4ecX/n6nOxLRysU/p4DGZ2CYuoo8oKnw4YkZkZTicWfWUl11JjrSkbG/g==
X-Received: by 2002:a05:620a:1a88:: with SMTP id
 bl8mr4130188qkb.252.1635435102954; 
 Thu, 28 Oct 2021 08:31:42 -0700 (PDT)
Received: from ubuntu-mate-laptop.localnet ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id b2sm2101304qtg.88.2021.10.28.08.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 08:31:42 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: vijendar.mukunda@amd.com
Subject: Re: [PATCH RESEND] ASoC: fix unmet dependencies on GPIOLIB for
 SND_SOC_DMIC
Date: Thu, 28 Oct 2021 11:31:41 -0400
Message-ID: <13689627.qBTK4F9haW@ubuntu-mate-laptop>
In-Reply-To: <6ff76018-309d-349e-691a-f504ca29420e@amd.com>
References: <20211027184835.112916-1-julianbraha@gmail.com>
 <6ff76018-309d-349e-691a-f504ca29420e@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: alsa-devel@alsa-project.org, fazilyildiran@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org
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

> For Renoir platform, DMIC driver selected for registering codec dai with
> ASOC. No additional functionality handled related to GPIO.
> Do you still see necessity adding GPIOLIB dependency?

Hi Vijendar,

While most users are unlikely to encounter this, we still do not want unmet
dependency bugs in the build system. Adding the GPIOLIB dependency just ensures
that nobody tries to build an "illegal configuration" of the kernel.

- Julian Braha
 





