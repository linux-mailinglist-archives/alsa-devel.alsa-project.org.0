Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB8924E8F8
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Aug 2020 19:09:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93E551670;
	Sat, 22 Aug 2020 19:08:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93E551670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598116165;
	bh=4moMwWItulryILO4z0Ol7MEx0pppGa5oK41gXTWjkCE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=goiQhhdpj1/KxuX8jt7bfBbfCuYEpRGpNrMr+LIn4ZtzuGiuGC3cvKCrIthyC8OsD
	 PnUkIOVDhYClsflLsQlRU/wqaxQg4asOMX5G/47pCerAV4BYQ6MpWWaRExlQjMerFc
	 xqrcF5nFQzG0/NkPhnESe3QWzzpnHJVvjx3U+b94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFDB7F801ED;
	Sat, 22 Aug 2020 19:07:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8EC3F801F9; Sat, 22 Aug 2020 19:07:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0B8CF80149
 for <alsa-devel@alsa-project.org>; Sat, 22 Aug 2020 19:07:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0B8CF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="PETRNFuq"
Received: by mail-qv1-xf41.google.com with SMTP id x6so2015670qvr.8
 for <alsa-devel@alsa-project.org>; Sat, 22 Aug 2020 10:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4moMwWItulryILO4z0Ol7MEx0pppGa5oK41gXTWjkCE=;
 b=PETRNFuqKrXRX+/knf4b3n2eGXGyJlOY9lLddhewGuO9YdGHkf/qgIQIVUiobEQSQ0
 QQw0MT6IAOpwxxJsr60cyrXo+U3DvXWkC90QH5697Yy0OGPNAKEv8hsFV5ogRDKgEssH
 Bs1N35ZMVu3iTYtqUez2txVihtryb2pgZPwXmPP8KIdwllfXw6g7ry26Lb3fN8tGYwvo
 CQum/nFVIElu1y7vuVUv7AQ11OXWqwSzmE1ukwZ0czCI7VK2XCfXLEeVKKFBvs0/3QV4
 OTDw4CiN9DY+p+8ReIBagNL8Ifo2FAR4Drr3PcHX2G1PGM0uo5wVtdD0jU8AZdQok8hm
 HCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4moMwWItulryILO4z0Ol7MEx0pppGa5oK41gXTWjkCE=;
 b=sxZWE7tagvHjCl8wI9Dtwlp8GvDhJuZiNnCjs4NzulI79h6wZL5hGkujw0FwFV+mL6
 VTNOUzz06CDRufaCACf8OAf97UEis61SAyJhu3R2VmtPmVTSVvDnW49GSW8dqWlG/khS
 9tq4OcDvx38ojF7Dc3BOf5IrUr0tTyU0cwbHKgYBWf8vqOHLkCqh21ScunBr5tTK3Mmt
 luMEFuPDmXXa3NLN3fFdeTYdeQoZcllDPLdc0yqIMvxwD5ahKlLqqR1y3dDlzX78B69w
 bxAvcQ+82df4Wlivp0nGtI7PRAE++LlutE2I+/D5XYNfNM/PVg3uKvqrqc/14pRFbIM+
 4UDw==
X-Gm-Message-State: AOAM531NW+uqwujB5NOmE3EmcqGWBohJV8ZVGiTii9mzy8KlrbEKsx3P
 4hsLlaVkOrGuEjOM9RoNv1JTz4Hy3ejgOj+kQTDi9Q==
X-Google-Smtp-Source: ABdhPJzKBoBZLnFLKnQycOP+/EvRW3p3enHzamxwS/vMv1qwM4msagCoF8g42yxa5fVzjcl71DMFDmdG/69INmgqHdk=
X-Received: by 2002:a05:6214:1841:: with SMTP id
 d1mr6891144qvy.135.1598116054719; 
 Sat, 22 Aug 2020 10:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200820233205.505925-1-cujomalainey@chromium.org>
 <b98a8a77-7652-1995-27ba-eb7b6d30202a@gmail.com>
In-Reply-To: <b98a8a77-7652-1995-27ba-eb7b6d30202a@gmail.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Sat, 22 Aug 2020 10:07:22 -0700
Message-ID: <CAOReqxiS6TKxo7REebEs2R22Es1_kgzeq5OAhHONBZ6GYjeyWw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ucm: Add JackSwitch definition
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Takashi Iwai <tiwai@suse.de>, Curtis Malainey <cujomalainey@chromium.org>,
 ALSA development <alsa-devel@alsa-project.org>
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

On Sat, Aug 22, 2020 at 6:48 AM Alper Nebi Yasak
<alpernebiyasak@gmail.com> wrote:
>
> Hi, I'm not really a kernel person, but wanted to point out an
> alternative I think is better.
>
> On 21/08/2020 02:32, Curtis Malainey wrote:
> > Some codecs can differentiate headsets based on the number of rings.
> > Should we choose to differentiate the config we will need to be able to
> > select based on the jack event code.
>
> AFAICT from ChromiumOS UCM configs, you're using JackSwitch to detect
> whether a plugged-in jack is/has headphones, a headset mic, or line-out.
> Instead, if you add something like my recent commit d0508b4f1604 ("ASoC:
> rk3399_gru_sound: Add DAPM pins, kcontrols for jack detection") to the
> machine drivers, you can just use JackControl to specify them in your
> UCM files, and your audio server could distinguish between those cases
> by the values of the jack kcontrols (e.g. PulseAudio already can).

Typically we use JackDev over JackControl, and this would add similar
support to what you added but within the context of using an input
device instead of an ALSA jack.
