Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C173F3D8683
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 06:20:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36FAC17D0;
	Wed, 28 Jul 2021 06:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36FAC17D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627446059;
	bh=98gtSXDc7ZlTP8DOpD7xPPrbBz6KU/i+LtjlbzvHQbE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gnOMlJ0KAJlANIWJ04cMIF++6pxMOGZinDvLJDa56aR013YRMlVJZmB5uk3APyvp8
	 +vfgCyxP3GhpXiBELT6h4FubOQxK+PSzU/HrpUV6rdL6yYUSyAOsyfx2CupyCR7Flb
	 eo7OfGnOjZm6NZGVQLVE+NLMVxiXe+s/k3SlLxbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B984CF8025E;
	Wed, 28 Jul 2021 06:19:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B44ADF8025A; Wed, 28 Jul 2021 06:19:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCA36F80212
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 06:19:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCA36F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="k0X6UEjk"
Received: by mail-qt1-x831.google.com with SMTP id l24so484087qtj.4
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 21:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=98gtSXDc7ZlTP8DOpD7xPPrbBz6KU/i+LtjlbzvHQbE=;
 b=k0X6UEjkKBfbAFH6JYFJNMOfoQuDUk6MYWgifJN2pAnWZnEeGST5bE74ezH/a4Ew8m
 l7+Ha5ZJzvssBw6MkI6+vJItvzys74w8MoJNkyeBcDGKwsmKCY+QW8vmmd26oCSfTTJt
 AaJvOxs7IhcR+nfQJONeDTeW+x1tB+jLz2umb27g8Lv5R7R5wa2TySBJWuj/TmkwXGRP
 VpIhPpKFi4ws1+9QWtJ/4237wxnTJbmRpT4wolmwZclF9yYVJCqyIiY82cByYOx34VNl
 OUYMFTOTln5FSaElAUSKa/6uujrTsBgBpsPW2W6CWfScvptbn1fhKlsAOsHNe0Di95/I
 aVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=98gtSXDc7ZlTP8DOpD7xPPrbBz6KU/i+LtjlbzvHQbE=;
 b=rmJYXRiPS9g9EzGkJ9F4dn51yWJgtoefu+75M0oRaMicloUIBCcXLnKuLN2eTIGAfg
 5QIfhq82mnE1MhX/sV8vc0ChYwG1TTfLl4Hbw2+ZCEaWODC8YPdV13A1LzWEczWJOYaW
 Pru3/zo7KVeFyrKEHR5W3hOkf3U0MdWXMvw8HeX4tsZSXPVyv+jsHBJabv/l3VF4fTLl
 jtReR71Gp7Bm/df0nhPrYs5DLyA9Vs42TEvpVRgulDKqgjBY+08J0YxSCLnvIEA7oBKT
 /q1pjXjIRXw5sJ1IpMnaISrDtNSJ7custSNrTd/7m0CHxn0CpIIqjdfT1PRLim2mWbB5
 p+ZA==
X-Gm-Message-State: AOAM53254D+FRkbpX4vS76aOXwnObG9MNE/TravAwhmtiMjG/AHVx5T1
 aNJ960ZNg+r04baKpCrL7VRGVCng6JWjBbbEWG4=
X-Google-Smtp-Source: ABdhPJzpRxaeYMeDLeO8zgqFYNb5J+g+FY8Gr9FLuWekwpckk/L7lwKzlbgsAza9R5n6NqJdrQnj4LbbOWpJUBlWZXs=
X-Received: by 2002:ac8:7c54:: with SMTP id o20mr13378070qtv.142.1627445961649; 
 Tue, 27 Jul 2021 21:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvctJDnsaRTXAGAJ6==juKazoo2=AJrWabLzqE=jCfg5EEA@mail.gmail.com>
 <20210727102744.30364-1-chihhao.chen@mediatek.com>
 <CAEsQvcuOQ_Tg0bRbsegECdBUsGxa61ei9-Z2bRbGvQ9FmEUPbA@mail.gmail.com>
In-Reply-To: <CAEsQvcuOQ_Tg0bRbsegECdBUsGxa61ei9-Z2bRbGvQ9FmEUPbA@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Wed, 28 Jul 2021 01:19:13 +0000
Message-ID: <CAEsQvcvMVCptNss0iSB1uk1vu7PNdyO5c3jzHbi3HvRELi5Jdw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
To: chihhao chen <chihhao.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, wsd_upstream@mediatek.com,
 Takashi Iwai <tiwai@suse.de>, damien@zamaudio.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

> Chihhao, please try the below patch and perform another echo test.
>
> Let us know if the echo test works or if it still fails and please
> remember to share with us the relevant dmesg logs.
>

Chihhao Chen,

when I said echo test I meant just test the device and observe if
there are noises related to incorrect clock setting.


I then realized a bit too late that probably in your programming
culture "echo test" refers to the whole technique you used to hook the
kernel and debug the issue to produce the fix.

If you call that technique "echo test" I'm sorry, I didn't know it was
called that way.


I just meant to briefly test to hear if there is noise even when the
clock parameters are correctly hardcoded.

My intent with that patch is to try to prove there's a firmware bug in
action just like Takashi Iwai suggested.


My apologies,
Geraldo Nascimento
