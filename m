Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD4163AE98
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 18:12:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34B5916F9;
	Mon, 28 Nov 2022 18:11:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34B5916F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669655533;
	bh=UAJkoGhfyjxTXNkyGkbL6RuavtaoVmXx1CufyHlFgbA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=brvV2uHktim+SpEH0tSCqJHS7xC2yt7upCyiy3rRD8054nIwwL5mENITxWqlH8cAQ
	 khit8HkNgr0hea4SxXrTRlsmUNoYuVbPudKSdGs7rjK55ypzlFCyjm2WvuIxDi69Lq
	 5K4n/yhf2gF0T7VBs8fNnciUL2dQrf6YQGVd06K8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFB5AF80166;
	Mon, 28 Nov 2022 18:11:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 994ECF8020D; Mon, 28 Nov 2022 18:11:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8A87F80166
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 18:11:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8A87F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="WTIMKifg"
Received: by mail-io1-xd35.google.com with SMTP id i85so8088020ioa.5
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 09:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DWFgfn7sl4yRxD6csRHBAYHMq81sRHzc2nkScUHiHKo=;
 b=WTIMKifgTx7fIvYm6ryFKZeDz9eDqd4eUILvbSnXYv+qBvhCFbDN5WIzqgN1Ig0gGY
 FrFkCuK9k61a2Ut7hudNt5CNn1qoMrE66Ggs+sQKYD+Ma3hrUQ1txkEz412JaNxnHrrH
 wGZLhEyAK5D9hklt2yjpqybl2BxHqGdAqSVII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DWFgfn7sl4yRxD6csRHBAYHMq81sRHzc2nkScUHiHKo=;
 b=LsZ2ecPjmcZNIGgQU2oA5j+im40stqkqqux7cauXWbsu0254wfY7MO9qtUOuHIWXGT
 s8R9K/+/QlhUxDhBG5voP2/WZ1smtmvTbAmSha1DBzmbUfNn4vN7isSWKz36aOlVJuOC
 BvR/5CsBvHDBPexUyceDqrLb4ernthfJ7gnpbXNduFapVsevVzJnV0oGKxuH5O/oDb9b
 V3KtbXVj+sOWDrbmyCb/Xk5/n1Tcl4ysiC9PUzcJluZZQ9u7zBs4lcO4FwbwtmiWSi5h
 ajegqWQREpZJB2rRqr2aKYp3RDsrPDA/JQl/mM/+NBH0EAT7p7i1/oHdJ3yC/ncFujbj
 seFg==
X-Gm-Message-State: ANoB5pk55oj5sgV9GmrBH43vUVCSMaOeCMzRjk/FDqp0HrMpjoG55Trh
 45Kb/lqcsnH2Dctqs8W9dZ9fPTW+4OkbhwGF
X-Google-Smtp-Source: AA0mqf6AKUayVMCDgt76b59tn/wp/YhC7a34DJ5KTaVGwXmAoCkO9BHF2AFuYLRBjR35kKaiF6C8zQ==
X-Received: by 2002:a02:cac9:0:b0:363:8849:44f7 with SMTP id
 f9-20020a02cac9000000b00363884944f7mr15544897jap.24.1669655466134; 
 Mon, 28 Nov 2022 09:11:06 -0800 (PST)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com.
 [209.85.166.175]) by smtp.gmail.com with ESMTPSA id
 q16-20020a02b050000000b00379cc6aba93sm2222121jah.34.2022.11.28.09.10.53
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 09:10:56 -0800 (PST)
Received: by mail-il1-f175.google.com with SMTP id q13so5336110ild.3
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 09:10:53 -0800 (PST)
X-Received: by 2002:a05:6e02:66d:b0:303:1196:96c7 with SMTP id
 l13-20020a056e02066d00b00303119696c7mr2904256ilt.133.1669655452584; Mon, 28
 Nov 2022 09:10:52 -0800 (PST)
MIME-Version: 1.0
References: <20221127-snd-freeze-v5-0-4ededeb08ba0@chromium.org>
 <alpine.DEB.2.22.394.2211281629120.3532114@eliteleevi.tm.intel.com>
In-Reply-To: <alpine.DEB.2.22.394.2211281629120.3532114@eliteleevi.tm.intel.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Nov 2022 18:10:41 +0100
X-Gmail-Original-Message-ID: <CANiDSCtd52UX1WQDj4PLTuTogurr63ZdMXVWmYqJHCMo_kEoMQ@mail.gmail.com>
Message-ID: <CANiDSCtd52UX1WQDj4PLTuTogurr63ZdMXVWmYqJHCMo_kEoMQ@mail.gmail.com>
Subject: Re: [PATCH v5] ASoC: SOF: Fix deadlock when shutdown a frozen
 userspace
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Alsa-devel <alsa-devel@alsa-project.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, stable@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

Hi Kay

Thanks for your review

On Mon, 28 Nov 2022 at 15:41, Kai Vehmanen <kai.vehmanen@linux.intel.com> wrote:
>
> Hi,
>
> On Mon, 28 Nov 2022, Ricardo Ribalda wrote:
>
> > During kexec(), the userspace is frozen. Therefore we cannot wait for it
> > to complete.
> >
> > Avoid running snd_sof_machine_unregister during shutdown.
> [...]
> >       /*
> > -      * make sure clients and machine driver(s) are unregistered to force
> > -      * all userspace devices to be closed prior to the DSP shutdown sequence
> > +      * make sure clients are unregistered prior to the DSP shutdown
> > +      * sequence.
> >        */
> >       sof_unregister_clients(sdev);
> >
> > -     snd_sof_machine_unregister(sdev, pdata);
> > -
> >       if (sdev->fw_state == SOF_FW_BOOT_COMPLETE)
>
> this is problematic as removing that machine_unregister() call will (at
> least) bring back an issue on Intel platforms (rare problem hitting S5 on
> Chromebooks).

Do you know which devices were affected or how to trigger the issue?

I have access to the ChromeOS lab, so I can test on a big variety of devices

Thanks!


>
> Not sure how to solve this, but if that call needs to be removed
> (unsafe to call at shutdown), then we need to rework how SOF
> does the cleanup.
>
> Br, Kai



-- 
Ricardo Ribalda
