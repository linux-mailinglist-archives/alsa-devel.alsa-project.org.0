Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 665C63D490A
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Jul 2021 20:07:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2BFE1761;
	Sat, 24 Jul 2021 20:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2BFE1761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627150044;
	bh=0ZovEVRRhsY88un6PBbZ2vZomv0g2lTMvNOXou7CPKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C+nnCaJywr2LfhrHGMGXLdf5YT85eLnixUeYOkWrzQWiVX3P9xlYH7TZ7U2ipSEe8
	 CHgbtyhf7mvG6PlT5DYWHjp2FNOPujQ8OdM1yBb+GHI88bvzl138feERYnI+S1aHoX
	 teNJ+RDvGDiXRJQGhzUpsm1zcMRkhznHLcAaGM4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 510C8F80256;
	Sat, 24 Jul 2021 20:05:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF26BF80227; Sat, 24 Jul 2021 20:05:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A172F800F0
 for <alsa-devel@alsa-project.org>; Sat, 24 Jul 2021 20:04:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A172F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CpeZupTF"
Received: by mail-qt1-x82d.google.com with SMTP id m11so3975004qtx.7
 for <alsa-devel@alsa-project.org>; Sat, 24 Jul 2021 11:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ySjT+9vhA6LvbQeBz3snrx5GQAIqPB2FJPEofd/VFlc=;
 b=CpeZupTFKNWztEfPSidkKyHokcBAMt2Wi3fxZGNLVd9kQwfMEr8hmCzrpiZN8OajUR
 1+Xgsg4E676KQ74nsIIUiTPr4+Zw4V/ZN5RKuKdZ6K8oXET13wSGXe+qjA54BIHiMkKm
 sHm8dYljb49cClUOdGMEM0pvJj4lj4UDwxdJinCyQHxn9TCwvT70YBBHtQPFkZbobDu9
 WF6iQDBjKpudNhx11mX6Mo0MhxNMN6RVUnju9CLdigEgMEXAXweTi0zWlz3/Ykl66JXW
 N+vs6XUlGIKVitlY1Q7e8wm2R9Y2VsNVnlQKT0a5UqVO6HFYANzF8JobRi+jguYBiwJO
 y3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ySjT+9vhA6LvbQeBz3snrx5GQAIqPB2FJPEofd/VFlc=;
 b=QWPkCIAuxDtlz6N+0HDtcHA4xOAgHhyQyhDkISdpxADtEL2SfMNXk0xnyfmwuUpEaX
 ndiGQYhgUh953wSJ3IO9xA7EN5ViVK2uVFosAfT9eTghZcPrvtflwez39DjVjldkoliZ
 vB7ysFVYGmTpqo+FX+8AZ8sVggXYQA1/N/6m/lO3j8yD3E2Bxk4tsciaiDoqMgTTawfx
 1dk6MW5kov8HjO8Qf+x+T9tdQqQgSTwe8BpyxMHTK1rJ+B//UWW3PISzIiVJLEmLbiFu
 Mwl8mDpqDXalszwGgqVK0iKZE+FTg4Nj7NLkgaCQyhT+wsrjJ8jcoBTLAzUqIpWwNb0T
 b3nA==
X-Gm-Message-State: AOAM533dsxXvgF+W3TERfOWTV04xCel6lC8EOX0gb8wz684Loqkc1rU6
 CnkkIBFOw4/y2W3+MNstfyyhAhUeKepdC71lm/8=
X-Google-Smtp-Source: ABdhPJxMOQJzEBbdDPWv1NzazwoX7K1S3r0NWDDWZvXR+QrtOrw9xPXY6S+kNGfbhguYEAiamAOcEG/7A5ZLh49DO54=
X-Received: by 2002:ac8:1483:: with SMTP id l3mr8917231qtj.142.1627149861044; 
 Sat, 24 Jul 2021 11:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <1627100621-19225-1-git-send-email-chihhao.chen@mediatek.com>
 <s5h7dhgi1e2.wl-tiwai@suse.de>
In-Reply-To: <s5h7dhgi1e2.wl-tiwai@suse.de>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Sat, 24 Jul 2021 15:04:13 +0000
Message-ID: <CAEsQvcs3P+TqQFzQetPfRycpo66eJFwnzwhk2JyCXFaCLFHmFg@mail.gmail.com>
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

On Sat, Jul 24, 2021 at 8:05 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> This looks like a regression introduced by the recent commit
> d2e8f641257d ("ALSA: usb-audio: Explicitly set up the clock
> selector"), which is a fix for certain devices.  Too bad that the
> behavior really depends on the device...

Dr. Iwai, perhaps we could restrict the generalized fix for the
Behringer UFX1604 / UFX1204 with some simple logic to devices that
only have *one* clock source.

In that case the clock selector must be set to the only clock source.

This way we keep the generalization without breaking devices with more
than one clock source.

Just an idea.

Thank you,
Geraldo Nascimento
