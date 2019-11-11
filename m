Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3D1F7F7E
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 20:12:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3DBC1683;
	Mon, 11 Nov 2019 20:11:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3DBC1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573499537;
	bh=ujwXMAqx9FCs5rnYnXCEWUXLXb519m8Zv60QY3p0mGk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A28hIY5vxRjVMInqNzqWWB6Mf6CUoK0SeGVQY+iqaQYze8EidDbiBfNWmh3IEhEqi
	 RQ1rmZM1k6n+PzagV8I7DCc7DJoQ9dMD66e4t1P1/UFrHxxzY3K2BBBlc7eNb+oHQk
	 EJOQSNVWHQBqwtQRnAcdJMvzzUDzPIINI5A2pC5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44768F804FF;
	Mon, 11 Nov 2019 20:11:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA0D7F80506; Mon, 11 Nov 2019 20:11:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEB4AF8045D
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 20:11:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEB4AF8045D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="X4gajxlm"
Received: by mail-qv1-xf41.google.com with SMTP id x14so5344895qvu.0
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 11:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sjPwrt/ZkgEySCDEuSo5XG85tk4K5vLmRhpGywBK0rM=;
 b=X4gajxlmf6ooQ8v7EqseWBK1mXaHimg+sxZ+ZTGCxMUzkOgL7dj+WC9Bq1EuuWSuTn
 o6YYUZeZA4ovB8YGyKkWZYhyCtmeb7GlMkfPJA4/uW/iSAsl5nbUzZDYywc+7Xf89Hxp
 RRxISg0XGIgD51BXXLZrlK1FzwH2XTIfXJaEsMqScAdZhQuO+IS0o0/X8pQVJoOaxKmc
 p86eujXvbrswKLI8dsc/jiqsesRUzlvLBjXo0LgXmu15opPLn18ySge+CsaP+T3NRqiF
 4lArOhELG89ADlkGSdqx72KoYjLKQveOXPt4lOQ+pRbYA5nszuOw1RjihnQfdPGwwifm
 rOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sjPwrt/ZkgEySCDEuSo5XG85tk4K5vLmRhpGywBK0rM=;
 b=ZIUA1wWPcGd0rF1dpxMNHfqXxm2IyHN/YysnCPwereZFnVJp5L4f/jgm5dNHuY6p0K
 ftHez9etoWYJr3hNSBZxMYmqmVWxzaDIRUKAcndaPqpJW9wL85wV4knkIKZw9DQS2Ovt
 s++upM52wbNIBCLkZHbrfhdYIJQ0VN7RWimW47xxTEY40X4Iyuxm10XPL86xmhvpGLkZ
 sHkTvJLTj9W3Yfe5LkqUTDmtHTXftTlDcATLokbX2mh+lvBQCfIzyoBaeX4lEa3pG97b
 VEJxFpzfCu8yvbnG3CnfuY3r5r/y1PU3vU0+pgoqGOqKAqeZZ4p7zW1W8K+rVZYoN8gp
 Bldg==
X-Gm-Message-State: APjAAAXB9R4wuOp6n8SFDdSytrdoSS7tFtbcVqJfw8aX7WoMAUa6vJG5
 xIU8O41GoFNW010cBY2siz+4oDItXJBDrGBX/sKkzQ==
X-Google-Smtp-Source: APXvYqy8jpOW989NWWVcSO1/JJppVF9dTxYRrgHPegBeGp4nMALHPt0cqpzlch2fLIVlDGRH7NNpFsf9Ik08pqQhtik=
X-Received: by 2002:ad4:4c4e:: with SMTP id
 cs14mr25175264qvb.198.1573499476401; 
 Mon, 11 Nov 2019 11:11:16 -0800 (PST)
MIME-Version: 1.0
References: <20191107015808.26844-1-cujomalainey@chromium.org>
 <20191107015808.26844-6-cujomalainey@chromium.org>
 <cedaf20b-6752-5f49-64c4-0f3abec8244c@perex.cz>
 <CAOReqxjWove6=9x+Hm0-xEJ_4-iocZo4fnwzV73-sxobTTuCyQ@mail.gmail.com>
In-Reply-To: <CAOReqxjWove6=9x+Hm0-xEJ_4-iocZo4fnwzV73-sxobTTuCyQ@mail.gmail.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 11 Nov 2019 11:11:04 -0800
Message-ID: <CAOReqxiNiJb=mzM+ogDZ+72fgcy3Mi4ZMxYW72qYw-h-0hBVJQ@mail.gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Cc: Curtis Malainey <cujomalainey@chromium.org>,
 Mark Brown <broonie@kernel.org>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 06/11] ucm: docs: Add DisableSoftwareVolume
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Nov 11, 2019 at 10:51 AM Curtis Malainey
<cujomalainey@google.com> wrote:
>
> On Mon, Nov 11, 2019 at 7:22 AM Jaroslav Kysela <perex@perex.cz> wrote:
> >
> > Dne 07. 11. 19 v 2:58 Curtis Malainey napsal(a):
> > > Some userspace audio servers might default to software volume, this
> > > allows the ucm to force its behaviour
> > >
> > > Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> > > ---
> > >   include/use-case.h | 2 ++
> > >   1 file changed, 2 insertions(+)
> > >
> > > diff --git a/include/use-case.h b/include/use-case.h
> > > index 05628303..1aeaf9d4 100644
> > > --- a/include/use-case.h
> > > +++ b/include/use-case.h
> > > @@ -334,6 +334,8 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
> > >    *      - This is used on platform where reported buffer level is not accurate.
> > >    *        E.g. "512", which holds 512 samples in device buffer. Note: this will
> > >    *        increase latency.
> > > + *   - DisableSoftwareVolume
> > > + *      - Set to "1" to force userspace to use hardware volume controls
> > >    */
> > >   int snd_use_case_get(snd_use_case_mgr_t *uc_mgr,
> > >                        const char *identifier,
> > >
> >
> >
> > My understanding is that if the hardware volume controls are defined in UCM,
> > then the UCM user (audio server) should use them. Otherwise, the software
> > volume control should be applied. I don't see the reason to have this info
> > doubled.
> >
> >                                         Jaroslav
> >
> +Jimmy Cheng-Yi Chiang can you clarify in what context CRAS might need
> this value? The only cases I see are for Chat 150 C and Jabra SPEAK
> 810. There are no volume mixers associated with these files.
+Jimmy Cheng-Yi Chiang retry adding Jimmy to email chain
> > --
> > Jaroslav Kysela <perex@perex.cz>
> > Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
