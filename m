Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 931E410F58B
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 04:24:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A6DA1664;
	Tue,  3 Dec 2019 04:23:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A6DA1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575343445;
	bh=B40/I2x2GyWOY/wIkIhKXsi+s/735Bz08Ktri/vkfBM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=upJpmzlEe9uFIsKYT+nS+glpvqLRuqBOHdrhXdJV8qJ82Hi2EbisjMg/urut2pYLk
	 Fbr7/3b2D/uWoWW89vVhKLNN1XmUNR3+6vrkoRkEymaVFyXvt+h70vso2pG7ROf35J
	 omV6yKsuydCswXeZtDYisEYHVdImlf0GeiNH+ewM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A9A2F80227;
	Tue,  3 Dec 2019 04:22:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8D97F80227; Tue,  3 Dec 2019 04:22:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F65AF800F0
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 04:22:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F65AF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="CWgK7MDe"
Received: by mail-qt1-x843.google.com with SMTP id n4so2306892qte.2
 for <alsa-devel@alsa-project.org>; Mon, 02 Dec 2019 19:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fzqtg++C6rwO25utvOJq6rXl7I/t9Qyvj23G71Br8zU=;
 b=CWgK7MDev/V18427/9dC8yU8++DN0YXy/U4s5x7EO7A76hAI4Iyy68zZ+l7SrctKoO
 IvK4VMEbovd4CLoS3QB2KyygxdUtkyqjH7JAE/CfgPUd1sscGCdKaRzO1Idlo5jqqtmq
 ICKJ6xtcpbPBfOLgV8UW61WAtXgeYYeGk38X9VtsR3xQmizcEcKvscsq0/hzMqDYI+kV
 sOHsuN9i3/pJSFhaHjR+9wN29izLL/DAkkflX1WyQ9a56Hbib5ax488D1hq9pJu85btX
 LvX8PshzUOEx24VEe7jkNAKbzXrj83D98flx7hPFZTFflgWMS5YWELJOeKyERqVMzLY6
 aBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fzqtg++C6rwO25utvOJq6rXl7I/t9Qyvj23G71Br8zU=;
 b=Mh38dJcgdfqhesj4JDrsIK6++JFTCmxqZsGOhGiliHn5qPMvOx+kZTe6KHNtr6S+Ns
 0Vtwt0IqXy5f1x9z1dUDur+aqzG7E5LiD4tBF7Io4jlL2lg+6fcQh4M3Vsz9HLRWyD+F
 4TREWcsFgAoRwS9JcBVpfI9dCWgUxhIuvsgg+zlOUi0xIYW/e9wLF45RFHEBSXWAf4Ud
 /QZZZnnoYFh3z+Kep0v05tHYS0lGseWcB0c1HnpENDWO+jDzZiY82hIlRb4Rd9LqNa0I
 AU/qdo7OF58/SeMxKk6Q1bbi/bRGu2MLgpswfThz02lMLBic/52KpUrpxAMFiSHr2reV
 015g==
X-Gm-Message-State: APjAAAUrdHinITV/qN/gFHLlbx2y1mdDIm8264YRtI83kzB/fiR7rUDF
 +PLSCNnnGr6EjQsldft0pJZD/RbXBI1RkSTbcUIzew==
X-Google-Smtp-Source: APXvYqxpQrszigRZ8qg4WqyowC96nkrUSNas2poSfIgJZqUjI6Q5Z3GcAJIirfdCdRpR1Yl2YKxwlHen7xd9uu2/zLo=
X-Received: by 2002:aed:30e2:: with SMTP id 89mr3230320qtf.355.1575343333860; 
 Mon, 02 Dec 2019 19:22:13 -0800 (PST)
MIME-Version: 1.0
References: <20191107015808.26844-1-cujomalainey@chromium.org>
 <20191107015808.26844-2-cujomalainey@chromium.org>
 <4b378b2c-fea2-5d77-26ff-0ff409d8e527@perex.cz>
 <0626a79d-4950-ab27-d10a-366cd74da332@perex.cz>
In-Reply-To: <0626a79d-4950-ab27-d10a-366cd74da332@perex.cz>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 2 Dec 2019 19:22:02 -0800
Message-ID: <CAOReqxiCDP4ByX4P4ROmfQmjTREJenzyQNaOT=Go+4ctN5j_hg@mail.gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Curtis Malainey <cujomalainey@chromium.org>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 02/11] ucm: docs: Add JackType value
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

On Fri, Nov 29, 2019 at 8:01 AM Jaroslav Kysela <perex@perex.cz> wrote:
>
> Dne 11. 11. 19 v 14:39 Jaroslav Kysela napsal(a):
> > Dne 07. 11. 19 v 2:57 Curtis Malainey napsal(a):
> >> Identifies the type of jack and how it should be accessed
> >>
> >> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> >> ---
> >>    include/use-case.h | 3 +++
> >>    1 file changed, 3 insertions(+)
> >>
> >> diff --git a/include/use-case.h b/include/use-case.h
> >> index 2051bd40..3208cc30 100644
> >> --- a/include/use-case.h
> >> +++ b/include/use-case.h
> >> @@ -322,6 +322,9 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
> >>     *        configuration that doesn't belong to UCM configuration files.
> >>     *   - JackName
> >>     *      - Input name is the input device name for the jack
> >> + *   - JackType
> >> + *      - Specifies whether the jack is accessed via hctl or gpio and therefore
> >> + *        only carries the possible values of "gpio" or "hctl"
> >>     */
> >>    int snd_use_case_get(snd_use_case_mgr_t *uc_mgr,
> >>                         const char *identifier,
> >>
> >
> > What is meant with the "gpio" type? The standard input device interface? I
> > believe it should be "inputdev" and "ctl" (hctl is just interface on top of
> > ctl and the application can access the jack through snd_ctl functions, too.
>
> I see (when I was cleaning this extra Chrome stuff in the ucm profiles) that
> it's related to the gpio (general purpose i/o pin interface) in the linux
> kernel. The JackSwitch is probably also related and defines the pin number
> where the application should watch for the jack state. In this case, it would
> be probably more nice to follow the JackControl and JackDev and define the pin
> number through JackGPIO or something like that. We will cover all three
> posibilities: ALSA control interface, Input interface, GPIO interface .
>
>                                         Jaroslav
Initially that was our thoughts too but then we realized that in the
event of a new theoretical input subsystem "foo" that can be used for
jack detect then we would need to create another field for that as
well. This reduces the need for having a field for every theoretical
subsystem in the future and only then requires a new value.
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
