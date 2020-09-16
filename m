Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6449126C251
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 13:53:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE9E91695;
	Wed, 16 Sep 2020 13:53:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE9E91695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600257237;
	bh=G8u3YZmN9VS48Zs6GcqxY9P1vdOnn+WbobUW/vlRpyk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n2U1/fpcZMoxYex3fb9tWMSkgm5ayjQFzv+eBGpBUVpe3LTaQ7ttZYEfI84RndvcF
	 2bjY2zYazxjnTeqdnTnk8npQfg6B3Vd2ybEqGbFWvQK2EDpD58MAjNyIp3dmdjikGA
	 hSioDvFyfhqk7QUcSnvW0Xb4ziXMMSs2nFnJk6dA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EFDFF800E8;
	Wed, 16 Sep 2020 13:52:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9890F8015A; Wed, 16 Sep 2020 13:52:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0C7AF800F1
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 13:52:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0C7AF800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rNTpNjlo"
Received: by mail-lj1-x242.google.com with SMTP id u21so5646546ljl.6
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 04:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G8u3YZmN9VS48Zs6GcqxY9P1vdOnn+WbobUW/vlRpyk=;
 b=rNTpNjloivgL4IIauQWwsnW3KxFixBc/ITJAbmTyYNUMIyMEtpg9ZBa48r6s6fWkYd
 /NfUhyCTCCGtfo4ijiup9gAKreg7Bs7UIPUy0PiJqYyXqvz79OMc2HMYFSibNNsuytD+
 1GRo7G6lEiQwDX+QJ7aWDh8rHqBvf6EyxvLp2yy5T9ENaAZDZzpf4RqYI4x/oCagOemc
 Ja0kUPbj7gs0YCQEf5nPzBV1F46VmAvwn5sEw7qX0W9GCZMqTz8aSq5ygPvz1N+shfms
 3aJJ+nYGGWY+EnxEmJ+aeLDed6RubyY6R3r4JDiejlYeeNMii+nbcxI3mM0jyTSPfW6v
 C8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G8u3YZmN9VS48Zs6GcqxY9P1vdOnn+WbobUW/vlRpyk=;
 b=WTpgY4eHbZgERVNvYfrdst8a+71mq091hwGyoCO+vM5meyxl9Lj1Zsd5jdwqWJ+JP0
 f7VQPzIXFidpFtgKL5KMV5jzSOLYtksA07tksADEPSMgitBXD1sjPW73wYuP+i6FgwUY
 v58sXm2uwZLjxzszDkAH8v5/ocgqbIG8xLrkQXX9WPvkcXhdsR6VbQ+/KseT9k1Zubqv
 k8VJPah0EX3/wL6DKmDOHaFp6Ih4VzW0dmMfKUI3Bc2ZvxQsDi7bvuZrhOsGOO/Ycpi5
 ueVIu02pSAEQ8Gq8Yf7VARMagI4w3G9BT22WWkQDZlysK/07ivaPNQYmMLaZ/xgESEso
 j7zw==
X-Gm-Message-State: AOAM531R0DwkJzSWrTeMNHKtaxSN7wT5rzixaJPPtZI6pplfPrIo+mLJ
 1gf6KqkxCsyc9pNWJLlvOU1g23Mpsi4zryfJ25w=
X-Google-Smtp-Source: ABdhPJzc002ZLUmgbuaE62WjRqkY0WfMHJ0a+m0maYHyQ6/Z/CBGbgoyR3VB9GpneRsAU37REZo3nFwFnQ/HWmLHjIE=
X-Received: by 2002:a2e:1444:: with SMTP id 4mr7758634lju.218.1600257125682;
 Wed, 16 Sep 2020 04:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <1600251387-1863-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5Dyo5J8SRWYLyh3bxwtcuAH=r6pcQg7-vtXfO2H6n4Exg@mail.gmail.com>
In-Reply-To: <CAOMZO5Dyo5J8SRWYLyh3bxwtcuAH=r6pcQg7-vtXfO2H6n4Exg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 16 Sep 2020 08:51:54 -0300
Message-ID: <CAOMZO5CEViX6E8sNo0LROk3Y92_BCezHDpfBqMaQK_J4kT24yw@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC: fsl_sai: update the register list
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Wed, Sep 16, 2020 at 8:47 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Knob kmg

Please ignore. It seems my cellphone wanted to write something.
