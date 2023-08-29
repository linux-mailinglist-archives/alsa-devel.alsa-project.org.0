Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0656478CFB9
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Aug 2023 00:58:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22BE4825;
	Wed, 30 Aug 2023 00:58:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22BE4825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693349933;
	bh=5AfpXtvYqnocpu5AzkLOipnh4ByqhhlekNZE7ncIX50=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WWiEYKoz+YbKujdY/+QImCsN9f0EOPbtpgbUo86y5vlY1DT2EPx6Vj6z89Plva+2P
	 alZJ6w8FInesDi4hKSl1I0e0jXEXFjc/ERPScl/6RmIGhseUs2mEsKzpN1//rVFNWR
	 y02ZU62qELzI3/2SoGz3vFPNmxLUIuUzm8DfTVFQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88E76F80158; Wed, 30 Aug 2023 00:58:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED041F800F5;
	Wed, 30 Aug 2023 00:58:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E72EF80155; Wed, 30 Aug 2023 00:57:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BC02F800D1
	for <alsa-devel@alsa-project.org>; Wed, 30 Aug 2023 00:57:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BC02F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=ymzQbHam
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so2884589a12.1
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 15:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693349863; x=1693954663;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AfpXtvYqnocpu5AzkLOipnh4ByqhhlekNZE7ncIX50=;
        b=ymzQbHamlcsfG9kBF0kM5KfkzJ1ZpvPUoD7ZaGboP5Px+PXb+tM5pRwNdTfvRRzpaD
         zasVMMX+WcRSXUixnHXW6cVXA9nXNxIA292wSv4dlrLMCVXIUE7tu2CjeimKhEt8UrD3
         SrkaZmrcLoiBlaSBBtB/kXM0nL0koNqj+xoNY4ij2ZrHttIQsrMdnCrpNBidh9nmyDYB
         2hhdLV3RidRzCpeGtQuUG9Z0SeNO2Csi/fDotuRt5WfAXsB+ZK3ffLERhwF2LfuDwcqk
         ftqs56ASkPhknBMWAl5m+hdd4B1DfC7da3/A6OhMFdt7jWTP6Fb8idJnVTN86Xf8ZBjO
         6tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693349863; x=1693954663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AfpXtvYqnocpu5AzkLOipnh4ByqhhlekNZE7ncIX50=;
        b=Ylj4ACeaSoIaVuP+o7dY3VfRFYXDFBBhQr1cBUuNxLYi57EJrIBdI4mUcJdFuUU/dt
         xIRuMnGcqbv3fakzt/VPWgnp5v95lb7vxxm1Ygu1CzYMQFmEy+m8MteEDvKoNRSkscbU
         crgFVa3mraoZH89Uh2lh9/jimym6BWIpa37cvRlKxBbX+0gYuwFO61aW+HQl6TD3FMuz
         A7EZ5Z95Q6eqFLNSbm1sTA6xHeDrCAzhBJj8OV8A+UCBaFjIJgYCkZvg7fkcfPFOu/Ks
         OZ8XIW6/JHfXH/LWezdiyUX1TQFefT4AldkoSu7b9CR2bcnl81Az4FnwwxtFVBYc8aSI
         FZCg==
X-Gm-Message-State: AOJu0YyRCwai9YBnK22uaISFnIFd7XEZOCCDuHLzxKoYd1BDZYZivvLl
	yF8OLpudFkmKMhQq0i7pzx3dnsdnmX5xesNZTF8zSQ==
X-Google-Smtp-Source: 
 AGHT+IFUdr0p1VHJFCivVEuaT5cU00mzYLKQv8KYvZTuP7UYa81kaLoRK2YM/GaXqMN0GH02XMGM0IKtQ1KmgrYlmAo=
X-Received: by 2002:a17:90a:d902:b0:269:524f:2a19 with SMTP id
 c2-20020a17090ad90200b00269524f2a19mr608585pjv.26.1693349862446; Tue, 29 Aug
 2023 15:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230824213312.1258499-1-cujomalainey@chromium.org>
 <ce20d02b-56ed-acd1-411b-8c68d8cabea8@perex.cz>
 <CAOReqxiDZOAEYYb5c73AHu+Nd2vZinLR5qdMAVJnEcV8TS6=Nw@mail.gmail.com>
 <6d498d35-841d-4ea4-2fd9-990f9b02563e@linux.intel.com>
 <6fc8a33a-52f2-0cd1-6259-b2b974548602@perex.cz>
 <CAOReqxh2-m5QmHJz-iN0eeuGFfuo0WqAHDcKKXs4ZB4AwK-qrg@mail.gmail.com>
In-Reply-To: 
 <CAOReqxh2-m5QmHJz-iN0eeuGFfuo0WqAHDcKKXs4ZB4AwK-qrg@mail.gmail.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 29 Aug 2023 15:57:31 -0700
Message-ID: 
 <CAOReqxh8fMQVbG6qmfG=vTQUJ0=SH95CvO9hTyQJfLVZKu16fA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ucm: docs: Add EchoReferenceDev
To: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 cujomalainey@chromium.org,
	alsa-devel@alsa-project.org, tiwai@suse.com, ethan.geller@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: G6W32GE6ZEQERUVHLF2WGBRPLXJNMH3C
X-Message-ID-Hash: G6W32GE6ZEQERUVHLF2WGBRPLXJNMH3C
X-MailFrom: cujomalainey@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G6W32GE6ZEQERUVHLF2WGBRPLXJNMH3C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 29, 2023 at 12:17=E2=80=AFPM Curtis Malainey
<cujomalainey@google.com> wrote:
>
> On Tue, Aug 29, 2023 at 8:37=E2=80=AFAM Jaroslav Kysela <perex@perex.cz> =
wrote:
> >
> > Modifiers are an extra layer on top of devices. I don't think that we h=
ave any
> > default relation between the modifier PCM device and the original PCM d=
evice
> > (from the UCM device definition). A new value to describe this (like
> > "ReplacePlaybackPCM 1") may be introduced. Another issue is when multip=
le
> > modifiers with this description are active - they conflict, so it shoul=
d be
> > described somewhere, too. Perhaps, "ConflictingModifier" array may be a=
dded to
> > API. But those extensions are not required for the "Echo Reference" mod=
ifier.

What is the expectation for naming and relationship to the devices? Is
the Modifier a suffix to the device name to associate it?

Curtis
