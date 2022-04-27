Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B71C1510D67
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 02:49:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DB7217AA;
	Wed, 27 Apr 2022 02:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DB7217AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651020545;
	bh=xT+jRLxaGEIGAMVQ0hStkvLI83vuk5QSmIbTskwede0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XLKHNy7fJQWWpHZH5sp4dPNwbz9IJyCa/Kc5CckRFYphUkCKIKY8OoXLxwLRNMpbC
	 jR2wn8JI1j2Y+I60EXPOZFDplM6T4swUmZFLncwriU/kbKEoZkVMf5Geq+0ho3Lxgb
	 hs2MYA0zahxin8byIxvk/OtvHnzNKPh4z+GtBmgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EA64F80171;
	Wed, 27 Apr 2022 02:48:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 055BBF80152; Wed, 27 Apr 2022 02:48:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52006F800FA
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 02:48:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52006F800FA
Received: by mail-oi1-f174.google.com with SMTP id v65so435398oig.10
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 17:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7jADvKtwI5abxB+PBQP/9nWBiqZb6jlr8eUfg5UByAo=;
 b=FefRFd9LddMDFDVCFQFXvk2goPtim0nW1XvdHQn/bOCONK8EdmaIpN1bp0+1ajAXLt
 rNTfzZaPuvcqBKc9z0wlfB0QZpUPHBlTG2IzCkFPOCFakQ6Z3rMJHL/RoCNWI7JsGTk5
 sRcZ8LwhW0iaBclu6I5dZ0DQooAEpuWfhHCOtFbWlcjllS9Li9q2/sh53RlzOtjDhGQF
 Qg2/kJDB0WBec2gSJDj+nLf2TA+wtdy+pyxXneh65iMRmo5ClYJDr2mXV2eZYTru60Be
 8pBdJXgE9PHnuWMX6o8h1tZV7t9PZOu+NyBbRowEeOpHBCpSopCySk6Wh3QJy9wsHtEy
 8SrA==
X-Gm-Message-State: AOAM533qUBHq6//ZerHr4tpfEqKPpTuSFNys5DChi9Z6vEISNEzWRc9v
 NjJzqb1lG1Ld/b9zv1SkMQ==
X-Google-Smtp-Source: ABdhPJz1tp6QAKevUv5cVDmCNzFf63FrVLvVvWCrybhibB6eccqsDL8me03IQhAgh1MhSDCxNboGPA==
X-Received: by 2002:a05:6808:1304:b0:325:388:2214 with SMTP id
 y4-20020a056808130400b0032503882214mr8610352oiv.59.1651020479019; 
 Tue, 26 Apr 2022 17:47:59 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x64-20020acae043000000b003222bb3dfb0sm5467281oig.36.2022.04.26.17.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 17:47:58 -0700 (PDT)
Received: (nullmailer pid 2835963 invoked by uid 1000);
 Wed, 27 Apr 2022 00:47:57 -0000
Date: Tue, 26 Apr 2022 19:47:57 -0500
From: Rob Herring <robh@kernel.org>
To: Dan K <kaehndan@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: sound: Add generic serial MIDI device
Message-ID: <YmiSvXCE5Yovvjhd@robh.at.kernel.org>
References: <20220425191602.770932-1-kaehndan@gmail.com>
 <20220425191602.770932-2-kaehndan@gmail.com>
 <YmcdvcyeJJBB1pqW@robh.at.kernel.org>
 <CAP+ZCCfT8Mm1OECsrKxzq5vtjyaTiF=ML9LJYkHXO0A6Wao32w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP+ZCCfT8Mm1OECsrKxzq5vtjyaTiF=ML9LJYkHXO0A6Wao32w@mail.gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
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

On Mon, Apr 25, 2022 at 07:49:49PM -0500, Dan K wrote:
> On Mon, Apr 25, 2022 at 5:16 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, Apr 25, 2022 at 02:16:02PM -0500, Daniel Kaehn wrote:
> > > Adds dt-binding for snd-serial-generic serial MIDI driver
> >
> > Bindings are for h/w and there's no such thing as generic h/w. There are
> > some exceptions but you'll have to justify why this is special.
> >
> 
> Thanks for taking the time to look at this!
> 
> Not entirely sure if you mean that I'll need to justify the existence
> / need for this binding,
> or the use of the term 'generic' -- just in case, I'll make sure to
> respond to both. Note that
> I'm justifying my reasoning for submitting the binding - but I'm
> uncertain myself if my reasoning
> is valid, as someone new to kernel development.

'Generic' is really just a red flag.

We've had generic or simple bindings before. The result tends to be a 
never ending stream of new properties to deal with every new variation 
in devices. These can be quirks for device behavior, timing for power 
control, etc.

> The intent of this binding is to signify that a serial port (namely a
> UART) is connected
> in hardware to a MIDI decoupling circuit, which then connects to some
> (any) sort of MIDI device,
> either directly to an on-board device, or via a jack/connector. In a
> sense, the MIDI device that this
> connects to is 'generic', as the identity of the device does not need
> to be known to interface with it
> over MIDI for most use cases.

Okay, maybe it is appropriate. The key part is 'most use cases'. What 
about ones that don't fit into 'most'? It's possible to do both (generic 
binding and device specific bindings), but we need to define when 
generic bindings are appropriate or not.

Do devices ever need power controls or other sideband interfaces? 
Regulators, resets, clocks? If so, you need to describe the specific 
device.

Is a jack/connector in any way standard and have signals other than UART 
(or whatever is the other side of the MIDI decoupling circuit)? We have 
bindings for standard connectors.

I don't really know anything about what this h/w looks like, so any 
pointers or examples would help. 

> I see how this is a bit of an oddball, since it's not specifically
> describing a particular hardware
> device attached to a UART (like some of the bluetooth modules are),

To follow that comparison, all/most BT modules use a standard/generic 
protocol over the serial port. But we don't have compatibles aligned to 
the protocol because the devices are more than just a serial protocol. 
They have GPIOs, regulators, clocks, etc. Furthermore, the serial 
protocols themselves can have extensions and/or quirks.


> but thought this sort of
> binding might be permissible because of things like the
> gpio-matrix-keypad binding, which doesn't
> describe specific switches, just how thoise switches are wired, and
> what GPIO they use, which is all
> that is needed to interface with them. Some MIDI devices implement
> extra low-level features like device
> multiplexing, but these aren't (to my knowledge) common, and are
> beyond what this supports.

At some point devices become simple enough to model generically.

> The reason that the corresponding driver written has the name
> 'generic' is for an entirely
> different reason. A "serial MIDI" driver already exists in the kernel,
> however, it  interfaces only with
> u16550-compatible UARTs. This driver uses the serial bus, making it
> work with 'generic' serial devices.

Bindings are separate from the kernel (though they live in the same 
repository for convenience). A 'generic' binding often appears with a 
'generic' driver. You can have specific bindings with a generic driver. 
The difference with doing that is the OS can evolve without changing the 
binding (an ABI). Maybe initially you use a generic driver until there's 
extra/custom features of the device you want to support with a custom 
driver.

Rob
