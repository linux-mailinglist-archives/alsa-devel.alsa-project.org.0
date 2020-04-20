Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 754BB1B0948
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 14:25:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 189CD1682;
	Mon, 20 Apr 2020 14:24:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 189CD1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587385503;
	bh=xy9VhJVcH0qPwv57A35vcWwzjCHkkaqUd92mi2lIXyg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i+Ao2ejjaa52np97CPC0SAHVMfIa4I81NfU5lIcGnXLh8PJ8WbNQGTvHG4nwKkhb6
	 V96g/Ri7S3g2scm4bEKZyA/fwjxGtfROQy7Y3tGh4JBuhWG41iH0hv5XL+wSUUz8Gg
	 UH0xgatkifvjt32Ujz4Am5rSM/RDEc4v8pKPGxUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54EABF8020C;
	Mon, 20 Apr 2020 14:23:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D75CF801D9; Mon, 20 Apr 2020 14:23:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12719F800E7
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 14:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12719F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oksKOqpk"
Received: by mail-ot1-x344.google.com with SMTP id m13so7849314otf.6
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 05:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dB5fFXDtNZJmKi5W1CbxDiopUm/CrNq1L0Xs/KI3ugA=;
 b=oksKOqpkL5BIT0FQ3tM/1yCv9/QCkBbYAp9oHSGmnD02GSrlJ+H5X28PF7Lhp2B4+3
 c30mxy6tvb98VsH8vSWt0ccXD77/CCm79AR2X4nbroKfgCilofvvz7aOxU3rG3BNwiRh
 WHui24ltdhTl1ZT/EILNfr+ybZ17tMMn24RefPqYIuJchHHpYB+23fF4TC4vY4V7Unmz
 2gqK+KawqQcldK+MKv0JoPXQSd6z+JqZssBruNIqIfA2KxDEPdMdS9N8gRTa1xTOkiqh
 WAb+qQ29Yf+tjLq37uNTEmaXlQz7babkJUE+R2l/R4xEQMa8KJDboJQR16desRHjNAjg
 7vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dB5fFXDtNZJmKi5W1CbxDiopUm/CrNq1L0Xs/KI3ugA=;
 b=eQdIPBx3Tp5x2rWbWuGsGw+MX1zTBNrtAM/KZ4X+AqOGECp71ZLb3zUW1zs2Mudend
 sBWO2I03eBoXy5bRu7TiDNFv1/MQn3g1Hlqc8VjywlWyoamneIvyew74d0pRcrynsBwV
 kgMY4cDJ5EtMRK47vpRhPL3KKY4kEyKFf+kWYwb5wQQYuPgcWe3sDbbxuJdUdsMWtWhs
 6kxrDRdH/dNLzl08L1bxzPJH3ssNFaeGxX1GVLbq8b6+ydy+Tvp2DMX1ZyvtP8i9+wlG
 rWZBu2tYLTBPNn0kWLy2KMZePSGYajUvu5k9Jei19P1lL/3TtkMpFCXMY/SlXuLqzL92
 AiMQ==
X-Gm-Message-State: AGi0PuZ8jdXd6oNzwQjJm1p0yG23bKIyraZSgB3HgWRVRJhOXwhVAkaf
 vMR7zrM3vwHYJSkCt4JNzUPhK5vMbBjTCZprPcU=
X-Google-Smtp-Source: APiQypKmSZJ8nmissvGU/pkWsPLYQA+fpHEY2Jk4ZHL3avI07b483TyKWn8igklk6qenSoDZ5w/ar4w4V/qRc8lWCLs=
X-Received: by 2002:a9d:19ca:: with SMTP id k68mr9591231otk.232.1587385389897; 
 Mon, 20 Apr 2020 05:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200417221341.31428-1-TheSven73@gmail.com>
 <20200420121542.GB6507@sirena.org.uk>
In-Reply-To: <20200420121542.GB6507@sirena.org.uk>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Mon, 20 Apr 2020 08:22:57 -0400
Message-ID: <CAGngYiWauBTnXDcP9UC1S7U5Ogy0B=bUZSdGs1Z9aKZ2+sB=Qw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: add Microsemi ZL38060 binding
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>
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

On Mon, Apr 20, 2020 at 8:15 AM Mark Brown <broonie@kernel.org> wrote:
>
> > +maintainers:
> > +  - Jaroslav Kysela <perex@perex.cz>
> > +  - Takashi Iwai <tiwai@suse.com>
>
> This is supposed to be people maintianing this specific binding, not the
> subsystem.

That would be Liam and yourself?
