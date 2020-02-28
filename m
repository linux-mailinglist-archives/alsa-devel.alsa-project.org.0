Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD457173181
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 08:01:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74E6B16DC;
	Fri, 28 Feb 2020 08:00:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74E6B16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582873283;
	bh=c6hyoD8zfmHfdvTYAWzSR1LNa/TqLChPyCgM+JY7rNU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fLjERzBP9UN+I1YT5SmeEWUNOXan8b7vx63RibEbCj62j6N6CqenTifX+F8y84guP
	 wGOrePVMAP5aI1qRClUTtOh6pftsRRSiiSC+9kl4aOdU7Ki1Y0LxZR1jf0bUOkrVdl
	 psCR5uOsWoH0bpQIA7NLGBe2Sn0O6P44CIYJGfr8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8864AF80086;
	Fri, 28 Feb 2020 07:59:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9EDDF8014E; Fri, 28 Feb 2020 07:59:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6F42F80086
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 07:59:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6F42F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="b7Eu1OiV"
Received: by mail-qv1-xf43.google.com with SMTP id fc12so139908qvb.6
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 22:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c6hyoD8zfmHfdvTYAWzSR1LNa/TqLChPyCgM+JY7rNU=;
 b=b7Eu1OiVC2aJps+SPPzuhzjoMER1rqPqa/VvZX29dIM7lR539TlgLa+v3GMZHBRQAZ
 eKx85GB9ht9NaHJX6T/qVdHk4UDIucXgAZ6/aTIRLJejLwfsNbAR9Vmt7SJ502TZP55S
 vEcKJZJKg3jJMQS7ipLyZjqQ8/4Lu6AuWQH60NG0cRLgtElo+6LZM3G144uugbn3JbGw
 aN1TMFE54ow0CXGU/EKnklzGqnXqBKBifIDgNq9Kwdebmqj94szrMo2DFayQGYxP6Nqi
 QjRJlEYjd9OZA88814HnrlYzMwEvul1UBw6wj8PovvjrQe6Y5v7z18EmT/zb+a0ydbDW
 DuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c6hyoD8zfmHfdvTYAWzSR1LNa/TqLChPyCgM+JY7rNU=;
 b=P3QKBZ27r5bGLZ5G2xe5HsKVvnKRtST6sULQ4za90OusED/dRr/8sZHSJePj/WtNno
 +8pWOKjEKS2QVuAL9Ty8J0p8M7Myi7y3knVELzRNkhzDjSow31TjzU4qvV78wR/rML4g
 r/PjXJmcRSKidpM8atiNyZ6RBKIfLWChHdqAarukXCAzWF7ZyTTJ7M38EsT3sFhxtDYS
 uaQ0+FE0yOJzFC1UvnhwSoEbRxwwTBljyHkeGTpGL0/pKJBhqnt3UEfH3eslRWQhdopB
 f9ELfgJYe6uOSULjayoQ+7eS/Bxltb55BPcDNWftT8kplQgSxq4K4bh8NgEVIDKMpZbI
 gyMw==
X-Gm-Message-State: APjAAAUUkW/m+acWputgci9J/bMg47vK+2Bm7nPPrlLumNj00C/BSL15
 fgp1wiHr/HdRbJanjfDMNbuBr9nTcZb6WsJuREo=
X-Google-Smtp-Source: APXvYqx4Mglpr2YgBhx2B/bWVdjJWIXLSKGQv1V/Zpmwn53wJsLruUiOcUOlVokZfkaeflXerQVi8nrguOcbktfRu5Y=
X-Received: by 2002:ad4:52eb:: with SMTP id p11mr2292548qvu.211.1582873174403; 
 Thu, 27 Feb 2020 22:59:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582770784.git.shengjiu.wang@nxp.com>
 <d9aebf5ef9a92623db10dc537161b3ecdb1d8b18.1582770784.git.shengjiu.wang@nxp.com>
 <20200227183926.GA456@NICOLINC-LT.nvidia.com>
In-Reply-To: <20200227183926.GA456@NICOLINC-LT.nvidia.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 28 Feb 2020 14:59:23 +0800
Message-ID: <CAA+D8ANFN9irpX25VnKYDm3cfU16ht7bcB4-zjDOyHMj8NM9Qw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ASoC: fsl_asrc: Move common definition to
 fsl_asrc_common
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Fri, Feb 28, 2020 at 2:41 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Thu, Feb 27, 2020 at 10:41:56AM +0800, Shengjiu Wang wrote:
> > There is a new ASRC included in i.MX serial platform, there
> > are some common definition can be shared with each other.
> > So move the common definition to a separate header file.
> >
> > And add fsl_asrc_pair_internal and fsl_asrc_internal for
> > the variable specific for the module, which can be used
> > internally.
>
> I think we can just call it "priv", instead of "internal", since
> it's passed by the "void *private" pointer.
>
> And it'd be nicer to have an extra preparational patch to rename
> existing "struct fsl_asrc *asrc_priv" to "struct fsl_asrc *asrc".
>
> Something like:
> struct fsl_asrc *asrc = yyyy;
> struct fsl_asrc_pair *pair = xxxx;
> struct fsl_asrc_priv *asrc_priv = asrc->private;
> struct fsl_asrc_pair_priv *pair_priv = pair->private;
>
> Thanks
> ------
>
ok, will change it.

best regards
wang shengjiu
