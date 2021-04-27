Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CB636CB53
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Apr 2021 20:52:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D41116D4;
	Tue, 27 Apr 2021 20:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D41116D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619549561;
	bh=FV42CIjBZ3QHrwAlRAEmteDvc46DdSUPmNmqu4F5yAw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B5jxb3yVeIbsVKunsLbe3E5yP3Vq+rJvId9nlrYucUAyo0nKLzadWHS7AAAGgHNHQ
	 NSeOC3Uw0TlzPE0K/xiEYQOnkm7vBiXWvS8tFc8yQ55GgZYbt8dAouyuaOAVjNUwmw
	 FTw2W0sbzrA9jlH1xpFpN1PAMkjzKA/m7MZ16C98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E1E0F80117;
	Tue, 27 Apr 2021 20:51:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E028AF800C0; Tue, 27 Apr 2021 20:51:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FEBDF800C0
 for <alsa-devel@alsa-project.org>; Tue, 27 Apr 2021 20:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FEBDF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="TBvf0xKS"
Received: by mail-lj1-x232.google.com with SMTP id l22so62031803ljc.9
 for <alsa-devel@alsa-project.org>; Tue, 27 Apr 2021 11:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gog+9Z3fXL22LIPFv7bH+SyHlsPgqAEYM+x0G4DVbUk=;
 b=TBvf0xKSwntfNBf0ki5A6F9saMvDAtYZZ//h/FcOHpAKhLhUpTEAOvReK/Cbk24D4q
 NWWhfSMe/wdjbcrKD2FBkm/Qms/xqia+kjBpuwsyhyjxGsxghMacVDusDEVpsXCXUlYw
 adeYxpvYfc1bVbPoJhJwwWKxU6HZupYPUPcDEDdz6NlPw0z+CykZJtCZS8tg36fQZRJm
 9pQT5vnhbINDuNub+jC6HXwE6tY030Mu4031/lKOlmIB9kdbHrJXUz1Q+EjPPfcDoKkf
 y7n2xIZn1urvoUh+y5c+F+zJkvkwBTs2dNF59WTkfJSzgHk1qI3mblHUn+JM7XfLXl8F
 uE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gog+9Z3fXL22LIPFv7bH+SyHlsPgqAEYM+x0G4DVbUk=;
 b=KWUDA2aAfH8jT2PPha5G7qwh8ZlKnkHQE2Mi3hqGU3EnytqJ73vKf+bLy14ArJV6D/
 w6SCjtQ63rNoLJL7L+EuysQ2PCGzCtqjnQaVllSnnyTMiTw4ICadAWQEbMuv52Q6GsIS
 zCxcaXU7b1Df0pNGUjwFnLg8MkA67mhuIZG8QypgFCWWsLjQspxp84fJXaTEj8A+9N+y
 Qs9vSF7giYnFDPYiCckBnn4S+IsmES/9W116cETljUPS5/JPCpfv2lsN2WGLiteAy4Nz
 xYws6k1FrAk+UZHMFkqPu/4n4n59bJuS9rfU1Yxt55+mRvWNLfdpRQvAfTvt7w31kaGt
 UOng==
X-Gm-Message-State: AOAM533RX+oGt352ui7NAZQRdR9X9zOOyDNCnK+cFW5OAT6Zgj9Zy7qw
 xsjLXvWQsAeOePpKLn99rOSK4pVlzV4hbkCYUOlLpw==
X-Google-Smtp-Source: ABdhPJwxKbevoemvyWBbaarG/ohvblLCHTsJTfbV7w0ScGJyTAY/d62rNZGVzSX4cFx25v8OxTCyeZHL45vTV5iZzcA=
X-Received: by 2002:a2e:6c12:: with SMTP id h18mr12473028ljc.116.1619549465409; 
 Tue, 27 Apr 2021 11:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <1619345553-29781-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1619345553-29781-1-git-send-email-yang.lee@linux.alibaba.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 27 Apr 2021 11:50:53 -0700
Message-ID: <CAKwvOdkXxyyLSTAaMsyeJ3jxCeAGY=9DxLZNX4DcvF=fmkx7mg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: q6dsp: q6afe: remove unneeded dead-store
 initialization
To: Yang Li <yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Mark Brown <broonie@kernel.org>
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

On Sun, Apr 25, 2021 at 3:12 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Variables 'wait' and 'port_id' are being initialized, however the
> values are never read and updated later on, hence the redundant
> initializations can be removed.
>
> Cleans up clang warnings:
> sound/soc/qcom/qdsp6/q6afe.c:933:21: warning: Value stored to 'wait'
> during its initialization is never read
> sound/soc/qcom/qdsp6/q6afe.c:1186:6: warning: Value stored to 'port_id'
> during its initialization is never read
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Thanks for the patch, but it looks like this has already been fixed in:
https://lore.kernel.org/alsa-devel/20210218222916.89809-5-pierre-louis.bossart@linux.intel.com/


> ---
>  sound/soc/qcom/qdsp6/q6afe.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index cad1cd1..442bf27 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -930,7 +930,7 @@ int q6afe_get_port_id(int index)
>  static int afe_apr_send_pkt(struct q6afe *afe, struct apr_pkt *pkt,
>                             struct q6afe_port *port, uint32_t rsp_opcode)
>  {
> -       wait_queue_head_t *wait = &port->wait;
> +       wait_queue_head_t *wait;
>         struct aprv2_ibasic_rsp_result_t *result;
>         int ret;
>
> @@ -1183,7 +1183,7 @@ int q6afe_port_stop(struct q6afe_port *port)
>         struct afe_port_cmd_device_stop *stop;
>         struct q6afe *afe = port->afe;
>         struct apr_pkt *pkt;
> -       int port_id = port->id;
> +       int port_id;
>         int ret = 0;
>         int index, pkt_size;
>         void *p;
> --
> 1.8.3.1
>


-- 
Thanks,
~Nick Desaulniers
