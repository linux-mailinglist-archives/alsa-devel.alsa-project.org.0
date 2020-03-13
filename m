Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2327E18401D
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 05:55:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A25531794;
	Fri, 13 Mar 2020 05:54:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A25531794
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584075334;
	bh=wvz9uvyc21UQew4+JG8ovh/2BCTI/jwbb7swMievMpI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S5tRjg2ism5uzMimGCxCFDFJO5ZVT9KFW+DcK+Fw3EYzXk/SUna8SdxhKfW9kpcf0
	 3ayLvc0NwIXsRW7N3fOhu4F/NVmn+DRUXLVfldq0fL4lpdsKtCG4rRSeeNFkwcXgmF
	 ou8SLZ0145UJ+g4rFHzN6SsEMTR1vi9XCoRtWbLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F84BF80086;
	Fri, 13 Mar 2020 05:53:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8107F801EB; Fri, 13 Mar 2020 05:53:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
 [210.131.2.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 296B9F80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 05:53:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 296B9F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com
 header.b="1qbYSOTg"
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 02D4rNS5006742
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 13:53:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 02D4rNS5006742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1584075204;
 bh=w3Y1PyEPxiBVRuK/A0Q7y3Dyq4APs/2kQeU8OKCr8ZA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=1qbYSOTgDX4Vgx5faAXlOdhiqgn8tPaNi0xwFJsuOFnT4BLAWTiK3CZJmA3YjgRfz
 vyGTQpfSMRynbM6aqYEOjHc7CxQ+lbb8YufLNjhi4t38klppChvz9JP+V8XTbiIFUP
 5pTz+otNvR6HGM1QC37YTNKQ0vAUwB/kTXjWTu75106a+XtDrFiJKO4uf4FbXMLpNq
 T41aOe2KIWiZZSSLRQR/DISiswtiCzk192xhd5v5aQX31dmV68iAvDZyvsuIO+nmt9
 BZmKxJ2821C3miI56kSQC2LkBBtoe9ej/p+krgV340LKS//8zuAKesgotob+NafjtI
 2iEU6JlZvKTaA==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id k26so5304084vso.5
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 21:53:23 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2k2ZjyXkLNzvzC4vWkj6jol9cINNFl1vmy2Qh1oL86rww8Rt5x
 T+XFHlYAQHKByglNkZEItuVAb5ogfEw4Q/NP5tE=
X-Google-Smtp-Source: ADFU+vuj8oh8CmqdPfS+e+blxWFNJKVra9+A1Sx+9bsoEaPEfI9I+52/E35yuOeItildQOuicmCENQ6ligLyO/1nQsQ=
X-Received: by 2002:a67:33cb:: with SMTP id z194mr8322970vsz.155.1584075202592; 
 Thu, 12 Mar 2020 21:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200312041232.wBVu2sBcq%akpm@linux-foundation.org>
 <c6c4e6fb-30f3-60a1-6bc0-25daa84d479d@infradead.org>
 <a8343b1f-7e87-d34d-a71b-86d20a8a3aff@linaro.org>
In-Reply-To: <a8343b1f-7e87-d34d-a71b-86d20a8a3aff@linaro.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 13 Mar 2020 13:52:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNARaR9_GPE+uU9Fh73850dwJXKETyF4gJxats_hrhgwzAg@mail.gmail.com>
Message-ID: <CAK7LNARaR9_GPE+uU9Fh73850dwJXKETyF4gJxats_hrhgwzAg@mail.gmail.com>
Subject: Re: mmotm 2020-03-11-21-11 uploaded (sound/soc/codecs/wcd9335.c)
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 mm-commits@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mhocko@suse.cz,
 linux-mm@kvack.org, Mark Brown <broonie@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
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

On Fri, Mar 13, 2020 at 1:59 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> Adding+ Masahiro Yamada for more inputs w.r.t kconfig.
>
>
> Kconfig side we have:
>
> config SND_SOC_ALL_CODECS
>          tristate "Build all ASoC CODEC drivers"
>          imply SND_SOC_WCD9335
>
> config SND_SOC_WCD9335
>          tristate "WCD9335 Codec"
>          depends on SLIMBUS
>         ...
>
> The implied symbol SND_SOC_WCD9335 should be set based on direct
> dependency, However in this case, direct dependency SLIMBUS=m where as
> SND_SOC_WCD9335=y. I would have expected to be SND_SOC_WCD9335=m in this
> case.
>
> Is this a valid possible case or a bug in Kconfig?
>

The patch exist:
https://patchwork.kernel.org/patch/11414795/


However, this caused another problem, then
got reverted in linux-next.

It fixed it too, so hopefully
this will be solved soon.



-- 
Best Regards
Masahiro Yamada
