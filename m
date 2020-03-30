Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D5819817E
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 18:43:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D7B41666;
	Mon, 30 Mar 2020 18:42:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D7B41666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585586594;
	bh=0CpcpZNj41fu3P8/k83fjX3m+8WgK2hQBql+7v6YBpM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cp7/KpGnFXp3D/r2oZnIV+SL9JoR6fMx4c8MkEwXn3RUiNj3x+BASIjgVEg714VJU
	 Af0ZBAlsMEdIOBkJNwnXctUSG5tK7VQM/1FB50j8s7f0ScGuiAaC52AqlwB34aAqnH
	 Whp0YJlfEYgJBh1e1obseSerf2bqVrxoqySCUHQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2620F8014A;
	Mon, 30 Mar 2020 18:41:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA9FEF80148; Mon, 30 Mar 2020 18:41:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B5FCF800EB
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 18:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B5FCF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="BwXDxbtP"
Received: by mail-io1-xd33.google.com with SMTP id x9so12032143iom.10
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 09:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KaOiEBNQZO3XH78CgYsD0ZSOHbuUFveEbxpmcY56/Qc=;
 b=BwXDxbtPv5/d1LNYw7e6R4Me2nkKbZXz1dyYR0tUuOefIhRTT63QxeTgbk2lHbMlZF
 yorbSkxUx8r8s2ULg9usilW8jmelit9uCxgX3Wp/zKtEpSY4hmrfb54vaKSlSp28bQEb
 /K7CnbwomIidgSf899JHv3bXdV/0KatzhSYR9dI4008G/o8l84TYFt3BulEr0lBxm1fh
 l+eh7zo8oMUeVBBTxunn4zShaNdi/kPT7iHYpRHzb4gn3MgRakD7mAiW/kptn7lKtops
 a67Cgt+k0a2pPUdkq9E9GyJs3Yk2ux/2ArcIAW9V/2F5yBKDSvpdXM512NsNDLdOwC1u
 0lcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KaOiEBNQZO3XH78CgYsD0ZSOHbuUFveEbxpmcY56/Qc=;
 b=RsiXPXClx/9WiiaUh3J+qXenVmX20Gu9Aud8wytJ9iG6RYje16+YWQ7DYOQpt2YJig
 z9qai3zAlO/0Q4vWYsqCHtobhOLW0WB4dZe7KTamVKQPTRG3OJlfQszFRfU/5Ky75KAH
 adl5QUuAi3r748N9tMrPSgPsd8hH5knbyjrk2sV+uQm9FmfXDdvOet0vePn/cdQPXv7x
 5BgYmKLCPLSliNs9Z8Q8FbKUm6iABV6eP08F70PL7Qg64v8mU+XdJY8//xET04APd/zM
 /Va3ZWiz1TV0TAP67X5GdXeLlcZfUKjM0dY10v+a/W4P/ZNM076RmPf55G3D3vBjD5sC
 xdiw==
X-Gm-Message-State: ANhLgQ1OtjunQvwFhEYgvcIIjKnqo61aGg+tc+uoaMDNDJtgYRkhAzrr
 lvDnD7wQV82saZourQn1pBLB3hsNaE/zRxqWjwexwQ==
X-Google-Smtp-Source: ADFU+vuwzHOs2E7LkPzLOhStWkrAJV6exWCfWDnSa5DiklZp16c8KtgAWXxH+fDbqfLChVEpzc8eBMbzgcMQN5bxRPU=
X-Received: by 2002:a02:1485:: with SMTP id 127mr11624243jag.122.1585586482988; 
 Mon, 30 Mar 2020 09:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200327204729.397-1-amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20200327204729.397-1-amadeuszx.slawinski@linux.intel.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Mon, 30 Mar 2020 09:41:12 -0700
Message-ID: <CAFQqKeVNKUqK4CP4RMLJkm+YQjN-6Kr5BfdisBvVgFn+jD5uKg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] ASoC: topology: Propagate error appropriately
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
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

On Fri, Mar 27, 2020 at 11:40 AM Amadeusz S=C5=82awi=C5=84ski <
amadeuszx.slawinski@linux.intel.com> wrote:

> v1:
>   Check if kstrdup succeeded.
>
> v2:
>   Remove unneeded freeing, which is performed in another place by dobj
>   handlers.
>
>   Additionally for functions which have return status which was ignored,
>   perform success checks and handle failures in appropriate way.
>
> Amadeusz S=C5=82awi=C5=84ski (6):
>   ASoC: topology: Add missing memory checks
>   ASoC: topology: Check return value of soc_tplg_create_tlv
>   ASoC: topology: Check return value of soc_tplg_*_create
>   ASoC: topology: Check soc_tplg_add_route return value
>   ASoC: topology: Check return value of pcm_new_ver
>   ASoC: topology: Check return value of soc_tplg_dai_config

Thanks, Amadeusz. LGTM
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
